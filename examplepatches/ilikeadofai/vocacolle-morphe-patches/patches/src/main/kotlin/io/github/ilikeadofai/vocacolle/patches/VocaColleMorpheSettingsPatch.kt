package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE

private const val SETTING_FRAGMENT =
    "Ljp/nicovideo/nicobox/ui/setting/SettingFragment;"
private const val SETTING_MENU_PROVIDER =
    "Ljp/nicovideo/nicobox/ui/setting/SettingFragment\$b;"
private const val SETTINGS_LAUNCHER =
    "Lio/github/ilikeadofai/vocacolle/extension/settings/MorpheSettingsLauncher;"
private const val SETTING_SCREEN = "Llj/j0;"
private const val SETTING_ROW = "Llj/a0;"
private const val SETTING_ROW_DESCRIPTOR =
    "(LG0/m;Ljava/lang/String;LDl/p;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JLDl/a;Lq0/r;II)V"
private const val SETTINGS_ACTIVITY =
    "Lio/github/ilikeadofai/vocacolle/extension/settings/MorpheSettingsActivity;"
private const val SETTINGS_HOST_ACTIVITY =
    "Lcom/google/android/gms/oss/licenses/OssLicensesMenuActivity;"
private const val APP_INFO_FRAGMENT =
    "Ljp/nicovideo/nicobox/ui/setting/appinfo/AppInfoFragment;"
private const val MORPHE_PATCH_INFO =
    "Lio/github/ilikeadofai/vocacolle/extension/settings/MorphePatchInfo;"
private const val NICOBOX_APPLICATION =
    "Ljp/nicovideo/nicobox/ui/NicoboxApplication;"
private const val APP_LANGUAGE_CONTROLLER =
    "Lio/github/ilikeadofai/vocacolle/extension/settings/AppLanguageController;"
private const val OSS_ACTIVITY_SUPER = "Landroidx/fragment/app/u;"
private const val APPCOMPAT_ACTIVITY = "Ll/c;"
private const val APPCOMPAT_ACTION_BAR = "Ll/a;"

private object SettingMenuCreateFingerprint : Fingerprint(
    definingClass = SETTING_MENU_PROVIDER,
    name = "d",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/Menu;",
        "Landroid/view/MenuInflater;"
    ),
    custom = { method, _ ->
        method.implementation?.let { implementation ->
            implementation.registerCount == 4 &&
                implementation.instructions.count { it.opcode == Opcode.RETURN_VOID } == 1
        } == true
    }
)

private object SettingMenuSelectFingerprint : Fingerprint(
    definingClass = SETTING_MENU_PROVIDER,
    name = "c",
    returnType = "Z",
    parameters = listOf("Landroid/view/MenuItem;"),
    custom = custom@ { method, _ ->
        val implementation = method.implementation ?: return@custom false
        val references = implementation.instructions
            .filterIsInstance<ReferenceInstruction>()
            .map { it.reference }
            .toList()
        implementation.registerCount == 3 &&
            implementation.instructions.count { it.opcode == Opcode.RETURN } == 2 &&
            references.filterIsInstance<FieldReference>()
                .count { it.type == SETTING_FRAGMENT } == 1 &&
            references.filterIsInstance<MethodReference>().count {
                it.definingClass == "Landroidx/fragment/app/p;" &&
                    it.returnType == "Landroidx/fragment/app/u;" &&
                    it.parameterTypes.isEmpty()
            } == 1
    }
)

private object SettingsHostActivityOnCreateFingerprint : Fingerprint(
    definingClass = SETTINGS_HOST_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    custom = custom@ { method, _ ->
        val implementation = method.implementation ?: return@custom false
        val methodReferences = implementation.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .toList()
        implementation.registerCount == 6 &&
            implementation.instructions.count { it.opcode == Opcode.RETURN_VOID } == 2 &&
            methodReferences.count {
                it.definingClass == OSS_ACTIVITY_SUPER &&
                    it.name == "onCreate" &&
                    it.returnType == "V" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
            } == 1 &&
            methodReferences.count {
                it.definingClass == APPCOMPAT_ACTIVITY &&
                    it.name == "getSupportActionBar" &&
                    it.returnType == APPCOMPAT_ACTION_BAR &&
                    it.parameterTypes.isEmpty()
            } == 2 &&
            methodReferences.count {
                it.definingClass == APPCOMPAT_ACTION_BAR &&
                    it.name == "r" &&
                    it.returnType == "V" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Z")
            } == 1
    }
)

