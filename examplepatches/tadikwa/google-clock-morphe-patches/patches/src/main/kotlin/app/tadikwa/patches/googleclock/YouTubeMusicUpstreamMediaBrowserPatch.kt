package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val MORPHE_YTM_PACKAGE_UPSTREAM =
    "app.morphe.android.apps.youtube.music"

private const val ORIGINAL_YTM_PACKAGE =
    "com.google.android.apps.youtube.music"

private val YTM_UPSTREAM_COMPATIBILITY = Compatibility(
    name = "YT Music Morphe",
    packageName = MORPHE_YTM_PACKAGE_UPSTREAM,
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(
            version = "9.15.51",
            isExperimental = true,
            description = "Experimental port of the upstream MediaBrowser package-identity fix to YT Music Morphe 9.15.51."
        )
    )
)

/*
 * Morphe's own current Android Auto patch uses this fingerprint to bypass
 * YT Music's caller certificate check. Keep the same bypass in this isolated
 * test patch so the result does not depend on whether that Morphe patch was
 * selected in the APK used as input.
 */
private object MediaBrowserCertificateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L"),
    strings = listOf(
        "X509",
        "isPartnerSHAFingerprint",
    ),
)

/*
 * Port of ReVanced's upstream "Unlock Android Auto Media Browser" logic.
 * The upstream patch anchors the class with this exact route string, then
 * patches the first no-argument method in the same class.
 */
private object SearchMediaItemsConstructorFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("ytm_media_browser/search_media_items"),
)

private object SearchMediaItemsExecuteFingerprint : Fingerprint(
    classFingerprint = SearchMediaItemsConstructorFingerprint,
    parameters = emptyList(),
)

@Suppress("unused")
val youtubeMusicUpstreamMediaBrowserPatch = bytecodePatch(
    name = "Google Clock MediaBrowser upstream compatibility",
    description = "Ports the upstream YT Music MediaBrowser unlock: bypasses the caller certificate gate and restores the original com.google.android.apps.youtube.music identity inside search_media_items.",
    default = true,
) {
    compatibleWith(YTM_UPSTREAM_COMPATIBILITY)

    execute {
        // 1) Certificate/allow-list gate. This mirrors Morphe's own
        //    'Bypass certificate checks' patch and is intentionally isolated.
        MediaBrowserCertificateFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // 2) Missing part from the upstream MediaBrowser unlock:
        //    force the package identity used by SearchMediaItems back to the
        //    original Google YT Music package, despite Morphe repackaging.
        SearchMediaItemsExecuteFingerprint.method.apply {
            val targetIndex = instructions.indexOfFirst { instruction ->
                if (instruction.opcode != Opcode.IGET_OBJECT) {
                    false
                } else {
                    val reference =
                        (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    reference?.type == "Ljava/lang/String;"
                }
            }

            if (targetIndex < 0) {
                throw PatchException(
                    "No IGET_OBJECT String field found in SearchMediaItems execute method"
                )
            }

            val targetInstruction =
                instructions[targetIndex] as? TwoRegisterInstruction
                    ?: throw PatchException(
                        "Unexpected instruction format for SearchMediaItems package field"
                    )

            val destinationRegister = targetInstruction.registerA

            replaceInstruction(
                targetIndex,
                "const-string v$destinationRegister, \"$ORIGINAL_YTM_PACKAGE\"",
            )
        }
    }
}
