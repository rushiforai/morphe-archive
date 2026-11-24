package app.jofslash.patches.listonic.prompts

import app.jofslash.patches.listonic.premium.PROFILE_CAROUSEL
import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.dropAddsOfConstant
import app.jofslash.patches.listonic.shared.editManifest
import app.jofslash.patches.listonic.shared.hideComposable
import app.jofslash.patches.listonic.shared.methodOf
import app.jofslash.patches.listonic.shared.methodWithStrings
import app.jofslash.patches.listonic.shared.methodsWhere
import app.jofslash.patches.listonic.shared.requireLocalRegisters
import app.jofslash.patches.listonic.shared.returnBoolean
import app.jofslash.patches.listonic.shared.returnEarly
import app.jofslash.patches.listonic.shared.setApplicationMetaData
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val TRIGGERS_MANAGER = "Lcom/listonic/trigger/TriggersManager;"
private const val TRIGGER_SEQUENCE = "Lcom/listonic/trigger/model/TriggerSequence;"
private const val UPDATE_LIBRARY = "Lcom/listonic/updatelibrary/UpdateLibrary;"
private const val IN_APP_MESSAGING = "Lcom/google/firebase/inappmessaging/FirebaseInAppMessaging;"

// The profile's menu: the "Enjoying the app? Rate us on Google Play" row is the one drawn with the
// rate-us description.
private const val PROFILE_MENU = "com.l.shared.ui.user.profile.MenuSection.<anonymous> (ProfileScreenContent.kt:715)"
private const val RATE_US_DESCRIPTION =
    "com.l.shared.ui.user.profile.<get-RateUsDescription> (ProfileScreenContent.android.kt:22)"

/**
 * Keeps the trigger sequence called [name] from being registered with Listonic's TriggersManager,
 * so what it would start (a prompt, a card) never starts.
 */
private fun BytecodePatchContext.skipTrigger(name: String) {
    methodsWhere(TRIGGERS_MANAGER, "register(name, sequence, callback)") { method ->
        method.returnType == "V" && method.parameterTypes.size == 3 &&
                method.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                method.parameterTypes[1].toString() == TRIGGER_SEQUENCE
    }.single().apply {
        requireLocalRegisters(1)
        addInstructions(
            0,
            """
                const-string v0, "$name"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :register
                return-void
                :register
                nop
            """
        )
    }
}

@Suppress("unused")
val hideRatingPromptsPatch = bytecodePatch(
    name = "Hide rating prompts",
    description = "Hides what asks you to rate the app on Google Play: the prompt after a while of use, the " +
            "\"Love Listonic?\" card on the profile screen and the \"Enjoying the app?\" row below it.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        // The rating prompt ("ReviewTrap") is a trigger sequence (app opens, items added, items
        // checked) registered with the TriggersManager.
        skipTrigger("ReviewTrap")

        // The profile's cards: leave out the "Love Listonic? Rate us" card.
        methodWithStrings(PROFILE_CAROUSEL).dropAddsOfConstant("RateApp")

        // The profile's menu: drop the call that draws the rate-us row (the first composable call
        // after its description is read).
        methodWithStrings(PROFILE_MENU, RATE_US_DESCRIPTION).apply {
            val instructions = implementation!!.instructions.toList()
            val description = instructions.indexOfFirst { insn ->
                (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                        ((insn as ReferenceInstruction).reference as StringReference).string == RATE_US_DESCRIPTION
            }
            val row = (description + 1 until instructions.size).firstOrNull { index ->
                val insn = instructions[index]
                insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((insn as ReferenceInstruction).reference as MethodReference).let {
                            it.returnType == "V" && it.parameterTypes.size >= 10
                        }
            } ?: throw PatchException("Couldn't find the rate-us row in the profile menu")
            replaceInstruction(row, "nop")
        }
    }
}

// The partner leaflets card on the lists screen and the leaflet offers widget inside a list.
private const val LEAFLETS_CARD = "com.l.shared.lists.ui.listoflists.components.LeafletsCardItem (LeafletsCardItem.kt:61)"
private const val LEAFLETS_OFFERS_WIDGET =
    "com.l.shared.lists.ui.shoppinglist.components.offers.LeafletsOffersWidget (LeafletsOffersWidget.kt:21)"

@Suppress("unused")
val hidePartnerOffersPatch = bytecodePatch(
    name = "Hide partner offers",
    description = "Hides the shop leaflets and partner offers (Offerista) shown on the lists screen and inside " +
            "your lists. The offers and leaflets you open yourself stay.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        // Both are drawn by their own composables; the app waits on the triggers that bring the
        // card, so they stay and only the drawing goes.
        hideComposable(LEAFLETS_CARD)
        hideComposable(LEAFLETS_OFFERS_WIDGET)
    }
}

private val disableInAppMessagesResourcePatch = resourcePatch {
    execute {
        // Firebase In-App Messaging fetches no campaigns while its data collection is off.
        editManifest { it.setApplicationMetaData("firebase_inapp_messaging_auto_data_collection_enabled", "false") }
    }
}

@Suppress("unused")
val disableInAppMessagesPatch = bytecodePatch(
    name = "Disable in-app messages",
    description = "Stops the pop-ups and banners that Listonic sends to the app as marketing campaigns " +
            "(Firebase In-App Messaging). Push notifications and the app's own messages stay.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    dependsOn(disableInAppMessagesResourcePatch)

    execute {
        // The app registers a click listener with In-App Messaging, so it stays in the app; it just
        // never shows a message: its display asks areMessagesSuppressed() before each one.
        methodOf(IN_APP_MESSAGING, "areMessagesSuppressed", emptyList()).returnBoolean(true)
    }
}

@Suppress("unused")
val hideUpdatePromptsPatch = bytecodePatch(
    name = "Hide update prompts",
    description = "Stops the Google Play update-available and forced-update screens. Google Play can't " +
            "update a patched app; update it by patching the new version.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        methodOf(UPDATE_LIBRARY, "checkForAppUpdate", emptyList()).returnEarly()
        methodOf(UPDATE_LIBRARY, "checkForFrozenAppUpdate", emptyList()).returnEarly()
    }
}
