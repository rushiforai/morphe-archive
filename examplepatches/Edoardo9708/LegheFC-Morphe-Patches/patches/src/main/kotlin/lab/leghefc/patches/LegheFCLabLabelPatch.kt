package lab.leghefc.patches

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import org.w3c.dom.Element

/**
 * Esperimento per Leghe FC 13.2.1:
 * - modifica l'etichetta del launcher;
 * - modifica le risposte ai controlli locali della sorgente di installazione
 *   usando la patch Morphe ufficiale (GPLv3 e relativi NOTICE).
 *
 * Non modifica l'install source reale registrato da Android, gli acquisti
 * o la convalida di licenze e abbonamenti sul server.
 */
@Suppress("unused")
val legheFcLabLabelPatch = resourcePatch(
    name = "Leghe FC - Avvio e nome 3 campo",
    description = "Corregge l'avvio dell'app e la rinomina in 3 campo.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Leghe FC",
            packageName = "it.quadronica.leghe",
            targets = listOf(AppTarget(version = "13.2.1"))
        )
    )

    // Patch bytecode pubblicata da MorpheApp/morphe-patches-library.
    // Viene eseguita prima della modifica del manifest.
    dependsOn(changePackageInstallerPatch { "com.android.vending" })

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: error("Elemento application assente dal manifest")
            application.setAttributeNS(
                "http://schemas.android.com/apk/res/android",
                "android:label",
                "3 campo"
            )
        }
    }
}
