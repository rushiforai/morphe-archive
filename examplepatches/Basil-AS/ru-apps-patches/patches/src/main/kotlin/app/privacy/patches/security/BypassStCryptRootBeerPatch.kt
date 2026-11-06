// Targets a second, independent root-detection library bundled in T-Bank:
// `ru.stcrypt.ckey.sdk.v1.core.RootBeer`, the STCrypt/CKey digital-signature SDK's
// own root-detection helper (CKey is used for CryptoPro/RuToken certificate
// signing). This is unrelated to `com.scottyab.rootbeer.RootBeerNative` already
// handled by BypassRootBeerPatch (different class, different vendor) and
// unrelated to the native RASP executor T-Bank's own BypassAntiTamperPatch
// targets (`com.t.core.miaf.ndk.Executor`, blocking native libs `i`/`rooot`/
// `toolChecker` — none of which this SDK loads).
//
// Found via independent `dexdump` disassembly of com.idamob.tinkoff.android
// (outside the 31-SDK checklist and outside either existing root/anti-tamper
// patch's scope): `isRootedWithoutBusyBoxCheck():Z` is the SDK's single aggregate
// entry point — it ORs together `detectRootManagementApps`,
// `detectPotentiallyDangerousApps`, `checkForBinary` (su paths),
// `checkForDangerousProps`, `checkForRWPaths`, `detectTestKeys`, `checkSuExists`
// (`Runtime.exec(["which","su"])`) and `checkForRootNative`. Every one of those
// sub-checks' call sites sits only inside this one method body (confirmed by
// grepping all 31 dex shards for call sites against each sub-check — none appear
// anywhere else), so disabling this single method fully neutralizes the group.
//
// It is reachable, not dead code: called from the SDK's own init path
// (`_CKeyCore.h`, which persists the result into a SharedPreferences `is_rooted`
// flag) and from the public `CKey.checkRoot()` API — neither of which touches
// `canLoadNativeLibrary()` or any native call BypassAntiTamperPatch already
// blocks.
//
// Gated to com.idamob.tinkoff.android only: this is the only package in the
// catalog confirmed (via dex class-descriptor scan) to bundle this SDK.
package app.privacy.patches.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.shared.*
import com.android.tools.smali.dexlib2.iface.Method

private const val STCRYPT_ROOT_BEER = "Lru/stcrypt/ckey/sdk/v1/core/RootBeer;"

private val returnFalse = """
    const/4 v0, 0x0
    return v0
""".trimIndent()

private fun MutableMethod.disableReturningFalse() {
    addInstructions(0, returnFalse)
}

private fun Method.isIsRootedWithoutBusyBoxCheck() = name == "isRootedWithoutBusyBoxCheck" &&
    returnType == "Z" &&
    parameterTypes.isEmpty()

@Suppress("unused")
val bypassStCryptRootBeerPatch = bytecodePatch(
    name = "Bypass STCrypt CKey root detection",
    description = "Disables the STCrypt/CKey SDK's aggregate root-detection check so it always reports a clean (non-rooted) result.",
    default = true,
) {
    compatibleWith(
        Compatibility(packageName = "com.idamob.tinkoff.android", name = "T-Bank"),
    )

    execute {
        var method: MutableMethod? = null

        classDefForEach { classDef ->
            if (classDef.type != STCRYPT_ROOT_BEER) return@classDefForEach

            val candidates = classDef.methods.filter {
                it.isIsRootedWithoutBusyBoxCheck() && it.implementation != null
            }
            if (candidates.size != 1) {
                throw PatchException(
                    "Expected one RootBeer.isRootedWithoutBusyBoxCheck() method, " +
                        "found ${candidates.size}",
                )
            }

            method = mutableClassDefBy(classDef).methods.first { it.isIsRootedWithoutBusyBoxCheck() }
        }

        val target = method
            ?: throw PatchException("STCrypt RootBeer.isRootedWithoutBusyBoxCheck() not found")
        target.disableReturningFalse()

        println("Bypass STCrypt CKey root detection: disabled isRootedWithoutBusyBoxCheck().")
    }
}
