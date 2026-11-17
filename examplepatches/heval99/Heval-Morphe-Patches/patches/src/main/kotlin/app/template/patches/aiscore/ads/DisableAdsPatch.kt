package app.template.patches.aiscore.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_AISCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

// The ad manager class (R8-renamed) is the one that owns the "mDisplayAds" check. Its only ()Z
// method using the one-day constant is the "ads allowed" gate, and its only (J, object, Boolean, I)
// -> object method is the house-ad factory.
internal object AdManagerFingerprint : Fingerprint(
    filters = listOf(string("mDisplayAds")),
)

private const val ONE_DAY_MS = 86_400_000L

internal fun Method.usesOneDayConstant() = implementation?.instructions?.any {
    (it is WideLiteralInstruction && it.wideLiteral == ONE_DAY_MS) ||
        (it is NarrowLiteralInstruction && it.narrowLiteral.toLong() == ONE_DAY_MS)
} == true

internal fun Method.isHouseAdFactory(): Boolean {
    val parameters = parameterTypes.map(CharSequence::toString)
    return parameters.size == 4 && parameters[0] == "J" && parameters[2] == "Ljava/lang/Boolean;" &&
        parameters[3] == "I" && returnType.let { it.startsWith("L") || it.startsWith("[") }
}

/**
 * The app asks one class "may ads be shown" before every banner, list row, odds house ad and
 * popup, and builds its own house ads in a factory. Forcing the gate to false stops all of them
 * without touching the VIP check that Enable Premium sets; the factory returns null as a second
 * line (every caller null-checks it), and the ad SDK entry points are neutered as a backstop.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes ads.",
) {
    compatibleWith(COMPATIBILITY_AISCORE)

    execute {
        // 1. Ad manager: the ads-allowed gate and the house-ad factory.
        val holders = AdManagerFingerprint.matchAllOrNull().orEmpty().map { it.classDef.type }.distinct()
        if (holders.size != 1) {
            throw PatchException("Disable ads: expected one \"mDisplayAds\" class, found $holders")
        }
        val manager = mutableClassDefBy(holders.single())

        val gates = manager.methods.filter {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null && it.usesOneDayConstant()
        }
        if (gates.size != 1) {
            throw PatchException("Disable ads: expected one ads-allowed gate in ${manager.type}, found ${gates.map { it.name }}")
        }
        gates.single().returnEarly(false)

        val factories = manager.methods.filter { it.implementation != null && it.isHouseAdFactory() }
        if (factories.size != 1) {
            throw PatchException("Disable ads: expected one house-ad factory in ${manager.type}, found ${factories.map { it.name }}")
        }
        // Object return: returnEarly() is void-only (rule 1).
        factories.single().addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 2. SDK backstop: AppLovin MAX loads/shows (GMA classic is obfuscated here, so GMA_LOAD_HOOKS
        // is not used; MobileAds.initialize is never called by the app, MAX initialises it).
        neuterAdHooks(MAX_LOAD_SHOW_HOOKS)
        hideMaxAdView()
    }
}
