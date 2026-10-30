package app.pigfoot.patches.pitt

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder
import com.android.tools.smali.dexlib2.builder.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.reference.*

internal const val PITT_GOOGLE_CLICK = "Lcom/ihad/ptt/a\$a;"
internal const val PITT_GOOGLE_PREPARE = "morphe\$prepareGoogleSignIn"
internal const val PITT_MICROG_DOWNLOAD = "https://github.com/MorpheApp/MicroG-RE/releases/latest"

/** The sign-out edge bypasses the new guard; all original instructions remain. */
internal fun guardPittGoogleEntry(method: MutableMethod) {
    require(method.pittId() == "$PITT_GOOGLE_CLICK->onClick(Landroid/view/View;)V") { "Unsupported PiTT Google click method" }
    val impl = requireNotNull(method.implementation)
    val code = impl.instructions.toList()
    fun ref(i: Int) = (code.getOrNull(i) as? ReferenceInstruction)?.reference?.toString()
    require(impl.registerCount == 7 && code.size > 8 &&
        code[0].opcode == Opcode.SGET_OBJECT && (code[0] as OneRegisterInstruction).registerA == 6 && ref(0) == "Lcom/ihad/ptt/model/handler/g2\$b;->a:$PITT_STATE" &&
        code[1].opcode == Opcode.IGET_OBJECT && ref(1) == "$PITT_STATE->O0:Ljava/lang/String;" &&
        (code[1] as TwoRegisterInstruction).registerA == 6 && (code[1] as TwoRegisterInstruction).registerB == 6 &&
        code[2].opcode == Opcode.INVOKE_VIRTUAL && ref(2) == "Ljava/lang/String;->isEmpty()Z" &&
        (code[2] as FiveRegisterInstruction).registerCount == 1 && (code[2] as FiveRegisterInstruction).registerC == 6 &&
        code[3].opcode == Opcode.MOVE_RESULT && (code[3] as OneRegisterInstruction).registerA == 6 &&
        code[4].opcode == Opcode.IGET_OBJECT && ref(4) == "$PITT_GOOGLE_CLICK->a:$PITT_LOGIN_OWNER" &&
        (code[4] as TwoRegisterInstruction).registerA == 0 && (code[4] as TwoRegisterInstruction).registerB == 5 &&
        code[5].opcode == Opcode.IF_EQZ && (code[5] as OneRegisterInstruction).registerA == 6 &&
        code[6].opcode == Opcode.IGET_OBJECT && ref(6) == "$PITT_LOGIN_OWNER->b0:Lh7/a;" &&
        (code[6] as TwoRegisterInstruction).registerA == 6 && (code[6] as TwoRegisterInstruction).registerB == 0 &&
        ref(7) == "Lcom/google/android/gms/common/api/c;->getApplicationContext()Landroid/content/Context;" &&
        code.none { (it as? ReferenceInstruction)?.reference?.toString()?.contains(PITT_GOOGLE_PREPARE) == true }) {
        "Unsupported or already modified PiTT Google click flow"
    }
    var address = 0
    val addresses = code.map { instruction -> address.also { address += instruction.codeUnits } }
    val signOut = addresses.indexOf(addresses[5] + (code[5] as OffsetInstruction).codeOffset)
    require(signOut > 7 && ref(signOut) == "Lcom/ihad/ptt/vd;->O:Lcom/google/firebase/auth/FirebaseAuth;" &&
        ref(signOut + 1) == "Lcom/google/firebase/auth/FirebaseAuth;->c()V") { "Unsupported PiTT sign-out branch" }
    val start = impl.newLabelForIndex(6)
    val helper = ImmutableMethodReference(PITT_GOOGLE_CLICK, PITT_GOOGLE_PREPARE, listOf("Landroid/content/Context;"), "Z")
    val getContext = ImmutableMethodReference("Lcom/ihad/ptt/we;", "c", emptyList(), "Landroidx/fragment/app/FragmentActivity;")
    listOf(
        BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, getContext),
        BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6),
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 6, 0, 0, 0, 0, helper),
        BuilderInstruction11x(Opcode.MOVE_RESULT, 6),
        BuilderInstruction21t(Opcode.IF_NEZ, 6, start),
        BuilderInstruction10x(Opcode.RETURN_VOID)
    ).forEachIndexed { i, instruction -> impl.addInstruction(6 + i, instruction) }
}

