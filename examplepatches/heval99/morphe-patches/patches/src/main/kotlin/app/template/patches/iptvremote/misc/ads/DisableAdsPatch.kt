package app.template.patches.iptvremote.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_IPTVREMOTE
import com.android.tools.smali.dexlib2.AccessFlags

private const val WORTISE_SDK = "Lcom/wortise/ads/WortiseSdk;"

/**
 * Switches the ad mediation layer to the app's own no-ads provider. The old patch only
 * killed WortiseSdk.initialize, but Yandex banners/interstitials/instream load through the
 * same provider without Wortise, so banners kept showing (issue #35).
 *
 * Every provider method that overrides the abstract base (placements, activity helper,
 * interstitial factory, instream page id and mode) now delegates to a fresh instance of the
 * no-ads sibling. That covers both the app's provider lookup and the direct calls
 * IptvFreeApplication makes on the ad-supported singleton at startup.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Switches the app to its built-in no-ads provider, removing banner, " +
            "interstitial and video pre-roll ads (Yandex, Wortise and mediated networks)."
) {
    compatibleWith(COMPATIBILITY_IPTVREMOTE)

    execute {
        val provider = AdProviderInstreamLeadFingerprint.method.definingClass
        val base = classDefBy(provider).superclass
            ?: throw PatchException("Ad provider $provider has no superclass")

        val siblings = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.superclass == base && classDef.type != provider) siblings += classDef.type
        }
        val noAds = siblings.singleOrNull()
            ?: throw PatchException("Expected one no-ads provider extending $base, found $siblings")
        // R8 strips the no-ads provider's trivial constructor and the app itself constructs it
        // with `new-instance i5` + `invoke-direct a4.<init>()`; do the same when it is absent.
        fun hasNoArgInit(type: String) =
            classDefBy(type).methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() }
        val initOwner = when {
            hasNoArgInit(noAds) -> noAds
            hasNoArgInit(base) -> base
            else -> throw PatchException("No no-arg constructor for $noAds or $base")
        }

        val baseMethods = classDefBy(base).methods
            .filter { AccessFlags.STATIC.isSet(it.accessFlags).not() && it.name != "<init>" }
            .map { Triple(it.name, it.parameterTypes.map(CharSequence::toString), it.returnType) }
            .toSet()

        val overrides = mutableClassDefBy(provider).methods.filter { method ->
            method.implementation != null &&
                    (method.returnType.startsWith("L") || method.returnType == "Z") &&
                    Triple(method.name, method.parameterTypes.map(CharSequence::toString), method.returnType) in baseMethods
        }
        if (overrides.isEmpty()) throw PatchException("No provider overrides found on $provider")

        overrides.forEach { method ->
            val params = method.parameterTypes.map(CharSequence::toString)
            if (params.any { it == "J" || it == "D" }) {
                throw PatchException("Unexpected wide parameter in ${method.name}")
            }
            // `this` is never needed again, so p0 doubles as the scratch register (as the app's
            // own `new i5()` site does). Some overrides, e.g. the instream page id getter, have
            // no local registers at all.
            // The /range forms keep this valid when p0 lands above v15 in larger methods.
            val args = "p0 .. p${params.size}"
            val signature = "${method.name}(${params.joinToString("")})${method.returnType}"
            val (move, ret) = if (method.returnType == "Z") "move-result" to "return"
            else "move-result-object" to "return-object"

            method.addInstructions(
                0,
                """
                    new-instance p0, $noAds
                    invoke-direct/range {p0 .. p0}, $initOwner-><init>()V
                    invoke-virtual/range {$args}, $noAds->$signature
                    $move p0
                    $ret p0
                """.trimIndent()
            )
        }

        // Belt and braces: Wortise is only reached through the provider, but keep its SDK
        // from initializing at all. Match every concrete overload rather than pinning the
        // R8-renamed listener type.
        val wortiseInit = mutableClassDefBy(WORTISE_SDK).methods.filter {
            it.name == "initialize" && it.returnType == "V" && it.implementation != null
        }
        if (wortiseInit.isEmpty()) throw PatchException("WortiseSdk.initialize not found")
        wortiseInit.forEach { it.returnEarly() }
    }
}
