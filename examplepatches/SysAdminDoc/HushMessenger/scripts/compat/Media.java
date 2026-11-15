package compat;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import static compat.CompatReport.*;
import static compat.Bubbles.*;
import static compat.Coexist.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Media and calls: screenshot-blocking viewers, camera and gallery routes, presence, menu blur, chat heads, call buttons, Instants and fonts. */
final class Media {

    static final String EPHEMERAL_VIEWER = "Lcom/facebook/messaging/media/ephemeralmedia/viewer/EphemeralMediaViewerFragment;";
    static final String QUICKSNAP_VIEWER = "Lcom/facebook/messaging/quicksnap/consumption/viewer/MsgrQuicksnapViewerFragment;";
    static final String WINDOW = "Landroid/view/Window;";
    static final String SET_FLAGS = WINDOW + "->setFlags(II)V", ADD_FLAGS = WINDOW + "->addFlags(I)V";
    // "Generate AI stickers" as 587 numbers it, as in NativeMediaControls.kt
    static final int GENERATE_AI_LABEL = 0x7f140566;
    // "Generate": the same cell's label when its tap opens the custom, AI and music sticker menu
    static final int GENERATE_MENU_LABEL = 0x7f141c62;
    // The same label in 587's armv7 string pack, two resources on
    static final int GENERATE_MENU_LABEL_ARMV7 = 0x7f141c64;
    // The viewer's onCreateDialog override in 587, its armv7 build included, and A1M in its other arm64 builds
    static final Set<String> EPHEMERAL_DIALOGS = Set.of("A1L", "A1M");
    // The Quicksnap viewer's onCreateView frame in 587: 39 registers, 40 in its armv7 build
    static final Set<Integer> QUICKSNAP_FRAMES = Set.of(39, 40);

    static int mediaTarget(List<Instruction> code, int at) {
        if (!(code.get(at) instanceof OffsetInstruction jump)) return -1;
        int offset = 0;
        for (int i = 0; i < at; i++) offset += code.get(i).getCodeUnits();
        int target = offset + jump.getCodeOffset(); offset = 0;
        for (int i = 0; i < code.size(); i++) { if (offset == target) return i; offset += code.get(i).getCodeUnits(); }
        return -1;
    }
    static Set<Integer> mediaTargets(Method method) { return mediaTargets(method, true); }
    /** With branches false, only the switch cases and catch handlers, as ControlHooks.kt's jumpTargets(branches = false). */
    static Set<Integer> mediaTargets(Method method, boolean branches) {
        var code = instructions(method); var offsets = new HashMap<Integer, Integer>(); int offset = 0;
        for (int i = 0; i < code.size(); i++) { offsets.put(offset, i); offset += code.get(i).getCodeUnits(); }
        var targets = new HashSet<Integer>(); offset = 0;
        for (var i : code) {
            if (i instanceof OffsetInstruction jump) {
                Integer landing = offsets.get(offset + jump.getCodeOffset());
                if (i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) {
                    if (landing != null && code.get(landing) instanceof SwitchPayload payload)
                        for (var e : payload.getSwitchElements()) targets.add(offsets.getOrDefault(offset + e.getOffset(), -1));
                } else if (branches && landing != null) targets.add(landing);
            }
            offset += i.getCodeUnits();
        }
        if (method.getImplementation() != null) for (var b : method.getImplementation().getTryBlocks())
            for (var h : b.getExceptionHandlers()) targets.add(offsets.getOrDefault(h.getHandlerCodeAddress(), -1));
        return targets;
    }
    static boolean mediaWrites(Instruction i, int r) {
        return i.getOpcode().setsRegister() && (register(i) == r || (i.getOpcode().name().contains("WIDE") && register(i) + 1 == r));
    }
    static boolean mediaOp(List<Instruction> c, int at, Opcode op) { return at < c.size() && c.get(at).getOpcode() == op; }
    static boolean mediaCall(List<Instruction> c, int at, String id, Integer... args) {
        return mediaOp(c, at, Opcode.INVOKE_VIRTUAL) && id.equals(ref(c.get(at))) && bubbleArgs(c.get(at)).equals(List.of(args));
    }
    static boolean mediaLiteral(List<Instruction> c, int at, int r) {
        return mediaOp(c, at, Opcode.CONST_16) && register(c.get(at)) == r && c.get(at) instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == 0x2000;
    }
    static boolean mediaNull(List<Instruction> c, int at, int r, int target) {
        return mediaOp(c, at, Opcode.IF_EQZ) && register(c.get(at)) == r && mediaTarget(c, at) == target;
    }
    static boolean mediaResult(List<Instruction> c, int at, String type, int r) {
        return at > 0 && mediaOp(c, at, Opcode.MOVE_RESULT_OBJECT) && register(c.get(at)) == r &&
            c.get(at - 1).getOpcode().name().startsWith("INVOKE") && c.get(at - 1) instanceof ReferenceInstruction ri &&
            ri.getReference() instanceof MethodReference mr && mr.getReturnType().equals(type);
    }
    static boolean mediaWindow(List<Instruction> c, int at, String owner, int source, int result, int target) {
        return mediaCall(c, at, owner + "->getWindow()" + WINDOW, source) && mediaOp(c, at + 1, Opcode.MOVE_RESULT_OBJECT) &&
            register(c.get(at + 1)) == result && mediaNull(c, at + 2, result, target);
    }
    /**
     * Mirrors NativeMediaControls.kt. No lifecycle body is eligible for an entry return, and no try block may cover a
     * guarded prefix: the Ephemeral viewer's bodies have none, and the Quicksnap viewer's all start past its site.
     */
    static List<Integer> screenshotViewerSites(Method method) {
        if (!Set.of(EPHEMERAL_VIEWER, QUICKSNAP_VIEWER).contains(method.getDefiningClass())) return List.of();
        var impl = method.getImplementation(); var c = instructions(method); var p = bubbleParameters(method);
        if (impl == null || AccessFlags.STATIC.isSet(method.getAccessFlags())) return List.of();
        List<Integer> sites; boolean valid, resume = false, hoisted = false; int reentry = -1, reentrySource = -1;
        if (method.getDefiningClass().equals(EPHEMERAL_VIEWER) && EPHEMERAL_DIALOGS.contains(method.getName()) &&
                p.equals(List.of("Landroid/os/Bundle;")) && method.getReturnType().equals("Landroid/app/Dialog;")) {
            sites = List.of(9);
            valid = impl.getTryBlocks().isEmpty() && impl.getRegisterCount() == 5 && c.size() == 15 && mediaResult(c, 4, "Landroid/app/Dialog;", 2) &&
                mediaWindow(c, 5, "Landroid/app/Dialog;", 2, 1, 10) && mediaLiteral(c, 8, 0) && mediaCall(c, 9, SET_FLAGS, 1, 0, 0);
        } else if (method.getDefiningClass().equals(EPHEMERAL_VIEWER) && method.getName().equals("onResume") && p.isEmpty() && method.getReturnType().equals("V")) {
            sites = List.of(14, 21); resume = true;
            valid = impl.getTryBlocks().isEmpty() && impl.getRegisterCount() == 5 && c.size() == 46 && mediaResult(c, 8, "Landroid/app/Activity;", 0) && mediaLiteral(c, 9, 1) &&
                mediaNull(c, 10, 0, 15) && mediaWindow(c, 11, "Landroid/app/Activity;", 0, 0, 15) && mediaCall(c, 14, SET_FLAGS, 0, 1, 1) &&
                mediaOp(c, 15, Opcode.INVOKE_VIRTUAL) && bubbleArgs(c.get(15)).equals(List.of(4)) &&
                c.get(15) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr && mr.getReturnType().equals("Landroid/app/Dialog;") &&
                mediaOp(c, 16, Opcode.MOVE_RESULT_OBJECT) && register(c.get(16)) == 0 && mediaNull(c, 17, 0, 22) &&
                mediaWindow(c, 18, "Landroid/app/Dialog;", 0, 0, 22) && mediaCall(c, 21, SET_FLAGS, 0, 1, 1);
            if (valid) for (int i = 10; i <= 21; i++) if (mediaWrites(c.get(i), 1)) valid = false;
        } else if (method.getDefiningClass().equals(QUICKSNAP_VIEWER) && method.getName().equals("onCreateView") &&
                p.equals(List.of("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")) && method.getReturnType().equals("Landroid/view/View;")) {
            // The one addFlags call is the site, as in NativeMediaControls.kt. 586's body has try blocks, all past it.
            var adds = new ArrayList<Integer>();
            for (int i = 0; i < c.size(); i++) if (ADD_FLAGS.equals(ref(c.get(i)))) adds.add(i);
            if (adds.size() != 1 || adds.getFirst() < 6) return List.of();
            int site = adds.getFirst();
            sites = List.of(site);
            int prefixEnd = 0;
            for (int i = 0; i <= site; i++) prefixEnd += c.get(i).getCodeUnits();
            boolean covered = false;
            for (var block : impl.getTryBlocks()) if (block.getStartCodeAddress() < prefixEnd) covered = true;
            // 587's session check between the window and its null check, with a missing dialog's tail jumping back to it
            int tail = site >= 9 ? mediaTarget(c, site - 8) : -1;
            hoisted = site >= 9 && tail > site && tail + 1 < c.size() && mediaResult(c, site - 9, "Landroid/app/Dialog;", 0) && mediaNull(c, site - 8, 0, tail) &&
                mediaCall(c, site - 7, "Landroid/app/Dialog;->getWindow()" + WINDOW, 0) && mediaResult(c, site - 6, WINDOW, 1) &&
                mediaNull(c, site - 2, 1, site + 1) && mediaOp(c, tail, Opcode.CONST_4) && register(c.get(tail)) == 1 &&
                c.get(tail) instanceof NarrowLiteralInstruction zero && zero.getNarrowLiteral() == 0 &&
                Set.of(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32).contains(c.get(tail + 1).getOpcode()) && mediaTarget(c, tail + 1) == site - 5;
            if (hoisted) for (int i = site - 5; i <= site - 3; i++) {
                var op = c.get(i).getOpcode();
                if (mediaWrites(c.get(i), 1) || c.get(i) instanceof OffsetInstruction || op == Opcode.THROW || op.name().startsWith("RETURN")) hoisted = false;
            }
            if (hoisted) { reentry = site - 5; reentrySource = tail + 1; }
            valid = !covered && QUICKSNAP_FRAMES.contains(impl.getRegisterCount()) && (hoisted || mediaResult(c, site - 6, "Landroid/app/Dialog;", 0) &&
                mediaNull(c, site - 5, 0, site + 1) && mediaWindow(c, site - 4, "Landroid/app/Dialog;", 0, 1, site + 1)) &&
                mediaLiteral(c, site - 1, 0) && mediaCall(c, site, ADD_FLAGS, 1, 0);
        } else return List.of();
        var setters = new ArrayList<Integer>();
        for (int i = 0; i < c.size(); i++) if (ref(c.get(i)) != null && Set.of(SET_FLAGS, ADD_FLAGS, WINDOW + "->clearFlags(I)V").contains(ref(c.get(i)))) setters.add(i);
        if (!valid || !setters.equals(sites)) return List.of();
        if (resume && c.stream().anyMatch(i -> i.getOpcode().name().contains("SWITCH") || i.getOpcode().name().contains("PAYLOAD"))) return List.of();
        if (hoisted && c.stream().anyMatch(i -> i.getOpcode().name().contains("SWITCH") || i.getOpcode().name().contains("PAYLOAD"))) return List.of();
        if (hoisted && mediaTargets(method, false).contains(reentry)) return List.of();
        for (int t : mediaTargets(method)) if (t >= 1 && t <= sites.getLast() && (!resume || t != 15) && t != reentry) return List.of();
        if (resume) for (int i = 0; i < c.size(); i++) if (i != 10 && i != 13 && c.get(i) instanceof OffsetInstruction && mediaTarget(c, i) == 15) return List.of();
        if (hoisted) for (int i = 0; i < c.size(); i++) if (i != reentrySource && c.get(i) instanceof OffsetInstruction && mediaTarget(c, i) == reentry) return List.of();
        return sites;
    }

