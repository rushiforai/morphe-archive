/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.misc.foldable

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.shared.requireLocals
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

private const val EXTENSION = "Lapp/morphe/extension/tiktok/foldable/FoldableSplitView;"
private const val FEED_ACTIVITY = "Lcom/ss/android/ugc/aweme/main/MainActivity;"
private object LiveCheck : Fingerprint(
    strings = listOf("isOptCommentSplit"), returnType = "Z",
    parameters = listOf("Landroid/app/Activity;", "Landroid/content/res/Configuration;"),
)
private object ContainerCheck : Fingerprint(
    strings = listOf("isOptSplitContainer"), returnType = "Z", parameters = emptyList(),
)

/** An instance method that takes a configuration change itself, rather than a declaration. */
internal fun Method.isConfigurationChange(): Boolean =
    name == "onConfigurationChanged" &&
        returnType == "V" &&
        parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/res/Configuration;") &&
        !AccessFlags.STATIC.isSet(accessFlags) &&
        implementation != null

/**
 * The first class from [start] up that takes configuration changes itself, and its method, or
 * null when the walk leaves the app before finding one.
 */
internal fun configurationChangeOf(start: String, classDefByOrNull: (String) -> ClassDef?): Method? {
    val seen = mutableSetOf<String>()
    var type: String? = start
    while (type != null && seen.add(type)) {
        val classDef = classDefByOrNull(type) ?: return null
        classDef.methods.firstOrNull { it.isConfigurationChange() }?.let { return it }
        type = classDef.superclass
    }
    return null
}

/**
 * Hands the feed activity's configuration change to the extension first (issue #26). TikTok's
 * feed activity takes size changes itself, so an unfold reaches it as one of these rather than
 * as a new activity, and the comment containers it built for the folded width would stay.
 */
internal fun MutableMethod.handConfigurationChangesToSplitView() = addInstruction(
    0,
    "invoke-static/range { p0 .. p1 }, $EXTENSION->onConfigurationChanged(Landroid/app/Activity;Landroid/content/res/Configuration;)V",
)

@Suppress("unused")
val foldableSplitViewPatch = bytecodePatch(
    name = "Foldable split comment view",
    description = "Shows comments beside the video on windows wider than a configurable threshold. Off by default. Switch: Hushfeed settings > App.",
    default = false,
) {
    category("Comments")
    compatibleWith(*AppCompatibilities.tiktok4703())
    dependsOn(sharedExtensionPatch, settingsPatch)
    execute {
        // Found before anything is written.
        val configurationChange = configurationChangeOf(FEED_ACTIVITY) { classDefByOrNull(it) }
            ?: throw PatchException("Split view: nothing between the feed activity and Activity takes configuration changes.")
        listOf(LiveCheck.method to true, ContainerCheck.method to false).forEach { (method, live) ->
            check(AccessFlags.STATIC.isSet(method.accessFlags)) {
                "Split view: ${method.name} is not static, so p0 is not its first argument."
            }
            method.requireLocals("Split view", 1)
            val call = if (live) "invoke-static/range { p0 .. p1 }, $EXTENSION->shouldForce(Landroid/app/Activity;Landroid/content/res/Configuration;)Z"
                else "invoke-static {}, $EXTENSION->shouldForceContainer()Z"
            method.addInstructions(0, """
                $call
                move-result v0
                if-eqz v0, :stock_split_check
                return v0
                :stock_split_check
                nop
            """)
        }
        mutableClassDefBy(configurationChange.definingClass).methods
            .single { it.isConfigurationChange() }
            .handConfigurationChangesToSplitView()
        SettingsStatusLoadFingerprint.method.addInstruction(0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableFoldableSplitView()V")
    }
}