internal val settingScreenFingerprint = Fingerprint(
    definingClass = SETTING_SCREEN,
    name = "c",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions
            ?.filterIsInstance<ReferenceInstruction>()
            ?.mapNotNull { it.reference as? MethodReference }
            ?.count {
                it.definingClass == SETTING_ROW &&
                    it.name == "s" &&
                    it.returnType == "V"
            } == 8
    }
)

internal val appInfoVersionFingerprint = Fingerprint(
    definingClass = APP_INFO_FRAGMENT,
    name = "h2",
    returnType = "Lnl/L;",
    parameters = listOf(APP_INFO_FRAGMENT, "Lq0/r;", "I"),
    strings = listOf("7.40.0")
)

internal val applicationOnCreateFingerprint = Fingerprint(
    definingClass = NICOBOX_APPLICATION,
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        val methodReferences = method.implementation?.instructions
            ?.filterIsInstance<ReferenceInstruction>()
            ?.mapNotNull { it.reference as? MethodReference }
            .orEmpty()
        classDef.superclass == "Landroid/app/Application;" &&
            classDef.sourceFile == "NicoboxApplication.kt" &&
            "Landroidx/lifecycle/q;" in classDef.interfaces &&
            "LA5/E\$a;" in classDef.interfaces &&
            methodReferences.count {
                it.definingClass == "Landroid/app/Application;" &&
                    it.name == "onCreate" &&
                    it.returnType == "V" &&
                    it.parameterTypes.isEmpty()
            } == 1 &&
            methodReferences.count {
                it.definingClass == "Landroid/app/Application;" &&
                    it.name == "registerActivityLifecycleCallbacks" &&
                    it.returnType == "V" &&
                    it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/app/Application\$ActivityLifecycleCallbacks;")
            } == 1
    }
)

@Suppress("unused")
val vocacolleMorpheSettingsPatch = bytecodePatch(
    name = "VocaColle Morphe settings",
    description = "Adds display-language, cache, diagnostic, and patch-version controls to native Morphe settings.",
    default = true
) {
    compatibleWith(VOCACOLLE)
    extendWith("extensions/extension.mpe")

    execute {
        addMorpheMenuItem()
        openMorpheSettingsFromMenu()
        addMorpheSettingsRow()
        hookSettingsHostActivity()
        appendMorphePatchVersion()
        applySavedDisplayLanguageEarly()
    }
}

context(_: BytecodePatchContext)
private fun applySavedDisplayLanguageEarly() {
    val method = applicationOnCreateFingerprint.method
    val superCallIndices = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroid/app/Application;" &&
                    it.name == "onCreate" &&
                    it.returnType == "V" &&
                    it.parameterTypes.isEmpty()
            } == true
    }
    check(superCallIndices.size == 1) {
        "Expected one exact VocaColle Application super.onCreate call, found ${superCallIndices.size}"
    }
    val superCallIndex = superCallIndices.single().index

    method.addInstructions(
        superCallIndex + 1,
        """
            invoke-static {p0}, $SETTINGS_LAUNCHER->initialize(Landroid/content/Context;)V
            invoke-static {p0}, $APP_LANGUAGE_CONTROLLER->applySavedLanguage(Landroid/content/Context;)V
        """.trimIndent()
    )
}

context(_: BytecodePatchContext)
private fun addMorpheSettingsRow() {
    val method = settingScreenFingerprint.method
    val rowCalls = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == SETTING_ROW &&
                    it.name == "s" &&
                    it.returnType == "V"
            } == true
    }
    check(rowCalls.size == 8) {
        "Expected eight native settings rows, found ${rowCalls.size}"
    }

    val appInfoRowIndex = rowCalls[4].index
    method.addInstructions(
        appInfoRowIndex + 1,
        """
            invoke-static {}, $SETTINGS_LAUNCHER->menuTitle()Ljava/lang/String;
            move-result-object v8
            invoke-static {}, $SETTINGS_LAUNCHER->createClickCallback()Ljava/lang/Object;
            move-result-object v17
            check-cast v17, LDl/a;
            const/4 v7, 0x0
            const/4 v9, 0x0
            const/4 v10, 0x0
            const/4 v11, 0x0
            const-wide/16 v12, 0x0
            const/4 v14, 0x0
            const-wide/16 v15, 0x0
            const/4 v19, 0x0
            const/16 v20, 0xfd
            invoke-static/range {v7 .. v20}, $SETTING_ROW->s$SETTING_ROW_DESCRIPTOR
        """.trimIndent()
    )
}