    /**
     * Every upload entry point. Analytics2UploadService inherits its two from an obfuscated job service base, which
     * counts only while it's abstract, extends JobService directly and has no other subclass.
     */
    static final String MONTAGE_PARAMS = "Lcom/facebook/messaging/montage/composer/model/MontageComposerFragmentParams;";
    static final String NAVIGATION_TRIGGER = "Lcom/facebook/messaging/send/trigger/NavigationTrigger;";
    static final String MONTAGE_ACTIVITY = "Lcom/facebook/messaging/montage/composer/MontageComposerActivity;";

    static boolean hasLiteral(Method m, int value) {
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == value) return true;
        return false;
    }

    static boolean isFragmentStart(MethodReference mr) {
        return "Z".equals(mr.getReturnType()) && List.of("Landroid/content/Intent;", "Landroidx/fragment/app/Fragment;", "I")
            .equals(mr.getParameterTypes().stream().map(Object::toString).toList());
    }

    static Set<String> stringsOf(Method m) {
        var strings = new HashSet<String>();
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference sr) strings.add(sr.getString());
        return strings;
    }

    static boolean isCameraClass(Instruction i) {
        return i.getOpcode() == Opcode.CONST_CLASS && ((ReferenceInstruction) i).getReference() instanceof TypeReference t &&
            MONTAGE_ACTIVITY.equals(t.getType());
    }

    /** The static factory Messenger 583's chat screen gets its camera launcher from. Mirrors SystemCamera.kt. */
    static boolean isChatCameraFactory(Method m) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getParameterTypes().isEmpty() ||
            !"Landroid/content/Context;".equals(m.getParameterTypes().get(0).toString())) return false;
        var strings = stringsOf(m);
        boolean cameraClass = false;
        for (var i : m.getImplementation().getInstructions()) if (isCameraClass(i)) cameraClass = true;
        return strings.contains("fragment_params") && strings.contains("trigger2") && hasLiteral(m, 7376) && cameraClass;
    }

    /** What the factory's builder returns right after it's handed the camera screen's class. */
    static String chatCameraLauncherType(Method factory) {
        var code = new ArrayList<Instruction>();
        factory.getImplementation().getInstructions().forEach(code::add);
        int at = -1;
        for (int i = 0; i < code.size(); i++) if (isCameraClass(code.get(i))) { at = i; break; }
        if (at < 0 || at + 1 >= code.size() || code.get(at + 1).getOpcode() != Opcode.IPUT_OBJECT) return null;
        var builder = ((FieldReference) ((ReferenceInstruction) code.get(at + 1)).getReference()).getDefiningClass();
        for (int i = at + 2; i < code.size(); i++)
            if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference mr &&
                builder.equals(mr.getDefiningClass())) return mr.getReturnType();
        return null;
    }

    /**
     * The check Messenger 583's chat runs on where a picked photo comes from, answering Boolean, or 587's callee that
     * holds its body and answers the reverse as Z. Mirrors SystemCamera.kt.
     */
    static boolean isThirdPartyUriCheck(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !Set.of("Ljava/lang/Boolean;", "Z").contains(m.getReturnType()) ||
            !List.of("Landroid/content/Context;", "Landroid/net/Uri;").equals(m.getParameterTypes().stream().map(Object::toString).toList())) return false;
        var strings = stringsOf(m);
        return strings.contains("Unable to get providerInfo for authority ") && strings.contains("content");
    }

    /** The open that refuses a picked photo whose file Messenger itself owns. Mirrors SystemCamera.kt. */
    static boolean isInternalFileOpen(Method m) {
        return AccessFlags.STATIC.isSet(m.getAccessFlags()) && "Landroid/content/res/AssetFileDescriptor;".equals(m.getReturnType()) &&
            List.of("Landroid/content/Context;", "Landroid/net/Uri;").equals(m.getParameterTypes().stream().map(Object::toString).toList()) &&
            stringsOf(m).contains("Attempted to retrieve internal file.");
    }

    static boolean isLauncherStart(Method m) {
        if (!"Z".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getParameterTypes().size() != 2 ||
            !"Landroid/os/Bundle;".equals(m.getParameterTypes().get(0).toString()) ||
            !m.getParameterTypes().get(1).toString().startsWith("L") || !stringsOf(m).contains("ActivityLauncher")) return false;
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr && isFragmentStart(mr)) return true;
        return false;
    }

    static boolean isLauncherCall(MethodReference mr) {
        return "Z".equals(mr.getReturnType()) && mr.getParameterTypes().size() == 2 &&
            "Landroid/os/Bundle;".equals(mr.getParameterTypes().get(0).toString()) && mr.getParameterTypes().get(1).toString().startsWith("L");
    }

    /**
     * The launcher interface a capture handler starts the camera through, or null. An instance method that casts its event to
     * ActivateCameraEvent, or (as in 586) the static helper both dispatchers hand the cast event to, that makes exactly one
     * launcher call. Mirrors SystemCamera.kt captureLauncherType.
     */
    static String captureLauncherType(Method m) {
        if (!"V".equals(m.getReturnType())) return null;
        boolean casts = AccessFlags.STATIC.isSet(m.getAccessFlags()) && !m.getParameterTypes().isEmpty() &&
            "Lcom/facebook/xapp/messaging/composer/camera/event/ActivateCameraEvent;".equals(m.getParameterTypes().get(0).toString());
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) && !casts) return null;
        var calls = new ArrayList<MethodReference>();
        for (var i : m.getImplementation().getInstructions()) {
            if (i.getOpcode() == Opcode.CHECK_CAST && ((ReferenceInstruction) i).getReference() instanceof TypeReference t &&
                "Lcom/facebook/xapp/messaging/composer/camera/event/ActivateCameraEvent;".equals(t.getType())) casts = true;
            if (i.getOpcode() == Opcode.INVOKE_INTERFACE && ((ReferenceInstruction) i).getReference() instanceof MethodReference mr && isLauncherCall(mr)) calls.add(mr);
        }
        return casts && calls.size() == 1 ? calls.get(0).getDefiningClass() : null;
    }

    /**
     * system_camera: the chat composer's camera listener, which builds MontageComposerActivity's intent and starts it
     * with request code 7377. Counted only while exactly one chat fragment also reads a photo picked in another app
     * (request code 1112), the path the switch hands the phone camera's photo to. While that reader also reads 7376, the
     * code Messenger 583's chat screen starts its camera with, the chat camera's factory, its launcher's start and the
     * chat's checks on where a picked photo comes from and who owns its file count too.
     */
    static List<Method> systemCameraLaunches(List<ClassDef> classes) {
        var launches = new ArrayList<Method>();
        var factories = new ArrayList<Method>();
        var captures = new ArrayList<Method>();
        var starts = new ArrayList<Method>();
        var checks = new ArrayList<Method>();
        int readers = 0;
        boolean readsChatCamera = false;
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            var params = new ArrayList<String>();
            for (var t : m.getParameterTypes()) params.add(t.toString());
            var strings = new HashSet<String>();
            boolean buildsIntent = false;
            for (var i : m.getImplementation().getInstructions()) {
                if (!(i instanceof ReferenceInstruction r)) continue;
                if (r.getReference() instanceof StringReference sr) strings.add(sr.getString());
                if (r.getReference() instanceof MethodReference mr && MONTAGE_ACTIVITY.equals(mr.getDefiningClass()) &&
                    "Landroid/content/Intent;".equals(mr.getReturnType()) &&
                    List.of("Landroid/content/Context;", MONTAGE_PARAMS, NAVIGATION_TRIGGER).equals(mr.getParameterTypes().stream().map(Object::toString).toList()))
                    buildsIntent = true;
            }
            if ("onActivityResult".equals(m.getName()) && "V".equals(m.getReturnType()) && params.equals(List.of("I", "I", "Landroid/content/Intent;")) &&
                hasLiteral(m, 7377) && hasLiteral(m, 1112) && strings.contains("ComposeFragment:externalMediaGalleryActivityResultNullData") &&
                strings.contains("ComposeFragment:montageMessageActivityResultNullData")) {
                readers++;
                readsChatCamera = hasLiteral(m, 7376);
            }
            if ("V".equals(m.getReturnType()) && params.equals(List.of(MONTAGE_PARAMS, NAVIGATION_TRIGGER)) &&
                !AccessFlags.STATIC.isSet(m.getAccessFlags()) && buildsIntent && hasLiteral(m, 7377)) launches.add(m);
            if (isChatCameraFactory(m)) factories.add(m);
            if (captureLauncherType(m) != null) captures.add(m);
            if (isLauncherStart(m)) starts.add(m);
            if (isThirdPartyUriCheck(m) || isInternalFileOpen(m)) checks.add(m);
        }
        if (readers != 1) return List.of();
        if (!readsChatCamera) return launches;
        launches.addAll(factories);
        var launcherInterface = factories.size() == 1 ? factories.get(0).getReturnType() : null;
        for (var m : captures) if (captureLauncherType(m).equals(launcherInterface)) launches.add(m);
        var launcher = factories.size() == 1 ? chatCameraLauncherType(factories.get(0)) : null;
        for (var m : starts) if (m.getDefiningClass().equals(launcher)) launches.add(m);
        launches.addAll(checks);
        return launches;
    }

    static final String ACTIVATE_GALLERY = "Lcom/facebook/xapp/messaging/composer/gallery/event/ActivateGalleryEvent;";
    static final String EDIT_GALLERY_ITEM = "Lcom/facebook/xapp/messaging/composer/gallery/event/EditGalleryItemEvent;";

    static String dotted(String type) {
        return type.substring(1, type.length() - 1).replace('/', '.');
    }

    static String packageOf(String type) {
        int slash = type.lastIndexOf('/');
        return slash < 0 ? "" : type.substring(0, slash);
    }

    static boolean isComposerResult(Method m) {
        if (!"onActivityResult".equals(m.getName()) || !"V".equals(m.getReturnType()) ||
            !List.of("I", "I", "Landroid/content/Intent;").equals(m.getParameterTypes().stream().map(Object::toString).toList())) return false;
        var strings = stringsOf(m);
        return hasLiteral(m, 7377) && hasLiteral(m, 1112) && strings.contains("ComposeFragment:externalMediaGalleryActivityResultNullData") &&
            strings.contains("ComposeFragment:montageMessageActivityResultNullData");
    }

    static final String COMPOSER_EVENT = "Lcom/facebook/xapp/messaging/composer/event/ComposerEvent;";

    /** The older handler given the event's class name, or the composer plugin given the event. Mirrors galleryHandlerKind. */
    static String galleryHandlerKind(Method m) {
        var params = m.getParameterTypes().stream().map(Object::toString).toList();
        if (params.size() == 2 && "Ljava/lang/String;".equals(params.get(1))) return "by name";
        if (params.size() == 4 && COMPOSER_EVENT.equals(params.get(3))) return "plugin";
        return null;
    }

    static boolean typeIs(Instruction i, Opcode opcode, String type) {
        return i.getOpcode() == opcode && i instanceof ReferenceInstruction r && r.getReference() instanceof TypeReference t && type.equals(t.getType());
    }

    /** A chat composer event handler, opening Messenger's gallery and its editor by event name or class. Mirrors ExternalGallery.kt. */
    static boolean isGalleryHandler(Method m, Map<String, Map<Integer, String>> tables) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType())) return false;
        var kind = galleryHandlerKind(m);
        if ("by name".equals(kind)) {
            var strings = new HashSet<>(stringsOf(m));
            strings.addAll(tableStrings(instructions(m), tables));
            if (!strings.contains(dotted(ACTIVATE_GALLERY)) || !strings.contains(dotted(EDIT_GALLERY_ITEM))) return false;
        } else if ("plugin".equals(kind)) {
            for (var event : List.of(ACTIVATE_GALLERY, EDIT_GALLERY_ITEM)) {
                boolean checked = false;
                for (var i : m.getImplementation().getInstructions()) if (typeIs(i, Opcode.INSTANCE_OF, event)) checked = true;
                if (!checked) return false;
            }
        } else return false;
        int casts = 0;
        for (var i : m.getImplementation().getInstructions()) if (typeIs(i, Opcode.CHECK_CAST, ACTIVATE_GALLERY)) casts++;
        return casts == 1;
    }

    static boolean implementsThrough(ClassDef cls, String iface, Map<String, ClassDef> byType) {
        for (int depth = 0; cls != null && depth < 16; depth++, cls = cls.getSuperclass() == null ? null : byType.get(cls.getSuperclass()))
            if (cls.getInterfaces().contains(iface)) return true;
        return false;
    }

    /** A class and the classes above it, as far as the dex has them. */
    static List<ClassDef> lineage(ClassDef cls, Map<String, ClassDef> byType) {
        var up = new ArrayList<ClassDef>();
        for (int depth = 0; cls != null && depth < 16; depth++, cls = cls.getSuperclass() == null ? null : byType.get(cls.getSuperclass())) up.add(cls);
        return up;
    }

    static boolean declaresStart(ClassDef cls, Method start) {
        var signature = start.getParameterTypes().stream().map(CharSequence::toString).toList();
        for (var m : cls.getMethods())
            if (m.getName().equals(start.getName()) && m.getReturnType().equals(start.getReturnType()) &&
                m.getParameterTypes().stream().map(CharSequence::toString).toList().equals(signature)) return true;
        return false;
    }

    /** The one concrete class that runs the launcher's own start, with nothing below it bringing another. Mirrors galleryTarget. */
    static ClassDef galleryTarget(List<ClassDef> classes, ClassDef launcher, Method start, Map<String, ClassDef> byType) {
        var below = new ArrayList<ClassDef>();
        for (var cls : classes)
            if (!cls.getType().equals(launcher.getType()) && lineage(cls, byType).stream().anyMatch(up -> up.getType().equals(launcher.getType()))) below.add(cls);
        // 584's launcher is abstract with two final subclasses that both inherit its start, so every object of it runs this start.
        if (below.stream().noneMatch(other -> declaresStart(other, start))) return launcher;
        var candidates = new ArrayList<ClassDef>(below);
        candidates.add(0, launcher);
        ClassDef target = null;
        for (var cls : candidates) {
            if (AccessFlags.ABSTRACT.isSet(cls.getAccessFlags())) continue;
            boolean runs = true;
            for (var up : lineage(cls, byType)) {
                if (up.getType().equals(launcher.getType())) break;
                if (declaresStart(up, start)) runs = false;
            }
            if (!runs) continue;
            boolean replaced = false;
            for (var other : below)
                if (declaresStart(other, start) && lineage(other, byType).stream().anyMatch(up -> up.getType().equals(cls.getType()))) replaced = true;
            if (replaced) continue;
            if (target != null) return null;
            target = cls;
        }
        return target;
    }

    /** The editor gets the launcher from its last parameter and starts it straight away. Mirrors startsFromProvider. */
    static boolean startsFromProvider(Method editor, String providerType, String start) {
        var code = instructions(editor);
        var params = editor.getParameterTypes();
        if (params.isEmpty() || !providerType.equals(params.get(params.size() - 1).toString())) return false;
        int provider = editor.getImplementation().getRegisterCount() - 1;
        int get = -1;
        for (int i = 0; i < code.size(); i++) {
            if (writesRegister(code.get(i), provider)) return false;
            if (code.get(i).getOpcode() == Opcode.INVOKE_INTERFACE && callArgs(code.get(i)).equals(List.of(provider)) &&
                (providerType + "->get()Ljava/lang/Object;").equals(ref(code.get(i)))) {
                if (get >= 0) return false;
                get = i;
            }
        }
        if (get < 0 || get + 2 >= code.size() || code.get(get + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return false;
        int launcher = ((OneRegisterInstruction) code.get(get + 1)).getRegisterA();
        var cast = code.get(get + 2);
        if (cast.getOpcode() != Opcode.CHECK_CAST || ((OneRegisterInstruction) cast).getRegisterA() != launcher ||
            !(((ReferenceInstruction) cast).getReference() instanceof TypeReference t) || !start.startsWith(t.getType() + "->")) return false;
        for (int i = get + 3; i < code.size(); i++) {
            var instruction = code.get(i);
            if (instruction.getOpcode() == Opcode.INVOKE_INTERFACE && start.equals(ref(instruction)))
                return !callArgs(instruction).isEmpty() && callArgs(instruction).get(0) == launcher;
            if (writesRegister(instruction, launcher) || instruction instanceof OffsetInstruction) return false;
        }
        return false;
    }

    /** The handler's field its Edit branch hands the editor, the chat camera launcher's provider. Mirrors galleryProvider. */
    static FieldReference galleryProvider(Method handler, String iface, Method start, Map<String, ClassDef> byType) {
        var code = instructions(handler);
        int e = -1;
        for (int i = 0; i < code.size(); i++)
            if ((code.get(i).getOpcode() == Opcode.INVOKE_STATIC || code.get(i).getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                code.get(i) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr && refParams(mr).contains(EDIT_GALLERY_ITEM)) {
                if (e >= 0) return null;
                e = i;
            }
        if (e < 0) return null;
        var edit = (MethodReference) ((ReferenceInstruction) code.get(e)).getReference();
        var editParams = refParams(edit);
        var args = callArgs(code.get(e));
        if (editParams.isEmpty() || args.isEmpty()) return null;
        String providerType = editParams.get(editParams.size() - 1);
        int provider = args.get(args.size() - 1);
        int load = -1;
        for (int i = e - 1; i >= 0 && load < 0; i--) if (writesRegister(code.get(i), provider)) load = i;
        // 586 reads the field into another register and moves it into the call's range, so plain moves are followed.
        for (int hops = 0; load >= 0 && hops < 4 && Set.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
            .contains(code.get(load).getOpcode()); hops++) {
            int from = ((TwoRegisterInstruction) code.get(load)).getRegisterB(), at = load;
            load = -1;
            for (int i = at - 1; i >= 0 && load < 0; i--) if (writesRegister(code.get(i), from)) load = i;
        }
        if (load < 0 || code.get(load).getOpcode() != Opcode.IGET_OBJECT ||
            !(((ReferenceInstruction) code.get(load)).getReference() instanceof FieldReference field)) return null;
        if (!field.getDefiningClass().equals(handler.getDefiningClass()) || !field.getType().equals(providerType)) return null;
        var edges = edges(handler);
        if (edges == null) return null;
        // Branches may run between the read and the call, but only the read leads in: no catch, no switch case, and no
        // branch from outside lands there.
        for (var edge : edges) {
            if (edge[1] <= load || edge[1] > e) continue;
            var from = edge[0] < 0 ? null : code.get(edge[0]).getOpcode();
            if (from == null || from == Opcode.PACKED_SWITCH || from == Opcode.SPARSE_SWITCH || edge[0] < load || edge[0] >= e) return null;
        }
        var home = byType.get(handler.getDefiningClass());
        if (home == null) return null;
        int fields = 0;
        for (var f : home.getFields())
            if (f.getName().equals(field.getName()) && f.getType().equals(field.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) fields++;
        if (fields != 1) return null;
        var editorClass = byType.get(edit.getDefiningClass());
        if (editorClass == null) return null;
        Method editor = null;
        for (var m : editorClass.getMethods()) if (hookId(m).equals(edit.toString())) {
            if (editor != null) return null;
            editor = m;
        }
        if (editor == null || editor.getImplementation() == null) return null;
        var startParams = new StringBuilder();
        for (var type : start.getParameterTypes()) startParams.append(type);
        return startsFromProvider(editor, providerType, iface + "->" + start.getName() + "(" + startParams + ")Z") ? field : null;
    }

    static final String ACTIVITY_RESULT_EVENT = "Lcom/facebook/xapp/messaging/composer/activity/event/ActivityResultEvent;";

    /** The p-number of the method's one parameter of this type, or -1 when it has none or several. */
    static int onlyParameter(Method m, String type) {
        int at = -1, found = 0, words = AccessFlags.STATIC.isSet(m.getAccessFlags()) ? 0 : 1;
        for (var param : m.getParameterTypes()) {
            if (type.contentEquals(param)) { found++; at = words; }
            words += "J".contentEquals(param) || "D".contentEquals(param) ? 2 : 1;
        }
        return found == 1 ? at : -1;
    }

    /**
     * The chat's static handler for a photo picked in another app: handed one thread and one result event, it checks for
     * 1112 and reads the event's one intent field from that parameter, before anything writes over it. Mirrors
     * galleryItemsIntent in ExternalGallery.kt.
     */
    static boolean isGalleryItemsHandler(Method m, Map<String, ClassDef> byType) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || m.getImplementation() == null ||
            onlyParameter(m, THREAD_KEY) < 0 || onlyParameter(m, ACTIVITY_RESULT_EVENT) < 0 || !hasLiteral(m, 1112)) return false;
        int event = galleryItemsRegister(m, ACTIVITY_RESULT_EVENT);
        var code = instructions(m);
        // 586's armv7 handler reuses the event's register for the coroutine's last argument once it's done with the event.
        // The hooks run before any of it, so that's fine while nothing from the reuse on branches or catches, and only
        // reads ahead of it count.
        int reused = code.size();
        for (int at = code.size() - 1; at >= 0; at--) if (writesRegister(code.get(at), event)) reused = at;
        if (reused < code.size() && (!m.getImplementation().getTryBlocks().isEmpty() ||
            code.subList(reused, code.size()).stream().anyMatch(i -> i instanceof OffsetInstruction))) return false;
        var intents = new LinkedHashMap<String, FieldReference>();
        for (int at = 0; at < code.size(); at++) {
            var i = code.get(at);
            if (i.getOpcode() != Opcode.IGET_OBJECT || ((TwoRegisterInstruction) i).getRegisterB() != event) continue;
            if (at > reused) return false;
            if (((ReferenceInstruction) i).getReference() instanceof FieldReference f && ACTIVITY_RESULT_EVENT.equals(f.getDefiningClass()) &&
                "Landroid/content/Intent;".equals(f.getType())) intents.put(f.toString(), f);
        }
        if (intents.size() != 1) return false;
        var intent = intents.values().iterator().next();
        var eventClass = byType.get(ACTIVITY_RESULT_EVENT);
        if (eventClass == null) return false;
        int fields = 0;
        for (var field : eventClass.getFields())
            if (field.getName().equals(intent.getName()) && field.getType().equals(intent.getType()) && !AccessFlags.STATIC.isSet(field.getAccessFlags())) fields++;
        return fields == 1;
    }

    /** The register that holds the static method's one parameter of this type. */
    static int galleryItemsRegister(Method m, String type) {
        int words = 0;
        for (var param : m.getParameterTypes()) words += "J".contentEquals(param) || "D".contentEquals(param) ? 2 : 1;
        return m.getImplementation().getRegisterCount() - words + onlyParameter(m, type);
    }

    /**
     * external_gallery: the chat's gallery event handlers (at most one of each kind, every one routing), the chat camera
     * launcher's start (the one way each handler's Edit branch reaches that launcher), the chat's result reader and its
     * one handler for a photo from another app, counted only while the reader is an instance method that reads the chat
     * camera's request code and the launcher is the camera switch's own. Mirrors findExternalGallery in ExternalGallery.kt.
     * Each gallery handler needs three locals for its scratch registers, and the photo handler's hook reaches its thread
     * and event with plain instructions, so both sit below v16.
     */
    static List<Method> externalGalleryHooks(List<ClassDef> classes, Map<String, Map<Integer, String>> tables) {
        var readers = new ArrayList<Method>();
        var factories = new ArrayList<Method>();
        var handlers = new ArrayList<Method>();
        var items = new ArrayList<Method>();
        var byType = new HashMap<String, ClassDef>();
        for (var cls : classes) byType.put(cls.getType(), cls);
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (m.getImplementation() == null) continue;
                if (isComposerResult(m)) readers.add(m);
                if (isChatCameraFactory(m)) factories.add(m);
                if (isGalleryHandler(m, tables)) handlers.add(m);
                if (isGalleryItemsHandler(m, byType)) items.add(m);
            }
        }
        if (readers.size() != 1 || !hasLiteral(readers.get(0), 7376) || AccessFlags.STATIC.isSet(readers.get(0).getAccessFlags()) ||
            factories.size() != 1 || handlers.isEmpty() || items.size() != 1) return List.of();
        if (galleryItemsRegister(items.get(0), THREAD_KEY) > 15 || galleryItemsRegister(items.get(0), ACTIVITY_RESULT_EVENT) > 15) return List.of();
        var kinds = new HashSet<String>();
        for (var handler : handlers) if (!kinds.add(galleryHandlerKind(handler))) return List.of();
        var factory = factories.get(0);
        String launcher = chatCameraLauncherType(factory);
        var launcherClass = launcher == null ? null : byType.get(launcher);
        if (launcherClass == null || !implementsThrough(launcherClass, factory.getReturnType(), byType)) return List.of();
        Method start = null;
        for (var m : launcherClass.getMethods()) if (m.getImplementation() != null && isLauncherStart(m)) {
            if (start != null) return List.of();
            start = m;
        }
        if (start == null) return List.of();
        // The hook has no host to hand the start, so it passes null, which only works while the start never reads it.
        for (var i : instructions(start)) if (mayRead(i, start.getImplementation().getRegisterCount() - 1)) return List.of();
        var target = galleryTarget(classes, launcherClass, start, byType);
        if (target == null) return List.of();
        for (var handler : handlers) {
            var provider = galleryProvider(handler, factory.getReturnType(), start, byType);
            var providerClass = provider == null ? null : byType.get(provider.getType());
            if (providerClass == null || !AccessFlags.INTERFACE.isSet(providerClass.getAccessFlags())) return List.of();
            String home = packageOf(handler.getDefiningClass());
            for (var cls : List.of(providerClass, launcherClass, target))
                if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags()) && !packageOf(cls.getType()).equals(home)) return List.of();
            if (AccessFlags.PRIVATE.isSet(start.getAccessFlags()) ||
                (!AccessFlags.PUBLIC.isSet(start.getAccessFlags()) && !packageOf(launcher).equals(home))) return List.of();
            int words = 1;
            for (var type : handler.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
            if (handler.getImplementation().getRegisterCount() - words < 3) return List.of();
        }
        var hooks = new ArrayList<Method>(handlers);
        hooks.add(start);
        hooks.add(readers.get(0));
        hooks.add(items.get(0));
        return hooks;
    }

    static final String MONTAGE_MODEL = "Lcom/facebook/messaging/montage/composer/model/";
    static final String EDITOR_BUILDER = MONTAGE_MODEL + "MontageComposerFragmentParams$Builder;";
    static final String EDITOR_PARAMS = MONTAGE_MODEL + "MontageComposerFragmentParams;";
    static final String CHAT_MEDIA = "Lcom/facebook/ui/media/attachments/model/MediaResource;";
    static final String INSERT_PREVIEW = "Lcom/facebook/xapp/messaging/composer/attachmentpreview/events/InsertAttachmentPreviewEvent;";
    static final String INSERT_PREVIEW_INIT = INSERT_PREVIEW + "-><init>(" + CHAT_MEDIA + "Ljava/util/List;)V";
    static final String ITEM_TYPE_CALL = "Landroid/content/Intent;->getType()Ljava/lang/String;";
    static final String INVOKE_SUSPEND = "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;";
    static final Set<Opcode> CHAT_RUN_ENDS = Set.of(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW);

    static boolean endsChatRun(Instruction i) {
        return i instanceof OffsetInstruction || CHAT_RUN_ENDS.contains(i.getOpcode());
    }

    static String typeOf(Instruction i) {
        return i instanceof ReferenceInstruction r && r.getReference() instanceof TypeReference t ? t.getType() : null;
    }

    /** The register that holds parameter p[n], counting this as p0 on an instance method. */
    static int parameterRegister(Method m, int n) {
        int words = AccessFlags.STATIC.isSet(m.getAccessFlags()) ? 0 : 1;
        for (var p : m.getParameterTypes()) words += "J".contentEquals(p) || "D".contentEquals(p) ? 2 : 1;
        return m.getImplementation().getRegisterCount() - words + n;
    }

    /** Where the gallery coroutine opens the editor with the item it copied, and the registers the hook there uses. */
    record GalleryChatSite(int at, int intent, int media, int chat, int params, String chatType, String unit) {}

    /**
     * The coroutine copies the picked item into a MediaResource (see copiedMedia) and builds the editor's params with it
     * right after, then opens the editor and returns Unit. The run into the copy, with no branch out and none landing inside, reads the
     * intent's type and casts the chat to one of the given types, and neither register changes after. All four registers
     * are locals below v16 and no try covers the builder. Mirrors galleryChatSite in GalleryToChat.kt.
     */
    static GalleryChatSite galleryChatSite(Method m, Set<String> chats) {
        if (m.getImplementation() == null) return null;
        var code = instructions(m);
        int at = -1;
        for (int i = 0; i < code.size(); i++)
            if (code.get(i).getOpcode() == Opcode.NEW_INSTANCE && EDITOR_BUILDER.equals(typeOf(code.get(i)))) {
                if (at >= 0) return null;
                at = i;
            }
        if (at < 0) return null;
        int media = copiedMedia(code, at), params = register(code.get(at));
        if (media < 0) return null;
        int open = at + 1;
        for (; open < code.size(); open++) {
            var i = code.get(open);
            if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr &&
                "V".equals(mr.getReturnType())) {
                var types = refParams(mr);
                if (types.size() == 4 && EDITOR_PARAMS.equals(types.get(1)) && NAVIGATION_TRIGGER.equals(types.get(2)) && "I".equals(types.get(3))) break;
            }
            if (endsChatRun(i)) return null;
        }
        if (open + 2 >= code.size() || code.get(open + 1).getOpcode() != Opcode.SGET_OBJECT || code.get(open + 2).getOpcode() != Opcode.RETURN_OBJECT ||
            register(code.get(open + 1)) != register(code.get(open + 2))) return null;
        if (!(((ReferenceInstruction) code.get(open + 1)).getReference() instanceof FieldReference unit) || !unit.getType().equals(unit.getDefiningClass())) return null;
        boolean stored = false;
        for (int i = at + 1; i < open; i++)
            if (code.get(i).getOpcode() == Opcode.IPUT_OBJECT && code.get(i) instanceof TwoRegisterInstruction put && put.getRegisterA() == media &&
                put.getRegisterB() == params && ((ReferenceInstruction) code.get(i)).getReference() instanceof FieldReference f &&
                EDITOR_BUILDER.equals(f.getDefiningClass()) && CHAT_MEDIA.equals(f.getType())) stored = true;
        if (!stored) return null;
        int start = at - 2;
        while (start > 0 && !endsChatRun(code.get(start - 1))) start--;
        var landings = mediaTargets(m);
        for (int i = start + 1; i < at; i++) if (landings.contains(i)) return null;
        int typed = -1, cast = -1;
        for (int i = start; i < at; i++) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && ITEM_TYPE_CALL.equals(ref(code.get(i)))) {
                if (typed >= 0) return null;
                typed = i;
            }
            if (code.get(i).getOpcode() == Opcode.CHECK_CAST && chats.contains(typeOf(code.get(i)))) {
                if (cast >= 0) return null;
                cast = i;
            }
        }
        if (typed < 0 || cast < 0) return null;
        int intent = ((FiveRegisterInstruction) code.get(typed)).getRegisterC(), chat = register(code.get(cast));
        for (int i = typed + 1; i < at; i++) if (writesRegister(code.get(i), intent)) return null;
        for (int i = cast + 1; i < at; i++) if (writesRegister(code.get(i), chat)) return null;
        var registers = List.of(intent, media, chat, params);
        int locals = parameterRegister(m, 0);
        if (new HashSet<>(registers).size() != 4 || registers.stream().anyMatch(r -> r > 15 || r >= locals)) return null;
        int address = 0;
        for (int i = 0; i < at; i++) address += code.get(i).getCodeUnits();
        for (var block : m.getImplementation().getTryBlocks())
            if (address >= block.getStartCodeAddress() && address < block.getStartCodeAddress() + block.getCodeUnitCount()) return null;
        return new GalleryChatSite(at, intent, media, chat, params, typeOf(code.get(cast)), unit.toString());
    }

    /**
     * The register holding the item's MediaResource copy right before the builder at {@code at}, or -1: either a static
     * copy with one parameter and its move-result (586 arm64), or the copy's constructor inlined as new-instance,
     * invoke-direct with one argument and a move-object out of the new register (586 armv7).
     */
    static int copiedMedia(List<Instruction> code, int at) {
        if (at < 2) return -1;
        var copy = code.get(at - 2);
        if (code.get(at - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT)
            return (copy.getOpcode() == Opcode.INVOKE_STATIC || copy.getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                copy instanceof ReferenceInstruction cr && cr.getReference() instanceof MethodReference copied &&
                copied.getParameterTypes().size() == 1 && CHAT_MEDIA.equals(copied.getReturnType()) ? register(code.get(at - 1)) : -1;
        if (at < 3 || code.get(at - 1).getOpcode() != Opcode.MOVE_OBJECT || code.get(at - 3).getOpcode() != Opcode.NEW_INSTANCE ||
            !CHAT_MEDIA.equals(typeOf(code.get(at - 3))) || copy.getOpcode() != Opcode.INVOKE_DIRECT ||
            !(copy instanceof FiveRegisterInstruction made) || made.getRegisterCount() != 2 ||
            !(((ReferenceInstruction) copy).getReference() instanceof MethodReference init) || !"<init>".equals(init.getName()) ||
            !CHAT_MEDIA.equals(init.getDefiningClass()) || init.getParameterTypes().size() != 1) return -1;
        var moved = (TwoRegisterInstruction) code.get(at - 1);
        int built = register(code.get(at - 3));
        return made.getRegisterC() == built && moved.getRegisterB() == built ? moved.getRegisterA() : -1;
    }

    static boolean publicStaticCall(String id, Map<String, ClassDef> byType) {
        var owner = byType.get(id.substring(0, id.indexOf("->")));
        if (owner == null) return false;
        Method found = null;
        for (var m : owner.getMethods()) if (hookId(m).equals(id)) {
            if (found != null) return false;
            found = m;
        }
        return found != null && AccessFlags.PUBLIC.isSet(owner.getAccessFlags()) && AccessFlags.PUBLIC.isSet(found.getAccessFlags()) &&
            AccessFlags.STATIC.isSet(found.getAccessFlags());
    }

    /** The chat's event dispatchers by the chat type they take, each the public static call right after a new tray insert. Mirrors chatDispatchers. */
    static Map<String, Set<String>> chatDispatchers(List<ClassDef> classes, Map<String, ClassDef> byType) {
        var found = new LinkedHashMap<String, Set<String>>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            var code = instructions(m);
            for (int i = 0; i + 1 < code.size(); i++) {
                if (code.get(i).getOpcode() != Opcode.INVOKE_DIRECT || !INSERT_PREVIEW_INIT.equals(ref(code.get(i)))) continue;
                var call = code.get(i + 1);
                if (call.getOpcode() != Opcode.INVOKE_STATIC || !(((ReferenceInstruction) call).getReference() instanceof MethodReference mr)) continue;
                var types = refParams(mr);
                if (!"V".equals(mr.getReturnType()) || types.size() != 2 || !COMPOSER_EVENT.equals(types.get(1)) ||
                    ((FiveRegisterInstruction) call).getRegisterD() != ((FiveRegisterInstruction) code.get(i)).getRegisterC()) continue;
                found.computeIfAbsent(types.get(0), k -> new LinkedHashSet<>()).add(mr.toString());
            }
        }
        found.values().removeIf(ids -> !ids.stream().allMatch(id -> publicStaticCall(id, byType)));
        return found;
    }

    static final String COMPOSER_FACTORY = "Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;";
    static final Set<Opcode> TRAY_NULLS = Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST);
    static final Set<Opcode> TRAY_GOTOS = Set.of(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32);

    /** The tray gate's single return, when no branch lands on it and its register is below v16. Mirrors traySite. */
    static int traySite(Method m) {
        if (!m.getParameterTypes().isEmpty() || !"Z".equals(m.getReturnType()) || m.getImplementation() == null) return -1;
        var code = instructions(m);
        int at = -1;
        for (int i = 0; i < code.size(); i++)
            if (CHAT_RUN_ENDS.contains(code.get(i).getOpcode())) {
                if (at >= 0) return -1;
                at = i;
            }
        if (at < 0 || code.get(at).getOpcode() != Opcode.RETURN || register(code.get(at)) > 15 || mediaTargets(m).contains(at)) return -1;
        return at;
    }

    /**
     * The composer factory's override of the base call it asks before building the tray plugin, the one whose event set
     * takes the tray insert. A false answer jumps to a zero for the plugin and a goto past where it's built. Only a factory
     * that overrides its gate counts. Mirrors trayGate in GalleryToChat.kt.
     */
    static Method trayGate(List<ClassDef> classes) {
        var trays = new HashSet<String>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!m.getParameterTypes().isEmpty() || !"Ljava/util/Set;".equals(m.getReturnType()) || m.getImplementation() == null) continue;
            for (var i : instructions(m)) if (i.getOpcode() == Opcode.CONST_CLASS && INSERT_PREVIEW.equals(typeOf(i))) trays.add(cls.getType());
        }
        var gates = new LinkedHashSet<String>();
        for (var factory : classes) {
            if (!COMPOSER_FACTORY.equals(factory.getSuperclass())) continue;
            for (var m : factory.getMethods()) {
                if (m.getImplementation() == null) continue;
                var code = instructions(m);
                for (int built = 0; built < code.size(); built++) {
                    if (code.get(built).getOpcode() != Opcode.NEW_INSTANCE || !trays.contains(typeOf(code.get(built)))) continue;
                    int plugin = register(code.get(built));
                    for (int none = 0; none + 1 < code.size(); none++) {
                        var zero = code.get(none);
                        if (!TRAY_NULLS.contains(zero.getOpcode()) || register(zero) != plugin || ((NarrowLiteralInstruction) zero).getNarrowLiteral() != 0 ||
                            !TRAY_GOTOS.contains(code.get(none + 1).getOpcode()) || mediaTarget(code, none + 1) <= built) continue;
                        for (int guard = 2; guard < code.size(); guard++) {
                            if (code.get(guard).getOpcode() != Opcode.IF_EQZ || mediaTarget(code, guard) != none) continue;
                            var call = code.get(guard - 2);
                            if (code.get(guard - 1).getOpcode() != Opcode.MOVE_RESULT || register(code.get(guard - 1)) != register(code.get(guard)) ||
                                (call.getOpcode() != Opcode.INVOKE_VIRTUAL && call.getOpcode() != Opcode.INVOKE_VIRTUAL_RANGE) ||
                                !(((ReferenceInstruction) call).getReference() instanceof MethodReference asked) ||
                                !COMPOSER_FACTORY.equals(asked.getDefiningClass()) || !asked.getParameterTypes().isEmpty() || !"Z".equals(asked.getReturnType())) continue;
                            boolean overridden = false;
                            for (var own : factory.getMethods())
                                overridden |= own.getName().equals(asked.getName()) && own.getParameterTypes().isEmpty() && "Z".equals(own.getReturnType());
                            if (overridden) gates.add(factory.getType() + "->" + asked.getName() + "()Z");
                        }
                    }
                }
            }
        }
        if (gates.size() != 1) return null;
        Method gate = null;
        for (var cls : classes) for (var m : cls.getMethods()) if (hookId(m).equals(gates.iterator().next())) {
            if (gate != null) return null;
            gate = m;
        }
        return gate != null && traySite(gate) >= 0 ? gate : null;
    }

    /**
     * gallery_temp_file: Messenger's copy of an item it's handed, an instance method with no parameters that names one temp
     * file "inbound" through a plain call and opens it for writing, and its check of a temp folder. Both or neither. Mirrors
     * findGalleryTempFile in ExternalGallery.kt.
     */
    static List<Method> galleryTempFileHooks(List<ClassDef> classes) {
        var copies = new ArrayList<Method>();
        var checks = new ArrayList<Method>();
        for (var c : classes) for (var m : c.getMethods()) {
            if (m.getImplementation() == null) continue;
            if (isTempFolderCheck(m)) checks.add(m);
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getParameterTypes().isEmpty() || !"V".equals(m.getReturnType())) continue;
            var code = instructions(m);
            if (code.stream().noneMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && "inbound".equals(s.getString()))) continue;
            if (code.stream().noneMatch(i -> i.getOpcode() == Opcode.INVOKE_DIRECT && "Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V".equals(ref(i)))) continue;
            var calls = code.stream().filter(i -> "Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;".equals(ref(i))).toList();
            if (calls.size() == 1 && calls.get(0).getOpcode() == Opcode.INVOKE_STATIC) copies.add(m);
        }
        return copies.size() == 1 && checks.size() == 1 ? List.of(checks.get(0), copies.get(0)) : List.of();
    }

    /** Messenger's check of a temp folder, which throws on one that's there but can't be used. Mirrors tempFolderCheck in ExternalGallery.kt. */
    static boolean isTempFolderCheck(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getParameterTypes().isEmpty() || !"Ljava/io/File;".equals(m.getReturnType())) return false;
        if (!stringsOf(m).containsAll(List.of("No write permissions for temporary directory ", " is not a directory."))) return false;
        var code = instructions(m);
        if (code.size() < 3 || code.get(0).getOpcode() != Opcode.IGET_OBJECT || code.get(1).getOpcode() != Opcode.INVOKE_VIRTUAL ||
            code.get(2).getOpcode() != Opcode.MOVE_RESULT) return false;
        if (!(((ReferenceInstruction) code.get(0)).getReference() instanceof FieldReference field) || !field.getDefiningClass().equals(m.getDefiningClass()) ||
            !"Ljava/io/File;".equals(field.getType())) return false;
        int folder = ((TwoRegisterInstruction) code.get(0)).getRegisterA();
        return "Ljava/io/File;->exists()Z".equals(ref(code.get(1))) && ((FiveRegisterInstruction) code.get(1)).getRegisterC() == folder && folder <= 15 &&
            ((OneRegisterInstruction) code.get(2)).getRegisterA() != folder;
    }

    /**
     * gallery_to_chat: Open your gallery app's handler for a photo from another app and the one coroutine it starts, while
     * the handler has four locals and its event below v16, the event's intent field is public and writable, the coroutine
     * has the editor site, and the chat type it casts to has one public dispatcher, plus the composer's tray gate. Mirrors
     * findGalleryToChat in GalleryToChat.kt.
     */
    static List<Method> galleryToChatHooks(List<ClassDef> classes) {
        var byType = new HashMap<String, ClassDef>();
        for (var cls : classes) byType.put(cls.getType(), cls);
        Method items = null;
        for (var cls : classes) for (var m : cls.getMethods())
            if (m.getImplementation() != null && isGalleryItemsHandler(m, byType)) {
                if (items != null) return List.of();
                items = m;
            }
        if (items == null) return List.of();
        int event = galleryItemsRegister(items, ACTIVITY_RESULT_EVENT);
        if (parameterRegister(items, 0) < 4 || event > 15) return List.of();
        FieldReference intent = null;
        for (var i : instructions(items))
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) i).getRegisterB() == event &&
                ((ReferenceInstruction) i).getReference() instanceof FieldReference f && ACTIVITY_RESULT_EVENT.equals(f.getDefiningClass()) &&
                "Landroid/content/Intent;".equals(f.getType())) intent = f;
        boolean writable = false;
        for (var f : byType.get(ACTIVITY_RESULT_EVENT).getFields())
            if (f.getName().equals(intent.getName()) && f.getType().equals(intent.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags()))
                writable = AccessFlags.PUBLIC.isSet(f.getAccessFlags()) && !AccessFlags.FINAL.isSet(f.getAccessFlags());
        if (!writable) return List.of();
        var startedTypes = new LinkedHashSet<String>();
        for (var i : instructions(items)) if (i.getOpcode() == Opcode.NEW_INSTANCE && typeOf(i) != null) startedTypes.add(typeOf(i));
        var started = new ArrayList<Method>();
        for (var type : startedTypes) {
            var cls = byType.get(type);
            if (cls == null) continue;
            var suspends = new ArrayList<Method>();
            for (var m : cls.getMethods()) if (hookId(m).substring(hookId(m).indexOf("->") + 2).equals(INVOKE_SUSPEND)) suspends.add(m);
            if (suspends.size() == 1) started.add(suspends.get(0));
        }
        if (started.size() != 1) return List.of();
        var resume = started.get(0);
        var insert = byType.get(INSERT_PREVIEW);
        if (insert == null || !AccessFlags.PUBLIC.isSet(insert.getAccessFlags())) return List.of();
        boolean insertable = false;
        for (var m : insert.getMethods()) if (hookId(m).equals(INSERT_PREVIEW_INIT) && AccessFlags.PUBLIC.isSet(m.getAccessFlags())) insertable = true;
        if (!insertable) return List.of();
        var dispatchers = chatDispatchers(classes, byType);
        dispatchers.values().removeIf(ids -> ids.size() != 1);
        var editors = new ArrayList<Method>();
        for (var step : coroutineSteps(resume, byType)) if (galleryChatSite(step, dispatchers.keySet()) != null) editors.add(step);
        if (editors.size() != 1) return List.of();
        var tray = trayGate(classes);
        return tray == null ? List.of() : List.of(items, editors.get(0), tray);
    }

    static final String PRESENCE_ITEM = "Lcom/facebook/presence/model/PresenceItem;";
    static final Set<String> PRESENCE_MANAGERS = Set.of("Lcom/facebook/presence/DefaultPresenceManager;", "Lcom/facebook/presence/PresenceManagerV2;");
    static final List<String> PRESENCE_ITEM_PARAMS = List.of("Lcom/facebook/user/model/UserKey;", "Ljava/lang/Long;", "Ljava/lang/Long;", "Ljava/lang/String;",
        "Ljava/lang/String;", "I", "J", "Z");
    static final String PRESENCE_INT_EXTRA = "Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I";

    static final String ANDROIDX_FRAGMENT = "Landroidx/fragment/app/Fragment;";
    static final Set<String> DIALOG_FRAGMENT_LISTENERS =
        Set.of("Landroid/content/DialogInterface$OnDismissListener;", "Landroid/content/DialogInterface$OnCancelListener;");

    /** androidx's DialogFragment: a Fragment that listens for both dismiss and cancel and keeps its dialog in mDialog. */
    static boolean dialogFragment(ClassDef cls) {
        if (!ANDROIDX_FRAGMENT.equals(cls.getSuperclass())) return false;
        var listeners = new HashSet<String>();
        for (var i : cls.getInterfaces()) listeners.add(i.toString());
        if (!listeners.equals(DIALOG_FRAGMENT_LISTENERS)) return false;
        for (Field f : cls.getFields())
            if (f.getName().equals("mDialog") && f.getType().equals("Landroid/app/Dialog;") && !AccessFlags.STATIC.isSet(f.getAccessFlags())) return true;
        return false;
    }

    /** Right after onStart's one Dialog.show(), on what it last read from its own mDialog, or -1. Mirrors MenuBlur.kt's menuBlurSite. */
    static int menuBlurSite(Method method) {
        if (!method.getName().equals("onStart") || !"V".equals(method.getReturnType()) || method.getParameterTypes().size() != 0
            || AccessFlags.STATIC.isSet(method.getAccessFlags())) return -1;
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.INVOKE_VIRTUAL || !"Landroid/app/Dialog;->show()V".equals(ref(code.get(i)))) continue;
            if (at >= 0) return -1;
            at = i;
        }
        if (at < 0 || at + 1 >= code.size() || mediaTargets(method).contains(at + 1)) return -1;
        int dialog = ((FiveRegisterInstruction) code.get(at)).getRegisterC();
        int read = -1;
        for (int i = at - 1; i >= 0; i--) if (mediaWrites(code.get(i), dialog)) { read = i; break; }
        if (read < 0 || code.get(read).getOpcode() != Opcode.IGET_OBJECT) return -1;
        int self = parameterRegister(method, 0);
        if (!(code.get(read) instanceof TwoRegisterInstruction get) || get.getRegisterB() != self) return -1;
        if (!(((ReferenceInstruction) code.get(read)).getReference() instanceof FieldReference field)
            || !field.getDefiningClass().equals(method.getDefiningClass()) || !field.getName().equals("mDialog")
            || !field.getType().equals("Landroid/app/Dialog;")) return -1;
        for (int i = 0; i < read; i++) if (mediaWrites(code.get(i), self)) return -1;
        return at + 1;
    }

    static final Set<Opcode> CHAT_HEAD_MOVES = EnumSet.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);

    /**
     * The video player's TextureView boolean: the only boolean its (Context, view, config) constructor reads from the
     * config, tested by the next instruction, read from the parameter or its one copy. Mirrors ChatHeadVideo.kt.
     */
    static FieldReference chatHeadVideoFlag(Method method) {
        if (!"<init>".equals(method.getName()) || !"V".equals(method.getReturnType()) ||
            AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getImplementation() == null) return null;
        var params = method.getParameterTypes().stream().map(CharSequence::toString).toList();
        if (params.size() != 3 || !"Landroid/content/Context;".equals(params.get(0)) || !params.get(2).startsWith("L") ||
            params.get(2).startsWith("Ljava/")) return null;
        if (method.getImplementation().getRegisterCount() - 4 < 3) return null;
        var code = instructions(method);
        // The video library's shared default settings, a class Redex leaves unrenamed.
        String settings = "Lcom/facebook/video/heroplayer/setting/HeroPlayerSetting;";
        boolean player = false;
        for (var i : code) {
            if (i.getOpcode() == Opcode.SGET_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f &&
                settings.equals(f.getDefiningClass()) && settings.equals(f.getType())) player = true;
        }
        if (!player) return null;
        int read = -1;
        for (int k = 0; k < code.size(); k++) {
            if (code.get(k).getOpcode() == Opcode.IGET_BOOLEAN && code.get(k) instanceof ReferenceInstruction r &&
                r.getReference() instanceof FieldReference f && params.get(2).equals(f.getDefiningClass())) {
                if (read >= 0) return null;
                read = k;
            }
        }
        if (read < 0 || read + 1 >= code.size()) return null;
        var get = (TwoRegisterInstruction) code.get(read);
        var test = code.get(read + 1);
        if (test.getOpcode() != Opcode.IF_EQZ || register(test) != get.getRegisterA()) return null;
        int config = parameterRegister(method, 3), holder = get.getRegisterB();
        if (!chatHeadWrites(code, read, config).isEmpty()) return null;
        if (holder != config) {
            var copies = chatHeadWrites(code, read, holder);
            if (copies.size() != 1) return null;
            var copy = code.get(copies.get(0));
            if (!CHAT_HEAD_MOVES.contains(copy.getOpcode()) || ((TwoRegisterInstruction) copy).getRegisterB() != config) return null;
        }
        return (FieldReference) ((ReferenceInstruction) get).getReference();
    }

    static List<Integer> chatHeadWrites(List<Instruction> code, int before, int register) {
        var at = new ArrayList<Integer>();
        for (int k = 0; k < before; k++) if (writes(code.get(k), register)) at.add(k);
        return at;
    }

    /** chat_head_video: the player's constructor, while exactly one has the shape and the config's boolean is writable. */
    static List<Method> chatHeadVideo(List<ClassDef> classes) {
        var players = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if ("<init>".equals(m.getName()) && chatHeadVideoFlag(m) != null) players.add(m);
        if (players.size() != 1) return List.of();
        var flag = chatHeadVideoFlag(players.get(0));
        ClassDef config = null;
        for (var cls : classes) if (cls.getType().equals(flag.getDefiningClass())) { config = cls; break; }
        if (config == null) return List.of();
        var fields = new ArrayList<Field>();
        for (var f : config.getFields()) if (f.getName().equals(flag.getName()) && "Z".equals(f.getType())) fields.add(f);
        if (fields.size() != 1) return List.of();
        int locked = AccessFlags.STATIC.getValue() | AccessFlags.FINAL.getValue() | AccessFlags.PRIVATE.getValue();
        return (fields.get(0).getAccessFlags() & locked) != 0 ? List.of() : players;
    }

    /**
     * The register a call button builder returns its wrapper in: its only return, of a new instance of the declared
     * return type made right before it, which nothing jumps to. -1 for any other method. Mirrors CallButtonBuilt.kt.
     */
    static int callButtonReturn(Method m) {
        String wrapper = m.getReturnType();
        if (!wrapper.startsWith("L") || wrapper.startsWith("Ljava/") || wrapper.startsWith("Landroid/") || m.getImplementation() == null) return -1;
        var code = instructions(m);
        int at = -1;
        for (int k = 0; k < code.size(); k++) if (code.get(k).getOpcode() == Opcode.RETURN_OBJECT) {
            if (at >= 0) return -1;
            at = k;
        }
        if (at < 2) return -1;
        int returned = register(code.get(at));
        var made = code.get(at - 2);
        var init = code.get(at - 1);
        if (made.getOpcode() != Opcode.NEW_INSTANCE || register(made) != returned ||
            !(made instanceof ReferenceInstruction mr) || !(mr.getReference() instanceof TypeReference type) || !wrapper.equals(type.getType())) return -1;
        if (init.getOpcode() != Opcode.INVOKE_DIRECT || !(init instanceof FiveRegisterInstruction call) || call.getRegisterC() != returned ||
            !(init instanceof ReferenceInstruction ir) || !(ir.getReference() instanceof MethodReference constructor) ||
            !wrapper.equals(constructor.getDefiningClass()) || !"<init>".equals(constructor.getName()) || constructor.getParameterTypes().isEmpty()) return -1;
        return mediaTargets(m).contains(at) ? -1 : returned;
    }

    /** The one everyday call tag a builder gives its button, as a literal or through a string table, else null. */
    static String callButtonTag(Method m, Map<String, Map<Integer, String>> tables) {
        var code = instructions(m);
        var named = new HashSet<String>();
        for (var i : code) if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s) named.add(s.getString());
        named.addAll(tableStrings(code, tables));
        String tag = null;
        for (var t : CALL_TAGS) if (named.contains(t)) {
            if (tag != null) return null;
            tag = t;
        }
        return tag;
    }

    /** The base type a builder's wrapper constructor takes the button as. */
    static String callButtonBase(Method m) {
        var code = instructions(m);
        int at = 0;
        while (code.get(at).getOpcode() != Opcode.RETURN_OBJECT) at++;
        return ((MethodReference) ((ReferenceInstruction) code.get(at - 1)).getReference()).getParameterTypes().get(0).toString();
    }

    /**
     * call_button_built: the audio and video call button builders, taking a thread key and a Mig scheme, exactly one of
     * each, returning the same wrapper, which extends the abstract base its constructor takes first. Mirrors CallButtonBuilt.kt.
     */
    static List<Method> callButtonBuilt(List<ClassDef> classes, Map<String, Map<Integer, String>> tables) {
        var builders = new HashMap<String, List<Method>>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            var params = m.getParameterTypes().stream().map(CharSequence::toString).toList();
            if (!params.contains(THREAD_KEY) || !params.contains(MIG_SCHEME) || callButtonReturn(m) < 0) continue;
            String tag = callButtonTag(m, tables);
            if (tag != null) builders.computeIfAbsent(tag, k -> new ArrayList<>()).add(m);
        }
        var audio = builders.getOrDefault("audio_call_button", List.of());
        var video = builders.getOrDefault("video_call_button", List.of());
        if (audio.size() != 1 || video.size() != 1) return List.of();
        Method a = audio.get(0), v = video.get(0);
        String base = callButtonBase(a);
        if (!a.getReturnType().equals(v.getReturnType()) || !base.equals(callButtonBase(v))) return List.of();
        ClassDef wrapperClass = null, baseClass = null;
        for (var cls : classes) {
            if (wrapperClass == null && cls.getType().equals(a.getReturnType())) wrapperClass = cls;
            if (baseClass == null && cls.getType().equals(base)) baseClass = cls;
        }
        if (wrapperClass == null || baseClass == null || !base.equals(wrapperClass.getSuperclass()) ||
            !AccessFlags.ABSTRACT.isSet(baseClass.getAccessFlags()) || AccessFlags.INTERFACE.isSet(baseClass.getAccessFlags())) return List.of();
        return List.of(a, v);
    }

    static final String CALL_LIST_COPY = IMMUTABLE_LIST + "->copyOf(Ljava/util/Collection;)" + IMMUTABLE_LIST;

    /** The register a method returns its ImmutableList in: its only return, which nothing jumps to. -1 otherwise. Mirrors CallButtonLists.kt. */
    static int callListReturn(Method m) {
        if (!IMMUTABLE_LIST.equals(m.getReturnType()) || m.getImplementation() == null) return -1;
        var code = instructions(m);
        int at = -1;
        for (int k = 0; k < code.size(); k++) if (code.get(k).getOpcode() == Opcode.RETURN_OBJECT) {
            if (at >= 0) return -1;
            at = k;
        }
        if (at < 0 || mediaTargets(m).contains(at)) return -1;
        int returned = register(code.get(at));
        return returned <= 255 ? returned : -1;
    }

    /**
     * The move-result that takes the List a filled array of element (any object type when null) goes straight into, through
     * a static call taking an Object array. -1 unless there's exactly one such site and nothing jumps into it or onto the
     * instruction after it. Mirrors CallButtonLists.kt.
     */
    static int callListArray(Method m, String element) {
        if (m.getImplementation() == null) return -1;
        var code = instructions(m);
        int site = -1;
        for (int i = 0; i + 3 < code.size(); i++) {
            var fill = code.get(i);
            if (fill.getOpcode() != Opcode.FILLED_NEW_ARRAY && fill.getOpcode() != Opcode.FILLED_NEW_ARRAY_RANGE) continue;
            if (!(fill instanceof ReferenceInstruction fr) || !(fr.getReference() instanceof TypeReference filled)) continue;
            String type = filled.getType();
            if (!type.startsWith("[L") || (element != null && !type.equals("[" + element))) continue;
            var array = code.get(i + 1);
            var call = code.get(i + 2);
            var list = code.get(i + 3);
            if (array.getOpcode() != Opcode.MOVE_RESULT_OBJECT || list.getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
            if (call.getOpcode() != Opcode.INVOKE_STATIC && call.getOpcode() != Opcode.INVOKE_STATIC_RANGE) continue;
            if (!(call instanceof ReferenceInstruction cr) || !(cr.getReference() instanceof MethodReference made)) continue;
            if (!made.getParameterTypes().stream().map(CharSequence::toString).toList().equals(List.of("[Ljava/lang/Object;")) ||
                !"Ljava/util/List;".equals(made.getReturnType()) || !callArgs(call).equals(List.of(register(array)))) continue;
            if (site >= 0) return -1;
            site = i + 3;
        }
        if (site < 0 || site + 1 >= code.size()) return -1;
        var targets = mediaTargets(m);
        for (int k = site - 2; k <= site + 1; k++) if (targets.contains(k)) return -1;
        return site;
    }

    /**
     * hide_call_lists: the business chat's call bar and the New message screen, the methods that call both call button
     * builders and either return an ImmutableList or pack the buttons' base type into an array for a List, exactly one of
     * each, while Messenger's ImmutableList can copy a collection. Mirrors CallButtonLists.kt.
     */
    static List<Method> callButtonLists(List<ClassDef> classes, List<Method> builders) {
        if (builders.size() != 2) return List.of();
        var ids = new HashSet<String>();
        for (var b : builders) ids.add(hookId(b));
        String base = callButtonBase(builders.get(0));
        var lists = new ArrayList<Method>();
        var arrays = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            var called = new HashSet<String>();
            for (var i : instructions(m)) if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference r) {
                String id = methodId(r);
                if (ids.contains(id)) called.add(id);
            }
            if (!called.equals(ids)) continue;
            if (callListReturn(m) >= 0) lists.add(m);
            if (callListArray(m, base) >= 0) arrays.add(m);
        }
        if (lists.size() != 1 || arrays.size() != 1 || lists.get(0) == arrays.get(0)) return List.of();
        ClassDef immutable = null;
        for (var cls : classes) if (cls.getType().equals(IMMUTABLE_LIST)) { immutable = cls; break; }
        if (immutable == null) return List.of();
        boolean copies = false;
        for (var m : immutable.getMethods()) if (hookId(m).equals(CALL_LIST_COPY) &&
            AccessFlags.STATIC.isSet(m.getAccessFlags()) && AccessFlags.PUBLIC.isSet(m.getAccessFlags())) copies = true;
        return copies ? List.of(lists.get(0), arrays.get(0)) : List.of();
    }

    /** menu_blur: DialogFragment's onStart, while exactly one class has the DialogFragment shape. Mirrors MenuBlur.kt. */
    static List<Method> menuBlur(List<ClassDef> classes) {
        var fragments = new ArrayList<ClassDef>();
        for (var cls : classes) if (dialogFragment(cls)) fragments.add(cls);
        if (fragments.size() != 1) return List.of();
        var sites = new ArrayList<Method>();
        for (var method : fragments.get(0).getMethods()) if (menuBlurSite(method) >= 0) sites.add(method);
        return sites.size() == 1 ? sites : List.of();
    }

    /**
     * Special contacts: PresenceItem's constructor, when it's plain (no try, no landing, one return-void last, no
     * parameter written), and each presence manager's typing handler, at least one, one per manager, none landing on its
     * first instruction. Mirrors findSpecialContacts in SpecialContacts.kt.
     */
    static List<Method> specialContacts(List<ClassDef> classes) {
        var presence = new ArrayList<Method>();
        var typing = new ArrayList<Method>();
        for (var cls : classes) {
            if (!PRESENCE_ITEM.equals(cls.getType()) && !PRESENCE_MANAGERS.contains(cls.getType())) continue;
            for (var m : cls.getMethods()) {
                if (isPresenceItemInit(m)) presence.add(m);
                if (isTypingHandler(m)) typing.add(m);
            }
        }
        if (presence.size() != 1 || presenceReturn(presence.get(0)) < 0 || typing.isEmpty()) return List.of();
        var managers = new HashSet<String>();
        for (var m : typing) if (!managers.add(m.getDefiningClass()) || mediaTargets(m).contains(0)) return List.of();
        var out = new ArrayList<Method>(presence);
        out.addAll(typing);
        return out;
    }

    static boolean isPresenceItemInit(Method m) {
        if (!PRESENCE_ITEM.equals(m.getDefiningClass()) || !"<init>".equals(m.getName()) || !"V".equals(m.getReturnType()) ||
            m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags())) return false;
        var params = new ArrayList<String>();
        for (var p : m.getParameterTypes()) params.add(p.toString());
        return params.equals(PRESENCE_ITEM_PARAMS);
    }

    /** The index of the constructor's one return-void when it's the last instruction and the code is plain, else -1. */
    static int presenceReturn(Method m) {
        var code = instructions(m);
        if (code.isEmpty() || !m.getImplementation().getTryBlocks().isEmpty() || !mediaTargets(m).isEmpty()) return -1;
        int last = code.size() - 1;
        if (code.get(last).getOpcode() != Opcode.RETURN_VOID) return -1;
        for (var i : code) if (i != code.get(last) && i.getOpcode() == Opcode.RETURN_VOID) return -1;
        int first = parameterRegister(m, 1);
        for (var i : code) for (int r = first; r < first + 9; r++) if (mediaWrites(i, r)) return -1;
        return last;
    }

    static boolean isTypingHandler(Method m) {
        if (!PRESENCE_MANAGERS.contains(m.getDefiningClass()) || !AccessFlags.STATIC.isSet(m.getAccessFlags()) ||
            !"V".equals(m.getReturnType()) || m.getImplementation() == null) return false;
        var params = new ArrayList<String>();
        for (var p : m.getParameterTypes()) params.add(p.toString());
        if (!params.equals(List.of("Landroid/content/Intent;", m.getDefiningClass()))) return false;
        boolean state = false, user = false;
        for (var i : instructions(m)) {
            if (!(i instanceof ReferenceInstruction r)) continue;
            if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && PRESENCE_INT_EXTRA.equals(r.getReference().toString())) state = true;
            if (i.getOpcode() == Opcode.CHECK_CAST && HIDDEN_USER_KEY.equals(r.getReference().toString())) user = true;
        }
        return state && user;
    }

    /** What the Instants capture callback logs when copying the photo runs out of memory, and the recipe it builds. */
    static final String INSTANT_PHOTO_COPY = "photo_copy";
    static final String INSTANT_CAPTURE_RECIPE = "Lcom/facebook/messaging/quicksnap/creation/engine/model/MsgrQuicksnapCaptureRecipe;";

    /**
     * The Instants camera's capture callback, when every one found has its photo reads where Send Instants from your
     * gallery swaps them: 1 to 4 reads, none a landing, each read and the instruction after it inside one try that
     * catches Exception, nothing landing on the first instruction, and three locals for the entry check. Mirrors
     * findInstantGallery and validateInstantGallery in InstantGallery.kt.
     */
    static List<Method> instantGallery(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if (isInstantCapture(m)) found.add(m);
        for (var m : found) if (!instantProved(m)) return List.of();
        return found;
    }

    static boolean isInstantCapture(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || m.getParameterTypes().size() != 1 ||
            !m.getParameterTypes().get(0).toString().startsWith("L") || m.getImplementation() == null) return false;
        boolean copy = false, recipe = false;
        for (var i : m.getImplementation().getInstructions()) {
            if (!(i instanceof ReferenceInstruction r)) continue;
            if (r.getReference() instanceof StringReference s && INSTANT_PHOTO_COPY.equals(s.getString())) copy = true;
            if (r.getReference() instanceof MethodReference mr && INSTANT_CAPTURE_RECIPE.equals(mr.getDefiningClass()) &&
                "<init>".equals(mr.getName())) recipe = true;
        }
        return copy && recipe;
    }

    static List<Integer> instantArguments(Instruction i) {
        var out = new ArrayList<Integer>();
        if (i instanceof RegisterRangeInstruction range)
            for (int r = range.getStartRegister(); r < range.getStartRegister() + range.getRegisterCount(); r++) out.add(r);
        else if (i instanceof FiveRegisterInstruction five) {
            int[] all = {five.getRegisterC(), five.getRegisterD(), five.getRegisterE(), five.getRegisterF(), five.getRegisterG()};
            for (int k = 0; k < five.getRegisterCount(); k++) out.add(all[k]);
        }
        return out;
    }

    /**
     * Where each photo read ends: a static getter handed only the result that returns a Bitmap, or (armv7) the result's
     * own no-argument Object getter cast to a Bitmap in the register it moved into.
     */
    static List<Integer> instantFrameReads(Method m) {
        var code = instructions(m);
        int result = parameterRegister(m, 1);
        String resultType = m.getParameterTypes().get(0).toString();
        var reads = new ArrayList<Integer>();
        for (int i = 0; i + 1 < code.size(); i++) {
            var call = code.get(i);
            if (!(call instanceof ReferenceInstruction r) || !(r.getReference() instanceof MethodReference mr)) continue;
            if (!instantArguments(call).equals(List.of(result)) || code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
            int moved = register(code.get(i + 1));
            var op = call.getOpcode();
            if ((op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE) && "Landroid/graphics/Bitmap;".equals(mr.getReturnType()) &&
                refParams(mr).equals(List.of(resultType))) {
                reads.add(i + 2);
                continue;
            }
            boolean instance = op == Opcode.INVOKE_VIRTUAL || op == Opcode.INVOKE_VIRTUAL_RANGE || op == Opcode.INVOKE_INTERFACE ||
                op == Opcode.INVOKE_INTERFACE_RANGE;
            if (!instance || !resultType.equals(mr.getDefiningClass()) || !mr.getParameterTypes().isEmpty() ||
                !"Ljava/lang/Object;".equals(mr.getReturnType())) continue;
            if (i + 2 < code.size() && code.get(i + 2).getOpcode() == Opcode.CHECK_CAST && register(code.get(i + 2)) == moved &&
                "Landroid/graphics/Bitmap;".equals(typeOf(code.get(i + 2)))) reads.add(i + 3);
        }
        return reads;
    }

    static boolean instantProved(Method m) {
        var impl = m.getImplementation();
        if (impl.getRegisterCount() - 2 < 3) return false;
        var reads = instantFrameReads(m);
        if (reads.isEmpty() || reads.size() > 4) return false;
        var code = instructions(m);
        int[] addresses = new int[code.size() + 1];
        for (int i = 0; i < code.size(); i++) addresses[i + 1] = addresses[i] + code.get(i).getCodeUnits();
        var landings = mediaTargets(m);
        if (landings.contains(0)) return false;
        for (int at : reads) {
            if (landings.contains(at) || at >= code.size()) return false;
            boolean caught = false;
            for (var block : impl.getTryBlocks()) {
                int start = block.getStartCodeAddress(), end = start + block.getCodeUnitCount();
                boolean inside = addresses[at - 1] >= start && addresses[at - 1] < end && addresses[at] >= start && addresses[at] < end;
                if (inside && block.getExceptionHandlers().stream().anyMatch(h ->
                    h.getExceptionType() == null || "Ljava/lang/Exception;".equals(h.getExceptionType()))) caught = true;
            }
            if (!caught) return false;
        }
        return true;
    }

    static final String COROUTINE_STEP = "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";

    /**
     * The coroutine's resume and the static helpers of its own class it hands {this, result} to. 587's armv7 build merges
     * coroutines into one class whose resume switches to each one's helper. Mirrors coroutineSteps in GalleryToChat.kt.
     */
    static List<Method> coroutineSteps(Method resume, Map<String, ClassDef> byType) {
        var steps = new ArrayList<Method>(List.of(resume));
        int self = parameterRegister(resume, 0), result = parameterRegister(resume, 1);
        var handed = new HashSet<String>();
        for (var i : instructions(resume))
            if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof FiveRegisterInstruction call && call.getRegisterCount() == 2 &&
                call.getRegisterC() == self && call.getRegisterD() == result) handed.add(ref(i));
        for (var m : byType.get(resume.getDefiningClass()).getMethods())
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) && hookId(m).endsWith(COROUTINE_STEP) && handed.contains(hookId(m))) steps.add(m);
        return steps;
    }

    static final String FONT_LAYOUT_ANCHOR = "Hit OEM font NPE in Paint.setTypeface, keeping previous typeface";
    static final String FONT_REPOSITORY_ANCHOR = "The requested font, %s, does not have a backing source. " +
        "You need to provide either a systemFontName, assetFontName, or a fileDescriptor.";
    static final String FONT_ROBOTO_ANCHOR = "Unable to create roboto typeface: %s";
    static final String TYPEFACE = "Landroid/graphics/Typeface;";
    static final String FONT_COLORS = "Landroid/content/res/ColorStateList;";

    /** CustomFont.kt isFontRobotoCopy: an instance (Context)Typeface copy that logs under the builder's class. */
    static boolean robotoCopy(Method m, String builder) {
        return !AccessFlags.STATIC.isSet(m.getAccessFlags()) && TYPEFACE.equals(m.getReturnType()) &&
            fontParameters(m).equals(List.of("Landroid/content/Context;")) && !builder.equals(m.getDefiningClass()) &&
            instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.CONST_CLASS && builder.equals(ref(i)));
    }

    static List<String> fontParameters(Method m) {
        return m.getParameterTypes().stream().map(Object::toString).toList();
    }

    static Set<String> fontCalls(Method m) {
        var calls = new HashSet<String>();
        for (var i : instructions(m)) if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference) calls.add(ref(i));
        return calls;
    }

    /**
     * custom_font: Litho's text layout setTypeface, Messenger's typeface repository and its Roboto builder, each the one
     * holder of its string, the by-name lookup that asks that repository, and every Litho text input that hands its
     * EditText a typeface. Mirrors CustomFont.kt.
     */
    static Map<String, List<Method>> customFontHooks(List<ClassDef> classes) {
        var holders = new LinkedHashMap<String, Set<Method>>();
        for (var anchor : List.of(FONT_LAYOUT_ANCHOR, FONT_REPOSITORY_ANCHOR, FONT_ROBOTO_ANCHOR)) holders.put(anchor, new LinkedHashSet<>());
        var byName = new ArrayList<Method>();
        var inputs = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (m.getImplementation() == null) continue;
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference sr && holders.containsKey(sr.getString()))
                    holders.get(sr.getString()).add(m);
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags())) continue;
            var params = fontParameters(m);
            if (TYPEFACE.equals(m.getReturnType()) && params.equals(List.of("Landroid/content/Context;", "Ljava/lang/String;", "I"))) {
                var calls = fontCalls(m);
                if (calls.contains(TYPEFACE + "->create(Ljava/lang/String;I)" + TYPEFACE) && calls.contains(TYPEFACE + "->create(" + TYPEFACE + "I)" + TYPEFACE))
                    byName.add(m);
            }
            if ("V".equals(m.getReturnType()) && params.size() >= 3 && params.subList(0, 3).equals(List.of(FONT_COLORS, FONT_COLORS, TYPEFACE)) &&
                params.contains("Landroid/widget/EditText;") && fontCalls(m).contains("Landroid/widget/TextView;->setTypeface(" + TYPEFACE + "I)V"))
                inputs.add(m);
        }
        var layout = holders.get(FONT_LAYOUT_ANCHOR).size() == 1 ? holders.get(FONT_LAYOUT_ANCHOR).iterator().next() : null;
        if (layout != null && (AccessFlags.STATIC.isSet(layout.getAccessFlags()) || !"V".equals(layout.getReturnType()) ||
            !fontParameters(layout).equals(List.of(TYPEFACE)))) layout = null;
        var repository = holders.get(FONT_REPOSITORY_ANCHOR).size() == 1 ? holders.get(FONT_REPOSITORY_ANCHOR).iterator().next() : null;
        if (repository != null) {
            var params = fontParameters(repository);
            if (!AccessFlags.STATIC.isSet(repository.getAccessFlags()) || !TYPEFACE.equals(repository.getReturnType()) || params.size() != 4 ||
                !params.get(0).startsWith("L") || !params.get(1).equals(repository.getDefiningClass()) || !"I".equals(params.get(3)) ||
                !fontCalls(repository).contains("Ljava/lang/Enum;->name()Ljava/lang/String;")) repository = null;
        }
        // The builder, plus family B's per-weight copies of it (CustomFont.kt robotoBuilders). Nothing if any other holder.
        var robotos = new ArrayList<Method>();
        var builders = holders.get(FONT_ROBOTO_ANCHOR).stream().filter(m -> AccessFlags.STATIC.isSet(m.getAccessFlags()) &&
            TYPEFACE.equals(m.getReturnType()) && fontParameters(m).equals(List.of("Landroid/content/Context;", "Ljava/lang/Integer;"))).toList();
        if (builders.size() == 1) {
            var builder = builders.get(0);
            robotos.add(builder);
            for (var m : holders.get(FONT_ROBOTO_ANCHOR)) if (m != builder) {
                if (robotoCopy(m, builder.getDefiningClass())) robotos.add(m);
                else { robotos.clear(); break; }
            }
        }
        var asked = new ArrayList<Method>();
        if (repository != null) for (var m : byName) {
            boolean asks = false;
            for (var i : instructions(m))
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference mr &&
                    mr.getDefiningClass().equals(repository.getDefiningClass()) && TYPEFACE.equals(mr.getReturnType()) &&
                    List.of(fontParameters(repository).get(0)).equals(mr.getParameterTypes().stream().map(Object::toString).toList())) asks = true;
            if (asks) asked.add(m);
        }
        var found = new LinkedHashMap<String, List<Method>>();
        found.put("font_layout", layout == null ? List.of() : List.of(layout));
        found.put("font_repository", repository == null ? List.of() : List.of(repository));
        found.put("font_roboto", robotos);
        found.put("font_by_name", asked);
        found.put("font_input", inputs);
        return found;
    }
}
