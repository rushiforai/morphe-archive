package patches.dynamicspot

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val homePromotionsResources = resourcePatch {
    execute {
        document("res/layout/activity_home_new.xml").use { document ->
            val elements = document.getElementsByTagName("*")
            val targets = setOf("@id/card_view7", "@id/promo_section")
            val hidden = mutableSetOf<String>()
            for (index in 0 until elements.length) {
                val element = elements.item(index) as Element
                val id = element.getAttributeNS(ANDROID, "id").replace("@+id/", "@id/")
                if (id !in targets) continue
                // Retain IDs and views: SettingsHome.C/D still bind listeners/palettes.
                element.setAttributeNS(ANDROID, "android:visibility", "gone")
                hidden += id
                if (id == "@id/card_view7") {
                    var divider = element.nextSibling
                    while (divider != null && divider !is Element) divider = divider.nextSibling
                    check(divider is Element && divider.tagName == "View") {
                        "dynamicSpot rating divider not found"
                    }
                    divider.setAttributeNS(ANDROID, "android:visibility", "gone")
                }
            }
            check(hidden == targets) { "dynamicSpot home promotion rows not found" }
        }
    }
}

@Suppress("unused")
val removePromotionsPatch = bytecodePatch(
    name = "Remove promotions",
    description = "Removes the BLYTZA home promotion, rating row and nags, special offers " +
        "and promotional notifications.",
) {
    compatibleWith(dynamicspot)
    dependsOn(patches.shared.originalInput(dynamicspot), fixPairipStartupPatch, homePromotionsResources)

    execute {
        listOf(OfferDialogFingerprint, RatingDialogFingerprint, PromoNotificationFingerprint).forEach {
            it.method.addInstruction(0, "return-void")
        }
        HomeOfferFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
