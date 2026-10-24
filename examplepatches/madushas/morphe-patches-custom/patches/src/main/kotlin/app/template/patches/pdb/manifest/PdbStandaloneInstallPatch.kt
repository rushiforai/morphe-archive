package app.template.patches.pdb.manifest

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import org.w3c.dom.Attr
import org.w3c.dom.Element

/**
 * Makes the patched APK installable on its own.
 *
 * `pdb_original.apk` is the **base** APK of an App Bundle: its `<manifest>`
 * declares `android:requiredSplitTypes="base__abi,base__density"`, so Android
 * refuses a single-APK install with `INSTALL_FAILED_MISSING_SPLIT`.
 *
 * Morphe produces one APK, so this removes the split requirement. It is safe here
 * because the base APK already carries what is needed to run: Pdb's only native
 * libraries (`libmmkv_32.so` / `libmmkv_64.so`) ship inside `assets/`, and the
 * default-density resources are in the base.
 *
 * The attribute is matched by name suffix and removed from both `<manifest>`
 * (where `requiredSplitTypes` actually lives) and `<application>`, because the
 * resource decoder may expose it either as `android:requiredSplitTypes` or by
 * local name.
 */
@Suppress("unused")
val pdbStandaloneInstallPatch = resourcePatch(
    name = "Allow standalone install (split-less APK)",
    description = "Removes Pdb's base-APK split requirement " +
        "(requiredSplitTypes=base__abi,base__density) so the single patched APK " +
        "installs. Required when patching the App Bundle's base APK.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val elements = mutableListOf<Element>(doc.documentElement)
            val applications = doc.getElementsByTagName("application")
            for (i in 0 until applications.length) {
                (applications.item(i) as? Element)?.let(elements::add)
            }

            for (element in elements) {
                val attributes = element.attributes
                val toRemove = buildList {
                    for (j in 0 until attributes.length) {
                        val attr = attributes.item(j) as? Attr ?: continue
                        val name = attr.name ?: continue
                        if (name.endsWith("requiredSplitTypes") ||
                            name.endsWith("isSplitRequired")
                        ) {
                            add(name)
                        }
                    }
                }
                toRemove.forEach { attributes.removeNamedItem(it) }
            }
        }
    }
}
