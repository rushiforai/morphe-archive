package app.morphe.patches.monument.limitedcache

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.monument.shared.Constants.COMPATIBILITY_MONUMENT
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

// The app's own "limited" value (set when the switch is turned off in Manage Cache).
private const val LIMITED_CACHE_SIZE = 5000

@Suppress("unused")
val limitCacheSizePatch = bytecodePatch(
    name = "Limit thumbnail cache by default",
    description = "Turns the \"Unlimited cache size\" preference off by default by making the " +
        "thumbnail cache size default to a limited value instead of unlimited (0). " +
        "A user can still enable unlimited caching from settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MONUMENT)

    execute {
        // getInt(key, default) — override the `default` argument (currently 0 = unlimited)
        // with the limited value, so an unset preference reads as "limited / switch off".
        val getIntMatch = ThumbnailsCacheSizeGetterFingerprint.instructionMatches[1]
        // invoke-interface {receiver, key, default}: the default is the 3rd register (E).
        val defaultRegister = getIntMatch.getInstruction<FiveRegisterInstruction>().registerE
        ThumbnailsCacheSizeGetterFingerprint.method.addInstructions(
            getIntMatch.index,
            "const/16 v$defaultRegister, $LIMITED_CACHE_SIZE",
        )
    }
}
