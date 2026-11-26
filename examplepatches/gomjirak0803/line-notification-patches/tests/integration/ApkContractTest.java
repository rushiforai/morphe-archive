import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.File;
import java.util.*;

/** Static binding/injection checks against user-supplied APKs; does not emulate Android. */
public final class ApkContractTest {
    private static final Map<String, ClassDef> classes = new HashMap<>();
    private static int assertions;
    public static void main(String[] args) throws Exception {
        String mode = args.length > 1 ? args[1] : "all";
        boolean all = "all".equals(mode);
        boolean hasSilent = all || "silent-only".equals(mode);
        boolean hasInfo = all || "info-only".equals(mode);
        boolean hasNoReply = all;
        boolean hasRead = all || "read-only".equals(mode);
        if (!all && !hasSilent && !hasInfo && !hasRead) {
            throw new IllegalArgumentException("Unknown validation mode: " + mode);
        }
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) {
            if (classes.put(type.getType(), type) != null) throw new AssertionError("Duplicate DEX class: " + type.getType());
        }
        field("Lap3/b;", "k0", "Lap3/b$a;");
        field("Ldp3/a;", "b", "Ljava/lang/String;");
        field("Lig3/k;", "b", "Ljava/lang/String;");
        field("Lig3/k;", "m", "Ljava/lang/String;");
        field("Lig3/k;", "n", "Lig3/k$d;");
        field("Lig3/k$d;", "c", "I");
        field("Lip8/g;", "p", "Landroid/os/Bundle;");
        field("Lcom/linecorp/chathistory/menu/ChatHistoryMenuFragment;", "e", "Lz50/t2;");
        field("Lz50/t2;", "a", "Ljava/lang/String;");
        field("Lz50/t2;", "m", "Z");
        field("Lbt8/j;", "a", "Lbt8/j;");
        field("Lig3/t$c;", "a", "Lig3/t$c;");
        field("Lvs8/i0;", "a", "Lvs8/i0;");
        method("Lsc0/f;", "a", "Landroid/content/Context;Lsc0/a;", "Ljava/lang/Object;");
        method("Lap3/b;", "getProfile", "", "Ldp3/a;");
        method("Lnn8/i;", "c", "", "Z");
        method("Lnn8/c;", "<init>", "Z", "V");
        method("Lnn8/c;", "a", "Ljava/lang/String;", "Lpn8/c;");
        method("Lpn8/c;", "c", "", "Z");
        method("Lwk8/a2;", "a", "Landroid/content/Context;Z", "Lwk8/l0;");
        method("Lwk8/l0;", "r", "", "Lue3/k;");
        method("Lwk8/l0;", "x", "Ljava/lang/String;", "Z");
        method("Lue3/k;", "u1", "Ljava/lang/String;", "Lig3/k;");
        method("Lue3/k;", "p", "Ljava/lang/String;ZLkotlin/coroutines/Continuation;", "Ljava/lang/Object;");
        method("Lcom/linecorp/chathistory/menu/t$a$b;", "<init>", "Z", "V");
        method("Lcom/linecorp/chathistory/menu/e;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;");
        method("Ld60/z;", "<init>", "IIIZZLnt8/l;", "V");
        method("Lnt8/l;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;");
        nativeReadContracts();
        String header = "Ljp/naver/line/android/common/view/header/Header;";
        method(header, "<init>", "Landroid/content/Context;", "V");
        method(header, "getTitleTextView", "", "Landroid/widget/TextView;");
        method(header, "getUpButtonBackgroundLayout", "", "Landroid/widget/LinearLayout;");
        method(header, "setUpButtonImageResource", "I", "V");
        method(header, "setUpButtonVisibility$LINE_Android_migrant_common_libs", "Z", "V");
        String ext = "Lapp/linenotifications/extension/";
        method("Ldt8/d;", "<init>", "Lkotlin/coroutines/Continuation;", "V");
        ClassDef continuationBridge = classes.get(ext + "NotificationContinuation;");
        check(continuationBridge != null && "Ldt8/d;".equals(continuationBridge.getSuperclass()),
                "Continuation bridge is an instance of native optimized setter's required base");
        Method bridgeConstructor = null;
        Method declaredInvokeSuspend = null;
        for (Method declared : continuationBridge.getMethods()) {
            check(!declared.getName().equals("resumeWith"),
                    "Continuation bridge retains final native resumeWith dispatcher");
            if (declared.getName().equals("<init>") && parameters(declared).equals("Ljava/lang/Object;")
                    && declared.getReturnType().equals("V")) {
                bridgeConstructor = declared;
            }
            if (declared.getName().equals("invokeSuspend") && parameters(declared).equals("Ljava/lang/Object;")
                    && declared.getReturnType().equals("Ljava/lang/Object;")) {
                declaredInvokeSuspend = declared;
            }
        }
        check(bridgeConstructor != null && bridgeConstructor.getImplementation() != null,
                "Continuation bridge directly declares <init>(Object)V");
        check(bridgeConstructor.getImplementation().getRegisterCount() == 2,
                "Continuation bridge <init> keeps exact 2-register p0/p1 frame");
        List<Instruction> bridgeInit = new ArrayList<>();
        bridgeConstructor.getImplementation().getInstructions().forEach(bridgeInit::add);
        check(bridgeInit.size() == 3
                        && bridgeInit.get(0).getOpcode() == com.android.tools.smali.dexlib2.Opcode.CHECK_CAST
                        && ((OneRegisterInstruction) bridgeInit.get(0)).getRegisterA() == 1
                        && ((com.android.tools.smali.dexlib2.iface.reference.TypeReference) ((ReferenceInstruction) bridgeInit.get(0)).getReference())
                                .getType().equals("Lkotlin/coroutines/Continuation;"),
                "Continuation bridge casts parameter p1 directly to kotlin.coroutines.Continuation before super.<init>");
        MethodReference superInitRef = bridgeInit.size() >= 2 && bridgeInit.get(1) instanceof ReferenceInstruction
                && ((ReferenceInstruction) bridgeInit.get(1)).getReference() instanceof MethodReference
                ? (MethodReference) ((ReferenceInstruction) bridgeInit.get(1)).getReference() : null;
        check(bridgeInit.size() == 3
                        && bridgeInit.get(1).getOpcode() == com.android.tools.smali.dexlib2.Opcode.INVOKE_DIRECT
                        && bridgeInit.get(1) instanceof FiveRegisterInstruction
                        && ((FiveRegisterInstruction) bridgeInit.get(1)).getRegisterCount() == 2
                        && ((FiveRegisterInstruction) bridgeInit.get(1)).getRegisterC() == 0
                        && ((FiveRegisterInstruction) bridgeInit.get(1)).getRegisterD() == 1
                        && superInitRef != null
                        && superInitRef.getDefiningClass().equals("Ldt8/d;")
                        && superInitRef.getName().equals("<init>")
                        && superInitRef.getParameterTypes().size() == 1
                        && superInitRef.getParameterTypes().get(0).toString().equals("Lkotlin/coroutines/Continuation;")
                        && superInitRef.getReturnType().equals("V")
                        && bridgeInit.get(2).getOpcode() == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,
                "Continuation bridge delegates {p0, p1} directly to Ldt8/d;-><init>(Lkotlin/coroutines/Continuation;)V and returns void");
        check(declaredInvokeSuspend != null && AccessFlags.PUBLIC.isSet(declaredInvokeSuspend.getAccessFlags())
                        && declaredInvokeSuspend.getImplementation() != null
                        && declaredInvokeSuspend.getImplementation().getRegisterCount() == 2,
                "Continuation bridge directly declares public invokeSuspend(Object)Object");
        List<Instruction> invokeBody = new ArrayList<>();
        declaredInvokeSuspend.getImplementation().getInstructions().forEach(invokeBody::add);
        check(invokeBody.size() == 1
                        && invokeBody.get(0).getOpcode() == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT
                        && ((OneRegisterInstruction) invokeBody.get(0)).getRegisterA() == 1,
                "Continuation bridge invokeSuspend returns p1 directly");
        Map<String,Integer> calls = new HashMap<>();
        for (ClassDef type : classes.values()) for (Method m : type.getMethods()) {
            if (m.getImplementation() == null) continue;
            for (Instruction i : m.getImplementation().getInstructions()) {
                if (!(i instanceof ReferenceInstruction)) continue;
                Object ref = ((ReferenceInstruction)i).getReference();
                if (!(ref instanceof MethodReference)) continue;
                MethodReference target = (MethodReference) ref;
                if (!target.getDefiningClass().startsWith(ext)) continue;
                Method resolved = find(target.getDefiningClass(), target.getName(), parameters(target), target.getReturnType());
                java.lang.reflect.Method framework = resolved == null ? frameworkMethod(target.getDefiningClass(), target) : null;
                check(resolved != null || framework != null, "Extension call resolves: " + target);
                if (i instanceof VariableRegisterInstruction) {
                    boolean isStatic = resolved != null ? AccessFlags.STATIC.isSet(resolved.getAccessFlags())
                            : java.lang.reflect.Modifier.isStatic(framework.getModifiers());
                    int words = isStatic ? 0 : 1;
                    for (CharSequence p : target.getParameterTypes()) words += p.toString().equals("J") || p.toString().equals("D") ? 2 : 1;
                    check(((VariableRegisterInstruction)i).getRegisterCount() == words, "Invoke arity: " + target);
                }
                if (!type.getType().startsWith(ext)) calls.merge(target.getName(), 1, Integer::sum);
            }
        }
        for (String hook : Arrays.asList("init", "post", "suppressBuilder", "insertRow",
                "interceptNotificationAction", "onMessageStored")) {
            check(calls.getOrDefault(hook, 0) == 1, "Exactly one native hook for " + hook + ": " + calls.get(hook));
        }
        for (String hook : Arrays.asList("captureChatMenu", "addChatMenu", "interceptToggle", "interceptChatListToggle")) {
            check(calls.getOrDefault(hook, 0) == (hasSilent ? 1 : 0), "Optional quiet-mode hook selection: " + hook);
        }
        check(calls.getOrDefault("menuNotifiable", 0) == (hasSilent ? 2 : 0),
                "Optional quiet-mode presentation hooks (chat menu + chat list)");
        check(calls.getOrDefault("chatListLastMessage", 0) == (hasInfo ? 1 : 0),
                "Optional chat-list attachment label hook");
        check(calls.getOrDefault("allowMuted", 0) == (hasSilent ? 2 : 0), "Optional native per-room notification gates");
        check(calls.getOrDefault("interceptNotificationMute", 0) == 0, "No duplicate old service dispatch hook");
        Method saved = find("Luq8/z2;", "f", "Lts8/od;JLtq8/r;Ljava/lang/String;Lso8/m;ZZJ", "V");
        List<Instruction> storedHooks = callsTo(saved, ext + "Notifications;", "onMessageStored");
        check(storedHooks.size() == 1 && storedHooks.get(0) instanceof FiveRegisterInstruction,
                "Local persistence has one notification refresh hook");
        check(((FiveRegisterInstruction) storedHooks.get(0)).getRegisterC() == 9,
                "Persistence refresh uses the saved native chat ID");
        List<Instruction> savedBody = new ArrayList<>();
        saved.getImplementation().getInstructions().forEach(savedBody::add);
        int storedIndex = callPosition(savedBody, ext + "Notifications;", "onMessageStored");
        check(storedIndex == 35 && savedBody.get(storedIndex - 1).getOpcode() == com.android.tools.smali.dexlib2.Opcode.IF_EQZ
                        && ((OneRegisterInstruction) savedBody.get(storedIndex - 1)).getRegisterA() == 14,
                "Only a successful native save result triggers refresh");
        check(callsTo(saved, "Lrw8/h;", "a").size() == 1
                        && callPosition(savedBody, "Lrw8/h;", "a") == 30,
                "Refresh follows the original blocking save completion");
        check(callsTo(saved, "Lip8/c;", "d").size() == 1
                        && callPosition(savedBody, "Lip8/c;", "d") > storedIndex,
                "Original fetched-message notification dispatch is preserved after refresh");
        Method notificationAction = find("Ljp/naver/line/android/access/remote/LineAccessServiceForNotification;",
                "onStartCommand", "Landroid/content/Intent;II", "I");
        List<Instruction> actionHooks = callsTo(notificationAction, ext + "Settings;", "interceptNotificationAction");
        check(actionHooks.size() == 1 && actionHooks.get(0) instanceof RegisterRangeInstruction,
                "Only one shared service action dispatch hook");
        RegisterRangeInstruction actionHook = (RegisterRangeInstruction) actionHooks.get(0);
        check(actionHook.getStartRegister() == 27 && actionHook.getRegisterCount() == 2,
                "Notification action receives original service and intent");
        if (hasSilent) {
        Method registrant = find("Lgw3/i;", "c", "Landroid/content/Context;Lfw3/d;", "V");
        check(callsTo(registrant, ext + "Notifications;", "allowMuted").size() == 1,
                "Message registrant retains its scoped mute hook");
        Method fetched = find("Lip8/c;", "d", "Ltq8/r;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"
                + "Lts8/od;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpn8/b;ZZLjava/lang/String;Ljava/lang/String;", "V");
        List<Instruction> fetchedHooks = callsTo(fetched, ext + "Notifications;", "allowMuted");
        List<Instruction> nativeThreadChecks = callsTo(fetched, "Lwk8/l0;", "x");
        check(fetchedHooks.size() == 1 && fetchedHooks.get(0) instanceof FiveRegisterInstruction,
                "Fetched-message path contains one scoped extension gate");
        FiveRegisterInstruction fetchedHook = (FiveRegisterInstruction) fetchedHooks.get(0);
        check(fetchedHook.getRegisterC() == 6 && fetchedHook.getRegisterD() == 8,
                "Fetched-message hook receives the native manager and original chat ID");
        check(nativeThreadChecks.size() == 1 && nativeThreadChecks.get(0) instanceof FiveRegisterInstruction,
                "OpenChat thread-parent notification gate remains native");
        FiveRegisterInstruction threadCheck = (FiveRegisterInstruction) nativeThreadChecks.get(0);
        check(threadCheck.getRegisterC() == 6 && threadCheck.getRegisterD() == 2,
                "OpenChat thread-parent gate still receives the resolved parent ID");
        check(hasField(fetched, "Ltq8/r;", "PREVENT_NOTIFICATION"), "Prevent-notification state gate retained");
        check(hasField(fetched, "Ljp/naver/line/android/db/generalkv/dao/a;", "NOTI_ENABLE"),
                "Global notification setting gate retained");
        check(hasField(fetched, "Ljp/naver/line/android/db/generalkv/dao/a;", "NOTI_MUTE_EXPIRED_TIME"),
                "Global temporary mute gate retained");
        Method toggle = find("Lz50/y0;", "invoke", "", "Ljava/lang/Object;");
        List<Instruction> toggleHooks = callsTo(toggle, ext + "Settings;", "interceptToggle");
        check(toggleHooks.size() == 1 && toggleHooks.get(0) instanceof FiveRegisterInstruction,
                "Only the native chat-menu toggle is intercepted");
        FiveRegisterInstruction toggleHook = (FiveRegisterInstruction) toggleHooks.get(0);
        check(toggleHook.getRegisterC() == 3 && toggleHook.getRegisterD() == 1,
                "Toggle hook receives the current fragment and native result callback");
        check(callsTo(toggle, "Lcom/linecorp/chathistory/menu/u;", "<init>").size() == 1,
                "Native ordinary-chat toggle remains available when interception is disabled");
        check(callsTo(toggle, "Lcom/linecorp/chathistory/menu/v;", "<init>").size() == 1,
                "Native OpenChat toggle remains available");
        Method menuData = find("Lz50/t2;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"
                + "Ljp/naver/line/android/model/ChatData$a;Lz50/i4;ZZLz50/r3;ILjava/lang/String;ZZ"
                + "Ljava/lang/Boolean;Landroid/net/Uri;Landroid/net/Uri;Lc60/b;Lc60/a;", "V");
        List<Instruction> menuStateHooks = callsTo(menuData, ext + "Settings;", "menuNotifiable");
        check(menuStateHooks.size() == 1 && menuStateHooks.get(0) instanceof FiveRegisterInstruction,
                "Local quiet state is applied only to menu presentation data");
        FiveRegisterInstruction menuStateHook = (FiveRegisterInstruction) menuStateHooks.get(0);
        check(menuStateHook.getRegisterC() == 1 && menuStateHook.getRegisterD() == 13,
                "Menu-state hook receives the chat ID and native notifiable flag");
        field("Lcom/linecorp/rxeventbus/d;", "a", "Lcom/linecorp/rxeventbus/d$a;");
        method("Lcom/linecorp/rxeventbus/d;", "b", "Ljava/lang/Object;", "V");
        field("Lxe8/b;", "CHAT_LIST", "Lxe8/b;");
        Method chatListItem = find("Lf22/i;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;ZZZZLjp/naver/line/android/model/ChatData$c;"
                + "Ljava/lang/String;Lyk8/z;Ljava/lang/Long;IZZZZZ", "V");
        List<Instruction> chatListStateHooks = callsTo(chatListItem, ext + "Settings;", "menuNotifiable");
        check(chatListStateHooks.size() == 1 && chatListStateHooks.get(0) instanceof FiveRegisterInstruction,
                "Local quiet state is applied to chat-list UI model");
        FiveRegisterInstruction chatListStateHook = (FiveRegisterInstruction) chatListStateHooks.get(0);
        check(chatListStateHook.getRegisterC() == 1 && chatListStateHook.getRegisterD() == 6,
                "Chat-list state hook receives the chat ID and native notifiable flag");
        Method chatListToggle = find("Ld42/d;", "u3", "Lf22/l;", "V");
        List<Instruction> chatListToggleHooks = callsTo(chatListToggle, ext + "Settings;", "interceptChatListToggle");
        check(chatListToggleHooks.size() == 1 && chatListToggleHooks.get(0) instanceof FiveRegisterInstruction,
                "Chat-list long-press ordinary-chat mute toggle is intercepted");
        FiveRegisterInstruction chatListToggleHook = (FiveRegisterInstruction) chatListToggleHooks.get(0);
        check(chatListToggleHook.getRegisterC() == 0,
                "Chat-list toggle hook receives the ordinary chat ID");
        check(callsTo(chatListToggle, "Ld42/l;", "<init>").size() == 1,
                "Native ordinary chat-list toggle remains available when interception is disabled");
        check(callsTo(chatListToggle, "Ld42/n;", "<init>").size() == 1,
                "Native OpenChat chat-list toggle remains available");
        check(callsTo(chatListToggle, "Ld42/m;", "<init>").size() == 1,
                "Native ServiceChat chat-list toggle remains available");
        }
        if (hasInfo) {
        Method chatListItem = find("Lf22/i;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;ZZZZLjp/naver/line/android/model/ChatData$c;"
                + "Ljava/lang/String;Lyk8/z;Ljava/lang/Long;IZZZZZ", "V");
        List<Instruction> chatListLastMsgHooks = callsTo(chatListItem, ext + "Settings;", "chatListLastMessage");
        check(chatListLastMsgHooks.size() == 1 && chatListLastMsgHooks.get(0) instanceof FiveRegisterInstruction,
                "Chat-list attachment preview uses verified UI model constructor");
        FiveRegisterInstruction chatListLastMsgHook = (FiveRegisterInstruction) chatListLastMsgHooks.get(0);
        check(chatListLastMsgHook.getRegisterC() == 1 && chatListLastMsgHook.getRegisterD() == 8
                        && chatListLastMsgHook.getRegisterE() == 10 && chatListLastMsgHook.getRegisterF() == 15,
                "Chat-list attachment hook receives chatId, lastMessageRaw, lastTime, and hasDraft");
        field("Ljp/naver/line/android/common/LineCommonFileProvider;", "g",
                "Ljp/naver/line/android/common/LineCommonFileProvider$a;");
        method("Ljp/naver/line/android/common/LineCommonFileProvider$a;", "d",
                "Landroid/content/Context;Ljava/io/File;", "Landroid/net/Uri;");
        field("Lj31/a;", "I4", "Lj31/a$b;");
        method("Lj31/a;", "e", "Lj31/c;", "Ljava/io/File;");
        method("Lj31/a;", "k", "Lj31/c;Lj31/e;", "Ljava/io/File;");
        method("Lj31/c;", "<init>", "Ljava/lang/String;J", "V");
        field("Lj31/e;", "IMAGE_STANDARD", "Lj31/e;");
        field("Lj31/e;", "IMAGE_ORIGINAL", "Lj31/e;");
        method("Le80/d;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Llg1/a$c;Ljava/lang/String;Z", "V");
        field("Lsu5/d;", "sa", "Lsu5/d$a;");
        method("Lsu5/d;", "n", "JJ", "Ljava/io/File;");
        method("Lsu5/d;", "k", "JJ", "Ljava/io/File;");
        method("Lsu5/d;", "m", "JJ", "Ljava/io/File;");
        field("Lsu5/o;", "va", "Lsu5/o$a;");
        method("Lsu5/o;", "h", "Lzu5/d;", "Ljava/lang/String;");
        method("Lzu5/d;", "<init>", "JJJLzu5/e;Ljava/lang/String;", "V");
        field("Lkn/l;", "d", "Lkn/l$e;");
        method("Llg1/a$c;", "<init>", "Ljava/lang/String;Ljava/lang/String;Ljava/util/List;", "V");
        }
        ClassDef click = classes.get(ext + "SettingsClick;");
        check(click != null && click.getInterfaces().size() == 3, "Settings callback has native function interfaces + Serializable");
        for (String flag : Arrays.asList("rowIncluded", "silentIncluded", "infoIncluded", "noReplyIncluded", "readIncluded")) {
            Method m = find(ext + "Settings;", flag, "", "Z");
            Instruction first = m.getImplementation().getInstructions().iterator().next();
            int expected = flag.equals("rowIncluded") ? 1
                    : flag.equals("silentIncluded") ? (hasSilent ? 1 : 0)
                    : flag.equals("infoIncluded") ? (hasInfo ? 1 : 0)
                    : flag.equals("noReplyIncluded") ? (hasNoReply ? 1 : 0)
                    : (hasRead ? 1 : 0);
            check(first instanceof NarrowLiteralInstruction && ((NarrowLiteralInstruction)first).getNarrowLiteral() == expected,
                    "Included flag matches selection: " + flag);
        }
        System.out.println("APK static contracts (" + (all ? "all features" : mode) + "): " + assertions + " assertions passed (Android execution not tested)");
    }
    private static void nativeReadContracts() {
        field("Ln30/d;", "a", "Ln30/d$a;");
        field("Lue3/y0;", "a", "Lqg3/e;");
        field("Lfw3/h;", "c", "Lfw3/h$a;");
        method("Ln30/d;", "b", "", "Lue3/y0;");
        method("Lqg3/e;", "e", "Ljava/lang/String;", "Li78/w;");
        method("La78/a;", "a", "La78/b;", "V");
        method("La78/b;", "b", "", "V");
        method("La78/b;", "c", "Lb78/b;", "V");
        method("La78/b;", "onError", "Ljava/lang/Throwable;", "V");
        method("Lb78/b;", "dispose", "", "V");
        method("Lfw3/l$a;", "<init>", "Ljava/lang/String;", "V");
        method("Lfw3/l$c;", "<init>", "Ljava/lang/String;", "V");
        method("Lfw3/h;", "c", "[Lfw3/l;", "V");
        check("La78/a;".equals(classes.get("Li78/w;").getSuperclass()), "Native whole-chat operation is a Completable");
        check(AccessFlags.INTERFACE.isSet(classes.get("La78/b;").getAccessFlags()), "Native observer supports a proxy");
        Method menu = find("Ld42/i;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;");
        check(callsTo(menu, "Lqg3/e;", "e").size() == 1, "Same native whole-chat update used by chat-list menu");
        check(callsTo(menu, "Lfw3/h;", "c").size() == 1, "Same native scoped notification cleanup used by menu");
        check(callsTo(menu, "Lfw3/l$a;", "<init>").size() == 1
                && callsTo(menu, "Lfw3/l$c;", "<init>").size() == 1, "Native cleanup uses chat and group selectors");
        boolean cachedMenuProvider = false;
        for (Method m : classes.get("Ld42/d;").getMethods()) {
            if (m.getName().equals("<init>") && callsTo(m, "Ln30/d;", "b").size() == 1 && hasField(m, "Lue3/y0;", "a"))
                cachedMenuProvider = true;
        }
        check(cachedMenuProvider, "Menu obtains cached read updater from the same native provider");
        Method worker = find("Lqg3/c;", "run", "", "V");
        check(callsTo(worker, "Lqg3/e;", "a").size() == 1 && callsTo(worker, "Lqg3/e;", "d").size() == 1,
                "Native worker resolves latest message when executed");
        List<Instruction> workerBody = new ArrayList<>();
        worker.getImplementation().getInstructions().forEach(workerBody::add);
        int update = callPosition(workerBody, "Lqg3/e;", "d");
        check(update == 9 && workerBody.get(update - 1) instanceof NarrowLiteralInstruction
                && ((NarrowLiteralInstruction)workerBody.get(update - 1)).getNarrowLiteral() == 1,
                "Native worker retains whole-chat unread clearing flag");
        Method mute = find("Lip8/p;", "b", "Landroid/content/Context;Ljava/lang/String;", "Landroidx/core/app/h$a;");
        Method reply = find("Lip8/p;", "c", "Landroid/content/Context;Ljava/lang/String;", "Landroidx/core/app/h$a;");
        check(hasString(mute, "jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION"),
                "Native mute action identity remains available for restoration");
        check(hasString(reply, "jp.naver.line.android.access.remote.action.SEND_MESSAGE_ACTION"),
                "Native direct reply action identity is untouched");
        check(hasLiteral(mute, 0x7f152825) && hasLiteral(reply, 0x7f152826),
                "Native action builders retain verified localized mute/reply labels");
        check(callsTo(mute, "Landroid/app/PendingIntent;", "getService").size() == 1
                && callsTo(reply, "Landroid/app/PendingIntent;", "getService").size() == 1,
                "Both original service PendingIntents remain intact");
        check(callsTo(mute, "Landroidx/core/app/h$a$a;", "a").isEmpty(), "Mute action has no RemoteInput");
        check(callsTo(reply, "Landroidx/core/app/h$a$a;", "a").size() == 1
                && callsTo(reply, "Landroidx/core/app/u$a;", "a").size() == 1,
                "Manual reply keeps native RemoteInput construction and attachment");
    }
    private static boolean hasString(Method method, String value) {
        for (Instruction i : method.getImplementation().getInstructions()) {
            Object ref = i instanceof ReferenceInstruction ? ((ReferenceInstruction)i).getReference() : null;
            if (ref instanceof StringReference && value.equals(((StringReference)ref).getString())) return true;
        }
        return false;
    }
    private static boolean hasLiteral(Method method, int value) {
        for (Instruction i : method.getImplementation().getInstructions())
            if (i instanceof NarrowLiteralInstruction && ((NarrowLiteralInstruction)i).getNarrowLiteral() == value) return true;
        return false;
    }
    private static int callPosition(List<Instruction> instructions, String owner, String name) {
        for (int i = 0; i < instructions.size(); i++) {
            if (!(instructions.get(i) instanceof ReferenceInstruction)) continue;
            Object reference = ((ReferenceInstruction) instructions.get(i)).getReference();
            if (!(reference instanceof MethodReference)) continue;
            MethodReference call = (MethodReference) reference;
            if (owner.equals(call.getDefiningClass()) && name.equals(call.getName())) return i;
        }
        return -1;
    }
    private static void field(String owner, String name, String type) {
        ClassDef c = classes.get(owner);
        if (c != null) for (Field f : c.getFields()) if (f.getName().equals(name) && f.getType().equals(type)) {
            check(AccessFlags.PUBLIC.isSet(f.getAccessFlags()), "Public field: " + owner + name); return;
        }
        throw new AssertionError("Missing field: " + owner + name + ":" + type);
    }
    private static void method(String owner, String name, String params, String result) {
        Method m = find(owner, name, params, result);
        check(m != null && AccessFlags.PUBLIC.isSet(m.getAccessFlags()), "Public method: " + owner + name + "(" + params + ")" + result);
    }
    private static Method find(String owner, String name, String params, String result) {
        ClassDef c = classes.get(owner);
        if (c == null) return null;
        for (Method m : c.getMethods()) if (m.getName().equals(name) && parameters(m).equals(params) && m.getReturnType().equals(result)) return m;
        for (String itf : c.getInterfaces()) { Method m = find(itf, name, params, result); if (m != null) return m; }
        return c.getSuperclass() == null ? null : find(c.getSuperclass(), name, params, result);
    }
    private static String parameters(MethodReference m) {
        StringBuilder s = new StringBuilder(); for (CharSequence p : m.getParameterTypes()) s.append(p); return s.toString();
    }
    private static List<Instruction> callsTo(Method method, String owner, String name) {
        if (method == null || method.getImplementation() == null) throw new AssertionError("Missing hook container");
        List<Instruction> result = new ArrayList<>();
        for (Instruction i : method.getImplementation().getInstructions()) {
            if (!(i instanceof ReferenceInstruction)) continue;
            Object ref = ((ReferenceInstruction)i).getReference();
            if (ref instanceof MethodReference) {
                MethodReference m = (MethodReference) ref;
                if (m.getDefiningClass().equals(owner) && m.getName().equals(name)) result.add(i);
            }
        }
        return result;
    }
    private static boolean hasField(Method method, String owner, String name) {
        for (Instruction i : method.getImplementation().getInstructions()) {
            if (!(i instanceof ReferenceInstruction)) continue;
            Object ref = ((ReferenceInstruction)i).getReference();
            if (ref instanceof FieldReference) {
                FieldReference f = (FieldReference) ref;
                if (f.getDefiningClass().equals(owner) && f.getName().equals(name)) return true;
            }
        }
        return false;
    }
    private static java.lang.reflect.Method frameworkMethod(String owner, MethodReference target) throws Exception {
        if (owner == null) return null;
        ClassDef c = classes.get(owner);
        if (c != null) return frameworkMethod(c.getSuperclass(), target);
        if (!owner.startsWith("Landroid/")) return null;
        Class<?> type = Class.forName(owner.substring(1, owner.length() - 1).replace('/', '.'), false, ApkContractTest.class.getClassLoader());
        for (java.lang.reflect.Method m : type.getMethods()) {
            if (!m.getName().equals(target.getName())) continue;
            StringBuilder params = new StringBuilder();
            for (Class<?> p : m.getParameterTypes()) params.append(descriptor(p));
            if (params.toString().equals(parameters(target)) && descriptor(m.getReturnType()).equals(target.getReturnType())) return m;
        }
        return null;
    }
    private static String descriptor(Class<?> c) {
        if (c.isArray()) return c.getName().replace('.', '/');
        if (!c.isPrimitive()) return "L" + c.getName().replace('.', '/') + ";";
        if (c == void.class) return "V";
        if (c == boolean.class) return "Z";
        if (c == int.class) return "I";
        if (c == long.class) return "J";
        if (c == float.class) return "F";
        if (c == double.class) return "D";
        if (c == char.class) return "C";
        if (c == short.class) return "S";
        return "B";
    }
    private static void check(boolean value, String message) { assertions++; if (!value) throw new AssertionError(message); }
}
