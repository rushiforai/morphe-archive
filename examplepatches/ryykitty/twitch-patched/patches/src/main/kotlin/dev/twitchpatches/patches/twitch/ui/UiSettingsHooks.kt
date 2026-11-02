package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.twitchpatches.patches.twitch.shared.*

private object UiStreamSettingsModelFingerprint : Fingerprint(
    strings = listOf(string("StreamSettingsModel(configurablePlayer=", StringComparisonType.STARTS_WITH)),
)

private class UiPlayerSettingsDelegateFingerprint(model: String) : Fingerprint(
    superclass = "Ltv/twitch/android/core/mvp/viewdelegate/RxViewDelegate;",
    filters = listOf(fieldAccess(definingClass = model)),
)

internal fun injectUiHeaderCapability(method: MutableMethod, available: Boolean) {
    val code = method.code()
    require(code.size == 2 && code[0].opcode == Opcode.CONST_4 && code[1].opcode == Opcode.RETURN &&
        (code[0] as OneRegisterInstruction).registerA == (code[1] as OneRegisterInstruction).registerA) {
        "UI settings: header capability stub changed."
    }
    requireNotNull(method.implementation).replaceInstruction(0,
        BuilderInstruction11n(Opcode.CONST_4, (code[0] as OneRegisterInstruction).registerA, if (available) 1 else 0))
}

internal fun BytecodePatchContext.injectUiPlayerEntry() {
    val model = UiStreamSettingsModelFingerprint.originalClassDef.type
    val owner = UiPlayerSettingsDelegateFingerprint(model).classDef
    val constructor = owner.methods.filter { it.name == "<init>" && it.returnType == "V" &&
        it.parameterTypes.size == 2 && it.parameterTypes[1] == "Landroid/view/View;" }
        .uniqueHook("UI player settings root constructor")
    constructor.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
        constructor.insertAtReturn(it,
            "invoke-static/range {p2 .. p2}, Ldev/twitchpatches/extension/settings/UiPlayerSettings;->bind(Landroid/view/View;)V")
    }
}

internal fun BytecodePatchContext.injectUiNavigation() =
    interceptReactNativeLink("twitchPatchesOpenUiSettings", "$UI_SETTINGS->openLink(Ljava/lang/String;)Z")

internal fun BytecodePatchContext.injectUiPolicyBridge() =
    generateReactNativeStringDispatch("dispatchUi", "TwitchPatchUi")
