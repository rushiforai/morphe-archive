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
        field("Ldw3/b;", "M1", "Ldw3/b$a;");
        field("Lgw3/a;", "b", "Ljava/lang/String;");
        field("Lln3/k;", "b", "Ljava/lang/String;");
        field("Lln3/k;", "m", "Ljava/lang/String;");
        field("Lln3/k;", "n", "Lln3/k$d;");
        field("Lln3/k$d;", "b", "I");
        field("Lyi8/e;", "p", "Landroid/os/Bundle;");
        field("Lcom/linecorp/chathistory/menu/ChatHistoryMenuFragment;", "e", "Li60/a4;");
        field("Li60/a4;", "a", "Ljava/lang/String;");
        field("Li60/a4;", "l", "Z");
        field("Lqm8/i;", "a", "Lqm8/i;");
        field("Lln3/u$c;", "a", "Lln3/u$c;");
        field("Llm8/i0;", "a", "Llm8/i0;");
        method("Lbd0/f;", "a", "Landroid/content/Context;Lbd0/a;", "Ljava/lang/Object;");
        method("Ldw3/b;", "getProfile", "", "Lgw3/a;");
        method("Lch8/i;", "c", "", "Z");
        field("Lch8/c$a;", "c", "Lch8/c$a;");
        check("Lbd0/a;".equals(classes.get("Lch8/c$a;").getSuperclass()),
                "ChatNotificationDao DI key extends bd0.a");
        method("Lch8/c;", "a", "Ljava/lang/String;", "Leh8/e;");
        field("Leh8/e;", "b", "Z");
        method("Lke8/o1;", "a", "Landroid/content/Context;Z", "Lke8/z;");
        method("Lke8/z;", "t", "", "Lyl3/e;");
        method("Lke8/z;", "z", "Ljava/lang/String;", "Z");
        method("Lyl3/e;", "y1", "Ljava/lang/String;", "Lln3/k;");
        method("Lyl3/e;", "t", "Ljava/lang/String;ZLkotlin/coroutines/Continuation;", "Ljava/lang/Object;");
        method("Lcom/linecorp/chathistory/menu/t$a$b;", "<init>", "Z", "V");
        method("Lcom/linecorp/chathistory/menu/e;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;");
        method("Lm60/y;", "<init>", "IIIZZLcn8/l;", "V");
        method("Lcn8/l;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;");
        field("Lco/l;", "b", "Lco/l$c;");
        method("Lcom/bumptech/glide/c;", "c", "Landroid/content/Context;", "Lqo/l;");
        method("Lqo/l;", "f", "Landroid/content/Context;", "Lcom/bumptech/glide/o;");
        method("Lcom/bumptech/glide/o;", "j", "", "Lcom/bumptech/glide/n;");
        method("Lcom/bumptech/glide/o;", "n", "Luo/i;", "V");
        method("Lcom/bumptech/glide/n;", "W", "Ljava/lang/Object;", "Lcom/bumptech/glide/n;");
        method("Lcom/bumptech/glide/n;", "X", "II", "Lto/c;");
        method("Lto/a;", "g", "Lco/l;", "Lto/a;");
        method("Lto/a;", "d", "", "Lto/a;");
        method("Lto/a;", "r", "Z", "Lto/a;");
        method("Lto/a;", "t", "II", "Lto/a;");
        method("Lx55/e;", "<init>", "Ljava/lang/String;Ljava/lang/String;Z", "V");
        nativeReadContracts();
        String header = "Ljp/naver/line/android/common/view/header/Header;";
        method(header, "<init>", "Landroid/content/Context;", "V");
        method(header, "getTitleTextView", "", "Landroid/widget/TextView;");
        method(header, "getUpButtonBackgroundLayout", "", "Landroid/widget/LinearLayout;");
        method(header, "setUpButtonImageResource", "I", "V");
        method(header, "setUpButtonVisibility$common_libs", "Z", "V");
        String ext = "Lapp/linenotifications/extension/";
        method("Lsm8/c;", "<init>", "Lkotlin/coroutines/Continuation;", "V");
        ClassDef continuationBridge = classes.get(ext + "NotificationContinuation;");
        check(continuationBridge != null && "Lsm8/c;".equals(continuationBridge.getSuperclass()),
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
                        && superInitRef.getDefiningClass().equals("Lsm8/c;")
                        && superInitRef.getName().equals("<init>")
                        && superInitRef.getParameterTypes().size() == 1
                        && superInitRef.getParameterTypes().get(0).toString().equals("Lkotlin/coroutines/Continuation;")
                        && superInitRef.getReturnType().equals("V")
                        && bridgeInit.get(2).getOpcode() == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,
                "Continuation bridge delegates {p0, p1} directly to Lsm8/c;-><init>(Lkotlin/coroutines/Continuation;)V and returns void");
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
        Method rowsHelper = find("Lun5/s1;", "lineNotificationRows", "Ljava/util/List;", "Ljava/util/List;");
        check(rowsHelper != null && rowsHelper.getImplementation() != null
                        && rowsHelper.getImplementation().getRegisterCount() == 19,
                "lineNotificationRows helper keeps exact 19-register frame");
        List<Instruction> rowsBody = new ArrayList<>();
        rowsHelper.getImplementation().getInstructions().forEach(rowsBody::add);
        int ctorPos = callPosition(rowsBody, "Lti5/a0;", "<init>");
        check(ctorPos >= 2 && rowsBody.get(ctorPos) instanceof RegisterRangeInstruction,
                "lineNotificationRows invokes Lti5/a0;-><init> via invoke-direct/range");
        RegisterRangeInstruction ctorCall = (RegisterRangeInstruction) rowsBody.get(ctorPos);
        check(ctorCall.getStartRegister() == 4 && ctorCall.getRegisterCount() == 14,
                "Lti5/a0;-><init> consumes exact range {v4..v17}");
        boolean loadedV1 = false;
        boolean copiedV16 = false;
        for (int idx = 0; idx < ctorPos; idx++) {
            Instruction insn = rowsBody.get(idx);
            if (insn.getOpcode() == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT
                    && insn instanceof TwoRegisterInstruction
                    && ((TwoRegisterInstruction) insn).getRegisterA() == 1
                    && ((TwoRegisterInstruction) insn).getRegisterB() == 3) {
                FieldReference f = (FieldReference) ((ReferenceInstruction) insn).getReference();
                if ("Lti5/g0;".equals(f.getDefiningClass()) && "j".equals(f.getName()) && "Lcn8/p;".equals(f.getType())) {
                    loadedV1 = true;
                }
            }
            if (loadedV1 && insn.getOpcode() == com.android.tools.smali.dexlib2.Opcode.MOVE_OBJECT_FROM16
                    && insn instanceof TwoRegisterInstruction
                    && ((TwoRegisterInstruction) insn).getRegisterA() == 16
                    && ((TwoRegisterInstruction) insn).getRegisterB() == 1) {
                copiedV16 = true;
                break;
            }
        }
        check(loadedV1 && copiedV16,
                "lineNotificationRows loads Lti5/g0;->j:Lcn8/p; into v1 and copies via move-object/from16 to v16");
        int profileSgetPos = -1;
        for (int idx = ctorPos + 1; idx < rowsBody.size(); idx++) {
            Instruction insn = rowsBody.get(idx);
            if (insn.getOpcode() == com.android.tools.smali.dexlib2.Opcode.SGET_OBJECT
                    && ((ReferenceInstruction) insn).getReference() instanceof FieldReference) {
                FieldReference f = (FieldReference) ((ReferenceInstruction) insn).getReference();
                if ("Lun5/a;".equals(f.getDefiningClass()) && "Profile".equals(f.getName())) {
                    profileSgetPos = idx;
                    break;
                }
            }
        }
        boolean resetV1BeforeProfile = false;
        if (profileSgetPos > ctorPos) {
            for (int idx = profileSgetPos + 1; idx < rowsBody.size(); idx++) {
                Instruction insn = rowsBody.get(idx);
                if (insn.getOpcode() == com.android.tools.smali.dexlib2.Opcode.CONST_4
                        && insn instanceof NarrowLiteralInstruction
                        && ((OneRegisterInstruction) insn).getRegisterA() == 1
                        && ((NarrowLiteralInstruction) insn).getNarrowLiteral() == 0) {
                    resetV1BeforeProfile = true;
                    break;
                }
                if (insn.getOpcode() == com.android.tools.smali.dexlib2.Opcode.IF_GE) {
                    break;
                }
            }
        }
        check(resetV1BeforeProfile,
                "lineNotificationRows resets scratch v1 to 0 before the :profile loop");
        Method suppressTarget = find("Lh34/f;", "b", "Ljava/lang/String;IILyi8/e;Z", "V");
        check(suppressTarget != null && suppressTarget.getImplementation() != null
                        && suppressTarget.getImplementation().getRegisterCount() == 9,
                "suppressBuilder target retains 9-register frame");
        List<Instruction> suppressHooks = callsTo(suppressTarget, ext + "Notifications;", "suppressBuilder");
        check(suppressHooks.size() == 1, "suppressBuilder target contains one suppression hook");
        Instruction suppressInsn = suppressHooks.get(0);
        boolean passesV7 = (suppressInsn instanceof RegisterRangeInstruction
                && ((RegisterRangeInstruction) suppressInsn).getStartRegister() == 7
                && ((RegisterRangeInstruction) suppressInsn).getRegisterCount() == 1)
                || (suppressInsn instanceof FiveRegisterInstruction
                && ((FiveRegisterInstruction) suppressInsn).getRegisterCount() == 1
                && ((FiveRegisterInstruction) suppressInsn).getRegisterC() == 7);
        check(passesV7, "suppressBuilder hook passes register v7 (p4)");
        Method saved = find("Lkk8/c3;", "f", "Ljm8/nd;JLjk8/r;Ljava/lang/String;Lhi8/o;ZZJ", "V");
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
        check(callsTo(saved, "Liq8/g;", "a").size() == 1
                        && callPosition(savedBody, "Liq8/g;", "a") == 30,
                "Refresh follows the original blocking save completion");
        check(callsTo(saved, "Lyi8/a;", "d").size() == 1
                        && callPosition(savedBody, "Lyi8/a;", "d") > storedIndex,
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
        Method registrant = find("Lk34/i;", "b", "Landroid/content/Context;Lj34/d;", "V");
        check(callsTo(registrant, ext + "Notifications;", "allowMuted").size() == 1,
                "Message registrant retains its scoped mute hook");
        Method fetched = find("Lyi8/a;", "d", "Ljk8/r;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"
                + "Ljm8/nd;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Leh8/b;ZZLjava/lang/String;Ljava/lang/String;", "V");
        List<Instruction> fetchedHooks = callsTo(fetched, ext + "Notifications;", "allowMuted");
        List<Instruction> nativeThreadChecks = callsTo(fetched, "Lke8/z;", "z");
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
        check(hasField(fetched, "Ljk8/r;", "PREVENT_NOTIFICATION"), "Prevent-notification state gate retained");
        check(hasField(fetched, "Ljp/naver/line/android/db/generalkv/dao/a;", "NOTI_ENABLE"),
                "Global notification setting gate retained");
        check(hasField(fetched, "Ljp/naver/line/android/db/generalkv/dao/a;", "NOTI_MUTE_EXPIRED_TIME"),
                "Global temporary mute gate retained");
        Method toggle = find("Li60/w1;", "invoke", "", "Ljava/lang/Object;");
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
        Method menuData = find("Li60/a4;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"
                + "Ljp/naver/line/android/model/ChatData$a;Li60/q5;ZLi60/x4;ILjava/lang/String;ZZ"
                + "Ljava/lang/Boolean;Landroid/net/Uri;Landroid/net/Uri;Ll60/b;Ll60/a;", "V");
        List<Instruction> menuStateHooks = callsTo(menuData, ext + "Settings;", "menuNotifiable");
        check(menuStateHooks.size() == 1 && menuStateHooks.get(0) instanceof FiveRegisterInstruction,
                "Local quiet state is applied only to menu presentation data");
        FiveRegisterInstruction menuStateHook = (FiveRegisterInstruction) menuStateHooks.get(0);
        check(menuStateHook.getRegisterC() == 1 && menuStateHook.getRegisterD() == 12,
                "Menu-state hook receives the chat ID and native notifiable flag");
        List<Instruction> menuBody = new ArrayList<>();
        menuData.getImplementation().getInstructions().forEach(menuBody::add);
        int menuHookPos = callPosition(menuBody, ext + "Settings;", "menuNotifiable");
        check(menuHookPos >= 0 && menuHookPos + 2 < menuBody.size(),
                "menuNotifiable hook is followed by move-result and iput-boolean");
        Instruction menuMove = menuBody.get(menuHookPos + 1);
        Instruction menuPut = menuBody.get(menuHookPos + 2);
        FieldReference menuField = menuPut instanceof ReferenceInstruction
                && ((ReferenceInstruction) menuPut).getReference() instanceof FieldReference
                ? (FieldReference) ((ReferenceInstruction) menuPut).getReference() : null;
        check(menuMove.getOpcode() == com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT
                        && menuMove instanceof OneRegisterInstruction
                        && ((OneRegisterInstruction) menuMove).getRegisterA() == 12
                        && menuPut.getOpcode() == com.android.tools.smali.dexlib2.Opcode.IPUT_BOOLEAN
                        && menuPut instanceof TwoRegisterInstruction
                        && ((TwoRegisterInstruction) menuPut).getRegisterA() == 12
                        && ((TwoRegisterInstruction) menuPut).getRegisterB() == 0
                        && menuField != null
                        && "Li60/a4;".equals(menuField.getDefiningClass())
                        && "l".equals(menuField.getName())
                        && "Z".equals(menuField.getType()),
                "menuNotifiable(v1, v12) stores move-result v12 into Li60/a4;->l:Z");
        field("Lcom/linecorp/rxeventbus/d;", "a", "Lcom/linecorp/rxeventbus/d$a;");
        method("Lcom/linecorp/rxeventbus/d;", "b", "Ljava/lang/Object;", "V");
        field("Ln88/b;", "CHAT_LIST", "Ln88/b;");
        Method chatListItem = find("Lu52/i;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;ZZZZLjp/naver/line/android/model/ChatData$c;"
                + "Ljava/lang/String;Lne8/z;Ljava/lang/Long;IZZZZZ", "V");
        List<Instruction> chatListStateHooks = callsTo(chatListItem, ext + "Settings;", "menuNotifiable");
        check(chatListStateHooks.size() == 1 && chatListStateHooks.get(0) instanceof FiveRegisterInstruction,
                "Local quiet state is applied to chat-list UI model");
        FiveRegisterInstruction chatListStateHook = (FiveRegisterInstruction) chatListStateHooks.get(0);
        check(chatListStateHook.getRegisterC() == 1 && chatListStateHook.getRegisterD() == 6,
                "Chat-list state hook receives the chat ID and native notifiable flag");
        Method chatListToggle = find("Lt72/c;", "E5", "Lu52/l;", "V");
        List<Instruction> chatListToggleHooks = callsTo(chatListToggle, ext + "Settings;", "interceptChatListToggle");
        check(chatListToggleHooks.size() == 1 && chatListToggleHooks.get(0) instanceof FiveRegisterInstruction,
                "Chat-list long-press ordinary-chat mute toggle is intercepted");
        FiveRegisterInstruction chatListToggleHook = (FiveRegisterInstruction) chatListToggleHooks.get(0);
        check(chatListToggleHook.getRegisterC() == 0,
                "Chat-list toggle hook receives the ordinary chat ID");
        check(callsTo(chatListToggle, "Lt72/k;", "<init>").size() == 1,
                "Native ordinary chat-list toggle remains available when interception is disabled");
        check(callsTo(chatListToggle, "Lt72/m;", "<init>").size() == 1,
                "Native OpenChat chat-list toggle remains available");
        check(callsTo(chatListToggle, "Lt72/l;", "<init>").size() == 1,
                "Native ServiceChat chat-list toggle remains available");
        }
        if (hasInfo) {
        Method chatListItem = find("Lu52/i;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;ZZZZLjp/naver/line/android/model/ChatData$c;"
                + "Ljava/lang/String;Lne8/z;Ljava/lang/Long;IZZZZZ", "V");
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
        field("Lq41/a;", "C8", "Lq41/a$b;");
        method("Lq41/a;", "a", "Lq41/c;", "Ljava/io/File;");
        method("Lq41/a;", "j", "Lq41/c;Lq41/e;", "Ljava/io/File;");
        method("Lq41/c;", "<init>", "Ljava/lang/String;J", "V");
        field("Lq41/e;", "IMAGE_STANDARD", "Lq41/e;");
        field("Lq41/e;", "IMAGE_ORIGINAL", "Lq41/e;");
        method("Lp80/e;", "<init>",
                "Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Lfi1/a$c;Ljava/lang/String;Z", "V");
        field("Lf16/d;", "W2", "Lf16/d$a;");
        method("Lf16/d;", "p", "JJ", "Ljava/io/File;");
        method("Lf16/d;", "k", "JJ", "Ljava/io/File;");
        method("Lf16/d;", "o", "JJ", "Ljava/io/File;");
        field("Lf16/p;", "Z2", "Lf16/p$a;");
        method("Lf16/p;", "o", "Ln16/e;", "Ljava/lang/String;");
        method("Ln16/e;", "<init>", "JJJLn16/f;Ljava/lang/String;", "V");
        field("Lco/l;", "d", "Lco/l$e;");
        method("Lfi1/a$c;", "<init>", "Ljava/lang/String;Ljava/lang/String;Ljava/util/List;", "V");
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
        field("Lx30/d;", "a", "Lx30/d$a;");
        field("Lyl3/s0;", "a", "Ltn3/e;");
        field("Lj34/h;", "c", "Lj34/h$a;");
        method("Lx30/d;", "b", "", "Lyl3/s0;");
        method("Ltn3/e;", "e", "Ljava/lang/String;", "Ly08/w;");
        method("Lq08/a;", "a", "Lq08/b;", "V");
        method("Lq08/b;", "onComplete", "", "V");
        method("Lq08/b;", "b", "Lr08/b;", "V");
        method("Lq08/b;", "onError", "Ljava/lang/Throwable;", "V");
        method("Lr08/b;", "dispose", "", "V");
        method("Lj34/l$a;", "<init>", "Ljava/lang/String;", "V");
        method("Lj34/l$c;", "<init>", "Ljava/lang/String;", "V");
        method("Lj34/h;", "c", "[Lj34/l;", "V");
        check("Lq08/a;".equals(classes.get("Ly08/w;").getSuperclass()), "Native whole-chat operation is a Completable");
        check(AccessFlags.INTERFACE.isSet(classes.get("Lq08/b;").getAccessFlags()), "Native observer supports a proxy");
        Method menu = find("Lt72/h;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;");
        check(callsTo(menu, "Ltn3/e;", "e").size() == 1, "Same native whole-chat update used by chat-list menu");
        check(callsTo(menu, "Lj34/h;", "c").size() == 1, "Same native scoped notification cleanup used by menu");
        check(callsTo(menu, "Lj34/l$a;", "<init>").size() == 1
                && callsTo(menu, "Lj34/l$c;", "<init>").size() == 1, "Native cleanup uses chat and group selectors");
        boolean cachedMenuProvider = false;
        for (Method m : classes.get("Lt72/c;").getMethods()) {
            if (m.getName().equals("<init>") && callsTo(m, "Lx30/d;", "b").size() == 1 && hasField(m, "Lyl3/s0;", "a"))
                cachedMenuProvider = true;
        }
        check(cachedMenuProvider, "Menu obtains cached read updater from the same native provider");
        Method worker = find("Ltn3/c;", "run", "", "V");
        check(callsTo(worker, "Ltn3/e;", "a").size() == 1 && callsTo(worker, "Ltn3/e;", "d").size() == 1,
                "Native worker resolves latest message when executed");
        List<Instruction> workerBody = new ArrayList<>();
        worker.getImplementation().getInstructions().forEach(workerBody::add);
        int update = callPosition(workerBody, "Ltn3/e;", "d");
        check(update == 9 && workerBody.get(update - 1) instanceof NarrowLiteralInstruction
                && ((NarrowLiteralInstruction)workerBody.get(update - 1)).getNarrowLiteral() == 1,
                "Native worker retains whole-chat unread clearing flag");
        Method mute = find("Lyi8/n;", "b", "Landroid/content/Context;Ljava/lang/String;", "Landroidx/core/app/h;");
        Method reply = find("Lyi8/n;", "c", "Landroid/content/Context;Ljava/lang/String;", "Landroidx/core/app/h;");
        check(hasString(mute, "jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION"),
                "Native mute action identity remains available for restoration");
        check(hasString(reply, "jp.naver.line.android.access.remote.action.SEND_MESSAGE_ACTION"),
                "Native direct reply action identity is untouched");
        check(hasLiteral(mute, 0x7f152a17) && hasLiteral(reply, 0x7f152a18),
                "Native action builders retain verified localized mute/reply labels");
        check(callsTo(mute, "Landroid/app/PendingIntent;", "getService").size() == 1
                && callsTo(reply, "Landroid/app/PendingIntent;", "getService").size() == 1,
                "Both original service PendingIntents remain intact");
        check(callsTo(mute, "Landroidx/core/app/z;", "<init>").isEmpty()
                && !hasField(mute, "Landroidx/core/app/h$a;", "f"),
                "Mute action has no RemoteInput");
        check(callsTo(reply, "Landroidx/core/app/z;", "<init>").size() == 1
                && hasField(reply, "Landroidx/core/app/h$a;", "f"),
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
