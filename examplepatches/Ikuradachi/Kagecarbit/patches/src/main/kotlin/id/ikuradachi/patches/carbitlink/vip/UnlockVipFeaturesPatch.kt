package id.ikuradachi.patches.carbitlink.vip

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.carbitlink.shared.Constants.COMPATIBILITY_CARBIT_LINK
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val unlockVipFeaturesPatch = bytecodePatch(
    name = "Unlock VIP features",
    description = "Enables Mapbox, Google Maps, Spotify integration, and TwinSpace features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CARBIT_LINK)

    execute {
        listOf(
            MapboxEntitlementFingerprint,
            GoogleMapsEntitlementFingerprint,
            TwinSpaceEntitlementFingerprint,
        ).map { it.matchAll(1..1).single() }.forEach { match ->
            val result = match.instructionMatches.last()
            val register = result.getInstruction<OneRegisterInstruction>().registerA
            match.method.replaceInstruction(result.index, "const/4 v$register, 0x1")
        }
    }
}
