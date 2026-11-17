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
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Quiet calls, Android Auto, local search, call recording, the home header and the phone id. */
final class Extras {

    static final String RTC_NOTIFICATION_SERVICE ="Lcom/facebook/rtc/notification/RtcNotificationForegroundService;";

    /**
     * The flag register of the log entry built right after a name: a static (Object, boolean) call that takes the
     * name's register first and the flag second, in either invoke form, or -1.
     */
    static int namedFlag(Instruction i, int name) {
        if (i.getOpcode() != Opcode.INVOKE_STATIC && i.getOpcode() != Opcode.INVOKE_STATIC_RANGE) return -1;
        if (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference target)) return -1;
        if (!List.of("Ljava/lang/Object;", "Z").equals(target.getParameterTypes().stream().map(Object::toString).toList())) return -1;
        if (i instanceof FiveRegisterInstruction call && call.getRegisterCount() == 2 && call.getRegisterC() == name) return call.getRegisterD();
        if (i instanceof RegisterRangeInstruction range && range.getRegisterCount() == 2 && range.getStartRegister() == name) return name + 1;
        return -1;
    }

    /**
     * The flag logged under the name at logged: the entry right after the name takes it directly, or the 32-bit
     * builds' copy of it made just before the entry, or -1.
     */
    static int loggedFlag(List<Instruction> code, int logged) {
        if (!(code.get(logged) instanceof OneRegisterInstruction named) || logged + 1 >= code.size()) return -1;
        int name = named.getRegisterA();
        var next = code.get(logged + 1);
        int text = textFlag(code, logged, name);
        if (text >= 0) return text;
        if (!Set.of(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16).contains(next.getOpcode())) return namedFlag(next, name);
        var copy = (TwoRegisterInstruction) next;
        if (copy.getRegisterA() == name || logged + 2 >= code.size()) return -1;
        return namedFlag(code.get(logged + 2), name) == copy.getRegisterA() ? copy.getRegisterB() : -1;
    }

    /**
     * 587's log entry: the flag turned into its String right after the name, that String's result, then a pair made from
     * the name and the String. The flag register, or -1. Mirrors QuietCalls.kt's textFlag.
     */
    static int textFlag(List<Instruction> code, int logged, int name) {
        if (logged + 4 >= code.size() || !"Ljava/lang/String;->valueOf(Z)Ljava/lang/String;".equals(ref(code.get(logged + 1)))) return -1;
        var text = code.get(logged + 1);
        int flag;
        if (text instanceof FiveRegisterInstruction call && call.getRegisterCount() == 1) flag = call.getRegisterC();
        else if (text instanceof RegisterRangeInstruction range && range.getRegisterCount() == 1) flag = range.getStartRegister();
        else return -1;
        if (code.get(logged + 2).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(logged + 3).getOpcode() != Opcode.NEW_INSTANCE) return -1;
        int result = register(code.get(logged + 2)), pair = register(code.get(logged + 3));
        var made = code.get(logged + 4);
        if (made.getOpcode() != Opcode.INVOKE_DIRECT || !(ref(code.get(logged + 3)) + "-><init>(Ljava/lang/Object;Ljava/lang/Object;)V").equals(ref(made))) return -1;
        var args = (FiveRegisterInstruction) made;
        return args.getRegisterCount() == 3 && args.getRegisterC() == pair && args.getRegisterD() == name && args.getRegisterE() == result ? flag : -1;
    }

    /** Index of the one const-string with this text, or -1 when there are none or several. */
    static int onlyString(List<Instruction> code, String text) {
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && text.equals(sr.getString())) {
                if (at >= 0) return -1;
                at = i;
            }
        }
        return at;
    }

    /**
     * quiet_call_ring: the app's only method naming "Maybe start ringing", an instance run()V that also names
     * ringtone_disabled and notifications_blocked once each. The flag the log entry pairs with ringtone_disabled has
     * exactly one if-nez before "Maybe start ringing" that lands after it and at or before that log, and nothing jumps
     * to the instruction after that branch. Ahead of that branch sits the call's one chat lookup, an invoke-static/range
     * (ThreadKey, ?, ImmutableList, String, long, boolean)V nothing jumps to. Mirrors QuietCalls.kt.
     */
    static List<Method> quietCallRing(List<ClassDef> classes) {
        var deciders = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (literals(method).contains("Maybe start ringing")) deciders.add(method);
        if (deciders.size() != 1) return List.of();
        var decider = deciders.get(0);
        if (AccessFlags.STATIC.isSet(decider.getAccessFlags()) || !"run".equals(decider.getName()) ||
            !decider.getParameterTypes().isEmpty() || !"V".equals(decider.getReturnType())) return List.of();
        var code = instructions(decider);
        int ring = onlyString(code, "Maybe start ringing"), logged = onlyString(code, "ringtone_disabled");
        if (ring < 0 || logged < 0 || onlyString(code, "notifications_blocked") < 0) return List.of();
        int flag = loggedFlag(code, logged);
        if (flag < 0) return List.of();
        var branches = new ArrayList<Integer>();
        for (int i = 0; i < ring; i++) {
            if (code.get(i).getOpcode() != Opcode.IF_NEZ || register(code.get(i)) != flag) continue;
            int target = mediaTarget(code, i);
            if (target > ring && target <= logged) branches.add(i);
        }
        if (branches.size() != 1 || mediaTargets(decider).contains(branches.get(0) + 1)) return List.of();
        var lookups = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) if (isCallChatLookup(code.get(i))) lookups.add(i);
        if (lookups.size() != 1 || lookups.get(0) > branches.get(0) || mediaTargets(decider).contains(lookups.get(0))) return List.of();
        return List.of(decider);
    }

    static boolean isCallChatLookup(Instruction i) {
        if (i.getOpcode() != Opcode.INVOKE_STATIC_RANGE || !(i instanceof ReferenceInstruction ri) ||
            !(ri.getReference() instanceof MethodReference target) || !"V".equals(target.getReturnType())) return false;
        var types = new ArrayList<String>();
        for (var t : target.getParameterTypes()) types.add(t.toString());
        return types.size() == 6 && "Lcom/facebook/messaging/model/threadkey/ThreadKey;".equals(types.get(0)) &&
            "Lcom/google/common/collect/ImmutableList;".equals(types.get(2)) && "Ljava/lang/String;".equals(types.get(3)) &&
            "J".equals(types.get(4)) && "Z".equals(types.get(5));
    }

    /**
     * quiet_call_notification: the call service's only static (Notification, Context, ...)V method that also takes the
     * service and makes an invoke-virtual startForeground(int, Notification...) call, when nothing jumps to its first
     * instruction. Mirrors QuietCalls.kt.
     */
    static List<Method> quietCallNotification(List<ClassDef> classes) {
        var posters = new ArrayList<Method>();
        for (var cls : classes) {
            if (!RTC_NOTIFICATION_SERVICE.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                var types = params(method);
                if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) ||
                    types.size() < 3 || !"Landroid/app/Notification;".equals(types.get(0)) || !"Landroid/content/Context;".equals(types.get(1)) ||
                    !types.contains(RTC_NOTIFICATION_SERVICE)) continue;
                for (var i : instructions(method)) {
                    if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference target &&
                        "startForeground".equals(target.getName()) && target.getParameterTypes().size() >= 2 &&
                        "I".contentEquals(target.getParameterTypes().get(0)) && "Landroid/app/Notification;".contentEquals(target.getParameterTypes().get(1))) {
                        posters.add(method);
                        break;
                    }
                }
            }
        }
        if (posters.size() != 1 || mediaTargets(posters.get(0)).contains(0)) return List.of();
        return posters;
    }

    /**
     * quiet_mode: the app's only (Notification, FbUserSession, MessagingNotification, String, int)Z method that also
     * reaches the compat notify, a (String, int, Notification)V call, which is what makes it the messaging
     * notification poster rather than the wrapper that delegates to it. Mirrors QuietMode.kt.
     */
    static List<Method> quietModeNotify(List<ClassDef> classes) {
        var poster = List.of("Landroid/app/Notification;", "Lcom/facebook/auth/usersession/FbUserSession;",
            "Lcom/facebook/messaging/notify/type/MessagingNotification;", "Ljava/lang/String;", "I");
        var compatNotify = List.of("Ljava/lang/String;", "I", "Landroid/app/Notification;");
        var posters = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"Z".equals(method.getReturnType()) || !params(method).equals(poster)) continue;
            for (var i : instructions(method)) {
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference target &&
                    "V".equals(target.getReturnType())) {
                    var types = new ArrayList<String>();
                    for (var t : target.getParameterTypes()) types.add(t.toString());
                    if (types.equals(compatNotify)) {
                        posters.add(method);
                        break;
                    }
                }
            }
        }
        if (posters.size() != 1 || mediaTargets(posters.get(0)).contains(0)) return List.of();
        return posters;
    }

    static final String CAR_EXTENSIONS = "android.car.EXTENSIONS";
    static final String CAR_CONVERSATION = "car_conversation";
    static final String PUT_BUNDLE = "Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V";

    /** The car bundle's register when code[index] stores it under android.car.EXTENSIONS loaded right before, else -1. */
    static int carBundleStored(List<Instruction> code, int index) {
        if (!(code.get(index) instanceof FiveRegisterInstruction put) || put.getOpcode() != Opcode.INVOKE_VIRTUAL || put.getRegisterCount() != 3 ||
            !PUT_BUNDLE.equals(ref(put)) || index == 0) return -1;
        var key = code.get(index - 1);
        return CAR_EXTENSIONS.equals(text(key)) && register(key) == put.getRegisterD() ? put.getRegisterE() : -1;
    }

    /**
     * car_messages: the app's only method writing both car_conversation and android.car.EXTENSIONS, an instance (X)V
     * method whose single car bundle store comes right before a return-void nothing jumps to. Mirrors CarMessages.kt.
     */
    static List<Method> carMessages(List<ClassDef> classes) {
        var writers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var strings = new HashSet<String>();
            for (var i : instructions(method)) { var s = text(i); if (s != null) strings.add(s); }
            if (strings.contains(CAR_CONVERSATION) && strings.contains(CAR_EXTENSIONS)) writers.add(method);
        }
        if (writers.size() != 1) return List.of();
        var method = writers.get(0);
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || params(method).size() != 1) return List.of();
        var code = instructions(method);
        if (code.stream().filter(i -> CAR_CONVERSATION.equals(text(i))).count() != 1) return List.of();
        var stores = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) if (carBundleStored(code, i) >= 0) stores.add(i);
        if (stores.size() != 1) return List.of();
        int ret = stores.get(0) + 1;
        if (ret >= code.size() || code.get(ret).getOpcode() != Opcode.RETURN_VOID || mediaTargets(method).contains(ret)) return List.of();
        return List.of(method);
    }

    static final long CAR_EXTENSION_FLAG = 0x0081027600011849L;
    static final String CAR_EXTENSION_STEP = "add_android_auto_extension";

    /**
     * car_extension_gate: the app's only method logging add_android_auto_extension, where const-wide the flag's id,
     * check-cast, an invoke-interface (J)Z MobileConfig getter, move-result and an if-eqz on that result lead straight into
     * the step, and nothing jumps to the branch. Mirrors carExtensionGate in CarMessages.kt.
     */
    static List<Method> carExtensionGate(List<ClassDef> classes) {
        var steps = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            for (var i : instructions(method)) if (CAR_EXTENSION_STEP.equals(text(i))) { steps.add(method); break; }
        }
        if (steps.size() != 1) return List.of();
        var method = steps.get(0);
        var code = instructions(method);
        var at = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) if (CAR_EXTENSION_STEP.equals(text(code.get(i)))) at.add(i);
        if (at.size() != 1 || at.get(0) < 5) return List.of();
        int step = at.get(0);
        var branch = code.get(step - 1); var result = code.get(step - 2); var read = code.get(step - 3);
        if (branch.getOpcode() != Opcode.IF_EQZ || result.getOpcode() != Opcode.MOVE_RESULT || register(branch) != register(result)) return List.of();
        if (!(read instanceof FiveRegisterInstruction call) || call.getRegisterCount() != 3 ||
            !(((ReferenceInstruction) read).getReference() instanceof MethodReference getter) || !"Z".equals(getter.getReturnType())) return List.of();
        // 587 reads the flag through a static (Object, long)Z helper right after the id; 586 cast the config and called its getter.
        boolean helper = read.getOpcode() == Opcode.INVOKE_STATIC && refParams(getter).equals(List.of("Ljava/lang/Object;", "J"));
        boolean config = read.getOpcode() == Opcode.INVOKE_INTERFACE && "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;".equals(getter.getDefiningClass()) &&
            refParams(getter).equals(List.of("J")) && code.get(step - 4).getOpcode() == Opcode.CHECK_CAST;
        if (!helper && !config) return List.of();
        var id = code.get(helper ? step - 4 : step - 5);
        if (id.getOpcode() != Opcode.CONST_WIDE || ((WideLiteralInstruction) id).getWideLiteral() != CAR_EXTENSION_FLAG || register(id) != call.getRegisterD()) return List.of();
        if (mediaTargets(method).contains(step - 1) || register(result) > 0xff) return List.of();
        return List.of(method);
    }

    static final String LOCAL_SEARCH_LIST = "message_search_thread_message_list_fragment";
    static final String LOCAL_THREAD_SUMMARY = "Lcom/facebook/messaging/model/threads/ThreadSummary;";
    static final String LOCAL_THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;";

    static String localSearchMade(List<Instruction> code, int at) {
        if (at < 0 || at >= code.size() || code.get(at).getOpcode() != Opcode.NEW_INSTANCE) return null;
        return code.get(at) instanceof ReferenceInstruction ri && ri.getReference() instanceof TypeReference type ? type.getType() : null;
    }

    /** The list the picker makes for a chat that isn't encrypted, or null. Mirrors localSearchListType in LocalChatSearch.kt. */
    static String localSearchListType(Method method) {
        if (!"V".equals(method.getReturnType()) || !params(method).equals(List.of(LOCAL_THREAD_SUMMARY, "Ljava/lang/String;", "I"))) return null;
        var code = instructions(method);
        if (code.stream().noneMatch(i -> LOCAL_SEARCH_LIST.equals(text(i)))) return null;
        var lists = new ArrayList<String>();
        for (int i = 0; i + 3 < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.INVOKE_VIRTUAL || !(code.get(i) instanceof ReferenceInstruction ri)
                || !(ri.getReference() instanceof MethodReference call) || !LOCAL_THREAD_KEY.equals(call.getDefiningClass())
                || !"Z".equals(call.getReturnType()) || !call.getParameterTypes().isEmpty()
                || code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT || code.get(i + 2).getOpcode() != Opcode.IF_EQZ) continue;
            String encrypted = localSearchMade(code, i + 3), plain = localSearchMade(code, mediaTarget(code, i + 2));
            if (encrypted != null && plain != null && !plain.equals(encrypted)) lists.add(plain);
        }
        return lists.size() == 1 ? lists.get(0) : null;
    }

    /** The list's search method reading the chat's key off the summary once, with the words untouched by then. */
    static boolean isLocalSearchMethod(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType())
            || !params(method).equals(List.of(LOCAL_THREAD_SUMMARY, "Ljava/lang/String;"))) return false;
        var code = instructions(method);
        int summary = parameterRegister(method, 1), words = parameterRegister(method, 2), read = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.IGET_OBJECT && code.get(i) instanceof ReferenceInstruction ri
                && ri.getReference() instanceof FieldReference field && LOCAL_THREAD_SUMMARY.equals(field.getDefiningClass())
                && LOCAL_THREAD_KEY.equals(field.getType()) && ((TwoRegisterInstruction) code.get(i)).getRegisterB() == summary) {
                if (read >= 0) return false;
                read = i;
            }
        }
        if (read < 0 || ((TwoRegisterInstruction) code.get(read)).getRegisterA() > 15 || words > 15 || mediaTargets(method).contains(read + 1)) return false;
        for (int i = 0; i < read; i++)
            if (code.get(i).getOpcode().setsRegister() && code.get(i) instanceof OneRegisterInstruction one && one.getRegisterA() == words) return false;
        return true;
    }

    /** local_chat_search: one picker naming one list with one search method and one view. Mirrors LocalChatSearch.kt. */
    static List<Method> localChatSearch(List<ClassDef> classes) {
        var types = new ArrayList<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            String type = localSearchListType(method);
            if (type != null) types.add(type);
        }
        if (types.size() != 1) return List.of();
        var search = new ArrayList<Method>();
        var view = new ArrayList<Method>();
        for (var cls : classes) {
            if (!types.get(0).equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                if (isLocalSearchMethod(method)) search.add(method);
                if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) && "onViewCreated".equals(method.getName()) && "V".equals(method.getReturnType())
                    && params(method).equals(List.of("Landroid/view/View;", "Landroid/os/Bundle;")) && method.getImplementation() != null) view.add(method);
            }
        }
        return search.size() == 1 && view.size() == 1 ? List.of(search.get(0), view.get(0)) : List.of();
    }

    static final String UNREAD_SNIPPET_CLASS =
        "Lcom/facebook/messaging/threadlist/plugins/core/threadsnippet/unreadcount/UnreadCountSnippetImpl;";
    static final String LONG_MAXIMUM = "Ljava/lang/Math;->max(JJ)J";

    /** The chat-list unread answer: three long comparisons, a maximum, and five of the summary's own times. */
    static boolean isUnreadAnswer(Method method) {
        if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Z".equals(method.getReturnType())
            || !params(method).equals(List.of(LOCAL_THREAD_SUMMARY))) return false;
        var code = instructions(method);
        int comparisons = 0;
        boolean maximum = false;
        var times = new LinkedHashSet<String>();
        for (var instruction : code) {
            if (instruction.getOpcode() == Opcode.CMP_LONG) comparisons++;
            if (LONG_MAXIMUM.equals(calledName(instruction))) maximum = true;
            if (instruction.getOpcode() == Opcode.IGET_WIDE && instruction instanceof ReferenceInstruction ri
                && ri.getReference() instanceof FieldReference field
                && LOCAL_THREAD_SUMMARY.equals(field.getDefiningClass()) && "J".equals(field.getType()))
                times.add(field.getName());
        }
        return comparisons == 3 && maximum && times.size() == 5;
    }

    /**
     * local_read: the one unread answer the chat list shares, read out of the unread-count snippet whose own plugin
     * name survives every build, then confirmed by the answer's shape. Mirrors LocalRead.kt.
     */
    static List<Method> localRead(List<ClassDef> classes) {
        var asked = new LinkedHashSet<String>();
        for (var cls : classes) {
            if (!UNREAD_SNIPPET_CLASS.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                if (!params(method).equals(List.of(LOCAL_THREAD_SUMMARY))) continue;
                for (var instruction : instructions(method)) {
                    if (instruction.getOpcode() != Opcode.INVOKE_STATIC
                        || !(instruction instanceof ReferenceInstruction ri)
                        || !(ri.getReference() instanceof MethodReference call)
                        || !"Z".equals(call.getReturnType()) || call.getParameterTypes().size() != 1
                        || !LOCAL_THREAD_SUMMARY.equals(call.getParameterTypes().get(0).toString())) continue;
                    asked.add(call.toString());
                }
            }
        }
        if (asked.size() != 1) return List.of();
        String wanted = asked.iterator().next();
        var answers = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (wanted.equals(hookId(method)) && isUnreadAnswer(method)) answers.add(method);
        return answers.size() == 1 ? List.of(answers.get(0)) : List.of();
    }

    static final String OVERLAY_CONFIG_HOLDER = "Lcom/facebook/rsys/overlayconfigmanager/OverlayConfigManagerHolder;";
    static final String WEBRTC_AUDIO_TRACK = "Lorg/webrtc/voiceengine/WebRtcAudioTrack;";
    static final String WEBRTC_AUDIO_RECORD = "Lorg/webrtc/voiceengine/WebRtcAudioRecord;";

    static boolean isThreadRun(Method method) {
        return "run".equals(method.getName()) && "V".equals(method.getReturnType()) && params(method).isEmpty() && method.getImplementation() != null;
    }

    static String calledName(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ri ? ri.getReference().toString() : null;
    }

    /** Where the playout thread hands a frame to the speaker, or -1. Mirrors playoutWriteAt in CallRecording.kt. */
    static int playoutWriteAt(Method method) {
        if (!isThreadRun(method)) return -1;
        var code = instructions(method);
        boolean reads = false;
        int at = -1, writes = 0;
        for (int i = 0; i < code.size(); i++) {
            String call = calledName(code.get(i));
            if (call == null) continue;
            if (call.startsWith(WEBRTC_AUDIO_TRACK + "->") && call.contains("nativeGetPlayoutData")) reads = true;
            if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && "Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I".equals(call)) {
                at = i;
                writes++;
            }
        }
        return reads && writes == 1 && !mediaTargets(method).contains(at) ? at : -1;
    }

    /** Where the record thread reads native's handle to hand a frame over, or -1. Mirrors recordHandoverAt in CallRecording.kt. */
    static int recordHandoverAt(Method method) {
        if (!isThreadRun(method)) return -1;
        var code = instructions(method);
        boolean reads = false;
        int hand = -1, hands = 0;
        for (int i = 0; i < code.size(); i++) {
            String call = calledName(code.get(i));
            if (call == null) continue;
            if ("Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I".equals(call)) reads = true;
            if (call.startsWith(WEBRTC_AUDIO_RECORD + "->") && call.contains("nativeDataIsRecorded")) {
                hand = i;
                hands++;
            }
        }
        if (!reads || hands != 1 || hand == 0) return -1;
        var before = code.get(hand - 1);
        if (before.getOpcode() != Opcode.IGET_WIDE || !(WEBRTC_AUDIO_RECORD + "->nativeAudioRecord:J").equals(calledName(before))) return -1;
        int handle = ((TwoRegisterInstruction) before).getRegisterA();
        if (!(code.get(hand) instanceof FiveRegisterInstruction args) || args.getRegisterCount() != 4 || args.getRegisterE() != handle ||
            args.getRegisterF() != handle + 1 || handle + 1 > 15) return -1;
        return mediaTargets(method).contains(hand - 1) ? -1 : hand - 1;
    }

    /** call_recording: where Java hands native its config layers, playout's two switches and the two audio threads. Mirrors CallRecording.kt. */
    static List<Method> callRecording(List<ClassDef> classes) {
        var holders = new ArrayList<Method>();
        var starts = new ArrayList<Method>();
        var stops = new ArrayList<Method>();
        var playouts = new ArrayList<Method>();
        var records = new ArrayList<Method>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (method.getImplementation() == null) continue;
                boolean plain = params(method).isEmpty() && "Z".equals(method.getReturnType());
                if (OVERLAY_CONFIG_HOLDER.equals(method.getDefiningClass()) && "<init>".equals(method.getName()) && params(method).equals(List.of("Ljava/util/ArrayList;"))) holders.add(method);
                if (plain && WEBRTC_AUDIO_TRACK.equals(method.getDefiningClass()) && "startPlayout".equals(method.getName())) starts.add(method);
                if (plain && WEBRTC_AUDIO_TRACK.equals(method.getDefiningClass()) && "stopPlayout".equals(method.getName())) stops.add(method);
                if (playoutWriteAt(method) >= 0) playouts.add(method);
                if (recordHandoverAt(method) >= 0) records.add(method);
            }
        }
        if (holders.size() != 1 || starts.size() != 1 || stops.size() != 1 || playouts.size() != 1 || records.size() != 1) return List.of();
        return List.of(holders.get(0), starts.get(0), stops.get(0), playouts.get(0), records.get(0));
    }

    static final String HEADER_DRAWABLE = "Landroid/graphics/drawable/Drawable;";
    static final String HEADER_SCALE = "Landroid/widget/ImageView$ScaleType;";

    /** The memoed Drawable cast in the chat list wordmark's render, or -1: invoke-static (scope, Function0, Object[]) Object, move-result, check-cast. */
    static int homeHeaderCast(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || params(method).size() != 1) return -1;
        var code = instructions(method);
        var refs = new HashSet<String>();
        boolean colors = false, image = false;
        for (var i : code) {
            String ref = ref(i);
            if (ref == null) continue;
            refs.add(ref);
            if (i.getOpcode() == Opcode.INVOKE_INTERFACE && ref.startsWith("Lcom/facebook/mig/scheme/interfaces/MigColorScheme;->")) colors = true;
            if (i.getOpcode() == Opcode.INVOKE_STATIC && ((ReferenceInstruction) i).getReference() instanceof MethodReference call) {
                var types = new ArrayList<String>();
                for (var t : call.getParameterTypes()) types.add(t.toString());
                if (types.size() == 4 && HEADER_DRAWABLE.equals(types.get(0)) && HEADER_SCALE.equals(types.get(1)) && "Z".equals(types.get(3))) image = true;
            }
        }
        if (!refs.contains(HEADER_SCALE + "->FIT_START:" + HEADER_SCALE) || !refs.contains(HEADER_SCALE + "->FIT_END:" + HEADER_SCALE) || !colors || !image) return -1;
        int found = -1;
        for (int at = 2; at < code.size(); at++) {
            var cast = code.get(at);
            if (cast.getOpcode() != Opcode.CHECK_CAST || !HEADER_DRAWABLE.equals(ref(cast))) continue;
            var moved = code.get(at - 1);
            var memo = code.get(at - 2);
            if (moved.getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(moved) != register(cast) || memo.getOpcode() != Opcode.INVOKE_STATIC
                || !(((ReferenceInstruction) memo).getReference() instanceof MethodReference call) || !"Ljava/lang/Object;".equals(call.getReturnType())) continue;
            var types = new ArrayList<String>();
            for (var t : call.getParameterTypes()) types.add(t.toString());
            if (types.size() != 3 || !"Lkotlin/jvm/functions/Function0;".equals(types.get(1)) || !"[Ljava/lang/Object;".equals(types.get(2))) continue;
            if (found >= 0) return -1;
            found = at;
        }
        return found < 0 || mediaTargets(method).contains(found + 1) ? -1 : found;
    }

    /** home_header: the chat list wordmark's render, the only method with its shape. Mirrors HomeHeader.kt. */
    static List<Method> homeHeader(List<ClassDef> classes) {
        var renders = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (homeHeaderCast(method) >= 0) renders.add(method);
        return renders.size() == 1 ? List.of(renders.get(0)) : List.of();
    }

    static final String PHONE_ID_PROVIDER = ".provider.phoneid";
    static final String GET_PHONE_ID = "com.facebook.GET_PHONE_ID";
    static final String INSTALLED_PACKAGES_CALL = "getInstalledPackages(I)Ljava/util/List;";

    static List<String> methodCalls(Method method) {
        var called = new ArrayList<String>();
        for (var i : instructions(method))
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call) called.add(call.toString());
        return called;
    }

    static final String PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;";

    /**
     * The PackageManager method an instruction calls, as "name(params)return", straight or through Morphe's Spoof
     * signature wrapper, a static that takes the manager first (#174). Mirrors PackageManagerCalls.kt.
     */
    static String packageManagerCall(Instruction i) {
        if (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference call)) return null;
        var parameters = new ArrayList<String>();
        for (var t : call.getParameterTypes()) parameters.add(t.toString());
        boolean manager = PACKAGE_MANAGER.equals(call.getDefiningClass());
        switch (i.getOpcode()) {
            case INVOKE_VIRTUAL, INVOKE_VIRTUAL_RANGE -> { if (!manager) return null; }
            case INVOKE_STATIC, INVOKE_STATIC_RANGE -> {
                if (manager || parameters.isEmpty() || !PACKAGE_MANAGER.equals(parameters.get(0))) return null;
                parameters.remove(0);
            }
            default -> { return null; }
        }
        return call.getName() + "(" + String.join("", parameters) + ")" + call.getReturnType();
    }

    static List<String> params(Method method) {
        var params = new ArrayList<String>();
        for (var t : method.getParameterTypes()) params.add(t.toString());
        return params;
    }

    /**
     * phone_id_sync: the phoneid requester's static (requester)ArrayList with one getInstalledPackages call, and its
     * instance (String)V that sends GET_PHONE_ID as an ordered broadcast. Taken only while one class holds every
     * phoneid provider query, the sync takes the list and is the app's only GET_PHONE_ID sender, and every other caller
     * of a query also calls the list. Mirrors PhoneIdSync.kt.
     */
    static List<Method> phoneIdSync(List<ClassDef> classes) {
        // A set by type, like the patch's: a class two dex files both carry is one requester, the first copy.
        var requesters = new LinkedHashSet<ClassDef>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (literals(method).contains(PHONE_ID_PROVIDER)) { requesters.add(cls); break; }
        if (requesters.size() != 1) return List.of();
        var requester = requesters.iterator().next();
        var lists = new ArrayList<Method>();
        var syncs = new ArrayList<Method>();
        var queries = new HashSet<String>();
        for (var method : requester.getMethods()) {
            boolean isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());
            var called = methodCalls(method);
            if (isStatic && "Ljava/util/ArrayList;".equals(method.getReturnType()) && params(method).equals(List.of(requester.getType())) &&
                instructions(method).stream().filter(i -> INSTALLED_PACKAGES_CALL.equals(packageManagerCall(i))).count() == 1) lists.add(method);
            if (!isStatic && "V".equals(method.getReturnType()) && params(method).equals(List.of("Ljava/lang/String;")) &&
                literals(method).contains(GET_PHONE_ID) && called.stream().anyMatch(c -> c.contains(";->sendOrderedBroadcast("))) syncs.add(method);
            if (literals(method).contains(PHONE_ID_PROVIDER)) queries.add(hookId(method));
        }
        if (lists.size() != 1 || syncs.size() != 1) return List.of();
        String list = hookId(lists.get(0)), sync = hookId(syncs.get(0));
        if (!methodCalls(syncs.get(0)).contains(list)) return List.of();
        var senders = new ArrayList<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (literals(method).contains(GET_PHONE_ID)) senders.add(hookId(method));
            var called = methodCalls(method);
            if (queries.contains(hookId(method)) || called.stream().noneMatch(queries::contains)) continue;
            if (!hookId(method).equals(sync) && !called.contains(list)) return List.of();
        }
        if (!senders.equals(List.of(sync))) return List.of();
        return List.of(lists.get(0), syncs.get(0));
    }
}
