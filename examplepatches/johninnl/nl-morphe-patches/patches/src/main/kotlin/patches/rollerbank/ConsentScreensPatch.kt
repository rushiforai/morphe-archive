package patches.rollerbank

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val consentResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/layout/fragment_intro_home.xml").use { doc ->
            listOf(Triple("Button", "android:id", "/dialog_intro_home_permission"),
                Triple("TextView", "android:text", "/dialog_intro_home_text2")).forEach { (tag, attr, suffix) ->
                val nodes = doc.getElementsByTagName(tag)
                val target = (0 until nodes.length).map { nodes.item(it) as Element }
                    .single { it.getAttribute(attr).endsWith(suffix) }
                check(target.getAttribute("android:visibility") != "gone")
                // Retain the IDs: the native completion callback still updates them.
                target.setAttributeNS("http://schemas.android.com/apk/res/android", "android:visibility", "gone")
            }
        }
    }
}

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Removes mandatory advertising consent from Home setup and allows completion without granting advertising consent. Includes ad and tracking controls; retains optional location and notification setup.",
) {
    dependsOn(originalInput, disableTracking, consentResources)
    compatibleWith(rollerbank)
    execute {
        // completed=true, canRequestAds=false, showError=false, message=null.
        // Complete only the app's setup callback; do not create a UMP decision.
        guarded("Lrn2;", "e(Landroid/app/Activity;ZLqh0;)V", 9, 11, 40).addInstructions(0, """
            const/4 v0, 0x1
            const/4 v1, 0x0
            const/4 v2, 0x0
            const/4 v3, 0x0
            invoke-interface {p2, v0, v1, v2, v3}, Lqh0;->b(ZZZLjava/lang/String;)V
            return-void
        """.trimIndent())
    }
}
