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
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Chats: hidden chats, nearby scans, story hold, the AI summary, chat preview, landscape, blocked people, folders, mute and story sharing. */
final class Chats {

    // hidden_chat_list, hidden_chat_row and hidden_chat_tap: Hide chosen chats. Mirrors HideChats.kt.
    static final String HIDDEN_PARTICIPANT = "Lcom/facebook/messaging/model/threads/ThreadParticipant;";
    static final String HIDDEN_PARTICIPANT_INFO = "Lcom/facebook/messaging/model/messages/ParticipantInfo;";
    static final String HIDDEN_USER_KEY = "Lcom/facebook/user/model/UserKey;";
    static final String HIDDEN_NAMER = "Lcom/facebook/messaging/threadlist/plugins/core/threadname/standard/StandardThreadNameImplementation;";
    static final List<String> HIDDEN_FILTER_PARAMS =
        List.of("Lcom/facebook/messaging/threadlist/clientfilter/ThreadListClientFilter;", IMMUTABLE_LIST, "Ljava/lang/String;");
    static final String HIDDEN_ITERATOR = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;";
    static final String HIDDEN_NEXT = "Ljava/util/Iterator;->next()Ljava/lang/Object;";
    static final String HIDDEN_ROWS = "Ljava/util/ArrayList;";

    /** The items read walks the chats its last client filter handed back exactly once, both registers plain and this untouched. */
    static boolean hiddenListSite(Method items) {
        var impl = items.getImplementation();
        if (impl == null || !INBOX_SUPPLIER.equals(items.getDefiningClass()) || AccessFlags.STATIC.isSet(items.getAccessFlags()) ||
            !items.getParameterTypes().isEmpty() || !IMMUTABLE_LIST.equals(items.getReturnType())) return false;
        var code = instructions(items);
        int self = impl.getRegisterCount() - 1, sites = 0;
        for (var i : code) if (writes(i, self)) return false;
        for (int at = 0; at < code.size(); at++) if (hiddenListSiteAt(code, at, self)) sites++;
        return sites == 1;
    }

    static boolean hiddenListSiteAt(List<Instruction> code, int at, int self) {
        if (!(code.get(at) instanceof FiveRegisterInstruction walk) || walk.getOpcode() != Opcode.INVOKE_VIRTUAL ||
            !HIDDEN_ITERATOR.equals(ref(walk)) || walk.getRegisterCount() != 1 || at + 1 >= code.size()) return false;
        int list = walk.getRegisterC();
        var taken = code.get(at + 1);
        if (taken.getOpcode() != Opcode.MOVE_RESULT_OBJECT) return false;
        int iterator = register(taken);
        if (iterator == list || list > 15 || iterator > 15 || list >= self || iterator >= self) return false;
        int written = -1;
        for (int i = at - 1; i >= 1 && written < 0; i--) if (writes(code.get(i), list)) written = i;
        if (written < 0) return false;
        var filter = code.get(written - 1);
        if (code.get(written).getOpcode() != Opcode.MOVE_RESULT_OBJECT ||
            (filter.getOpcode() != Opcode.INVOKE_INTERFACE && filter.getOpcode() != Opcode.INVOKE_INTERFACE_RANGE) ||
            !(filter instanceof ReferenceInstruction fr) || !(fr.getReference() instanceof MethodReference filtered) ||
            !IMMUTABLE_LIST.equals(filtered.getReturnType()) || !inboxParams(filtered).equals(HIDDEN_FILTER_PARAMS)) return false;
        int next = -1;
        for (int i = at + 2; i <= Math.min(at + 8, code.size() - 3) && next < 0; i++)
            if (code.get(i).getOpcode() == Opcode.INVOKE_INTERFACE && HIDDEN_NEXT.equals(ref(code.get(i))) &&
                ((FiveRegisterInstruction) code.get(i)).getRegisterC() == iterator) next = i;
        if (next < 0) return false;
        var chat = code.get(next + 1);
        var cast = code.get(next + 2);
        if (chat.getOpcode() != Opcode.MOVE_RESULT_OBJECT || cast.getOpcode() != Opcode.CHECK_CAST || register(cast) != register(chat) ||
            !THREAD_SUMMARY_TYPE.equals(((TypeReference) ((ReferenceInstruction) cast).getReference()).getType())) return false;
        var loop = code.subList(next + 3, code.size());
        return hiddenRead(loop, THREAD_SUMMARY_TYPE, THREAD_KEY, null) && hiddenRead(loop, THREAD_SUMMARY_TYPE, IMMUTABLE_LIST, null) &&
            hiddenRead(loop, HIDDEN_PARTICIPANT, HIDDEN_PARTICIPANT_INFO, null) && hiddenRead(loop, HIDDEN_PARTICIPANT_INFO, HIDDEN_USER_KEY, null) &&
            hiddenRead(loop, HIDDEN_USER_KEY, "Ljava/lang/String;", "id");
    }

