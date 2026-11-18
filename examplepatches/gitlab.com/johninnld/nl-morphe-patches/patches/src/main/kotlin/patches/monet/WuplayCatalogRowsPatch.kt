package patches.monet

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

@Suppress("unused")
val wuplayCatalogRows = bytecodePatch(
    name = "Individual Wuplay catalog rows",
    description = "Choose individual published Wuplay catalogs in Monet's Content picker, with Wuplay icons " +
        "and refresh independent of Recommendations. Requires Wuplay's catalog publisher. " +
        "Enable only one catalog source patch; enabling both fails by design.",
    default = false,
) {
    compatibleWith(monet)
    dependsOn(monetOriginalInput)
    extendWith("extensions/monet-wuplay.mpe")
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val contracts = MonetWuplayHooks.validate(classes)
        for (signature in MonetWuplayHooks.TARGETS) {
            val original = contracts.getValue(signature)
            val method = mutableClassDefBy(original.definingClass).methods.single { it == original }
            MonetWuplayHooks.apply(method)
        }
    }
}