context(_: BytecodePatchContext)
private fun appendMorphePatchVersion() {
    val method = appInfoVersionFingerprint.method
    val implementation = method.implementation!!
    val versionIndices = implementation.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_STRING &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == "7.40.0"
    }
    check(versionIndices.size == 1) {
        "Expected one AppInfo version literal, found ${versionIndices.size}"
    }
    val versionIndex = versionIndices.single().index

    val versionRegister =
        (implementation.instructions[versionIndex] as OneRegisterInstruction).registerA
    method.addInstructions(
        versionIndex + 1,
        """
            invoke-static {v$versionRegister}, $MORPHE_PATCH_INFO->formatAppVersion(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$versionRegister
        """.trimIndent()
    )
}

context(_: BytecodePatchContext)
private fun addMorpheMenuItem() {
    val method = SettingMenuCreateFingerprint.method
    val returns = method.implementation!!.instructions.withIndex().filter {
        it.value.opcode == Opcode.RETURN_VOID
    }
    check(returns.size == 1) {
        "Expected one void return in setting menu creation callback, found ${returns.size}"
    }
    val returnIndex = returns.single().index

    method.addInstructions(
        returnIndex,
        """
            invoke-static {p1}, $SETTINGS_LAUNCHER->addMorpheMenuItem(Landroid/view/Menu;)V
        """.trimIndent()
    )
}

context(_: BytecodePatchContext)
private fun openMorpheSettingsFromMenu() {
    val method = SettingMenuSelectFingerprint.method
    val references = method.implementation!!.instructions
        .filterIsInstance<ReferenceInstruction>()
        .map { it.reference }
        .toList()

    val outerField = references
        .filterIsInstance<FieldReference>()
        .single { it.type == SETTING_FRAGMENT }
    val getActivityMethod = references
        .filterIsInstance<MethodReference>()
        .single {
            it.definingClass == "Landroidx/fragment/app/p;" &&
                it.returnType == "Landroidx/fragment/app/u;" &&
                it.parameterTypes.isEmpty()
        }

    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {p1}, $SETTINGS_LAUNCHER->isMorpheMenuItem(Landroid/view/MenuItem;)Z
            move-result v0
            if-eqz v0, :not_morphe_settings
            iget-object v0, p0, $outerField
            invoke-virtual {v0}, $getActivityMethod
            move-result-object v0
            invoke-static {v0}, $SETTINGS_LAUNCHER->open(Landroid/content/Context;)V
            const/4 v0, 0x1
            return v0
            :not_morphe_settings
            nop
        """.trimIndent()
    )
}

context(_: BytecodePatchContext)
private fun hookSettingsHostActivity() {
    val method = SettingsHostActivityOnCreateFingerprint.method
    val implementation = method.implementation!!
    val superCalls = implementation.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == OSS_ACTIVITY_SUPER &&
                    it.name == "onCreate" &&
                    it.returnType == "V" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
            } == true
    }
    check(superCalls.size == 1) {
        "Expected one settings host super.onCreate call, found ${superCalls.size}"
    }
    val superCallIndex = superCalls.single().index

    val methodReferences = implementation.instructions
        .filterIsInstance<ReferenceInstruction>()
        .mapNotNull { it.reference as? MethodReference }
        .toList()
    val getSupportActionBar = methodReferences
        .filter {
            it.definingClass == APPCOMPAT_ACTIVITY &&
                it.name == "getSupportActionBar" &&
                it.returnType == APPCOMPAT_ACTION_BAR &&
                it.parameterTypes.isEmpty()
        }
        .distinctBy(MethodReference::toString)
        .single()
    val showHomeAsUp = methodReferences.single {
        it.definingClass == APPCOMPAT_ACTION_BAR &&
            it.name == "r" &&
            it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Z")
    }

    method.addInstructionsWithLabels(
        superCallIndex + 1,
        """
            invoke-static {p0}, $SETTINGS_ACTIVITY->initialize(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :not_morphe_settings_host
            invoke-virtual {p0}, $getSupportActionBar
            move-result-object v0
            if-eqz v0, :finish_morphe_settings_host
            const/4 v1, 0x1
            invoke-virtual {v0, v1}, $showHomeAsUp
            :finish_morphe_settings_host
            return-void
            :not_morphe_settings_host
            nop
        """.trimIndent()
    )
}