/** UI guidance belongs only to an explicit signed-out Google-login attempt. */
internal fun pittGooglePrepareMethod(): ImmutableMethod {
    val b = MethodImplementationBuilder(5) // v4 is the Context argument; v0..v3 are private locals.
    fun string(register: Int, value: String) = b.addInstruction(BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value)))
    fun call(opcode: Opcode, owner: String, name: String, params: List<String>, returns: String, vararg regs: Int) {
        val r = regs.toList() + List(5 - regs.size) { 0 }
        b.addInstruction(BuilderInstruction35c(opcode, regs.size, r[0], r[1], r[2], r[3], r[4], ImmutableMethodReference(owner, name, params, returns)))
    }
    fun toast() {
        b.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
        call(Opcode.INVOKE_STATIC, "Landroid/widget/Toast;", "makeText", listOf("Landroid/content/Context;", "Ljava/lang/CharSequence;", "I"), "Landroid/widget/Toast;", 4, 1, 0)
        b.addInstruction(BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0))
        call(Opcode.INVOKE_VIRTUAL, "Landroid/widget/Toast;", "show", emptyList(), "V", 0)
    }
    b.addInstruction(BuilderInstruction21t(Opcode.IF_EQZ, 4, b.getLabel("blocked")))
    b.addLabel("check")
    call(Opcode.INVOKE_VIRTUAL, "Landroid/content/Context;", "getPackageManager", emptyList(), "Landroid/content/pm/PackageManager;", 4)
    b.addInstruction(BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0))
    string(1, PITT_GMS_PACKAGE)
    b.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 2, 0))
    call(Opcode.INVOKE_VIRTUAL, "Landroid/content/pm/PackageManager;", "getApplicationInfo", listOf("Ljava/lang/String;", "I"), "Landroid/content/pm/ApplicationInfo;", 0, 1, 2)
    b.addInstruction(BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0))
    b.addInstruction(BuilderInstruction22c(Opcode.IGET_BOOLEAN, 0, 0, ImmutableFieldReference("Landroid/content/pm/ApplicationInfo;", "enabled", "Z")))
    b.addInstruction(BuilderInstruction21t(Opcode.IF_EQZ, 0, b.getLabel("disabled")))
    b.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
    b.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
    b.addLabel("checked")
    b.addLabel("missing")
    b.addInstruction(BuilderInstruction11x(Opcode.MOVE_EXCEPTION, 0))
    string(1, "Google 帳號登入需要 MicroG-RE，請先安裝後再試。")
    string(2, PITT_MICROG_DOWNLOAD)
    string(3, "android.intent.action.VIEW")
    b.addInstruction(BuilderInstruction10t(Opcode.GOTO, b.getLabel("prompt")))
    b.addLabel("disabled")
    string(1, "MicroG-RE 已停用，請先啟用後再登入。")
    string(2, "package:$PITT_GMS_PACKAGE")
    string(3, "android.settings.APPLICATION_DETAILS_SETTINGS")
    b.addLabel("prompt")
    toast()
    b.addLabel("launch")
    b.addInstruction(BuilderInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference("Landroid/content/Intent;")))
    call(Opcode.INVOKE_STATIC, "Landroid/net/Uri;", "parse", listOf("Ljava/lang/String;"), "Landroid/net/Uri;", 2)
    b.addInstruction(BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1))
    call(Opcode.INVOKE_DIRECT, "Landroid/content/Intent;", "<init>", listOf("Ljava/lang/String;", "Landroid/net/Uri;"), "V", 0, 3, 1)
    call(Opcode.INVOKE_VIRTUAL, "Landroid/content/Context;", "startActivity", listOf("Landroid/content/Intent;"), "V", 4, 0)
    b.addLabel("launched")
    b.addLabel("blocked")
    b.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
    b.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
    b.addLabel("launchFailure")
    b.addInstruction(BuilderInstruction11x(Opcode.MOVE_EXCEPTION, 0))
    b.addInstruction(BuilderInstruction10t(Opcode.GOTO, b.getLabel("blocked")))
    b.addLabel("checkFailure")
    b.addInstruction(BuilderInstruction11x(Opcode.MOVE_EXCEPTION, 0))
    string(1, "無法確認 MicroG-RE 狀態，請確認已安裝並啟用。")
    toast()
    b.addInstruction(BuilderInstruction10t(Opcode.GOTO, b.getLabel("blocked")))
    b.addCatch("Landroid/content/pm/PackageManager\$NameNotFoundException;", b.getLabel("check"), b.getLabel("checked"), b.getLabel("missing"))
    b.addCatch("Ljava/lang/RuntimeException;", b.getLabel("check"), b.getLabel("checked"), b.getLabel("checkFailure"))
    b.addCatch("Ljava/lang/RuntimeException;", b.getLabel("launch"), b.getLabel("launched"), b.getLabel("launchFailure"))
    return ImmutableMethod(PITT_GOOGLE_CLICK, PITT_GOOGLE_PREPARE,
        listOf(ImmutableMethodParameter("Landroid/content/Context;", emptySet(), null)), "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        emptySet(), emptySet(), b.methodImplementation)
}
