package app.morphe.patches.icsee

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Chaves do AndroidManifest que o próprio app usa como "interruptores" de anúncio
// (lidas por com.xworld.utils.O.a -> ApplicationInfo.metaData.getBoolean):
//  - SUPPORT_START_UP_AD:    anúncio de abertura (tela de boas-vindas / splash).
//  - SUPPORT_INTERSTITIAL_AD: anúncio de tela cheia entre telas.
// Com elas em "false", AdOpenManager e XMAdManager respondem "sem anúncio" e o app segue
// o fluxo normal. Não mexemos em SUPPORT_GOOGLE_AD de propósito: essa chave também decide
// permissões, login e outras telas que nada têm a ver com anúncio.
private val AD_SWITCHES = setOf("SUPPORT_START_UP_AD", "SUPPORT_INTERSTITIAL_AD")

@Suppress("unused")
val iCSeeRemoveAdsPatch = resourcePatch(
    name = "iCSee Remove Ads",
    description = "Removes the ads shown when the app opens and between screens.",
) {
    compatibleWith(ICSEE_COMPATIBILITY)

    execute {
        val changed = mutableSetOf<String>()

        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("meta-data")
            for (i in 0 until nodes.length) {
                val node = nodes.item(i) as? Element ?: continue
                val name = node.getAttribute("android:name")
                if (name in AD_SWITCHES) {
                    node.setAttribute("android:value", "false")
                    changed += name
                }
            }
        }

        // Se alguma chave não existir, a versão do app é outra: melhor falhar do que
        // entregar um patch que não faz nada.
        if (changed != AD_SWITCHES) {
            throw PatchException(
                "iCSee: chaves de anúncio não encontradas no manifest " +
                    "(faltando: ${AD_SWITCHES - changed}). Versão do app diferente de 7.9.5_G?",
            )
        }
    }
}
