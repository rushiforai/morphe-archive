package app.template.patches.pizzabusiness

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private val pizzaFundsStore = rawResourcePatch {
    dependsOn(pizzaNativeBootstrap)
    execute {
        val file = get("lib/arm64-v8a/libcocos2dcpp.so")
        // Each reviewed delta selects FUNDS and hides the starter predicate.
        // Exact input/output hashes live in the payload, alongside its edits.
        // Balances, ownership, receipt and purchase-success code are preserved.
        val profile = PizzaProfiles.forPackage(packageMetadata)
        val bytes = profile.resource("funds-store.delta.gz").use {
            PizzaBootstrap.restoreNative(file.readBytes(), it)
        }
        file.writeBytes(bytes)
    }
}

@Suppress("unused")
val pizzaHidePaidOffersPatch = bytecodePatch(
    name = "Hide paid offers",
    description = "Hides real-money storefront sections and cancels Google Play checkout. Keeps in-game currency exchanges and existing purchase processing. Requires a supported ARM64 Pizza build.",
    default = true,
) {
    compatibleWith(PizzaProfiles.compatibility)
    dependsOn(pizzaStartupSupport, pizzaFundsStore)
    execute {
        val owner = "Lcom/tapblaze/pizzabusiness/PurchasesManager;"
        val canceled = "Lcom/tapblaze/pizzabusiness/PurchasesManager\$1;"
        val activity = "Lcom/tapblaze/pizzabusiness/BaseAppActivity;"
        val entry = pizzaMethod(owner, "purchase", listOf(STRING), "V")
        val callback = pizzaMethod(canceled, "run", emptyList(), "V", static = false)
        val cancellationBridge = pizzaMethod(owner, "access\$000", emptyList(), "V")
        requirePizza(entry.calls(owner, "purchaseInternal") &&
            callback.calls(owner, "access\$000") && cancellationBridge.calls(owner, "reportPurchaseFailed"),
            "purchase/cancellation entry changed")
        // Reuse the game's real cancellation callback on its GL queue. This
        // releases its pending UI and never opens Billing or grants a purchase.
        val replacement = MutableMethod(ImmutableMethod(entry.definingClass, entry.name,
            entry.parameters, entry.returnType, entry.accessFlags, entry.annotations,
            entry.hiddenApiRestrictions, ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        replacement.replaceBody("""
            invoke-static {}, $owner->getInstance()$owner
            move-result-object v0
            new-instance v1, $canceled
            invoke-direct {v1, v0}, $canceled-><init>($owner)V
            invoke-static {}, $activity->getInstance()$activity
            move-result-object v0
            invoke-virtual {v0, v1}, $activity->runOnGLThread($RUNNABLE)V
            return-void
        """.trimIndent())
        mutableClassDefBy(owner).methods.apply { remove(entry); add(replacement) }
    }
}
