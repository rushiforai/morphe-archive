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
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Uploads and tabs: upload tasks, tab badges and configs, the inbox header and search bar, AI mentions, share, swipe, recent media and voice. */
final class Tabs {

    // Google Play's bound task route into GooglePlayUploadService, which skips onStartCommand. Mirrors AnalyticsUploads.kt.
    static final String GOOGLE_PLAY_UPLOAD_SERVICE = "Lcom/facebook/analytics2/logger/GooglePlayUploadService;";
    static final String TASK_SERVICE_COMPAT = "Lcom/facebook/common/jobscheduler/compat/GcmTaskServiceCompat;";
    static final String BOUND_UPLOAD_MARK = "Job with no build ID, cancelling job";
    // 584 moved the first message into a string table, so the stale build ID message marks it too
    static final String OLD_BUILD_UPLOAD_MARK = "Job with old build ID: %d, cancelling job, expected: %d";

    static boolean holdsBoundUploadMark(Method m) {
        if (m.getImplementation() == null) return false;
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s &&
                (BOUND_UPLOAD_MARK.equals(s.getString()) || OLD_BUILD_UPLOAD_MARK.equals(s.getString()))) return true;
        return false;
    }

    static boolean typeChecked(Method m, Opcode opcode, String type) {
        for (var i : m.getImplementation().getInstructions())
            if (i.getOpcode() == opcode && type.equals(((ReferenceInstruction) i).getReference().toString())) return true;
        return false;
    }

    /** The Runnable's run() with the uploader's task inlined: reads its service field first and reports through one (I)V. */
    static boolean isInlinedUploadTask(Method m, String base) {
        if (!"run()V".equals(entryPoint(m)) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !holdsBoundUploadMark(m) ||
            !typeChecked(m, Opcode.INSTANCE_OF, TASK_SERVICE_COMPAT) || !typeChecked(m, Opcode.CHECK_CAST, GOOGLE_PLAY_UPLOAD_SERVICE)) return false;
        var code = m.getImplementation();
        var first = code.getInstructions().iterator().next();
        if (first.getOpcode() != Opcode.IGET_OBJECT || ((TwoRegisterInstruction) first).getRegisterB() != code.getRegisterCount() - 1 ||
            !(((ReferenceInstruction) first).getReference() instanceof FieldReference field) ||
            !m.getDefiningClass().equals(field.getDefiningClass()) || !base.equals(field.getType())) return false;
        var reporters = new TreeSet<String>();
        for (var i : code.getInstructions())
            if (i.getOpcode() == Opcode.INVOKE_DIRECT && ((ReferenceInstruction) i).getReference() instanceof MethodReference r &&
                m.getDefiningClass().equals(r.getDefiningClass()) && "V".equals(r.getReturnType()) &&
                r.getParameterTypes().size() == 1 && "I".contentEquals(r.getParameterTypes().get(0))) reporters.add(r.toString());
        return reporters.size() == 1;
    }

    static List<Method> boundUploadTasks(List<ClassDef> classes) {
        ClassDef play = null;
        for (var cls : classes) if (GOOGLE_PLAY_UPLOAD_SERVICE.equals(cls.getType())) play = cls;
        if (play == null || play.getSuperclass() == null) return List.of();
        var base = play.getSuperclass();
        ClassDef baseClass = null;
        for (var cls : classes) if (base.equals(cls.getType())) baseClass = cls;
        if (baseClass == null || !"Landroid/app/Service;".equals(baseClass.getSuperclass())) return List.of();
        // 582's builds and 587's second family keep the uploader's override of the base's abstract (task)I method.
        var abstractTasks = new HashSet<String>();
        for (var m : baseClass.getMethods())
            if (AccessFlags.ABSTRACT.isSet(m.getAccessFlags()) && "I".equals(m.getReturnType()) && m.getParameterTypes().size() == 1)
                abstractTasks.add(entryPoint(m));
        var found = new ArrayList<Method>();
        for (var m : play.getMethods())
            if (abstractTasks.contains(entryPoint(m)) && "I".equals(m.getReturnType()) && m.getParameterTypes().size() == 1 &&
                !AccessFlags.STATIC.isSet(m.getAccessFlags()) && !AccessFlags.ABSTRACT.isSet(m.getAccessFlags()) &&
                m.getImplementation() != null && holdsBoundUploadMark(m))
                found.add(m);
        // Elsewhere the upload is inlined into the Runnable.
        for (var cls : classes) {
            if (!cls.getInterfaces().contains("Ljava/lang/Runnable;")) continue;
            boolean holdsService = false;
            for (var f : cls.getFields()) if (base.equals(f.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) holdsService = true;
            if (holdsService) for (var m : cls.getMethods()) if (isInlinedUploadTask(m, base)) found.add(m);
        }
        return found;
    }

    static final String XANALYTICS_FLUSH = "Lcom/facebook/xanalytics/XAnalyticsHolder;->flush()V";
    static final String XANALYTICS_UPLOAD = "Lcom/facebook/xanalytics/XAnalyticsNative;->kickOffUpload()V";

    /** The XAnalytics timer: a Runnable's run() that flushes, then uploads, once each, and otherwise only calls ()Object getters. */
    static boolean isXAnalyticsUploadTimer(Method m) {
        if (!"run()V".equals(entryPoint(m)) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null) return false;
        int flushes = 0, uploads = 0, returns = 0;
        boolean uploadAfterFlush = false;
        Instruction last = null;
        for (var i : m.getImplementation().getInstructions()) {
            last = i;
            if (i.getOpcode() == Opcode.RETURN_VOID) returns++;
            if (!i.getOpcode().name.startsWith("invoke")) continue;
            if (!(((ReferenceInstruction) i).getReference() instanceof MethodReference r)) return false;
            var name = r.getDefiningClass() + "->" + r.getName() + "(" + String.join("", r.getParameterTypes()) + ")" + r.getReturnType();
            if (XANALYTICS_FLUSH.equals(name)) flushes++;
            else if (XANALYTICS_UPLOAD.equals(name)) { uploads++; uploadAfterFlush = flushes == 1; }
            else if (!"get".equals(r.getName()) || !r.getParameterTypes().isEmpty() || !"Ljava/lang/Object;".equals(r.getReturnType())) return false;
        }
        return flushes == 1 && uploads == 1 && uploadAfterFlush && returns == 1 && last.getOpcode() == Opcode.RETURN_VOID;
    }

    static List<Method> xanalyticsUploadTimers(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes)
            if (cls.getInterfaces().contains("Ljava/lang/Runnable;"))
                for (var m : cls.getMethods()) if (isXAnalyticsUploadTimer(m)) found.add(m);
        return found.size() == 1 ? found : List.of();
    }

    static final List<String> UPLOAD_ACTIONS = List.of("com.facebook.analytics2.logger.UPLOAD_NOW",
        "com.facebook.analytics2.logger.USER_LOGOUT", "Unknown action=");

    static String methodId(MethodReference r) {
        return r.getDefiningClass() + "->" + r.getName() + "(" + String.join("", r.getParameterTypes()) + ")" + r.getReturnType();
    }

    /**
     * The uploader's (params, callback, action)V dispatcher, which names both upload actions and the unknown one,
     * as literals or (587's USER_LOGOUT) through a string table.
     */
    static boolean isUploadActionDispatcher(Method m, Map<String, Map<Integer, String>> tables) {
        if (!"V".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null ||
            m.getParameterTypes().size() != 3 || !"Ljava/lang/String;".contentEquals(m.getParameterTypes().get(2))) return false;
        var strings = new HashSet<String>();
        for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s) strings.add(s.getString());
        if (!strings.contains("Unknown action=")) return false;
        strings.addAll(tableStrings(instructions(m), tables));
        return strings.containsAll(UPLOAD_ACTIONS);
    }

    /** (params, action)V that only calls the dispatcher with this, its params, a null callback and its action. */
    static boolean startsUploadInProcess(Method m, Method dispatcher) {
        if (!"V".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null ||
            m.getParameterTypes().size() != 2 || !"Ljava/lang/String;".contentEquals(m.getParameterTypes().get(1))) return false;
        var code = new ArrayList<Instruction>();
        m.getImplementation().getInstructions().forEach(code::add);
        if (code.size() != 3 || code.get(0).getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() != 0 ||
            code.get(1).getOpcode() != Opcode.INVOKE_DIRECT || code.get(2).getOpcode() != Opcode.RETURN_VOID) return false;
        if (!(((ReferenceInstruction) code.get(1)).getReference() instanceof MethodReference target) ||
            !methodId(target).equals(methodId(dispatcher)) ||
            !m.getParameterTypes().get(0).toString().equals(target.getParameterTypes().get(0).toString())) return false;
        var call = (FiveRegisterInstruction) code.get(1);
        int self = m.getImplementation().getRegisterCount() - 3;
        int callback = ((OneRegisterInstruction) code.get(0)).getRegisterA();
        return callback < self && call.getRegisterCount() == 4 && call.getRegisterC() == self && call.getRegisterD() == self + 1 &&
            call.getRegisterE() == callback && call.getRegisterF() == self + 2;
    }

    /** The in-process upload start beside the one dispatcher, when there's exactly one. Mirrors AnalyticsUploads.kt. */
    static List<Method> inProcessUploadStarts(List<ClassDef> classes, Map<String, Map<Integer, String>> tables) {
        var dispatchers = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if (isUploadActionDispatcher(m, tables)) dispatchers.add(m);
        if (dispatchers.size() != 1) return List.of();
        var dispatcher = dispatchers.get(0);
        var starts = new ArrayList<Method>();
        for (var cls : classes)
            if (cls.getType().equals(dispatcher.getDefiningClass()))
                for (var m : cls.getMethods()) if (startsUploadInProcess(m, dispatcher)) starts.add(m);
        return starts.size() == 1 ? starts : List.of();
    }

    static List<Method> analyticsUploads(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        ClassDef uploader = null;
        for (var cls : classes) {
            var entries = ANALYTICS_UPLOAD_ENTRIES.get(cls.getType());
            if (entries != null) for (var m : cls.getMethods())
                if (entries.contains(entryPoint(m)) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) found.add(m);
            if (ANALYTICS2_UPLOAD_SERVICE.equals(cls.getType())) uploader = cls;
        }
        if (uploader == null || uploader.getSuperclass() == null) return found;
        var jobs = Set.of(START_COMMAND, START_JOB);
        for (var m : uploader.getMethods()) if (jobs.contains(entryPoint(m))) return found;
        var base = uploader.getSuperclass();
        ClassDef baseClass = null;
        int subclasses = 0;
        for (var cls : classes) {
            if (base.equals(cls.getType())) baseClass = cls;
            if (base.equals(cls.getSuperclass())) subclasses++;
        }
        if (baseClass == null || !AccessFlags.ABSTRACT.isSet(baseClass.getAccessFlags()) ||
            !"Landroid/app/job/JobService;".equals(baseClass.getSuperclass()) || subclasses != 1) return found;
        for (var m : baseClass.getMethods())
            if (jobs.contains(entryPoint(m)) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) found.add(m);
        return found;
    }

    /**
     * emoji_search: the composer's text watcher, (Editable, boolean)V, which names both "afterTextChanged" and the plain
     * "expression" tray mode. Counted only when exactly one method looks like it. Mirrors EmojiSearch.kt.
     */
    static List<Method> emojiSearchWatchers(List<ClassDef> classes) {
        var watchers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType()) ||
                AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            if (!params.equals(List.of("Landroid/text/Editable;", "Z"))) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("afterTextChanged") && strings.contains("expression")) watchers.add(method);
        }
        return watchers.size() == 1 ? watchers : List.of();
    }

    static final String TAB_CONTENT_SPEC = "messaging.navigation.home.tabs.tabcontent.TabContentInterfaceSpec";
    static final String FACEBOOK_BUTTON =
        "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;";

    /**
     * tab_badges: the bottom bar's badge dispatcher, an instance (String) method naming the tab content spec and
     * "getBadgeController", whose no-badge tabs all read one static field of its return type. Every match must hold that
     * field and keep its tab id within v15, or none counts. Mirrors TabBadges.kt.
     */
    static List<Method> tabBadgeDispatchers(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !method.getReturnType().startsWith("L") || method.getParameterTypes().size() != 1 ||
                !"Ljava/lang/String;".equals(method.getParameterTypes().get(0).toString())) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains(TAB_CONTENT_SPEC) && strings.contains("getBadgeController")) found.add(method);
        }
        for (var method : found) {
            var none = new HashSet<String>();
            for (var i : instructions(method))
                if (i.getOpcode() == Opcode.SGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                    method.getReturnType().equals(f.getType())) none.add(f.toString());
            // The tab id is p1, the method's last register.
            if (none.size() != 1 || method.getImplementation().getRegisterCount() - 1 > 15) return List.of();
        }
        return found;
    }

    /**
     * facebook_badge: the Facebook button's build, whose one (FbUserSession)Z check drops the cast badge controller to
     * null right before the button is made with it, and whose check result no other path jumps past. Mirrors TabBadges.kt.
     */
    static List<Method> facebookBadgeChecks(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) {
            if (!FACEBOOK_BUTTON.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) if (facebookBadgeCheck(method) >= 0) found.add(method);
        }
        for (var method : found) {
            int result = facebookBadgeCheck(method);
            if (register(instructions(method).get(result)) > 15 || mediaTargets(method).contains(result + 1)) return List.of();
        }
        return found;
    }

    static final String HEADER_ROW = "ThreadHeaderMessageActionRowComponent";

    record HeaderActions(int read, List<FieldReference> checked) {}

    /**
     * facebook_profile_header: the empty chat header row's render, which names its component, reads its own action list
     * once and then asks that list for each action it may draw. Null when the shape moved. Mirrors ProfileHeader.kt.
     */
    static HeaderActions headerActions(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getParameterTypes().size() != 1) return null;
        var code = instructions(method);
        boolean named = false;
        int read = -1, reads = 0;
        for (int at = 0; at < code.size(); at++) {
            var i = code.get(at);
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && HEADER_ROW.equals(sr.getString())) named = true;
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                f.getDefiningClass().equals(method.getDefiningClass()) && "Ljava/util/List;".equals(f.getType())) { read = at; reads++; }
        }
        if (!named || reads != 1) return null;
        int list = ((TwoRegisterInstruction) code.get(read)).getRegisterA();
        var checked = new ArrayList<FieldReference>();
        for (int at = read + 2; at < code.size(); at++) {
            var action = code.get(at - 1);
            if (writesRegister(action, list)) break;
            if (!(code.get(at) instanceof FiveRegisterInstruction call) || !(action instanceof ReferenceInstruction ai) ||
                !(ai.getReference() instanceof FieldReference constant)) continue;
            if (call.getOpcode() != Opcode.INVOKE_INTERFACE || !"Ljava/util/List;->contains(Ljava/lang/Object;)Z".equals(ref(call)) ||
                call.getRegisterCount() != 2 || call.getRegisterC() != list || action.getOpcode() != Opcode.SGET_OBJECT ||
                register(action) != call.getRegisterD() || !constant.getType().equals(constant.getDefiningClass())) continue;
            checked.add(constant);
        }
        return checked.isEmpty() ? null : new HeaderActions(read, checked);
    }

    /** The name an enum's initializer gives constant: the one string loaded since the previous constant was stored. */
    static String headerEnumName(ClassDef cls, FieldReference constant) {
        if (!"Ljava/lang/Enum;".equals(cls.getSuperclass())) return null;
        var inits = new ArrayList<Method>();
        for (var method : cls.getMethods()) if ("<clinit>".equals(method.getName())) inits.add(method);
        if (inits.size() != 1 || inits.get(0).getImplementation() == null) return null;
        var code = instructions(inits.get(0));
        int store = -1, matches = 0, previous = -1;
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.SPUT_OBJECT) continue;
            if (constant.toString().equals(ref(code.get(at)))) { store = at; matches++; }
            else if (matches == 0) previous = at;
        }
        if (matches != 1) return null;
        var names = new ArrayList<String>();
        for (int at = previous + 1; at < store; at++)
            if (code.get(at) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) names.add(sr.getString());
        return names.size() == 1 ? names.get(0) : null;
    }

    /**
     * The one header row render that asks its list for VIEW_PROFILE, or none when more than one does or a jump lands
     * right past its list read.
     */
    static List<Method> profileHeaders(List<ClassDef> classes) {
        var renders = new ArrayList<Map.Entry<Method, HeaderActions>>();
        var wanted = new HashSet<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var actions = headerActions(method);
            if (actions == null) continue;
            renders.add(Map.entry(method, actions));
            for (var constant : actions.checked()) wanted.add(constant.getDefiningClass());
        }
        var enums = new HashMap<String, ClassDef>();
        for (var cls : classes) if (wanted.contains(cls.getType())) enums.put(cls.getType(), cls);
        var found = new ArrayList<Map.Entry<Method, HeaderActions>>();
        for (var render : renders) for (var constant : render.getValue().checked()) {
            var enumClass = enums.get(constant.getDefiningClass());
            if (enumClass != null && "VIEW_PROFILE".equals(headerEnumName(enumClass, constant))) { found.add(render); break; }
        }
        if (found.size() != 1 || mediaTargets(found.get(0).getKey()).contains(found.get(0).getValue().read() + 1)) return List.of();
        return List.of(found.get(0).getKey());
    }

    static final String TAB_CONFIG_TRACE = "MessengerTabConfigurationCreator.createTabConfiguration";
    static final Set<String> HIDABLE_TABS = Set.of("PEOPLE", "JEWEL", "AI", "MUSE");

    /**
     * tab_config: the bottom bar's tab-list builder, an instance (Context, FbUserSession) method naming its trace. Every
     * match must have one configuration site with nothing jumping to it, or none counts. Mirrors TabConfig.kt.
     */
    static List<Method> tabConfigurations(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !method.getReturnType().startsWith("L") || method.getParameterTypes().size() != 2 ||
                !"Landroid/content/Context;".equals(method.getParameterTypes().get(0).toString()) ||
                !BUBBLE_SESSION.equals(method.getParameterTypes().get(1).toString())) continue;
            boolean traced = false;
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && TAB_CONFIG_TRACE.equals(sr.getString())) traced = true;
            if (traced) found.add(method);
        }
        for (var method : found) {
            int site = tabConfigSite(method);
            if (site < 0) return List.of();
            var targets = mediaTargets(method);
            if (targets.contains(site) || targets.contains(site + 1)) return List.of();
        }
        return found;
    }

    /**
     * Index of the new-instance right before the builder's one (List, List) configuration constructor, or -1. The builder
     * must read PEOPLE, JEWEL, AI and MUSE as constants of one enum.
     */
    static int tabConfigSite(Method method) {
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            var op = code.get(i).getOpcode();
            if ((op == Opcode.INVOKE_DIRECT || op == Opcode.INVOKE_DIRECT_RANGE) &&
                ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference m &&
                "<init>".equals(m.getName()) && method.getReturnType().equals(m.getDefiningClass())) {
                if (at >= 0) return -1;
                at = i;
            }
        }
        if (at < 1 || !(code.get(at) instanceof FiveRegisterInstruction build) || build.getRegisterCount() != 3) return -1;
        var params = new ArrayList<String>();
        for (var t : ((MethodReference) ((ReferenceInstruction) build).getReference()).getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of("Ljava/util/List;", "Ljava/util/List;"))) return -1;
        var start = code.get(at - 1);
        if (start.getOpcode() != Opcode.NEW_INSTANCE || register(start) != build.getRegisterC() ||
            !method.getReturnType().equals(((TypeReference) ((ReferenceInstruction) start).getReference()).getType())) return -1;
        var names = new HashSet<String>();
        var types = new HashSet<String>();
        for (var i : code)
            if (i.getOpcode() == Opcode.SGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                HIDABLE_TABS.contains(f.getName()) && f.getType().equals(f.getDefiningClass())) {
                names.add(f.getName());
                types.add(f.getType());
            }
        return names.equals(HIDABLE_TABS) && types.size() == 1 ? at - 1 : -1;
    }

    /** Index of the check's MOVE_RESULT, or -1. */
    static int facebookBadgeCheck(Method method) {
        if (!FACEBOOK_BUTTON.equals(method.getDefiningClass()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !method.getParameterTypes().isEmpty() || !method.getReturnType().startsWith("L")) return -1;
        var code = instructions(method);
        int at = -1, sites = 0;
        for (int i = 0; i + 3 < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.INVOKE_VIRTUAL ||
                !(((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference callee) ||
                !"Z".equals(callee.getReturnType()) || callee.getParameterTypes().size() != 1 ||
                !"Lcom/facebook/auth/usersession/FbUserSession;".equals(callee.getParameterTypes().get(0).toString())) continue;
            if (code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT || code.get(i + 2).getOpcode() != Opcode.IF_NEZ ||
                register(code.get(i + 2)) != register(code.get(i + 1)) || !jumpsTo(code, i + 2, i + 4) ||
                code.get(i + 3).getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) code.get(i + 3)).getNarrowLiteral() != 0) continue;
            at = i;
            sites++;
        }
        if (sites != 1) return -1;
        int controller = register(code.get(at + 3));
        Instruction cast = null;
        for (int i = 0; i < at; i++)
            if (code.get(i).getOpcode() == Opcode.CHECK_CAST && register(code.get(i)) == controller) cast = code.get(i);
        if (cast == null) return -1;
        var type = ((TypeReference) ((ReferenceInstruction) cast).getReference()).getType();
        Instruction build = null;
        for (int i = at + 4; i < code.size() && build == null; i++)
            if ((code.get(i).getOpcode() == Opcode.INVOKE_DIRECT || code.get(i).getOpcode() == Opcode.INVOKE_DIRECT_RANGE) &&
                ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference init && "<init>".equals(init.getName()) &&
                method.getReturnType().equals(init.getDefiningClass())) build = code.get(i);
        if (build == null) return -1;
        // 587 hands the controller over through a builder: right after the check it goes into the builder's field of its
        // type, and the builder goes into the button.
        int carrier = controller;
        String carried = type;
        if (code.get(at + 4).getOpcode() == Opcode.IPUT_OBJECT && register(code.get(at + 4)) == controller) {
            var field = (FieldReference) ((ReferenceInstruction) code.get(at + 4)).getReference();
            if (!type.equals(field.getType())) return -1;
            carrier = ((TwoRegisterInstruction) code.get(at + 4)).getRegisterB();
            carried = field.getDefiningClass();
        }
        // The dropped register (or its builder) is that argument of the button the method returns, and nothing else.
        var arguments = bubbleArgs(build);
        int word = 1, uses = 0;
        String usedAs = null;
        for (var parameter : ((MethodReference) ((ReferenceInstruction) build).getReference()).getParameterTypes()) {
            var name = parameter.toString();
            if (word < arguments.size() && arguments.get(word) == carrier) {
                uses++;
                usedAs = name;
            }
            word += "J".equals(name) || "D".equals(name) ? 2 : 1;
        }
        return uses == 1 && carried.equals(usedAs) ? at + 1 : -1;
    }

    static final Set<String> AI_MENTION_PLUGINS = Set.of(
        "messaging.aibot.core.mentionai.MentionAiRowSupplier", "messaging.aibot.core.imagine.ImagineRowSupplier",
        "messaging.communitymessaging.ai.mentionrowsupplier.CommunityAiRowSupplier");

    /**
     * ai_mentions: the @ suggestion row dispatchers, non-static (query, ImmutableList.Builder)V methods traced as
     * MentionRowSupplierSpec that run a Meta AI, imagine or community AI section. Mirrors AiMentions.kt.
     */
    static List<Method> aiMentionDispatchers(List<ClassDef> classes) {
        var dispatchers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType()) ||
                AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getParameterTypes().size() != 2 ||
                !"Lcom/google/common/collect/ImmutableList$Builder;".equals(method.getParameterTypes().get(1).toString())) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("messaging.mentions.composer.MentionRowSupplierSpec") &&
                strings.stream().anyMatch(AI_MENTION_PLUGINS::contains)) dispatchers.add(method);
        }
        return dispatchers;
    }

    /**
     * ai_commands: the static (controller, ThreadKey)List that turns the open chat's AiPageCustomCommands into
     * suggestions. Counted only when exactly one method looks like it. Mirrors AiMentions.kt.
     */
    static List<Method> aiCommandLists(List<ClassDef> classes) {
        var lists = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"Ljava/util/List;".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            if (!params.equals(List.of(cls.getType(), "Lcom/facebook/messaging/model/threadkey/ThreadKey;"))) continue;
            for (var i : method.getImplementation().getInstructions())
                if (i.getOpcode() == Opcode.CHECK_CAST && ((ReferenceInstruction) i).getReference() instanceof TypeReference tr &&
                    "Lcom/facebook/messaging/aibot/page/customcommand/AiPageCustomCommand;".equals(tr.getType())) {
                    lists.add(method);
                    break;
                }
        }
        return lists.size() == 1 ? lists : List.of();
    }

    /**
     * ai_search_hint: the inbox search bar builder, which names "search_bar" and picks its hint between two constants on a
     * (FbUserSession)Z check right before Resources.getString. Counted only when exactly one method looks like it.
     * Mirrors AiSearchHint.kt.
     */
    static List<Method> searchBarBuilders(List<ClassDef> classes) {
        var builders = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var code = instructions(method);
            if (code.stream().noneMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "search_bar".equals(sr.getString()))) continue;
            if (searchBarPick(code) >= 0) builders.add(method);
        }
        return builders.size() == 1 ? builders : List.of();
    }

    /** Index of the bar's getString call, with the check 7 lines up, the plain id 3 up and the Meta AI id 1 up, or -1. */
    static int searchBarPick(List<Instruction> code) {
        for (int pick = 7; pick < code.size(); pick++) {
            if (code.get(pick).getOpcode() != Opcode.INVOKE_VIRTUAL ||
                !"Landroid/content/res/Resources;->getString(I)Ljava/lang/String;".equals(ref(code.get(pick)))) continue;
            var get = (FiveRegisterInstruction) code.get(pick);
            if (!(code.get(pick - 7) instanceof ReferenceInstruction ci && ci.getReference() instanceof MethodReference check) ||
                (code.get(pick - 7).getOpcode() != Opcode.INVOKE_VIRTUAL && code.get(pick - 7).getOpcode() != Opcode.INVOKE_INTERFACE) || !"Z".equals(check.getReturnType()) ||
                check.getParameterTypes().size() != 1 ||
                !"Lcom/facebook/auth/usersession/FbUserSession;".equals(check.getParameterTypes().get(0).toString())) continue;
            int held = register(code.get(pick - 6));
            if (code.get(pick - 6).getOpcode() != Opcode.MOVE_RESULT ||
                !(code.get(pick - 5) instanceof ReferenceInstruction rr && rr.getReference() instanceof MethodReference resources) ||
                !"Landroid/content/res/Resources;".equals(resources.getReturnType()) ||
                code.get(pick - 4).getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(code.get(pick - 4)) != get.getRegisterC() ||
                code.get(pick - 3).getOpcode() != Opcode.CONST || register(code.get(pick - 3)) != get.getRegisterD() ||
                code.get(pick - 1).getOpcode() != Opcode.CONST || register(code.get(pick - 1)) != get.getRegisterD() ||
                code.get(pick - 2).getOpcode() != Opcode.IF_EQZ || register(code.get(pick - 2)) != held ||
                !jumpsTo(code, pick - 2, pick)) continue;
            return pick;
        }
        return -1;
    }

    /**
     * ai_search_screen_hint: the search screen's header, which reads the inbox bar's own Meta AI check and, within a few
     * lines that leave the answer alone, picks between the bar's two hint ids with if-nez right before reading the string.
     * Counted only when the bar is unambiguous and exactly one method matches. Mirrors AiSearchHint.kt.
     */
    static List<Method> searchScreenHints(List<ClassDef> classes, List<Method> bars) {
        if (bars.size() != 1) return List.of();
        var bar = instructions(bars.get(0));
        int pick = searchBarPick(bar);
        if (pick < 0) return List.of();
        String check = ref(bar.get(pick - 7));
        int plain = ((NarrowLiteralInstruction) bar.get(pick - 3)).getNarrowLiteral();
        int metaAi = ((NarrowLiteralInstruction) bar.get(pick - 1)).getNarrowLiteral();
        var screens = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (searchScreenHintSite(instructions(method), check, plain, metaAi)) screens.add(method);
        return screens.size() == 1 ? screens : List.of();
    }

    static boolean searchScreenHintSite(List<Instruction> code, String check, int plain, int metaAi) {
        for (int result = 1; result < code.size(); result++) {
            var call = code.get(result - 1);
            if (code.get(result).getOpcode() != Opcode.MOVE_RESULT ||
                (call.getOpcode() != Opcode.INVOKE_VIRTUAL && call.getOpcode() != Opcode.INVOKE_INTERFACE) || !check.equals(ref(call))) continue;
            int held = register(code.get(result));
            for (int ai = result + 1; ai <= Math.min(result + 7, code.size() - 4); ai++) {
                if (ai > result + 1 && writesRegister(code.get(ai - 1), held)) break;
                var hint = code.get(ai);
                var branch = code.get(ai + 1);
                var other = code.get(ai + 2);
                if (hint.getOpcode() != Opcode.CONST || branch.getOpcode() != Opcode.IF_NEZ || other.getOpcode() != Opcode.CONST ||
                    register(hint) == held || register(other) != register(hint) || register(branch) != held || !jumpsTo(code, ai + 1, ai + 3) ||
                    ((NarrowLiteralInstruction) hint).getNarrowLiteral() != metaAi || ((NarrowLiteralInstruction) other).getNarrowLiteral() != plain ||
                    !readsHint(code.get(ai + 3), register(hint))) continue;
                return true;
            }
        }
        return false;
    }

    /** Resources.getString(id), or a static (Resources, I)String helper, with the id in [hint]. */
    static boolean readsHint(Instruction i, int hint) {
        if (!(i instanceof FiveRegisterInstruction call) || call.getRegisterCount() != 2 || call.getRegisterD() != hint ||
            !(i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference target)) return false;
        return (i.getOpcode() == Opcode.INVOKE_VIRTUAL && "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;".equals(target.toString())) ||
            (i.getOpcode() == Opcode.INVOKE_STATIC && "Ljava/lang/String;".equals(target.getReturnType()) &&
                refParams(target).equals(List.of("Landroid/content/res/Resources;", "I")));
    }

    /** 587's numbering of the @ list row flags. Meta renumbers them with each release. Mirrors AiMentionRows.kt. */
    record AiRowFlags(Set<Long> row, Set<Long> chat, long shared, long encrypted, long imagine, long imagineYourself) {}
    static final AiRowFlags AI_ROW_FLAGS =
        new AiRowFlags(Set.of(0x810606011b2d20L, 0x81060601042d19L), Set.of(0x810606011b2d20L, 0x81060600042cd6L),
            0x810606011b2d20L, 0x81060600052cd7L, 0x81060600402ce7L, 0x81060600f92d15L);
    static final String CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;";
    static final String FB_SESSION_TYPE = "Lcom/facebook/auth/usersession/FbUserSession;";

    /**
     * ai_mention_rows: the instance checks behind the Meta AI, imagine and imagine yourself rows of the newer @ list, told
     * apart by parameters and the server flag each reads: ()Z reading both row flags (community channels),
     * (FbUserSession, Capabilities)Z reading both chat flags (regular chats), (FbUserSession)Z reading the shared flag and
     * the encrypted flag (encrypted chats), (FbUserSession, ThreadKey, Capabilities, Z, Z)Z reading the imagine flag and
     * (FbUserSession, ThreadKey, Capabilities)Z reading the imagine yourself flag. Counted only when there is exactly one
     * of each, all five share a class and all read 584's flags. Mirrors AiMentionRows.kt.
     */
    static List<Method> aiMentionRowChecks(List<ClassDef> classes) {
        return aiMentionRowChecks(classes, AI_ROW_FLAGS);
    }

    static Set<Long> serverFlags(Method method) {
        var flags = new HashSet<Long>();
        for (var i : method.getImplementation().getInstructions())
            if (i.getOpcode() == Opcode.CONST_WIDE && i instanceof WideLiteralInstruction flag) flags.add(flag.getWideLiteral());
        return flags;
    }

    static List<Method> aiMentionRowChecks(List<ClassDef> classes, AiRowFlags build) {
        // Family B reads the shared flag in a static ()Z getter of its own, and a call to one counts as reading it.
        var getters = new HashSet<String>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (method.getImplementation() != null && AccessFlags.STATIC.isSet(method.getAccessFlags()) && method.getParameterTypes().isEmpty() &&
                "Z".equals(method.getReturnType()) && serverFlags(method).equals(Set.of(build.shared()))) getters.add(hookId(method));
        var rows = new TreeMap<String, List<Method>>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Z".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var p : method.getParameterTypes()) params.add(p.toString());
            var flags = serverFlags(method);
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference target && getters.contains(target.toString())) flags.add(build.shared());
            String row = null;
            if (params.isEmpty() && flags.containsAll(build.row())) row = "meta_ai";
            else if (params.equals(List.of(FB_SESSION_TYPE, CAPABILITIES)) && flags.containsAll(build.chat())) row = "meta_ai_chats";
            else if (params.equals(List.of(FB_SESSION_TYPE)) && flags.containsAll(Set.of(build.shared(), build.encrypted()))) row = "meta_ai_encrypted";
            else if (params.equals(List.of(FB_SESSION_TYPE, THREAD_KEY, CAPABILITIES, "Z", "Z")) && flags.contains(build.imagine())) row = "imagine";
            else if (params.equals(List.of(FB_SESSION_TYPE, THREAD_KEY, CAPABILITIES)) && flags.contains(build.imagineYourself())) row = "imagine_yourself";
            if (row != null) rows.computeIfAbsent(row, k -> new ArrayList<>()).add(method);
        }
        if (rows.size() != 5 || rows.values().stream().anyMatch(m -> m.size() != 1)) return List.of();
        var checks = rows.values().stream().map(m -> m.get(0)).toList();
        return checks.stream().map(Method::getDefiningClass).distinct().count() == 1 ? checks : List.of();
    }

    /**
     * xhe_audio: the no-argument call() that names its copies "orca_share_media" and ends one copy with
     * new FileOutputStream(File, Z), a static (InputStream, OutputStream) copy returning nothing or, in 587, a
     * dropped long, OutputStream.close() and Uri.fromFile on the same File. Counted only when exactly one method looks like it. Mirrors XheAudio.kt.
     */
    static List<Method> shareCopies(List<ClassDef> classes) {
        var copies = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            boolean isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());
            boolean call = "call".equals(method.getName()) && method.getParameterTypes().isEmpty() && !isStatic;
            // Some 584.1 arm64 builds move call()'s body into a static method that takes its own class.
            boolean outlined = isStatic && method.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(cls.getType()));
            if (!(call || outlined) || !"Ljava/lang/Object;".equals(method.getReturnType())) continue;
            var code = instructions(method);
            if (code.stream().noneMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "orca_share_media".equals(sr.getString()))) continue;
            int sites = 0;
            for (int at = 3; at < code.size(); at++) {
                if (!(code.get(at) instanceof FiveRegisterInstruction point) || code.get(at).getOpcode() != Opcode.INVOKE_STATIC ||
                    !"Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;".equals(ref(code.get(at)))) continue;
                if (!(code.get(at - 1) instanceof FiveRegisterInstruction close) || close.getOpcode() != Opcode.INVOKE_VIRTUAL ||
                    !"Ljava/io/OutputStream;->close()V".equals(ref(close))) continue;
                if (!(code.get(at - 2) instanceof FiveRegisterInstruction copy) || copy.getOpcode() != Opcode.INVOKE_STATIC ||
                    !(((ReferenceInstruction) copy).getReference() instanceof MethodReference copier) || !Set.of("V", "J").contains(copier.getReturnType()) ||
                    !copier.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/io/InputStream;", "Ljava/io/OutputStream;"))) continue;
                if (!(code.get(at - 3) instanceof FiveRegisterInstruction open) || open.getOpcode() != Opcode.INVOKE_DIRECT ||
                    !"Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V".equals(ref(open))) continue;
                if (open.getRegisterD() == point.getRegisterC() && open.getRegisterC() == close.getRegisterC() && copy.getRegisterD() == close.getRegisterC()) sites++;
            }
            if (sites == 1) copies.add(method);
        }
        return copies.size() == 1 ? copies : List.of();
    }

    static final String OVERSCROLL_BEHAVIOR = "Lcom/facebook/messaging/threadview/overscroll/ui/OverScrollActionBehavior;";

    /**
     * disappearing_swipe: the chat overscroll behavior's own non-static onStartNestedScroll, which still logs
     * "dm_swipe_up_impression". The class keeps its name in every build. Mirrors DisappearingSwipe.kt.
     */
    static List<Method> disappearingSwipeStarts(List<ClassDef> classes) {
        var starts = new ArrayList<Method>();
        for (var cls : classes) {
            if (!OVERSCROLL_BEHAVIOR.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                    !"onStartNestedScroll".equals(method.getName()) || !"Z".equals(method.getReturnType())) continue;
                var params = new ArrayList<String>();
                for (var t : method.getParameterTypes()) params.add(t.toString());
                if (!params.equals(List.of("Landroidx/coordinatorlayout/widget/CoordinatorLayout;", "Landroid/view/View;",
                    "Landroid/view/View;", "Landroid/view/View;", "I", "I"))) continue;
                for (var i : method.getImplementation().getInstructions())
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        "dm_swipe_up_impression".equals(sr.getString())) {
                        starts.add(method);
                        break;
                    }
            }
        }
        return starts;
    }

    static final String QUICK_SEND_SHOW = "Lcom/facebook/xapp/messaging/composer/recentmedia/quicksend/event/QuickSendShowEvent;";
    static final String IMAGES_URI = "Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;";

    /**
     * recent_media: the static void detector that reads the newest photo from the media store and makes the recent photo
     * card's event with the event's own static factory. The quick send handler that takes the event and makes another is
     * left out. Mirrors RecentMedia.kt.
     */
    static List<Method> recentMediaDetectors(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"V".equals(method.getReturnType()) || QUICK_SEND_SHOW.equals(cls.getType())) continue;
            boolean takesEvent = false;
            for (var t : method.getParameterTypes()) takesEvent |= QUICK_SEND_SHOW.equals(t.toString());
            if (takesEvent) continue;
            boolean factory = false, images = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (!(i instanceof ReferenceInstruction ri)) continue;
                if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                    ri.getReference() instanceof MethodReference mr && QUICK_SEND_SHOW.equals(mr.getDefiningClass()) &&
                    QUICK_SEND_SHOW.equals(mr.getReturnType())) factory = true;
                if (ri.getReference() instanceof FieldReference fr && IMAGES_URI.equals(fr.toString())) images = true;
            }
            if (factory && images) found.add(method);
        }
        return found;
    }

    static final String CORNER_PEEK_ATTACH = "qs_corner_peek_attach";
    static final String CORNER_PEEK_ATTACHED = "qs_corner_peek_attached";

    static final String CHAT_HEADS_FULL_VIEW = "Lcom/facebook/messaging/chatheads/view/stacks/ChatHeadsFullView;";

    /**
     * instants_button: the chat list's static void attach step, handed the fragment it's declared on, that inflates the
     * Instants button (Messenger's "corner peek") and logs qs_corner_peek_attach and qs_corner_peek_attached. The layout
     * pass, scroll listener and resume coroutine that call it log neither. Beside it, the chat-head controller's static
     * void step, handed the controller, that reads the stack's ChatHeadsFullView, adds the Instants button under the
     * heads and logs it as "quicksnap". Mirrors InstantsButton.kt.
     */
    static List<Method> instantsButtonAttaches(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"V".equals(method.getReturnType()) || method.getParameterTypes().size() != 1 ||
                !cls.getType().equals(method.getParameterTypes().get(0).toString())) continue;
            boolean attach = false, attached = false, quicksnap = false, fullView = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (!(i instanceof ReferenceInstruction ri)) continue;
                if (ri.getReference() instanceof FieldReference fr && CHAT_HEADS_FULL_VIEW.equals(fr.getType())) fullView = true;
                if (!(ri.getReference() instanceof StringReference sr)) continue;
                if (CORNER_PEEK_ATTACH.equals(sr.getString())) attach = true;
                if (CORNER_PEEK_ATTACHED.equals(sr.getString())) attached = true;
                if ("quicksnap".equals(sr.getString())) quicksnap = true;
            }
            if ((attach && attached) || (quicksnap && fullView)) found.add(method);
        }
        return found;
    }

    /**
     * save_voice: the static step that hands the voice message player its file, (FbUserSession, own class, an object)
     * returning a Uri, with one return-object and the "Download audio" name it gives the fetch. Kept only when there's
     * exactly one. Mirrors SaveVoice.kt.
     */
    static List<Method> voiceDownloads(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var params = method.getParameterTypes();
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"Landroid/net/Uri;".equals(method.getReturnType()) || params.size() != 3 ||
                !"Lcom/facebook/auth/usersession/FbUserSession;".equals(params.get(0).toString()) ||
                !cls.getType().equals(params.get(1).toString()) || !params.get(2).toString().startsWith("L")) continue;
            int returns = 0;
            boolean download = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (i.getOpcode() == Opcode.RETURN_OBJECT) returns++;
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                    "Download audio".equals(sr.getString())) download = true;
            }
            if (returns == 1 && download) found.add(method);
        }
        return found.size() == 1 ? found : new ArrayList<>();
    }
}
