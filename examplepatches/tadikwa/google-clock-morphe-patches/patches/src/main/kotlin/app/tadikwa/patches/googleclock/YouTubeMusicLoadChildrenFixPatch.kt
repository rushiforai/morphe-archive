package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val YTM_MORPHE_PACKAGE_V2 =
    "app.morphe.android.apps.youtube.music"

private val YTM_V2_COMPATIBILITY = Compatibility(
    name = "YT Music Morphe",
    packageName = YTM_MORPHE_PACKAGE_V2,
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(
            version = "9.15.51",
            isExperimental = true,
            description = "Google Clock loadChildren bridge for Morphe-patched YT Music 9.15.51."
        )
    )
)

/*
 * Exact gate hit after Google Clock has connected and called
 * subscribe("com.google.android.deskclock").
 *
 * In YT Music 9.15.51, Lkzf.c(Llkh;) calls Lavtj.v() exactly once.
 * When it is false, the method takes its error branch and invokes
 * Lkxu.e(3). The concrete Lkxu implementation turns that into the
 * PlaybackState ERROR(7) / Music Premium message observed by Clock.
 *
 * Force only the Lavtj.v() result to true. The original normal browse
 * path then continues, including the DeskClock consent bypass already
 * supplied by the base bridge patch.
 */
private object MediaBrowserLoadChildrenFingerprintV2 : Fingerprint(
    definingClass = "Lkzf;",
    name = "c",
    returnType = "V",
    parameters = listOf("Llkh;"),
)

@Suppress("unused")
val youtubeMusicLoadChildrenFixPatch = bytecodePatch(
    name = "Google Clock alarm MediaBrowser bridge v2",
    description = "Adds the missing YT Music loadChildren fix: bypasses the account/capability error path that emits PlaybackState ERROR(7) after Google Clock subscribes.",
    default = true,
) {
    compatibleWith(YTM_V2_COMPATIBILITY)

    // Reuse every root/entitlement/consent/background fix from the current bridge.
    dependsOn(youtubeMusicClockBridgePatch)

    execute {
        MediaBrowserLoadChildrenFingerprintV2.method.apply {
            val resultIndexes = instructions.withIndex()
                .mapNotNull { (index, instruction) ->
                    val reference =
                        (instruction as? ReferenceInstruction)?.reference as? MethodReference
                            ?: return@mapNotNull null

                    val isLoadChildrenGate =
                        reference.definingClass == "Lavtj;" &&
                            reference.name == "v" &&
                            reference.returnType == "Z" &&
                            reference.parameterTypes.isEmpty()

                    if (!isLoadChildrenGate) return@mapNotNull null
                    index + 1
                }

            if (resultIndexes.size != 1) {
                throw PatchException(
                    "Expected exactly 1 Lavtj.v() loadChildren gate in Lkzf.c(), found ${resultIndexes.size}"
                )
            }

            val resultIndex = resultIndexes.single()
            val resultInstruction =
                instructions.getOrNull(resultIndex)
                    ?: throw PatchException(
                        "Lavtj.v() loadChildren gate has no result instruction"
                    )

            if (resultInstruction !is OneRegisterInstruction) {
                throw PatchException(
                    "Unexpected result instruction after Lavtj.v() in Lkzf.c()"
                )
            }

            val register = resultInstruction.registerA
            replaceInstruction(resultIndex, "const/4 v$register, 0x1")
        }
    }
}
