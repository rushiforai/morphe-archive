package org.ungoogled.patches.maps.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

@Suppress("unused")
val bypassPlayServicesChecksPatch = bytecodePatch(
    name = "Bypass Play Services checks",
    description = "Makes Maps' bundled Play services signature and availability checks always pass, so it " +
        "runs re-signed and with Play services disabled or absent, and lets it load tiles, search and " +
        "routing by sending Google's own package and certificate in the identity headers the Maps backend " +
        "checks. Where Play services rejects the re-signed app, Maps degrades instead of crashing. Also skips " +
        "Google's \"isn't Play Protect certified\" page, and with no Play services at all uses Android's own " +
        "Cronet so the map still loads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // Restore map data used to be a patch of its own; a re-signed Maps needs both.
    dependsOn(restoreMapDataPatch, sharedExtensionPatch)

    execute {
        // "Is this package signed by Google?" -> true. Both methods are static
        // with locals to spare, so v0 is free.
        PlayServicesSignatureCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // isGooglePlayServicesAvailable -> 0, ConnectionResult.SUCCESS. This is
        // the check that gates the "Enable Google Play services" dialog; the
        // decompiler cannot even render its body, so the whole thing is
        // short-circuited rather than reasoned about branch by branch.
        PlayServicesAvailabilityFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Google's device-compliance verdict (issue #70): never acted on, so an uncertified phone is not shut
        // out of Maps. Only the verdict's two timing metrics are skipped with it.
        DeviceComplianceVerdictFingerprint.method.addInstructions(0, "return-void")

        // 26.43 has score-based provider selection built in: getAllProviderInfos always offers
        // HttpEngineNativeProvider and computes its platform/version score. Older Cronet put that
        // path behind shouldUseScoreBasedProviderSelection; preserve its fallback override if present.
        val provider = mutableClassDefBy("Lorg/chromium/net/CronetProvider;")
        val cronet = provider.methods.singleOrNull {
            it.name == "shouldUseScoreBasedProviderSelection" && it.returnType == "Z" &&
                it.parameterTypes.map { t -> t.toString() } == listOf("Landroid/content/Context;")
        }
        if (cronet != null) {
            cronet.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, Lorg/ungoogled/ui/CronetChoice;->onlyFallback(Landroid/content/Context;)Z
                    move-result v0
                    if-eqz v0, :cronet_flag
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("cronet_flag", cronet.implementation!!.instructions.first()),
            )
        } else {
            // Fail closed on unknown Cronet layouts rather than silently removing no-GMS support.
            val references = provider.methods.singleOrNull {
                it.name == "getAllProviderInfos" && it.returnType == "Ljava/util/List;" &&
                    it.parameterTypes.map { t -> t.toString() } == listOf("Landroid/content/Context;")
            }?.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }.orEmpty()
            if (references.none { it is StringReference && it.string == "org.chromium.net.impl.HttpEngineNativeProvider" } ||
                references.none { it is MethodReference && it.definingClass == provider.type &&
                    it.name == "calculateHttpEngineNativeProviderScore" }) {
                throw PatchException("Cronet has neither a provider-selection flag nor native HttpEngine selection")
            }
        }

    }
}
