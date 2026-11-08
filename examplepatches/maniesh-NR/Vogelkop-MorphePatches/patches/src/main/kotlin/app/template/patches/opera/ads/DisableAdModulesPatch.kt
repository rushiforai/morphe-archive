package app.template.patches.opera.ads

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Opera ships a mediation layer that reflectively loads third-party ad network
 * modules (found by their implementation class names in the dex):
 *
 *   com.opera.android.ads.liftoff.LiftoffAdsModuleImpl    (Liftoff / Vungle)
 *   com.opera.android.ads.mintegral.MintegralAdsModuleImpl (Mintegral)
 *   com.opera.android.ads.pangle.PangleAdsModuleImpl      (Pangle / ByteDance)
 *
 * Pangle is even delivered as a dedicated Play split (`split_pangle_ads.apk`),
 * which proves the module loader already tolerates a missing module class.
 * Verified in Opera Beta 104.0.5262.91143: the availability probe
 * (`Lk8;->a0()Z`) wraps the class lookup in try/catch and falls back to a
 * no-op ads provider (`Li0f;`), so breaking the class name is safe.
 *
 * The patch rewrites those three class-name constants to a non-existent class,
 * so no third-party ad SDK module is ever instantiated. Opera's own ad
 * delivery (start-page promo cards) is handled by separate patches; see the
 * README.
 *
 * Replacement runs on the patcher's prebuilt string index via
 * `matchAllMethodIndicesForEach`, so only the matched methods are ever
 * materialized as mutable classes (the whole-app `classDefForEach` +
 * `mutableClassDefByOrNull` scan used before pushed peak patching memory to
 * 1.1-1.5 GB; see README "Memory usage").
 */
@Suppress("unused")
val operaDisableAdModulesPatch = patch(
    name = "Disable ad modules",
    description = "Prevents Opera from loading its bundled third-party ad network " +
        "modules (Liftoff/Vungle, Mintegral, Pangle/ByteDance) by breaking the " +
        "reflective class lookup used by the ad mediation layer.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY)

    execute {
        val deadModule = "com.opera.android.ads.disabled.DisabledByMorphe"
        val adModuleClasses = listOf(
            "com.opera.android.ads.liftoff.LiftoffAdsModuleImpl",
            "com.opera.android.ads.mintegral.MintegralAdsModuleImpl",
            "com.opera.android.ads.pangle.PangleAdsModuleImpl",
        )

        var patched = 0
        for (adModuleClass in adModuleClasses) {
            string(adModuleClass).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(deadModule),
                    ),
                )
                patched++
            }
        }

        if (patched != adModuleClasses.size) {
            throw PatchException(
                "Expected exactly ${adModuleClasses.size} ad module class references, " +
                    "found $patched. Is this an unsupported Opera version?",
            )
        }

        println("Opera ad modules: neutralized $patched module reference(s).")
    }
}
