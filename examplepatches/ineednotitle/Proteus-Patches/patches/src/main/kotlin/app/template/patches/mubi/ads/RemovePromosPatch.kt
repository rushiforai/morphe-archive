package app.template.patches.mubi.ads

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

// Remove MUBI's promotional cards and in-app upsell banners.
//
// MUBI has no third-party video ads; its "ads" are Braze-driven marketing:
//   • Content Cards rendered by com.braze.ui.contentcards.*
//   • the full-screen Braze feed (com.braze.ui.feed.* / appboy.ui.feed.*)
//   • card refreshes triggered from app code
//
// The manifest half disables only the Braze *UI* activities. Braze's push
// trampoline and the app's own notifications are deliberately left enabled.
//
// The bytecode half no-ops the void card-fetch methods wherever they are called,
// so the app cannot pull new promo cards even if it never launches the Braze
// activities.
//
// This does not touch the upgrade flow (handled by "Block upgrade & sale deep
// links") or analytics (handled by "Block analytics & tracking").
//
// Fail-safe: absent Braze classes simply do not match.

private val PROMO_ACTIVITY_PREFIXES = listOf(
    "com.braze.ui.contentcards",
    "com.braze.ui.feed",
    "com.appboy.ui.contentcards",
    "com.appboy.ui.feed",
)

private val CARD_METHODS = mapOf(
    "Lcom/braze/Braze;" to setOf("requestContentCardsRefresh", "launchContentCards"),
    "Lcom/appboy/Appboy;" to setOf("requestContentCardsRefresh", "launchContentCards"),
)

private val disableBrazeUiPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")

            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                val name = activity.getAttribute("android:name")

                if (PROMO_ACTIVITY_PREFIXES.any(name::startsWith)) {
                    activity.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}

@Suppress("unused")
val mubiRemovePromosPatch = bytecodePatch(
    name = "Remove promo cards & upsell banners",
    description = "Disables Braze Content Cards, the Braze feed and card refreshes in MUBI. " +
        "Push notifications and the app's own screens are untouched.",
    default = true,
) {
    compatibleWith(MUBI_COMPATIBILITY)
    dependsOn(disableBrazeUiPatch)

    execute {
        classDefForEach { classDef ->
            classDef.methods.forEach methodLoop@ { method ->
                val implementation = method.implementation ?: return@methodLoop

                val callSites = implementation.instructions
                    .mapIndexedNotNull { index, instruction ->
                        val reference = (instruction as? ReferenceInstruction)?.reference
                            as? MethodReference ?: return@mapIndexedNotNull null

                        val methodsForOwner = CARD_METHODS[reference.definingClass]
                            ?: return@mapIndexedNotNull null

                        if (reference.name in methodsForOwner && reference.returnType == "V") {
                            index
                        } else {
                            null
                        }
                    }

                if (callSites.isEmpty()) return@methodLoop

                val mutableMethod = mutableClassDefByOrNull(classDef.type)?.findMutableMethodOf(method)
                    ?: return@methodLoop
                callSites.sortedDescending().forEach { index ->
                    mutableMethod.replaceInstruction(index, "nop")
                }
            }
        }
    }
}
