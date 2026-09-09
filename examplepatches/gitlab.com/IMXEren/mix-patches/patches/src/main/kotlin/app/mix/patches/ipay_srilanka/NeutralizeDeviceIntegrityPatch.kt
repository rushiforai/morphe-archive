package app.mix.patches.ipay_srilanka

import app.mix.native.NativeOpcode
import app.mix.native.nativeLibPatch
import app.mix.patches.ipay_srilanka.shared.Constants.COMPATIBILITY_IPAY_SRILANKA

/**
 * Aligns the common entry points of the native component with the expected startup
 * behavior of the patched build.
 *
 * - [V1sFingerprint] is made to report a zero state; the runtime-registered entry
 *   folded into its region is aligned the same way, so both resolve to the same
 *   deterministic result.
 * - [V1s1D1Fingerprint] and [LolcIPayFingerprint] return at entry, keeping their
 *   callers on the normal startup path.
 */
@Suppress("unused")
internal val neutralizeDeviceIntegrityNativePatch = nativeLibPatch {
    compatibleWith(COMPATIBILITY_IPAY_SRILANKA)
    libraries(LIBIPAY_NATIVE)

    execute {
        V1sFingerprint.match(this).function.let { v1s ->
            v1s.returnZero()

            // The runtime-registered entry sits directly after v1s's own instructions
            // inside the same discovered region.
            val c1sEntryIndex = v1s.instructions.indexOfFirst { instruction ->
                instruction.address == v1s.entryAddress + C1S_ENTRY_OFFSET_FROM_V1S
            }
            check(c1sEntryIndex > 0) { "Failed to locate the second entry inside the v1s function region" }
            v1s.replaceInstructions(c1sEntryIndex, NativeOpcode.MOV_ZERO, NativeOpcode.RETURN)
        }

        V1s1D1Fingerprint.match(this).function.returnEarly()
        LolcIPayFingerprint.match(this).function.returnEarly()
    }
}
