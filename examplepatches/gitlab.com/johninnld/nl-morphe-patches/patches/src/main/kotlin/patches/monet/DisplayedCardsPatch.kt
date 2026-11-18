package patches.monet

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

/** Removes the 20-card display cap and adds -10, +10 and Max to Monet's original themed picker,
 * preserving its layout and single-card steps.
 * Derived from Santodan/santodan-patches under GPL-3.0; see NOTICE. */
@Suppress("unused")
val unlimitedDisplayedCards = bytecodePatch(
    name = "Unlimited displayed cards",
    description = "Remove the 20-card limit from Displayed Cards. Add -10, +10 and Max to the original " +
        "themed picker, preserving its layout and single-card steps.",
    default = false,
) {
    compatibleWith(monet)
    dependsOn(monetOriginalInput)
    extendWith("extensions/monet-displayed-cards.mpe")
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val contracts = MonetDisplayedCardsHooks.validate(classes)
        for (signature in MonetDisplayedCardsHooks.TARGETS) {
            val original = contracts.getValue(signature)
            MonetDisplayedCardsHooks.apply(mutableClassDefBy(original.definingClass).methods.single { it == original })
        }
    }
}
