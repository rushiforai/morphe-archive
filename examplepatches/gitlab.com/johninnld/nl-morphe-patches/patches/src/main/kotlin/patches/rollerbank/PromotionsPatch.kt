package patches.rollerbank

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Element

internal val promotionResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/menu/main.xml").use { doc ->
            val nodes = doc.getElementsByTagName("item")
            val items = (0 until nodes.length).map { nodes.item(it) as Element }
            check(items.map { it.getAttribute("android:id").substringAfterLast('/') } ==
                listOf("menu_settings", "menu_premium", "menu_remove_ads")) {
                "Rollerbank shared toolbar menu changed"
            }
            // All four main pages inflate this menu. Keep the settings action;
            // removing its two overflow-only siblings also removes the dots.
            items.drop(1).forEach { it.parentNode.removeChild(it) }
        }
        document("res/xml/preferences_settings.xml").use { doc ->
            val nodes = doc.getElementsByTagName("androidx.preference.PreferenceCategory")
            val target = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttribute("android:key").endsWith("/preference_category_upgrades") }
            check(target.getElementsByTagName("com.dennisk.rollerbank.custom.PreferenceWithImage").length == 3)
            target.parentNode.removeChild(target)
        }
    }
}

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(
    name = "Hide Premium banner",
    description = "Skips the Premium introduction, removes settings Upgrades and removes the Premium/Remove ads toolbar overflow from every main page. Preserves normal onboarding completion and purchase status.",
) {
    dependsOn(originalInput, googleCompatibility, promotionResources)
    compatibleWith(rollerbank)
    execute {
        val method = guarded("${APP}ActivityOnboard;", "onCreate(Landroid/os/Bundle;)V", 17, 12, 109)
        val result = method.getInstruction<OneRegisterInstruction>(71)
        check(result.opcode == Opcode.MOVE_RESULT && result.registerA == 1)
        method.replaceInstruction(71, "const/4 v1, 0x1")
    }
}