    static boolean hiddenRead(List<Instruction> code, String owner, String type, String name) {
        for (var i : code)
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                owner.equals(f.getDefiningClass()) && type.equals(f.getType()) && (name == null || name.equals(f.getName()))) return true;
        return false;
    }

    /** The chat's own name, its people's SecretString names and the SecretString's text field, each read exactly where HideChats.kt reads it. */
    static boolean hiddenChatNames(Map<String, ClassDef> byType) {
        var namer = byType.get(HIDDEN_NAMER);
        var info = byType.get(HIDDEN_PARTICIPANT_INFO);
        var secret = byType.get(SECRET_STRING);
        if (namer == null || info == null || secret == null) return false;
        var namers = new ArrayList<Method>();
        for (var m : namer.getMethods()) if (params(m).equals(List.of(THREAD_SUMMARY_TYPE))) namers.add(m);
        if (namers.size() != 1 || !hiddenRead(instructions(namers.get(0)), THREAD_SUMMARY_TYPE, "Ljava/lang/String;", null)) return false;
        var described = new ArrayList<Method>();
        for (var m : info.getMethods())
            if ("toString".equals(m.getName()) && m.getParameterTypes().isEmpty() && "Ljava/lang/String;".equals(m.getReturnType())) described.add(m);
        if (described.size() != 1 || described.get(0).getImplementation() == null) return false;
        var code = instructions(described.get(0));
        int label = -1;
        for (int k = 0; k < code.size() && label < 0; k++)
            if ((code.get(k).getOpcode() == Opcode.CONST_STRING || code.get(k).getOpcode() == Opcode.CONST_STRING_JUMBO) && "name".equals(inboxString(code.get(k)))) label = k;
        if (label < 0 || label + 1 >= code.size()) return false;
        var read = code.get(label + 1);
        if (read.getOpcode() != Opcode.IGET_OBJECT || !(((ReferenceInstruction) read).getReference() instanceof FieldReference named) ||
            !HIDDEN_PARTICIPANT_INFO.equals(named.getDefiningClass()) || !SECRET_STRING.equals(named.getType())) return false;
        var ctors = new ArrayList<Method>();
        for (var m : secret.getMethods())
            if ("<init>".equals(m.getName()) && m.getImplementation() != null && params(m).equals(List.of("Ljava/lang/String;"))) ctors.add(m);
        if (ctors.size() != 1) return false;
        int argument = ctors.get(0).getImplementation().getRegisterCount() - 1;
        var texts = new LinkedHashSet<String>();
        for (var i : instructions(ctors.get(0)))
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f && SECRET_STRING.equals(f.getDefiningClass()) &&
                "Ljava/lang/String;".equals(f.getType()) && i instanceof TwoRegisterInstruction t && t.getRegisterA() == argument) texts.add(fieldId(f));
        return texts.size() == 1;
    }

    /**
     * The chat list menu: the one class built right after its plugin's "MenuItems" check, with one row list and one tap.
     * Hide chat menu items hooks the same row list and needs everything but the eye icons.
     */
    static Map<String, List<Method>> hiddenChats(List<ClassDef> classes, Map<String, ClassDef> byType) {
        var built = new LinkedHashSet<String>();
        for (var cls : classes)
            for (var m : cls.getMethods()) {
                var code = instructions(m);
                for (int at = 0; at < code.size(); at++) { var menu = hiddenMenuBuiltAt(code, at); if (menu != null) built.add(menu); }
            }
        var menus = new ArrayList<ClassDef>();
        for (var type : built) {
            var menu = byType.get(type);
            if (menu != null && hiddenMenuMethods(menu, true).size() == 1 && hiddenMenuMethods(menu, false).size() == 1) menus.add(menu);
        }
        var hooks = new LinkedHashMap<String, List<Method>>();
        hooks.put("hidden_chat_row", List.of());
        hooks.put("hidden_chat_tap", List.of());
        hooks.put("chat_menu_items", List.of());
        if (menus.size() != 1) return hooks;
        var row = hiddenMenuMethods(menus.get(0), true).get(0);
        var tap = hiddenMenuMethods(menus.get(0), false).get(0);
        if (hiddenRowProved(row, byType, true)) hooks.put("hidden_chat_row", List.of(row));
        if (hiddenRowProved(row, byType, false)) hooks.put("chat_menu_items", List.of(row));
        if (hiddenTapProved(tap)) hooks.put("hidden_chat_tap", List.of(tap));
        return hooks;
    }

    static String hiddenMenuBuiltAt(List<Instruction> code, int at) {
        var op = code.get(at).getOpcode();
        if ((op != Opcode.CONST_STRING && op != Opcode.CONST_STRING_JUMBO) || !"MenuItems".equals(inboxString(code.get(at))) || at + 4 >= code.size()) return null;
        if (code.get(at + 1).getOpcode() != Opcode.INVOKE_VIRTUAL || !"Ljava/lang/String;->equals(Ljava/lang/Object;)Z".equals(ref(code.get(at + 1))) ||
            code.get(at + 2).getOpcode() != Opcode.MOVE_RESULT || code.get(at + 3).getOpcode() != Opcode.IF_EQZ ||
            code.get(at + 4).getOpcode() != Opcode.NEW_INSTANCE) return null;
        return ((TypeReference) ((ReferenceInstruction) code.get(at + 4)).getReference()).getType();
    }

    /** The menu's instance row lists, ()ArrayList, or its instance taps, (I)V. */
    static List<Method> hiddenMenuMethods(ClassDef menu, boolean rows) {
        var found = new ArrayList<Method>();
        for (var m : menu.getMethods()) {
            if (AccessFlags.STATIC.isSet(m.getAccessFlags())) continue;
            if (rows ? m.getParameterTypes().isEmpty() && HIDDEN_ROWS.equals(m.getReturnType()) : "V".equals(m.getReturnType()) && params(m).equals(List.of("I")))
                found.add(m);
        }
        return found;
    }

    /**
     * The row list hands back one plain register with a second free beside it, and builds its rows through one builder
     * class: a factory, an int id, a String description, a CharSequence title, an icon whose enum has both eye icons, and
     * a static build that takes the builder and a name. The eye icons count only when [eyes] is set.
     */
    static boolean hiddenRowProved(Method row, Map<String, ClassDef> byType, boolean eyes) {
        var impl = row.getImplementation();
        if (impl == null) return false;
        var code = instructions(row);
        int at = -1, returns = 0;
        for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.RETURN_OBJECT) { at = i; returns++; }
        if (returns != 1) return false;
        int rows = register(code.get(at)), menu = rows == 0 ? 1 : 0;
        if (rows > 15 || menu >= impl.getRegisterCount() - 1) return false;
        var builds = new LinkedHashMap<String, MethodReference>();
        for (var i : code)
            if (i.getOpcode() == Opcode.INVOKE_STATIC && ((ReferenceInstruction) i).getReference() instanceof MethodReference m &&
                inboxParams(m).equals(List.of(m.getDefiningClass(), "Ljava/lang/String;")) && m.getReturnType().startsWith("L")) builds.put(m.toString(), m);
        if (builds.size() != 1) return false;
        String owner = builds.values().iterator().next().getDefiningClass();
        var icons = new LinkedHashMap<String, MethodReference>();
        var factories = new LinkedHashSet<String>();
        var titles = new LinkedHashSet<String>();
        var ids = new LinkedHashSet<String>();
        var descriptions = new LinkedHashSet<String>();
        var setters = new LinkedHashSet<String>();
        for (var i : code) {
            if (!(i instanceof ReferenceInstruction ri)) continue;
            if (ri.getReference() instanceof MethodReference m && owner.equals(m.getDefiningClass())) {
                var types = inboxParams(m);
                if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && "V".equals(m.getReturnType()) && types.size() == 1 && types.get(0).startsWith("L") &&
                    !types.get(0).equals("Ljava/lang/CharSequence;") && !types.get(0).equals("Ljava/lang/String;")) icons.put(m.toString(), m);
                if (i.getOpcode() == Opcode.INVOKE_STATIC && types.isEmpty() && owner.equals(m.getReturnType())) factories.add(m.toString());
                if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && "V".equals(m.getReturnType()) && types.equals(List.of("Ljava/lang/CharSequence;"))) titles.add(m.toString());
                if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && "V".equals(m.getReturnType()) && types.equals(List.of("Ljava/lang/String;"))) setters.add(m.toString());
            }
            if (ri.getReference() instanceof FieldReference f && owner.equals(f.getDefiningClass())) {
                if (i.getOpcode() == Opcode.IPUT && "I".equals(f.getType())) ids.add(fieldId(f));
                if (i.getOpcode() == Opcode.IPUT_OBJECT && "Ljava/lang/String;".equals(f.getType())) descriptions.add(fieldId(f));
            }
        }
        // 587 fills the description through a setter instead of writing the field.
        if (descriptions.isEmpty()) descriptions = setters;
        if (icons.size() != 1 || factories.size() != 1 || titles.size() != 1 || ids.size() != 1 || descriptions.size() != 1) return false;
        if (!eyes) return true;
        var iconType = byType.get(icons.values().iterator().next().getParameterTypes().get(0).toString());
        if (iconType == null || !AccessFlags.ENUM.isSet(iconType.getAccessFlags())) return false;
        var names = new HashSet<String>();
        for (var m : iconType.getMethods()) for (var i : instructions(m)) { var s = inboxString(i); if (s != null) names.add(s); }
        return names.contains("EYE") && names.contains("EYE_CROSS");
    }

    /** The tap has two scratch locals, nothing jumps to its start, and it reads one chat field of its own class. */
    static boolean hiddenTapProved(Method tap) {
        var impl = tap.getImplementation();
        if (impl == null || impl.getRegisterCount() - 2 < 2 || mediaTargets(tap).contains(0)) return false;
        var summaries = new LinkedHashSet<String>();
        for (var i : instructions(tap))
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                tap.getDefiningClass().equals(f.getDefiningClass()) && THREAD_SUMMARY_TYPE.equals(f.getType())) summaries.add(fieldId(f));
        return summaries.size() == 1;
    }

    /**
     * nearby_scans: the foreground location controller's one static (Context, FbUserSession, controller, J)V that names
     * the task it queues, and the app's one reader of WifiManager.getScanResults. Both are taken only while the app's
     * single WifiManager.startScan sits in the class that scheduler instantiates, its single BluetoothLeScanner.startScan
     * sits in a class holding the BleScanOperation that queued class drives, and the reader has the shape
     * scanResultReader checks. Mirrors NearbyScans.kt.
     */
    static List<Method> nearbyScans(List<ClassDef> classes) {
        final String controller = "Lcom/facebook/location/foreground/ForegroundLocationFrameworkController;";
        final String operation = "Lcom/facebook/blescan/BleScanOperation;";
        var schedulers = new ArrayList<Method>();
        var wifi = new ArrayList<ClassDef>();
        var bluetooth = new ArrayList<ClassDef>();
        var readers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            if (controller.equals(cls.getType()) && AccessFlags.STATIC.isSet(method.getAccessFlags()) && "V".equals(method.getReturnType())) {
                var params = new ArrayList<String>();
                for (var t : method.getParameterTypes()) params.add(t.toString());
                if (params.equals(List.of("Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;", controller, "J")) &&
                    literals(method).contains("ForegroundLocationFrameworkController_scheduleRequestLocationWithDelay")) schedulers.add(method);
            }
            for (var i : instructions(method)) {
                if (!(i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call)) continue;
                if (readsScanResults(call)) readers.add(method);
                if (!"startScan".equals(call.getName())) continue;
                if ("Landroid/net/wifi/WifiManager;".equals(call.getDefiningClass())) wifi.add(cls);
                if ("Landroid/bluetooth/le/BluetoothLeScanner;".equals(call.getDefiningClass())) bluetooth.add(cls);
            }
        }
        if (schedulers.size() != 1 || wifi.size() != 1 || bluetooth.size() != 1 || readers.size() != 1 || !scanResultReader(readers.get(0))) return List.of();
        boolean queued = false;
        for (var i : instructions(schedulers.get(0)))
            if (i.getOpcode() == Opcode.NEW_INSTANCE && ((ReferenceInstruction) i).getReference() instanceof TypeReference type &&
                type.getType().equals(wifi.get(0).getType())) queued = true;
        boolean holdsOperation = false;
        for (var field : bluetooth.get(0).getFields()) if (operation.equals(field.getType())) holdsOperation = true;
        boolean drives = false;
        for (var method : wifi.get(0).getMethods()) if (calls(method, operation)) drives = true;
        return queued && holdsOperation && drives ? List.of(schedulers.get(0), readers.get(0)) : List.of();
    }

    static boolean readsScanResults(MethodReference call) {
        return "Landroid/net/wifi/WifiManager;".equals(call.getDefiningClass()) && "getScanResults".equals(call.getName());
    }

    static boolean readsWifiIdentity(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call &&
            "Landroid/net/wifi/WifiInfo;".equals(call.getDefiningClass()) && call.getParameterTypes().isEmpty() &&
            "Ljava/lang/String;".equals(call.getReturnType()) &&
            ("getSSID".equals(call.getName()) || "getBSSID".equals(call.getName()));
    }

    /**
     * wifi_identity: every method outside org.webrtc that reads the connected network's SSID or BSSID, taken only while
     * every such read's answer is kept by the next instruction (move-result-object). Mirrors NearbyScans.kt.
     */
    static List<Method> wifiIdentityReads(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        for (var cls : classes) {
            if (cls.getType().startsWith("Lorg/webrtc/")) continue;
            for (var method : cls.getMethods()) {
                var implementation = method.getImplementation();
                if (implementation == null) continue;
                boolean reads = false;
                boolean pending = false;
                for (var instruction : implementation.getInstructions()) {
                    if (pending && instruction.getOpcode() != Opcode.MOVE_RESULT_OBJECT) return List.of();
                    pending = readsWifiIdentity(instruction);
                    reads |= pending;
                }
                if (pending) return List.of();
                if (reads) readers.add(method);
            }
        }
        return readers;
    }

    static final String STORY_FINISHED = "story_playback_finished";
    static final String MONTAGE_VIEWER = "Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;";

    /**
     * story_hold: the app's only story_playback_finished logger, a public instance ()V whose one hand-off is an
     * invoke-virtual or invoke-interface {callback, this} of a (page)V method, right after an if-eqz on the callback and
     * right before return-void, with nothing jumping straight to it and a local other than the callback to spare. The
     * callback has to call a static (MontageViewerFragment, Integer)V on the viewer. Mirrors StoryHold.kt.
     */
    static List<Method> storyHold(List<ClassDef> classes) {
        var loggers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (literals(method).contains(STORY_FINISHED)) loggers.add(method);
        if (loggers.size() != 1) return List.of();
        var completion = loggers.get(0);
        int flags = completion.getAccessFlags();
        if (!AccessFlags.PUBLIC.isSet(flags) || AccessFlags.STATIC.isSet(flags) || !completion.getParameterTypes().isEmpty() ||
            !"V".equals(completion.getReturnType()) || completion.getImplementation() == null) return List.of();
        var code = instructions(completion);
        int page = completion.getImplementation().getRegisterCount() - 1;
        var hands = new ArrayList<Integer>();
        for (int i = 1; i + 1 < code.size(); i++) {
            if (!(code.get(i) instanceof FiveRegisterInstruction call) || !(code.get(i) instanceof ReferenceInstruction ri) ||
                !(ri.getReference() instanceof MethodReference target)) continue;
            var op = call.getOpcode();
            if ((op == Opcode.INVOKE_VIRTUAL || op == Opcode.INVOKE_INTERFACE) && call.getRegisterCount() == 2 && call.getRegisterD() == page &&
                target.getParameterTypes().size() == 1 && "V".equals(target.getReturnType()) && code.get(i + 1).getOpcode() == Opcode.RETURN_VOID &&
                code.get(i - 1).getOpcode() == Opcode.IF_EQZ && ((OneRegisterInstruction) code.get(i - 1)).getRegisterA() == call.getRegisterC())
                hands.add(i);
        }
        if (hands.size() != 1 || mediaTargets(completion).contains(hands.get(0))) return List.of();
        var call = (FiveRegisterInstruction) code.get(hands.get(0));
        boolean spare = false;
        for (int r = 0; r < page; r++) if (r != call.getRegisterC()) { spare = true; break; }
        if (!spare) return List.of();
        var target = (MethodReference) ((ReferenceInstruction) call).getReference();
        var targetParams = target.getParameterTypes().stream().map(Object::toString).toList();
        for (var cls : classes) {
            if (!cls.getType().equals(target.getDefiningClass())) continue;
            Method callback = null;
            int matches = 0;
            for (var method : cls.getMethods()) {
                if (method.getName().equals(target.getName()) && params(method).equals(targetParams) && method.getReturnType().equals(target.getReturnType())) {
                    callback = method;
                    matches++;
                }
            }
            if (matches != 1) return List.of();
            for (var i : instructions(callback)) {
                if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction cr && cr.getReference() instanceof MethodReference viewer &&
                    MONTAGE_VIEWER.equals(viewer.getDefiningClass()) && "V".equals(viewer.getReturnType()) &&
                    viewer.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(MONTAGE_VIEWER, "Ljava/lang/Integer;")))
                    return List.of(completion);
            }
            return List.of();
        }
        return List.of();
    }

    static final String AI_SUMMARY_PILL = "AiSummaryFloatingPillEventHandler";
    static final List<String> AI_SUMMARY_PARAMETERS =
        List.of(THREAD_KEY, "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;", "J", "Z", "Z");

    /**
     * ai_summary: the one class with a method naming AiSummaryFloatingPillEventHandler, the one distinct
     * (ThreadKey, Capabilities, J, Z, Z)Z method it calls, and that method defined with code in these classes. Mirrors
     * AiSummary.kt.
     */
    static List<Method> aiSummary(List<ClassDef> classes) {
        ClassDef handler = null;
        int handlers = 0;
        for (var cls : classes) {
            boolean names = false;
            for (var method : cls.getMethods())
                for (var i : instructions(method))
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && AI_SUMMARY_PILL.equals(s.getString())) names = true;
            if (names) { handler = cls; handlers++; }
        }
        if (handlers != 1) return List.of();
        var checks = new LinkedHashSet<String>();
        for (var method : handler.getMethods())
            for (var i : instructions(method)) {
                if (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference call)) continue;
                var params = new ArrayList<String>();
                for (var t : call.getParameterTypes()) params.add(t.toString());
                if ("Z".equals(call.getReturnType()) && params.equals(AI_SUMMARY_PARAMETERS)) checks.add(methodId(call));
            }
        if (checks.size() != 1) return List.of();
        var check = checks.iterator().next();
        for (var cls : classes) {
            if (!cls.getType().equals(check.substring(0, check.indexOf("->")))) continue;
            for (var method : cls.getMethods())
                if (hookId(method).equals(check)) return method.getImplementation() != null ? List.of(method) : List.of();
            return List.of();
        }
        return List.of();
    }

    static final String CHAT_PREVIEW_FRAGMENT = "Lcom/facebook/messaging/threadlist/threaditemmenu/preview/InboxThreadPreviewDialogFragment;";
    static final long CHAT_PREVIEW_FLAG = 0x1010536000042fdL;
    static final long CHAT_PREVIEW_ENCRYPTED_FLAG = 0x101055e00004588L;

    static boolean buildsChatPreview(Method method) {
        for (var i : instructions(method))
            if (i.getOpcode() == Opcode.NEW_INSTANCE && ((TypeReference) ((ReferenceInstruction) i).getReference()).getType().equals(CHAT_PREVIEW_FRAGMENT)) return true;
        return false;
    }

    static boolean readsChatPreviewFlag(Method method) {
        for (var i : instructions(method))
            if (i.getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) i).getWideLiteral() == CHAT_PREVIEW_FLAG) return true;
        return false;
    }

    /**
     * One reader's flag reads have the tested shape: each const-wide of the preview or encrypted-chat flag goes, after
     * an optional check-cast to the check's interface, into a boolean (…J) check taking the pair last, invoke-static or
     * (after the cast) invoke-interface on the cast register, then move-result, with nothing jumping into the read. The
     * preview flag is read exactly once. Returns the encrypted-chat reads, or -1 for any other shape.
     */
    static int chatPreviewReads(Method method) {
        var code = instructions(method);
        var targets = mediaTargets(method);
        int previews = 0, encrypted = 0;
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.CONST_WIDE) continue;
            long flag = ((WideLiteralInstruction) code.get(at)).getWideLiteral();
            if (flag != CHAT_PREVIEW_FLAG && flag != CHAT_PREVIEW_ENCRYPTED_FLAG) continue;
            int pair = register(code.get(at));
            boolean cast = at + 1 < code.size() && code.get(at + 1).getOpcode() == Opcode.CHECK_CAST;
            int callAt = cast ? at + 2 : at + 1;
            if (callAt + 1 >= code.size() || !(code.get(callAt) instanceof FiveRegisterInstruction call) ||
                !(((ReferenceInstruction) call).getReference() instanceof MethodReference check)) return -1;
            var args = List.of(call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()).subList(0, call.getRegisterCount());
            var params = check.getParameterTypes();
            boolean form = cast
                ? call.getOpcode() == Opcode.INVOKE_INTERFACE && !args.isEmpty() && args.get(0) == register(code.get(at + 1)) &&
                    ((ReferenceInstruction) code.get(at + 1)).getReference().toString().equals(check.getDefiningClass())
                : call.getOpcode() == Opcode.INVOKE_STATIC;
            if (!form || !"Z".equals(check.getReturnType()) || params.isEmpty() ||
                !"J".equals(params.get(params.size() - 1).toString()) || args.size() < 2 || !args.subList(args.size() - 2, args.size()).equals(List.of(pair, pair + 1)) ||
                code.get(callAt + 1).getOpcode() != Opcode.MOVE_RESULT)
                return -1;
            for (int i = at + 1; i <= callAt + 1; i++) if (targets.contains(i)) return -1;
            if (flag == CHAT_PREVIEW_FLAG) previews++; else encrypted++;
        }
        return previews == 1 ? encrypted : -1;
    }

    /**
     * chat_preview: every method that reads the preview flag, when the one method that new-instances
     * InboxThreadPreviewDialogFragment reads it too (586) or a reader invoke-statics it (587), every reader passes
     * chatPreviewReads and at least one reads the encrypted-chat flag. Mirrors ChatPreview.kt.
     */
    static List<Method> chatPreview(List<ClassDef> classes) {
        Method builder = null;
        int builders = 0;
        var readers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (buildsChatPreview(method)) { builder = method; builders++; }
            if (readsChatPreviewFlag(method)) readers.add(method);
        }
        if (builders != 1) return List.of();
        String built = hookId(builder);
        boolean linked = false;
        for (var reader : readers) {
            if (hookId(reader).equals(built)) linked = true;
            for (var i : instructions(reader))
                if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                    ((ReferenceInstruction) i).getReference().toString().equals(built)) linked = true;
        }
        if (!linked) return List.of();
        var seen = new HashSet<String>();
        var found = new ArrayList<Method>();
        int encrypted = 0;
        for (var reader : readers) {
            int reads = chatPreviewReads(reader);
            if (reads < 0) return List.of();
            encrypted += reads;
            if (seen.add(hookId(reader))) found.add(reader);
        }
        return encrypted > 0 ? found : List.of();
    }

    static final String PREVIEW_TAP_TAG = "InboxThreadPreviewDialogFragment.preview_tap";
    static final String PREVIEW_VIEW_CALL = "onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;";

    /** The int field of the stack's own class that the iput at [at] writes from a register into [stack], or null. */
    static FieldReference previewSize(List<Instruction> code, int at, int stack, String type) {
        if (code.get(at).getOpcode() != Opcode.IPUT || !(((ReferenceInstruction) code.get(at)).getReference() instanceof FieldReference f)) return null;
        return ((TwoRegisterInstruction) code.get(at)).getRegisterB() == stack && f.getDefiningClass().equals(type) && "I".equals(f.getType()) ? f : null;
    }

    /**
     * The preview stack's new-instance at [at], its LinearLayout(Context) constructor, the most and the chat's height
     * written to two int fields, Math.min of the height and one other register, and that answer written to a third int
     * field, with three distinct fields and three distinct registers no higher than v15.
     */
    static boolean previewStackAt(List<Instruction> code, int at) {
        if (code.get(at).getOpcode() != Opcode.NEW_INSTANCE || at + 6 >= code.size()) return false;
        int stack = register(code.get(at));
        String type = ((TypeReference) ((ReferenceInstruction) code.get(at)).getReference()).getType();
        var init = code.get(at + 1);
        if (init.getOpcode() != Opcode.INVOKE_DIRECT || !"Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V".equals(ref(init)) ||
            bubbleArgs(init).isEmpty() || bubbleArgs(init).get(0) != stack) return false;
        var most = previewSize(code, at + 2, stack, type);
        var height = previewSize(code, at + 3, stack, type);
        var least = previewSize(code, at + 6, stack, type);
        if (most == null || height == null || least == null) return false;
        int mostRegister = register(code.get(at + 2)), heightRegister = register(code.get(at + 3));
        var min = code.get(at + 4);
        var operands = bubbleArgs(min);
        if (min.getOpcode() != Opcode.INVOKE_STATIC || !"Ljava/lang/Math;->min(II)I".equals(ref(min)) ||
            operands.stream().filter(r -> r == heightRegister).count() != 1) return false;
        int leastRegister = operands.get(0) == heightRegister ? operands.get(1) : operands.get(0);
        if (code.get(at + 5).getOpcode() != Opcode.MOVE_RESULT || register(code.get(at + 6)) != register(code.get(at + 5))) return false;
        if (new HashSet<>(List.of(most.getName(), height.getName(), least.getName())).size() != 3) return false;
        var registers = List.of(mostRegister, heightRegister, leastRegister);
        return new HashSet<>(registers).size() == 3 && registers.stream().allMatch(r -> r <= 15);
    }

    /**
     * The preview's tap layer: its tag as a const-string at [at], setTag on the layer with that register, then the first
     * iput-object of the layer into a View field of the fragment within 16 instructions, before anything overwrites the
     * layer. The store's index, or -1.
     */
    static int tapLayerAt(List<Instruction> code, int at) {
        var tag = code.get(at);
        if ((tag.getOpcode() != Opcode.CONST_STRING && tag.getOpcode() != Opcode.CONST_STRING_JUMBO) ||
            !(((ReferenceInstruction) tag).getReference() instanceof StringReference s) || !PREVIEW_TAP_TAG.equals(s.getString()) || at + 1 >= code.size()) return -1;
        var tagged = code.get(at + 1);
        var operands = bubbleArgs(tagged);
        if (tagged.getOpcode() != Opcode.INVOKE_VIRTUAL || !"Landroid/view/View;->setTag(Ljava/lang/Object;)V".equals(ref(tagged)) ||
            operands.size() != 2 || operands.get(1) != register(tag)) return -1;
        int layer = operands.get(0);
        for (int i = at + 2; i <= Math.min(at + 16, code.size() - 1); i++) {
            var step = code.get(i);
            if (step.getOpcode() == Opcode.IPUT_OBJECT && register(step) == layer && ((ReferenceInstruction) step).getReference() instanceof FieldReference f &&
                f.getDefiningClass().equals(CHAT_PREVIEW_FRAGMENT) && "Landroid/view/View;".equals(f.getType())) return i;
            if (mediaWrites(step, layer)) return -1;
        }
        return -1;
    }

    /**
     * InboxThreadPreviewDialogFragment's onCreateView, when it builds the stack once (previewStackAt) and stores its tap
     * layer once (tapLayerAt), the stack first, with nothing jumping onto the stack's new-instance or just past the store.
     */
    static boolean chatPreviewSizeSite(Method method) {
        if (method.getImplementation() == null || !CHAT_PREVIEW_FRAGMENT.equals(method.getDefiningClass()) ||
            !PREVIEW_VIEW_CALL.equals(method.getName() + "(" + String.join("", method.getParameterTypes()) + ")" + method.getReturnType())) return false;
        var code = instructions(method);
        int stack = -1, stacks = 0, tapLayer = -1, layers = 0;
        for (int at = 0; at < code.size(); at++) {
            if (previewStackAt(code, at)) { stack = at; stacks++; }
            int stored = tapLayerAt(code, at);
            if (stored >= 0) { tapLayer = stored; layers++; }
        }
        if (stacks != 1 || layers != 1) return false;
        var targets = mediaTargets(method);
        return tapLayer > stack && tapLayer + 1 < code.size() && !targets.contains(stack) && !targets.contains(tapLayer + 1);
    }

    /** chat_preview_size: the first InboxThreadPreviewDialogFragment class's methods that pass chatPreviewSizeSite. Mirrors ChatPreviewSize.kt. */
    static List<Method> chatPreviewSize(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) {
            if (!cls.getType().equals(CHAT_PREVIEW_FRAGMENT)) continue;
            for (var method : cls.getMethods()) if (chatPreviewSizeSite(method)) found.add(method);
            break;
        }
        return found;
    }

    static final String FB_FRAGMENT_ACTIVITY = "Lcom/facebook/base/activity/FbFragmentActivity;";
    static final long LANDSCAPE_FLAG = 0x8105e800002b9eL;
    static final String MEDIA_ORIENTATION_OPTION = "allowOrientationChanges";

    /**
     * The portrait lock check: non-static ()Z with code and 3 to 16 registers, reading the lock flag as const-wide,
     * reading exactly one FbFragmentActivity field of its own class and always from a this nothing overwrites, calling
     * an FbFragmentActivity ()Z method, and leaving through plain returns nothing jumps onto. Mirrors Landscape.kt.
     */
    static boolean isPortraitLock(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) || !m.getParameterTypes().isEmpty() || m.getImplementation() == null) return false;
        int registers = m.getImplementation().getRegisterCount();
        if (registers > 16 || registers < 3) return false;
        var code = instructions(m);
        int self = parameterRegister(m, 0);
        boolean flag = false, optIn = false;
        var fields = new HashSet<String>();
        for (var i : code) {
            if (i.getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) i).getWideLiteral() == LANDSCAPE_FLAG) flag = true;
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f && FB_FRAGMENT_ACTIVITY.equals(f.getType())) {
                if (!f.getDefiningClass().equals(m.getDefiningClass()) || ((TwoRegisterInstruction) i).getRegisterB() != self) return false;
                fields.add(f.toString());
            }
            if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && ((ReferenceInstruction) i).getReference() instanceof MethodReference c &&
                FB_FRAGMENT_ACTIVITY.equals(c.getDefiningClass()) && c.getParameterTypes().isEmpty() && "Z".equals(c.getReturnType())) optIn = true;
            if (writesRegister(i, self)) return false;
        }
        if (!flag || !optIn || fields.size() != 1) return false;
        var targets = mediaTargets(m);
        boolean returns = false;
        for (int at = 0; at < code.size(); at++)
            if (code.get(at).getOpcode() == Opcode.RETURN) { if (targets.contains(at)) return false; returns = true; }
        return returns;
    }

    /** landscape_lock: the one method with the portrait lock check's shape. */
    static List<Method> portraitLock(List<ClassDef> classes) {
        Method found = null;
        int count = 0;
        for (var cls : classes) for (var m : cls.getMethods()) if (isPortraitLock(m)) { found = m; count++; }
        return count == 1 ? List.of(found) : List.of();
    }

    /**
     * The media viewers' orientation call: static (own class, I)V with code and at most 16 registers, an instance-of
     * FbFragmentActivity, and at least one (I)V call, each a two-register invoke passing p1 second. Mirrors Landscape.kt.
     */
    static boolean isMediaOrientation(Method m) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || m.getImplementation() == null) return false;
        var params = new ArrayList<String>();
        for (var t : m.getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of(m.getDefiningClass(), "I")) || m.getImplementation().getRegisterCount() > 16) return false;
        int orientation = parameterRegister(m, 1);
        boolean checks = false;
        int handOffs = 0;
        for (var i : instructions(m)) {
            if (i.getOpcode() == Opcode.INSTANCE_OF && ((TypeReference) ((ReferenceInstruction) i).getReference()).getType().equals(FB_FRAGMENT_ACTIVITY)) checks = true;
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference c && "V".equals(c.getReturnType()) &&
                c.getParameterTypes().size() == 1 && "I".equals(c.getParameterTypes().get(0).toString())) {
                if (!(i instanceof FiveRegisterInstruction call) || call.getRegisterCount() != 2 || call.getRegisterD() != orientation) return false;
                handOffs++;
            }
        }
        return checks && handOffs > 0;
    }

    /** landscape_media: the one class naming allowOrientationChanges, and its one method with the orientation call's shape. */
    static List<Method> mediaOrientation(List<ClassDef> classes) {
        ClassDef helper = null;
        int helpers = 0;
        for (var cls : classes) {
            boolean names = false;
            for (var method : cls.getMethods())
                for (var i : instructions(method))
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && MEDIA_ORIENTATION_OPTION.equals(s.getString())) names = true;
            if (names) { helper = cls; helpers++; }
        }
        if (helpers != 1) return List.of();
        Method found = null;
        int count = 0;
        for (var m : helper.getMethods()) if (isMediaOrientation(m)) { found = m; count++; }
        return count == 1 ? List.of(found) : List.of();
    }

    static final String BLOCK_PEOPLE_PRESENTER = "BlockPeopleV2PresenterImpl";
    static final String BLOCKED_ID_UNREADABLE = "user id/phone-number is null/empty when trying to parse the id";
    static final String USER_MODEL = "Lcom/facebook/user/model/User;";
    static final Set<Opcode> BLOCKED_PICTURE_GOTOS = Set.of(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32);

    /** The registers a call hands its User parameters, its receiver left out. */
    static List<Integer> userArguments(Instruction i) {
        if (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference call)) return List.of();
        var args = bubbleArgs(i);
        int at = i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE ? 0 : 1;
        var users = new ArrayList<Integer>();
        for (var type : call.getParameterTypes()) {
            if (USER_MODEL.contentEquals(type) && at < args.size()) users.add(args.get(at));
            at += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        }
        return users;
    }

    /**
     * One picture store of the blocked list's row builder: `iput-object vP` into an object field right after
     * `const/4 vP, 0`, which follows `if-nez vU` on the move-result-object of a call returning User. The if-nez lands on
     * one straight run, with no branch in it and nothing landing inside it, that hands vU unchanged to a call as a User,
     * ends with `move-result-object vP`, and goes back with the only branch to the store, which no switch case or catch
     * handler lands on.
     */
    static boolean blockedPictureAt(Method builder, List<Instruction> code, int store, Set<Integer> targets) {
        if (store < 4 || code.get(store).getOpcode() != Opcode.IPUT_OBJECT) return false;
        var field = (FieldReference) ((ReferenceInstruction) code.get(store)).getReference();
        int picture = register(code.get(store));
        var empty = code.get(store - 1);
        if (!field.getType().startsWith("L") || empty.getOpcode() != Opcode.CONST_4 || register(empty) != picture ||
            ((NarrowLiteralInstruction) empty).getNarrowLiteral() != 0) return false;
        var check = code.get(store - 2);
        if (check.getOpcode() != Opcode.IF_NEZ) return false;
        int user = register(check);
        var result = code.get(store - 3);
        if (result.getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(result) != user ||
            !(code.get(store - 4) instanceof ReferenceInstruction lookup && lookup.getReference() instanceof MethodReference person &&
                USER_MODEL.equals(person.getReturnType()))) return false;
        int known = mediaTarget(code, store - 2), back = -1, into = 0;
        for (int i = 0; i < code.size(); i++) if (code.get(i) instanceof OffsetInstruction && mediaTarget(code, i) == store) { back = i; into++; }
        if (into != 1 || known < 0 || back <= known || !BLOCKED_PICTURE_GOTOS.contains(code.get(back).getOpcode()) ||
            mediaTargets(builder, false).contains(store)) return false;
        for (int i = known; i < back; i++) if (code.get(i) instanceof OffsetInstruction) return false;
        for (int i = known + 1; i <= back; i++) if (targets.contains(i)) return false;
        var built = code.get(back - 1);
        if (built.getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(built) != picture) return false;
        int handed = -1;
        for (int i = known; i < back && handed < 0; i++) if (userArguments(code.get(i)).contains(user)) handed = i;
        if (handed < 0) return false;
        for (int i = known; i < handed; i++) {
            var op = code.get(i).getOpcode();
            int written = register(code.get(i));
            if (op.setsRegister() && written >= 0 && (written == user || (op.setsWideRegister() && written + 1 == user))) return false;
        }
        return true;
    }

    /**
     * blocked_list_pictures: the app's only method holding both the blocked list presenter's log tag and its id parse
     * failure, taken when exactly one picture store in it has blockedPictureAt's shape. Mirrors BlockedListPictures.kt.
     */
    static List<Method> blockedListPictures(List<ClassDef> classes) {
        var builders = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var strings = literals(method);
            if (strings.contains(BLOCK_PEOPLE_PRESENTER) && strings.contains(BLOCKED_ID_UNREADABLE)) builders.add(method);
        }
        if (builders.size() != 1) return List.of();
        var builder = builders.get(0);
        var code = instructions(builder);
        var targets = mediaTargets(builder);
        int sites = 0;
        for (int store = 0; store < code.size(); store++) if (blockedPictureAt(builder, code, store, targets)) sites++;
        return sites == 1 ? List.of(builder) : List.of();
    }

    static final Set<String> FETCH_FAILURES = Set.of("thread_summary_fetch_failed", "sender_user_fetch_failed");

    /**
     * MsysNotificationParser's getThreadLevelResult body: an instance invokeSuspend(Object)Object failing with both
     * FETCH_FAILURES. 587 merges it into a coroutine class shared with others, so only the strings name it. Mirrors
     * RestrictedNotify.kt's isThreadCheck.
     */
    static boolean isThreadCheck(Method method) {
        return "invokeSuspend".equals(method.getName()) && !AccessFlags.STATIC.isSet(method.getAccessFlags()) &&
            "Ljava/lang/Object;".equals(method.getReturnType()) && params(method).equals(List.of("Ljava/lang/Object;")) &&
            method.getImplementation() != null && stringsOf(method).containsAll(FETCH_FAILURES);
    }

    /** The notification thread check's folder read: the instruction after it, its register, the enum and the compared constants. */
    record FolderRead(int index, int register, String type, Set<String> compared) {}

    static boolean folderWrites(Instruction i, int r) {
        var op = i.getOpcode();
        return op.setsRegister() && i instanceof OneRegisterInstruction o && (o.getRegisterA() == r || (op.setsWideRegister() && o.getRegisterA() + 1 == r));
    }

    /** By index, the enum field compared with folder at each sget-object of the type straight before an if-eq or if-ne on both. */
    static TreeMap<Integer, String> folderChecks(List<Instruction> code, int folder, String type) {
        var checks = new TreeMap<Integer, String>();
        for (int i = 1; i < code.size(); i++) {
            if (!(code.get(i) instanceof TwoRegisterInstruction check)) continue;
            var op = code.get(i).getOpcode();
            if (op != Opcode.IF_EQ && op != Opcode.IF_NE) continue;
            int other;
            if (check.getRegisterA() == folder) other = check.getRegisterB();
            else if (check.getRegisterB() == folder) other = check.getRegisterA();
            else continue;
            var load = code.get(i - 1);
            if (!(load instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof FieldReference constant)) continue;
            if (load.getOpcode() != Opcode.SGET_OBJECT || register(load) != other || !type.equals(constant.getDefiningClass()) ||
                !type.equals(constant.getType())) continue;
            checks.put(i, constant.getName());
        }
        return checks;
    }

    /**
     * The one ThreadSummary iget-object in the thread check whose register is compared with two or more constants of the
     * field's own type after it, unwritten before the last, and whose next instruction nothing lands on. Mirrors
     * RestrictedNotify.kt's folderRead.
     */
    static FolderRead folderRead(Method method) {
        if (!isThreadCheck(method)) return null;
        var code = instructions(method);
        var reads = new ArrayList<FolderRead>();
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.IGET_OBJECT) continue;
            var field = (FieldReference) ((ReferenceInstruction) code.get(at)).getReference();
            if (!THREAD_SUMMARY_TYPE.equals(field.getDefiningClass()) || !field.getType().startsWith("L")) continue;
            int folder = register(code.get(at));
            var checks = folderChecks(code, folder, field.getType()).tailMap(at + 1);
            if (checks.size() < 2) continue;
            boolean written = false;
            for (int i = at + 1; i < checks.lastKey(); i++) if (folderWrites(code.get(i), folder)) written = true;
            if (!written) reads.add(new FolderRead(at + 1, folder, field.getType(), new HashSet<>(checks.values())));
        }
        if (reads.size() != 1) return null;
        var read = reads.get(0);
        return read.index() < code.size() && !mediaTargets(method).contains(read.index()) ? read : null;
    }

    /** An enum's constants by name: each <init>(String, ...) call's name constant and the field the next sput-object fills. */
    static Map<String, String> enumConstantFields(ClassDef cls) {
        var constants = new HashMap<String, String>();
        if (!"Ljava/lang/Enum;".equals(cls.getSuperclass())) return constants;
        Method init = null;
        for (var m : cls.getMethods()) if ("<clinit>".equals(m.getName())) { init = m; break; }
        if (init == null || init.getImplementation() == null) return constants;
        var held = new HashMap<Integer, String>();
        String named = null;
        for (var i : init.getImplementation().getInstructions()) {
            var reference = i instanceof ReferenceInstruction ri ? ri.getReference() : null;
            var op = i.getOpcode();
            if (reference instanceof StringReference s && i instanceof OneRegisterInstruction o) held.put(o.getRegisterA(), s.getString());
            else if (reference instanceof MethodReference m && (op == Opcode.INVOKE_DIRECT || op == Opcode.INVOKE_DIRECT_RANGE) &&
                cls.getType().equals(m.getDefiningClass()) && "<init>".equals(m.getName()) && !m.getParameterTypes().isEmpty() &&
                "Ljava/lang/String;".contentEquals(m.getParameterTypes().get(0))) {
                var args = bubbleArgs(i);
                named = args.size() > 1 ? held.get(args.get(1)) : null;
            } else if (reference instanceof FieldReference f && op == Opcode.SPUT_OBJECT && cls.getType().equals(f.getDefiningClass()) &&
                cls.getType().equals(f.getType())) {
                if (named != null) constants.putIfAbsent(named, f.getName());
                named = null;
            } else if (i instanceof OneRegisterInstruction o && op.setsRegister()) {
                held.remove(o.getRegisterA());
                if (op.setsWideRegister()) held.remove(o.getRegisterA() + 1);
            }
        }
        return constants;
    }

    /**
     * restricted_notify: the thread check, when its folder read compares the folder with both the RESTRICTED and the INBOX
     * constant of the app's one class of the folder's type. Mirrors RestrictedNotify.kt.
     */
    static List<Method> restrictedNotify(List<ClassDef> classes) {
        var gates = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if (isThreadCheck(m)) gates.add(m);
        if (gates.size() != 1) return List.of();
        var read = folderRead(gates.get(0));
        if (read == null) return List.of();
        var folders = new ArrayList<ClassDef>();
        for (var cls : classes) if (read.type().equals(cls.getType())) folders.add(cls);
        if (folders.size() != 1) return List.of();
        var constants = enumConstantFields(folders.get(0));
        var restricted = constants.get("RESTRICTED");
        var inbox = constants.get("INBOX");
        return restricted != null && inbox != null && read.compared().contains(restricted) && read.compared().contains(inbox)
            ? List.of(gates.get(0)) : List.of();
    }

    static final String NOTIFICATION_SETTING = "Lcom/facebook/messaging/model/threads/NotificationSetting;";

    /** quiet_log_check: the restricted_notify thread check, when it also has the mute check. Mirrors QuietChats.kt. */
    static List<Method> quietLogCheck(List<ClassDef> classes) {
        var gates = restrictedNotify(classes);
        return gates.size() == 1 && muteCheck(gates.get(0)) ? gates : List.of();
    }

    /**
     * QuietChats.kt's flippedBranch: the first if-eqz/if-nez on the register 587's xor-int/lit8 at xor fills, with only
     * plain moves writing it on the way, or -1.
     */
    static int flippedBranch(List<Instruction> code, int xor) {
        int muted = ((TwoRegisterInstruction) code.get(xor)).getRegisterA();
        for (int at = xor + 1; at < code.size(); at++) {
            var op = code.get(at).getOpcode();
            if ((op == Opcode.IF_EQZ || op == Opcode.IF_NEZ) && register(code.get(at)) == muted) return at;
            if (writes(code.get(at), muted) && op != Opcode.MOVE && op != Opcode.MOVE_FROM16 && op != Opcode.MOVE_16) return -1;
        }
        return -1;
    }

    /** QuietChats.kt's threadKeyField: the check's own ThreadKey fields, typed, or an Object field cast to ThreadKey straight after. */
    static Set<String> threadKeyFields(Method method) {
        var code = instructions(method);
        var fields = new LinkedHashSet<String>();
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.IGET_OBJECT || !(((ReferenceInstruction) code.get(at)).getReference() instanceof FieldReference f) ||
                !method.getDefiningClass().equals(f.getDefiningClass())) continue;
            var cast = at + 1 < code.size() ? code.get(at + 1) : null;
            if (THREAD_KEY.equals(f.getType()) || ("Ljava/lang/Object;".equals(f.getType()) && cast != null &&
                cast.getOpcode() == Opcode.CHECK_CAST && register(cast) == register(code.get(at)) &&
                THREAD_KEY.equals(((ReferenceInstruction) cast).getReference().toString()))) fields.add(fieldId(f));
        }
        return fields;
    }

    /**
     * QuietChats.kt's muteCheck: one ThreadSummary ()NotificationSetting call whose result is asked a ()Z straight after,
     * then either branched on with no jump onto the branch (586) or flipped by xor-int/lit8 1 and branched on at
     * flippedBranch (587). The branched register fits 4 bits, one ThreadKey field of the check is read, and the check's
     * own register is never written.
     */
    static boolean muteCheck(Method method) {
        if (!isThreadCheck(method)) return false;
        var code = instructions(method);
        int sites = 0, branch = -1, result = -1;
        boolean muted = false;
        for (int at = 0; at < code.size() - 4; at++) {
            if (code.get(at).getOpcode() != Opcode.INVOKE_VIRTUAL || !(((ReferenceInstruction) code.get(at)).getReference() instanceof MethodReference get) ||
                !THREAD_SUMMARY_TYPE.equals(get.getDefiningClass()) || !NOTIFICATION_SETTING.equals(get.getReturnType()) ||
                !get.getParameterTypes().isEmpty()) continue;
            if (code.get(at + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
            int setting = register(code.get(at + 1));
            if (code.get(at + 2).getOpcode() != Opcode.INVOKE_VIRTUAL ||
                !(((ReferenceInstruction) code.get(at + 2)).getReference() instanceof MethodReference ask) ||
                !NOTIFICATION_SETTING.equals(ask.getDefiningClass()) || !"Z".equals(ask.getReturnType()) || !ask.getParameterTypes().isEmpty() ||
                ((FiveRegisterInstruction) code.get(at + 2)).getRegisterC() != setting) continue;
            if (code.get(at + 3).getOpcode() != Opcode.MOVE_RESULT) continue;
            int answer = register(code.get(at + 3));
            var next = code.get(at + 4);
            if ((next.getOpcode() == Opcode.IF_EQZ || next.getOpcode() == Opcode.IF_NEZ) && register(next) == answer) {
                sites++;
                branch = at + 4;
                result = answer;
                muted = false;
            } else if (next.getOpcode() == Opcode.XOR_INT_LIT8 && ((TwoRegisterInstruction) next).getRegisterB() == answer &&
                ((NarrowLiteralInstruction) next).getNarrowLiteral() == 1 && flippedBranch(code, at + 4) >= 0) {
                sites++;
                branch = flippedBranch(code, at + 4);
                result = ((TwoRegisterInstruction) next).getRegisterA();
                muted = true;
            }
        }
        if (sites != 1 || result > 15 || (!muted && mediaTargets(method).contains(branch))) return false;
        if (threadKeyFields(method).size() != 1) return false;
        int self = method.getImplementation().getRegisterCount() - 2;
        for (var i : code) if (writes(i, self)) return false;
        return true;
    }

    static final String HOISTED_SHARE_LOADER ="Lcom/facebook/messaging/sharing/broadcastflow/mutation/loader/plugins/sections/" +
        "morewaystoshare/hoisted/BroadcastFlowHoistedMoreWaysToShareSectionsLoader;";
    static final String UNHOISTED_SHARE_TRACE = "messaging.sharing.broadcastflow.mutation.loader.sections.morewaystoshare.unhoisted." +
        "BroadcastFlowUnhoistedMoreWaysToShareSectionsLoader";

    static String created(Instruction i) {
        return i.getOpcode() == Opcode.NEW_INSTANCE ? ((TypeReference) ((ReferenceInstruction) i).getReference()).getType() : null;
    }

    static String text(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr ? sr.getString() : null;
    }

    static List<Integer> reads(Instruction i) {
        var out = new ArrayList<Integer>();
        if (i instanceof FiveRegisterInstruction call) {
            int[] all = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
            for (int r = 0; r < call.getRegisterCount(); r++) out.add(all[r]);
        } else if (i instanceof RegisterRangeInstruction range) {
            for (int r = 0; r < range.getRegisterCount(); r++) out.add(range.getStartRegister() + r);
        }
        return out;
    }

    /** getId() is just the literal ADD_TO_STORY_ID. */
    static boolean storyRow(ClassDef cls) {
        for (var method : cls.getMethods()) {
            if (!"getId".equals(method.getName()) || !"Ljava/lang/String;".equals(method.getReturnType()) ||
                !method.getParameterTypes().isEmpty() || AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
            var code = instructions(method);
            if (code.size() == 2 && code.get(0).getOpcode() == Opcode.CONST_STRING && "ADD_TO_STORY_ID".equals(text(code.get(0))) &&
                code.get(1).getOpcode() == Opcode.RETURN_OBJECT) return true;
        }
        return false;
    }

    /** The gate kind on the one row this method creates: 1 hoisted, 2 unhoisted, 0 neither. Mirrors ShareStory.kt. */
    static int storyGate(Method method, String row) {
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (!row.equals(created(code.get(i)))) continue;
            if (at >= 0) return 0;
            at = i;
        }
        if (at < 0) return 0;
        if (hoistedStoryGate(method, code, at)) return 1;
        return unhoistedStoryGate(method, code, at) ? 2 : 0;
    }

    static boolean hoistedStoryGate(Method method, List<Instruction> code, int at) {
        if (!HOISTED_SHARE_LOADER.equals(method.getDefiningClass()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !method.getParameterTypes().isEmpty() || !"V".equals(method.getReturnType()) || at < 3) return false;
        int gate = at - 1;
        if (code.get(gate).getOpcode() != Opcode.IF_EQZ || mediaTarget(code, gate) <= at) return false;
        int value = register(code.get(gate));
        if (code.get(at - 2).getOpcode() != Opcode.MOVE_RESULT || register(code.get(at - 2)) != value || value > 15) return false;
        if (code.get(at - 3).getOpcode() != Opcode.INVOKE_STATIC || !(code.get(at - 3) instanceof ReferenceInstruction ri) ||
            !(ri.getReference() instanceof MethodReference call) || !"Z".equals(call.getReturnType())) return false;
        return !mediaTargets(method).contains(gate);
    }

    static boolean unhoistedStoryGate(Method method, List<Instruction> code, int at) {
        boolean traced = false;
        for (var i : code) if (UNHOISTED_SHARE_TRACE.equals(text(i))) traced = true;
        if (!traced) return false;
        int gate = -1;
        for (int i = at - 1; i >= 1; i--) if (code.get(i).getOpcode() == Opcode.IF_EQ) { gate = i; break; }
        if (gate < 0) return false;
        var compare = (TwoRegisterInstruction) code.get(gate);
        int state = compare.getRegisterA(), skip = compare.getRegisterB();
        if (state > 15 || skip > 15 || state == skip) return false;
        var read = code.get(gate - 1);
        if (read.getOpcode() != Opcode.IGET_OBJECT || ((TwoRegisterInstruction) read).getRegisterA() != state ||
            !(((ReferenceInstruction) read).getReference() instanceof FieldReference field) ||
            !field.getDefiningClass().equals(method.getDefiningClass()) || !"Ljava/lang/Object;".equals(field.getType())) return false;
        boolean started = false;
        for (int i = gate + 1; i < at; i++) if (UNHOISTED_SHARE_TRACE.equals(text(code.get(i)))) started = true;
        if (!started) return false;
        int skipTo = mediaTarget(code, gate);
        if (skipTo <= at || at + 2 >= code.size() || skipTo + 1 >= code.size()) return false;
        int made = register(code.get(at));
        var list = code.get(at + 2);
        if (list.getOpcode() != Opcode.INVOKE_STATIC ||
            !(IMMUTABLE_LIST + "->of(Ljava/lang/Object;)" + IMMUTABLE_LIST).equals(ref(list)) || !reads(list).equals(List.of(made))) return false;
        var first = code.get(skipTo);
        var write = code.get(skipTo + 1);
        if (!(first instanceof FiveRegisterInstruction) && !(first instanceof RegisterRangeInstruction)) return false;
        if (reads(first).contains(state) || (write.getOpcode() != Opcode.MOVE_RESULT && write.getOpcode() != Opcode.MOVE_RESULT_OBJECT) ||
            register(write) != state) return false;
        return !mediaTargets(method).contains(gate);
    }

    /**
     * share_story: the one class whose getId() is just ADD_TO_STORY_ID, and the two methods that create it, each creating
     * it once behind its proven gate, one of them in the hoisted more-ways-to-share loader. Mirrors ShareStory.kt.
     */
    static List<Method> shareStory(List<ClassDef> classes) {
        var rows = new ArrayList<String>();
        for (var cls : classes) if (storyRow(cls)) rows.add(cls.getType());
        if (rows.size() != 1) return List.of();
        var row = rows.get(0);
        var creators = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            for (var i : instructions(method)) if (row.equals(created(i))) { creators.add(method); break; }
        }
        if (creators.size() != 2) return List.of();
        int hoisted = 0;
        for (var method : creators) {
            int kind = storyGate(method, row);
            if (kind == 0) return List.of();
            if (kind == 1) hoisted++;
        }
        return hoisted == 1 ? creators : List.of();
    }

    static final String STORY_SHARE_ACTIVITY = "com.facebook.messenger.intents.MediaEditShareIntentHandler";
    static final List<String> STORY_TOGGLE_PARAMETERS = List.of("Landroid/content/Context;", "Ljava/lang/String;", "Z");

    /**
     * The one load of the Your story share activity's name in this fragment's onActivityCreated, handed straight on as the
     * name to a static (Context, String, boolean) toggle of the same class, with nothing landing on the call. The index of
     * the call, or -1. Mirrors ShareStory.kt.
     */
    static int storyTargetCall(Method method) {
        if (!"onActivityCreated".equals(method.getName()) || !"V".equals(method.getReturnType()) ||
            AccessFlags.STATIC.isSet(method.getAccessFlags()) || !params(method).equals(List.of("Landroid/os/Bundle;"))) return -1;
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (!STORY_SHARE_ACTIVITY.equals(text(code.get(i)))) continue;
            if (at >= 0) return -1;
            at = i;
        }
        if (at < 0 || at + 1 >= code.size()) return -1;
        int loaded = register(code.get(at));
        var call = code.get(at + 1);
        if (call.getOpcode() != Opcode.INVOKE_STATIC || !(call instanceof FiveRegisterInstruction args) ||
            !(((ReferenceInstruction) call).getReference() instanceof MethodReference toggle)) return -1;
        var types = new ArrayList<String>();
        for (var t : toggle.getParameterTypes()) types.add(t.toString());
        if (!toggle.getDefiningClass().equals(method.getDefiningClass()) || !"V".equals(toggle.getReturnType()) ||
            !types.equals(STORY_TOGGLE_PARAMETERS) || args.getRegisterCount() != 3 || args.getRegisterD() != loaded ||
            args.getRegisterE() == loaded || args.getRegisterE() == args.getRegisterC()) return -1;
        return mediaTargets(method).contains(at + 1) ? -1 : at + 1;
    }

    /**
     * share_story_target: the one onActivityCreated that turns Messenger's Your story share target on or off, whose toggle
     * sets a component's enabled state. Mirrors ShareStory.kt.
     */
    static List<Method> shareStoryTarget(List<ClassDef> classes) {
        ClassDef owner = null;
        Method site = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (storyTargetCall(method) < 0) continue;
            if (site != null) return List.of();
            owner = cls;
            site = method;
        }
        if (site == null) return List.of();
        var toggle = (MethodReference) ((ReferenceInstruction) instructions(site).get(storyTargetCall(site))).getReference();
        Method body = null;
        for (var method : owner.getMethods()) {
            if (!method.getName().equals(toggle.getName()) || !"V".equals(method.getReturnType()) ||
                !AccessFlags.STATIC.isSet(method.getAccessFlags()) || !params(method).equals(STORY_TOGGLE_PARAMETERS)) continue;
            if (body != null) return List.of();
            body = method;
        }
        if (body == null) return List.of();
        for (var i : instructions(body))
            if ("Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V".equals(ref(i)))
                return List.of(site);
        return List.of();
    }
}
