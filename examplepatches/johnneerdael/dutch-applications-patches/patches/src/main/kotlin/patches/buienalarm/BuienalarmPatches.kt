package patches.buienalarm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val OPTIONS = "Lcom/meteoplaza/android/mpbannerview/MPBannerOptions;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val APP = "http://schemas.android.com/apk/res-auto"

private val bannerEnabled = Fingerprint(
    definingClass = OPTIONS,
    name = "access\$getEnabled\$cp",
    returnType = "Z",
    parameters = emptyList(),
    isStatic = true,
)

private val adDecisions = Fingerprint(
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(definingClass = OPTIONS, name = "disableBanners")),
)

private fun org.w3c.dom.Document.singleElement(attribute: String, value: String): Element {
    val elements = getElementsByTagName("*")
    val matches = (0 until elements.length).map { elements.item(it) as Element }
        .filter { it.getAttribute(attribute) == value }
    check(matches.size == 1) { "Expected one $attribute=$value, found ${matches.size}" }
    return matches.single()
}

private val hideBannerContainers = resourcePatch {
    execute {
        for ((layout, id) in listOf("activity_main" to "banner_fragment", "fragment_weather" to "banner1")) {
            document("res/layout/$layout.xml").use { doc ->
                doc.singleElement("android:id", "@id/$id").apply {
                    setAttributeNS(ANDROID, "android:visibility", "gone")
                    setAttributeNS(ANDROID, "android:layout_height", "0dp")
                }
            }
        }
    }
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Disables banners and full-screen video/interstitial requests, and removes reserved banner space.",
) {
    compatibleWith(buienalarm)
    dependsOn(hideBannerContainers, googleCompatibility)
    execute {
        // The weather screen starts this coordinator before its banner/premium
        // decision. Return Unit before it creates or awaits an interstitial.
        Fingerprint(
            returnType = "Ljava/lang/Object;", isStatic = true,
            parameters = listOf("L", "Landroidx/fragment/app/t;", "J", "L", "L"),
            strings = listOf("InterstitialActivationEvent", "interstitial_enabled", "interstitial_was_ad_shown",
                "interstitial_last_shown_time", "INTERSTITIAL"),
        ).method.apply {
            check(instructions.any { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lhs3;" && ref.name == "a"
            }) { "Unexpected interstitial load coordinator" }
            check(instructions.any { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lhs3;" && ref.name == "c"
            }) { "Unexpected interstitial show coordinator" }
            addInstructions(0, "sget-object v0, Lvb8;->a:Lvb8;\nreturn-object v0")
        }
        // The getter is checked during initial fragment creation as well as later refreshes.
        // Guard it before MainActivity.onResume can run, preventing a first-load ad request.
        bannerEnabled.method.apply {
            check(implementation!!.registerCount >= 1) { "Banner enabled getter has no scratch register" }
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        // Keep the existing ad-disabled branches and their cleanup. Only override the
        // local boolean consumed by each ad decision; subscription storage is untouched.
        adDecisions.matchAll(2..2).forEach { match ->
            match.method.apply {
                val disableIndex = instructions.indexOfFirst { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == OPTIONS && ref.name == "disableBanners"
                }
                val booleanIndex = instructions.take(disableIndex).indexOfLast { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Ljava/lang/Boolean;" && ref.name == "booleanValue"
                }
                check(booleanIndex >= 0 && instructions[booleanIndex + 1].opcode == Opcode.MOVE_RESULT) {
                    "Cannot find the ad decision boolean in $definingClass->$name"
                }
                val register = getInstruction<OneRegisterInstruction>(booleanIndex + 1).registerA
                val branch = instructions.drop(booleanIndex + 2).take(disableIndex - booleanIndex - 2)
                    .firstOrNull { it.opcode == Opcode.IF_EQZ }
                check(branch is OneRegisterInstruction && branch.registerA == register) {
                    "Unexpected ad decision branch in $definingClass->$name"
                }
                addInstructions(booleanIndex + 2, "const/16 v$register, 0x1")
            }
        }
    }
}

@Suppress("unused")
val hidePremiumBanner = resourcePatch(
    name = "Hide Premium banner",
    description = "Hides the Buienalarm Premium promotion card in Settings.",
) {
    compatibleWith(buienalarm)
    dependsOn(googleCompatibility)
    execute {
        document("res/xml/preferences_general.xml").use { doc ->
            doc.documentElement.setAttribute("xmlns:app", APP)
            // Retain the object: the app looks it up and sets its title and summary.
            doc.singleElement("android:key", "preference_subscription")
                .setAttributeNS(APP, "app:isPreferenceVisible", "false")
        }
    }
}
