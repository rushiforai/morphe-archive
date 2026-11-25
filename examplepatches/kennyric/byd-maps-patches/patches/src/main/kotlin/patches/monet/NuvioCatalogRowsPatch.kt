package patches.monet

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

/** NuvioTV-flavored catalog rows over the same reviewed 1.1.1 contracts as the Wuplay rows,
 * accepting every supported catalog publisher instead of Wuplay only. Selects exclusively:
 * both catalog patches hook the same reviewed native methods.
 * Derived from Santodan/santodan-patches under GPL-3.0; see NOTICE. */
@Suppress("unused")
val nuvioCatalogRows = bytecodePatch(
    name = "Individual Nuvio catalog rows",
    description = "Choose individual published catalogs in Monet's Content picker, with the publisher's " +
        "identity and refresh independent of Recommendations. Requires a catalog publisher such as " +
        "NuvioTV. Enable only one catalog source patch; enabling both fails by design.",
    default = false,
) {
    compatibleWith(monet)
    dependsOn(monetOriginalInput)
    extendWith("extensions/monet-nuviocatalog.mpe")
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val contracts = MonetWuplayHooks.validate(classes)
        for (signature in MonetWuplayHooks.TARGETS) {
            val original = contracts.getValue(signature)
            val method = mutableClassDefBy(original.definingClass).methods.single { it == original }
            MonetWuplayHooks.apply(method, MonetWuplayHooks.NUVIO_EXTENSION, MonetWuplayHooks.NUVIO_REFRESH)
        }
    }
}
