package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission

/** The release this tree has audited targets for beyond the generated 18.6.3 projection. */
internal const val GBOARD_18_8_TARGET = "18.8.0.1022711984-beta-arm64-v8a"

/**
 * Compatibility for one feature that carries an audited 18.8 target set.
 *
 * The shared catalogue entry stays 18.6.3-only on purpose: a patch may only advertise a build it
 * can actually resolve on, so a ported feature states both releases itself and the patches that
 * have not been ported keep the narrow one.
 */
internal fun gboardCompatibility18_8(): Compatibility = Compatibility(
    name = "Gboard",
    packageName = GboardTargetAdmission.packageName,
    apkFileType = GboardTargetAdmission.apkFileType,
    appIconColor = 0x1A73E8,
    signatures = GboardTargetAdmission.signatures,
    targets = GboardTargetAdmission.versionNames.map { versionName ->
        AppTarget(
            version = versionName,
            isExperimental = false,
        )
    } + AppTarget(
        version = GBOARD_18_8_TARGET,
        isExperimental = false,
    ),
)

/**
 * Picks the target set for the APK in front of us.
 *
 * The generated projection only ever describes the release it was built for, so it is used only
 * when the build actually declares its probe member; anything else falls through to the table the
 * feature carries for 18.8.0 instead of resolving names that are not there. Choosing by what the
 * APK declares rather than by a version string keeps the decision honest for builds the projection
 * cannot describe, such as the 18.5.4 and 18.8.0 targets below the generated version.
 *
 * Both arguments are evaluated lazily on the projection side (`projection` is a function reference)
 * because a build that does not select the feature must still be able to load the patch class.
 */
internal fun <T> selectReleaseTargets(
    context: BytecodePatchContext,
    projection: () -> T,
    probe: (T) -> GboardMethodTarget,
    audited: T,
): T {
    val projected = projection()
    return if (probe(projected).resolveOrNull(context) != null) projected else audited
}
