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

    static final long CAR_EXTENSION_FLAG = 0x0081026b0001184aL;
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
        if (answers.size() != 1) return List.of();
        // The hook hands the summary over straight out of its parameter register, so nothing may write that register.
        var answer = answers.get(0);
        int summary = answer.getImplementation().getRegisterCount() - 1;
        for (var instruction : instructions(answer))
            if (instruction.getOpcode().setsRegister() && instruction instanceof OneRegisterInstruction one
                && (one.getRegisterA() == summary || (instruction.getOpcode().setsWideRegister() && one.getRegisterA() + 1 == summary)))
                return List.of();
        return List.of(answer);
    }

    static final String BADGE_COUNT_TRACE = "UnreadInboxItemsCalculator.updateBadgeUnreadCount";
    static final String BADGE_TOTAL_LOG = " total=";
    static final List<String> BADGE_COUNT_PARAMETERS =
        List.of("Ljava/lang/String;", "Ljava/lang/String;", "I", "I", "I", "I", "I");
    /** The unread total is the fourth parameter. Mirrors BADGE_TOTAL_PARAMETER in UnreadBadge.kt. */
    static final int BADGE_TOTAL_PARAMETER = 3;

    static boolean hasBadgeCountShape(Method method) {
        return !AccessFlags.STATIC.isSet(method.getAccessFlags()) && "V".equals(method.getReturnType())
            && params(method).equals(BADGE_COUNT_PARAMETERS);
    }

    static boolean loadsBadgeString(Method method, String wanted) {
        for (var instruction : instructions(method))
            if (instruction instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s
                && wanted.equals(s.getString())) return true;
        return false;
    }

    /**
     * Whether the count logs the register as its total, copied out within three instructions of the label, and the
     * entry is a spot nothing jumps onto and no try covers. Mirrors validateUnreadBadge in UnreadBadge.kt.
     */
    static boolean badgeCountHookable(Method method) {
        var implementation = method.getImplementation();
        if (implementation == null) return false;
        int first = implementation.getRegisterCount() - (BADGE_COUNT_PARAMETERS.size() + 1);
        if (first < 0) return false;
        int total = first + 1 + BADGE_TOTAL_PARAMETER;
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size() && at < 0; i++)
            if (code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s
                && BADGE_TOTAL_LOG.equals(s.getString())) at = i;
        if (at < 0) return false;
        boolean logged = false;
        for (int i = at + 1; i < Math.min(code.size(), at + 4); i++) {
            var op = code.get(i).getOpcode();
            if ((op == Opcode.MOVE || op == Opcode.MOVE_FROM16 || op == Opcode.MOVE_16)
                && ((TwoRegisterInstruction) code.get(i)).getRegisterB() == total) logged = true;
        }
        if (!logged || Media.mediaTargets(method).contains(0)) return false;
        for (var block : implementation.getTryBlocks()) if (block.getStartCodeAddress() == 0) return false;
        return true;
    }

    /** unread_badge: the one badge count, alone in its shape on its class. Mirrors findUnreadBadge in UnreadBadge.kt. */
    static List<Method> unreadBadge(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) {
            var shaped = new ArrayList<Method>();
            for (var method : cls.getMethods()) if (hasBadgeCountShape(method)) shaped.add(method);
            if (shaped.size() == 1 && loadsBadgeString(shaped.get(0), BADGE_COUNT_TRACE)) found.add(shaped.get(0));
        }
        return found.size() == 1 && badgeCountHookable(found.get(0)) ? found : List.of();
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

    /** One side of a picked row in Message storage. Mirrors RecoveryArm in RecoveryCodeRow.kt. */
    private record RecoveryArm(int title, String label, int owner, int text) { }

    private static final Set<List<Integer>> RECOVERY_ROW_TITLES =
        Set.of(List.of(0x7f14179e, 0x7f1417a0), List.of(0x7f1417a0, 0x7f1417a2));

    private static List<Integer> recoveryArguments(Instruction i) {
        if (i.getOpcode() != Opcode.INVOKE_STATIC || !(i instanceof FiveRegisterInstruction call)) return null;
        int[] all = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
        var used = new ArrayList<Integer>();
        for (int n = 0; n < call.getRegisterCount(); n++) used.add(all[n]);
        return used;
    }

    private static MethodReference recoveryCall(Instruction i) {
        return i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m ? m : null;
    }

    /** The four instructions of a side, or null. Mirrors recoveryArm in RecoveryCodeRow.kt. */
    private static RecoveryArm recoveryArm(List<Instruction> code, int at, int flag) {
        if (at < 0 || at + 3 >= code.size()) return null;
        var title = code.get(at); var lookup = code.get(at + 1); var result = code.get(at + 2); var rowCode = code.get(at + 3);
        if (title.getOpcode() != Opcode.CONST || ((OneRegisterInstruction) title).getRegisterA() != flag) return null;
        if (rowCode.getOpcode() != Opcode.CONST_16 || ((OneRegisterInstruction) rowCode).getRegisterA() != flag) return null;
        if (result.getOpcode() != Opcode.MOVE_RESULT_OBJECT) return null;
        int text = ((OneRegisterInstruction) result).getRegisterA();
        var label = recoveryCall(lookup); var arguments = recoveryArguments(lookup);
        if (label == null || arguments == null || text == flag || arguments.size() != 2 || arguments.get(1) != flag) return null;
        var types = label.getParameterTypes();
        if (!"Ljava/lang/String;".equals(label.getReturnType()) || types.isEmpty() || !"I".equals(types.get(types.size() - 1).toString())) return null;
        return new RecoveryArm(((NarrowLiteralInstruction) title).getNarrowLiteral(), label.toString(), arguments.get(0), text);
    }

    /** Whether this is the Message storage page's render method. Mirrors recoveryCodeSite in RecoveryCodeRow.kt. */
    private static boolean isRecoveryCodeRender(Method method) {
        if (!"render".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || "V".equals(method.getReturnType())
            || method.getParameterTypes().size() != 1 || method.getImplementation() == null) return false;
        var code = instructions(method);
        var picks = new ArrayList<int[]>();
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.IF_EQZ) continue;
            int flag = ((OneRegisterInstruction) code.get(at)).getRegisterA();
            var chosen = recoveryArm(code, at + 1, flag);
            int addAt = at + 5;
            if (chosen == null || addAt >= code.size()) continue;
            var call = recoveryCall(code.get(addAt)); var arguments = recoveryArguments(code.get(addAt));
            if (call == null || arguments == null || !call.getDefiningClass().equals(method.getDefiningClass()) || !"V".equals(call.getReturnType())) continue;
            var types = call.getParameterTypes().stream().map(Object::toString).toList();
            if (types.size() != 4 || !"Ljava/lang/String;".equals(types.get(2)) || !"I".equals(types.get(3)) || arguments.size() != 4
                || arguments.get(2) != chosen.text() || arguments.get(3) != flag) continue;
            int elseAt = mediaTarget(code, at);
            var otherwise = recoveryArm(code, elseAt, flag);
            if (otherwise == null || !otherwise.label().equals(chosen.label()) || otherwise.owner() != chosen.owner() || otherwise.text() != chosen.text()) continue;
            int backAt = elseAt + 4;
            if (backAt >= code.size()) continue;
            var back = code.get(backAt).getOpcode();
            if (back != Opcode.GOTO && back != Opcode.GOTO_16 && back != Opcode.GOTO_32) continue;
            if (mediaTarget(code, backAt) != addAt) continue;
            picks.add(new int[] {at + 1, otherwise.title()});
        }
        return picks.size() == 2 && RECOVERY_ROW_TITLES.contains(List.of(picks.get(0)[1], picks.get(1)[1]))
            && !mediaTargets(method).contains(picks.get(1)[0]);
    }

    /** recovery_code_row: the page's render method, only while exactly one method has its shape. Mirrors findRecoveryCodeRow. */
    static List<Method> recoveryCodeRow(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (isRecoveryCodeRender(method)) found.add(method);
        return found.size() == 1 ? found : List.of();
    }

    private static final String NOTE_SCREEN = "Lcom/facebook/presence/note/ui/creation/NotesCreationFragment;";

    private static FieldReference noteField(Instruction i) {
        return i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f ? f : null;
    }

    /** Whether the instruction at storeAt stores the note's text filter after its limit. Mirrors noteLimitAt in LongerNotes.kt. */
    private static boolean isNoteLimitStore(Method method, List<Instruction> code, int storeAt) {
        var store = code.get(storeAt);
        if (store.getOpcode() != Opcode.IPUT_OBJECT) return false;
        var filterField = noteField(store);
        if (filterField == null || !"Landroid/text/InputFilter;".equals(filterField.getType())) return false;
        int filter = ((TwoRegisterInstruction) store).getRegisterA();
        int composer = ((TwoRegisterInstruction) store).getRegisterB();
        int at = storeAt - 1;
        for (; at >= 0; at--) {
            var i = code.get(at);
            var field = noteField(i);
            if (i.getOpcode() == Opcode.IPUT && field != null && field.getDefiningClass().equals(filterField.getDefiningClass())
                && "I".equals(field.getType()) && ((TwoRegisterInstruction) i).getRegisterB() == composer) break;
            if (CompatReport.writes(i, filter) || CompatReport.writes(i, composer)) return false;
        }
        if (at < 0) return false;
        int limit = ((TwoRegisterInstruction) code.get(at)).getRegisterA();
        int loadAt = at - 1;
        while (loadAt >= 0 && !CompatReport.writes(code.get(loadAt), limit)) loadAt--;
        if (loadAt < 0) return false;
        var load = code.get(loadAt);
        if (load.getOpcode() != Opcode.CONST_16 || ((NarrowLiteralInstruction) load).getNarrowLiteral() != 60) return false;
        var targets = mediaTargets(method);
        for (int i = loadAt + 1; i <= storeAt; i++) if (targets.contains(i) || code.get(i) instanceof OffsetInstruction) return false;
        return true;
    }

    /** Whether the method hands the note limit to the composer in exactly one place. Mirrors noteLimitSite. */
    private static boolean hasNoteLimitSite(Method method) {
        if (method.getImplementation() == null) return false;
        var code = instructions(method);
        int sites = 0;
        for (int at = 0; at < code.size(); at++) if (isNoteLimitStore(method, code, at)) sites++;
        return sites == 1;
    }

    /** longer_notes: the note screen's state method, only while exactly one method has its shape. Mirrors findLongerNotes. */
    static List<Method> longerNotes(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) {
            if (!NOTE_SCREEN.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) if (hasNoteLimitSite(method)) found.add(method);
        }
        return found.size() == 1 ? found : List.of();
    }

    private static final String SEARCH_LIST = "Lcom/google/common/collect/ImmutableList;";
    private static final String THREAD_LAUNCHER_SPEC = "messaging.navigation.threadviewlauncher.ThreadViewLauncherSpec";

    private static List<String> searchTypes(Method m) {
        return m.getParameterTypes().stream().map(Object::toString).toList();
    }

    /** The register holding parameter index (0 is the first after this), or -1. Mirrors argumentRegister in SearchSections.kt. */
    private static int searchParameter(Method m, int index) {
        if (m.getImplementation() == null) return -1;
        var types = searchTypes(m);
        int words = 0, before = 0;
        for (int n = 0; n < types.size(); n++) {
            int size = "J".equals(types.get(n)) || "D".equals(types.get(n)) ? 2 : 1;
            words += size;
            if (n < index) before += size;
        }
        int self = AccessFlags.STATIC.isSet(m.getAccessFlags()) ? 0 : 1;
        int first = m.getImplementation().getRegisterCount() - words - self;
        return first < 0 ? -1 : first + self + before;
    }

    /** Mirrors searchSectionsList in SearchSections.kt. */
    private static boolean isSearchResultConstructor(Method m) {
        return "<init>".equals(m.getName()) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && "V".equals(m.getReturnType())
            && searchTypes(m).equals(List.of(SEARCH_LIST, "Ljava/lang/Integer;", "I")) && m.getImplementation() != null
            && !mediaTargets(m).contains(0) && searchParameter(m, 0) >= 0;
    }

    /** Mirrors searchItemsSite in SearchSections.kt. */
    private static boolean isSearchSectionConstructor(Method m, String type) {
        if (!"<init>".equals(m.getName()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType())) return false;
        // 588's constructor takes a second Integer after 587's one.
        if (!searchTypes(m).equals(List.of(type, SEARCH_LIST, "Lcom/google/common/collect/ImmutableMap;", "Ljava/lang/Integer;",
            "Ljava/lang/Integer;", "Ljava/lang/String;", "Z"))) return false;
        if (m.getImplementation() == null || mediaTargets(m).contains(0)) return false;
        int first = searchParameter(m, 0);
        return first >= 0 && searchParameter(m, 1) == first + 1;
    }

    /** Mirrors aiChatOpenParams in SearchSections.kt. */
    private static boolean isAiChatLauncher(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) || m.getImplementation() == null) return false;
        var types = searchTypes(m);
        if (types.size() != 4 || !"Landroid/content/Context;".equals(types.get(0)) || !"Lcom/facebook/auth/usersession/FbUserSession;".equals(types.get(2))
            || !"Lcom/facebook/messaging/threadview/params/ThreadViewParams;".equals(types.get(3))) return false;
        return searchParameter(m, 0) - 1 >= 1 && !mediaTargets(m).contains(0);
    }

    /** search_sections: the result constructor of the class the people search source returns. Mirrors findSearchSections. */
    static List<Method> searchSections(List<ClassDef> classes) {
        var results = new LinkedHashSet<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !method.getReturnType().startsWith("L") || method.getImplementation() == null) continue;
            var strings = stringsOf(method);
            if (strings.contains("PeopleYouMayKnowSectionDataSource") && strings.contains("Failed to load people you may know")) results.add(method.getReturnType());
        }
        if (results.size() != 1) return List.of();
        String result = results.iterator().next();
        for (var cls : classes) {
            if (!cls.getType().equals(result)) continue;
            var found = new ArrayList<Method>();
            for (var method : cls.getMethods()) if (isSearchResultConstructor(method)) found.add(method);
            return found.size() == 1 ? found : List.of();
        }
        return List.of();
    }

    /** search_items: the section constructor that takes the enum of section types first. Mirrors findSearchItems. */
    static List<Method> searchItems(List<ClassDef> classes) {
        var enums = new ArrayList<String>();
        for (var cls : classes) {
            if (!"Ljava/lang/Enum;".equals(cls.getSuperclass())) continue;
            for (var method : cls.getMethods())
                if ("<clinit>".equals(method.getName()) && method.getImplementation() != null && stringsOf(method).contains("NULL_STATE_AI_BOTS")) {
                    enums.add(cls.getType());
                    break;
                }
        }
        if (enums.size() != 1) return List.of();
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (isSearchSectionConstructor(method, enums.get(0))) found.add(method);
        return found.size() == 1 ? found : List.of();
    }

    /** ai_chat_open: the chat launcher that names its own spec. Mirrors findAiChatOpen. */
    static List<Method> aiChatOpen(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!isAiChatLauncher(method)) continue;
            if (stringsOf(method).contains(THREAD_LAUNCHER_SPEC)) found.add(method);
        }
        return found.size() == 1 ? found : List.of();
    }

    private static final List<String> OWN_TILE_CONSTRUCTOR = List.of("Lcom/facebook/auth/usersession/FbUserSession;",
        "Lcom/facebook/messaging/inbox/units/StaticUnitConfig;", "Lcom/facebook/messaging/montage/model/MontageBucketPreview;",
        "Lcom/facebook/presence/api/model/NoteWithUserInfo;");

    /** Mirrors storyCreateTileRegister in StoryCreateTile.kt. */
    private static boolean isStoryTrayBuilder(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !SEARCH_LIST.equals(m.getReturnType()) || m.getImplementation() == null) return false;
        var params = searchTypes(m);
        if (params.size() != 8 || !params.get(1).startsWith("L")) return false;
        for (int n = 3; n < 8; n++) if (!SEARCH_LIST.equals(params.get(n))) return false;
        return !mediaTargets(m).contains(0) && searchParameter(m, 1) >= 0;
    }

    /** story_create_tile: the stories row builder that logs its presence check. Mirrors findStoryCreateTile. */
    static List<Method> storyCreateTile(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!SEARCH_LIST.equals(method.getReturnType()) || method.getParameterTypes().size() != 8 || method.getImplementation() == null) continue;
            if (stringsOf(method).contains("invalid_facebook_user_presence") && isStoryTrayBuilder(method)) found.add(method);
        }
        if (found.size() != 1) return List.of();
        String tile = found.get(0).getParameterTypes().get(1).toString();
        for (var cls : classes) {
            if (!cls.getType().equals(tile)) continue;
            for (var method : cls.getMethods())
                if ("<init>".equals(method.getName()) && searchTypes(method).equals(OWN_TILE_CONSTRUCTOR)) return found;
            return List.of();
        }
        return List.of();
    }

    /** Mirrors pinnedBarGate in PinnedBar.kt: a ThreadKey ()Z check whose answer jumps straight to the loader's new-instance. */
    private static boolean hasPinnedBarGate(Method m, String loader) {
        if (m.getImplementation() == null) return false;
        var code = instructions(m);
        int made = -1, branch = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.NEW_INSTANCE || !loader.equals(((ReferenceInstruction) code.get(i)).getReference().toString())) continue;
            if (made >= 0) return false;
            made = i;
        }
        if (made < 0) return false;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.IF_NEZ || !jumpsTo(code, i, made)) continue;
            if (branch >= 0) return false;
            branch = i;
        }
        // 588 falls into the loader from an if-eqz right above that skips it, and nothing else may land on the loader.
        if (branch < 0 && made >= 1 && code.get(made - 1).getOpcode() == Opcode.IF_EQZ && mediaTarget(code, made - 1) > made
            && !mediaTargets(m).contains(made)) branch = made - 1;
        if (branch < 2 || mediaTargets(m).contains(branch)) return false;
        int pinnedRegister = ((OneRegisterInstruction) code.get(branch)).getRegisterA();
        var pinnedResult = code.get(branch - 1);
        if (pinnedResult.getOpcode() != Opcode.MOVE_RESULT || ((OneRegisterInstruction) pinnedResult).getRegisterA() != pinnedRegister || pinnedRegister > 0xff) return false;
        var pinnedRead = code.get(branch - 2);
        if (pinnedRead.getOpcode() != Opcode.INVOKE_VIRTUAL || !(((ReferenceInstruction) pinnedRead).getReference() instanceof MethodReference pinnedCheck)) return false;
        return "Lcom/facebook/messaging/model/threadkey/ThreadKey;".equals(pinnedCheck.getDefiningClass()) && "Z".equals(pinnedCheck.getReturnType())
            && pinnedCheck.getParameterTypes().isEmpty();
    }

    /** pinned_bar: the banner fetch that gates the loader naming the pinned data source. Mirrors findPinnedBar. */
    static List<Method> pinnedBar(List<ClassDef> classes) {
        var pinnedLoaders = new ArrayList<String>();
        for (var cls : classes) for (var method : cls.getMethods())
            if (method.getImplementation() != null && stringsOf(method).contains("PinnedMessagesMsysBannerDataSource")) {
                pinnedLoaders.add(cls.getType());
                break;
            }
        if (pinnedLoaders.size() != 1) return List.of();
        for (var cls : classes) {
            if (!"Lcom/facebook/messaging/msys/thread/banner/datafetch/ThreadViewBannerDataFetch;".equals(cls.getType())) continue;
            var found = new ArrayList<Method>();
            for (var method : cls.getMethods()) if (hasPinnedBarGate(method, pinnedLoaders.get(0))) found.add(method);
            return found.size() == 1 ? found : List.of();
        }
        return List.of();
    }

    private static List<String> typeNames(List<? extends CharSequence> types) {
        var names = new ArrayList<String>();
        for (var type : types) names.add(type.toString());
        return names;
    }

    private static final List<String> SOUND_PICKER_TYPES = List.of("Lcom/facebook/auth/usersession/FbUserSession;",
        "Lcom/facebook/messaging/model/messages/Message;", "Z", "Z");

    /** Mirrors isSoundCheck in OpenChatSound.kt: an in-app sounds check of the session, `(FbUserSession)Z`. */
    private static boolean isSoundCheck(Instruction i, int session) {
        if (i.getOpcode() != Opcode.INVOKE_VIRTUAL || !(((ReferenceInstruction) i).getReference() instanceof MethodReference call)) return false;
        return "Z".equals(call.getReturnType()) && typeNames(call.getParameterTypes()).equals(List.of("Lcom/facebook/auth/usersession/FbUserSession;"))
            && ((FiveRegisterInstruction) i).getRegisterCount() == 2 && ((FiveRegisterInstruction) i).getRegisterD() == session;
    }

    /** Mirrors openChatSite in OpenChatSound.kt, on the stock shape: the dropped in-app sounds check and the in-app sound call. */
    private static boolean hasOpenChatSite(Method m) {
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) || m.getImplementation() == null) return false;
        if (!typeNames(m.getParameterTypes()).equals(SOUND_PICKER_TYPES)) return false;
        var soundStrings = stringsOf(m);
        if (!soundStrings.contains("notif_processing") || !soundStrings.contains("Play sound")) return false;
        var code = instructions(m);
        int session = m.getImplementation().getRegisterCount() - 4;
        int play = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.INVOKE_VIRTUAL || !(((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference call)) continue;
            if (!"V".equals(call.getReturnType()) || !typeNames(call.getParameterTypes()).equals(List.of("Lcom/facebook/auth/usersession/FbUserSession;", "Ljava/lang/String;"))) continue;
            if (play >= 0) return false;
            play = i;
        }
        if (play < 3) return false;
        var playCall = (FiveRegisterInstruction) code.get(play);
        if (playCall.getRegisterCount() != 3 || playCall.getRegisterD() != session) return false;
        int soundName = playCall.getRegisterE();
        var soundStart = code.get(play - 3);
        if (!Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST).contains(soundStart.getOpcode()) || ((OneRegisterInstruction) soundStart).getRegisterA() != soundName) return false;
        var soundLookup = code.get(play - 2);
        if (soundLookup.getOpcode() != Opcode.INVOKE_STATIC || !(((ReferenceInstruction) soundLookup).getReference() instanceof MethodReference lookupCall)) return false;
        if (!"Ljava/lang/String;".equals(lookupCall.getReturnType()) || !typeNames(lookupCall.getParameterTypes()).equals(List.of("I"))
            || ((FiveRegisterInstruction) soundLookup).getRegisterC() != soundName) return false;
        var soundResult = code.get(play - 1);
        if (soundResult.getOpcode() != Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction) soundResult).getRegisterA() != soundName) return false;
        int dropped = -1;
        for (int i = 0; i + 1 < code.size(); i++) {
            if (!isSoundCheck(code.get(i), session) || code.get(i + 1).getOpcode() != Opcode.RETURN) continue;
            if (dropped >= 0) return false;
            dropped = i;
        }
        return dropped >= 0 && ((FiveRegisterInstruction) code.get(dropped)).getRegisterC() != playCall.getRegisterC();
    }

    /** open_chat_sound: the one message sound picker with a dropped in-app sounds check. Mirrors findOpenChatSound. */
    static List<Method> openChatSound(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (hasOpenChatSite(method)) found.add(method);
        return found.size() == 1 ? found : List.of();
    }

    private static final String MARK_THREADS_PARAMS = "Lcom/facebook/messaging/service/model/MarkThreadsParams;";
    private static final String MARK_THREADS_RESULT = "Lcom/facebook/fbservice/service/OperationResult;";
    private static final String MARK_THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;";
    private static final Set<String> MARK_THREAD_SHAPES = Set.of(
        "(" + MARK_THREAD_KEY + "Ljava/lang/Long;Lkotlin/jvm/functions/Function1;)V",
        "(" + MARK_THREAD_KEY + "Lkotlin/jvm/functions/Function1;)V");

    /**
     * Mirrors isMarkThreadsHandler in MarkReadLocally.kt: a static method answering an OperationResult that casts the
     * mark_threads parcel and makes exactly two interface calls with a chat's key first, on one interface, one to mark
     * the chat read and one to mark it unread.
     */
    private static boolean isMarkThreadsHandler(Method m) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !MARK_THREADS_RESULT.equals(m.getReturnType()) || m.getImplementation() == null) return false;
        boolean parcel = false;
        var owners = new HashSet<String>();
        var shapes = new ArrayList<String>();
        for (var i : instructions(m)) {
            if (!(i instanceof ReferenceInstruction referring)) continue;
            if (i.getOpcode() == Opcode.CHECK_CAST && referring.getReference() instanceof TypeReference type && MARK_THREADS_PARAMS.equals(type.getType())) parcel = true;
            if (i.getOpcode() != Opcode.INVOKE_INTERFACE && i.getOpcode() != Opcode.INVOKE_INTERFACE_RANGE) continue;
            if (!(referring.getReference() instanceof MethodReference call)) continue;
            var types = typeNames(call.getParameterTypes());
            if (types.isEmpty() || !MARK_THREAD_KEY.equals(types.get(0))) continue;
            owners.add(call.getDefiningClass());
            shapes.add("(" + String.join("", types) + ")" + call.getReturnType());
        }
        return parcel && shapes.size() == 2 && owners.size() == 1 && new HashSet<>(shapes).equals(MARK_THREAD_SHAPES);
    }

    /** mark_read_locally: the one mark_threads service handler. Mirrors findMarkReadLocally in MarkReadLocally.kt. */
    static List<Method> markReadLocally(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) if (isMarkThreadsHandler(method)) found.add(method);
        return found.size() == 1 ? found : List.of();
    }
}
