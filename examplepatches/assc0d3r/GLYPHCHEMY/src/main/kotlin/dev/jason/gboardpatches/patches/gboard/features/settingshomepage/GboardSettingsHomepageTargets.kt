package dev.jason.gboardpatches.patches.gboard.features.settingshomepage

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

/**
 * The one member the settings homepage override rewrites, plus the access flags the release
 * declares for it.
 *
 * The flags are part of the contract because the stock gate pins the exact declaration: 18.6.3
 * compiles the settings entry point as `protected final`, and 18.8.0 as `public final`. Nothing
 * else about it moved - same class, same `onCreate(Bundle)`, same seven registers, same body - so
 * the flags are the whole per-release difference.
 */
internal data class SettingsHomepageTargets(
    val activity: GboardMethodTarget,
    val accessFlags: Int,
)

/**
 * Chooses by what the APK actually declares. The generated projection is only used when the method
 * it names is also declared with the flags it expects; otherwise the audited 18.8.0 contract
 * applies.
 */
internal fun settingsHomepageTargets(context: BytecodePatchContext): SettingsHomepageTargets {
    val projected = settingsHomepageProjection()
    return if (projected.matches(context)) projected else SETTINGS_HOMEPAGE_18_8
}

private fun SettingsHomepageTargets.matches(context: BytecodePatchContext): Boolean =
    activity.resolveOrNull(context)?.accessFlags == accessFlags

/** Read at call time so a build that does not select this feature can still load the class. */
private fun settingsHomepageProjection() = SettingsHomepageTargets(
    activity = GboardVersionBindings.settingsHomepageOnCreate,
    accessFlags = AccessFlags.PROTECTED.value or AccessFlags.FINAL.value,
)

private val SETTINGS_HOMEPAGE_18_8 = SettingsHomepageTargets(
    activity = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;",
        name = "onCreate",
        parameterTypes = listOf("Landroid/os/Bundle;"),
        returnType = "V",
    ),
    accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
)
