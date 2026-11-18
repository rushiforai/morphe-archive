package patches.monet

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

/** Local premium unlock. The structural finder proves the four-input billing evaluator;
 * only its single false-return literal changes. Billing, license storage and startup
 * code retain native behavior.
 * Derived from Santodan/santodan-patches under GPL-3.0; see NOTICE. */
@Suppress("unused")
val unlockPremium = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Monet's local premium features. Billing and license storage stay native; " +
        "only the local evaluator's false return changes.",
) {
    compatibleWith(monet)
    dependsOn(monetOriginalInput)
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val evaluator = MonetPremiumHooks.findUnique(classes)
        check(evaluator.toString() == MonetPremiumHooks.REVIEWED) {
            "Monet 1.1.1 evaluator differs from the reviewed contract: ${evaluator}"
        }
        MonetPremiumHooks.apply(mutableClassDefBy(evaluator.definingClass).methods.single { it == evaluator })
    }
}
