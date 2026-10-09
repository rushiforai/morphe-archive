package app.aidan.patches.aftership.sync

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val ACCOUNT_FRAGMENT = "LN5/k;"
private const val TRACKING_LIST_TAB_FRAGMENT = "LY6/i;"
private const val TRACKING_LIST_EMPTY_GUIDE = "LZ6/o;"
private const val TRACKING_LIST_FRAGMENT = "LY6/b;"
private const val NEW_TRACKING_LIST_PRESENTER =
    "Lcom/aftership/shopper/views/shipment/presenter/NewTrackingListPresenter;"
private const val EMAIL_GRANT_HELPER = "LP4/i;"
private const val HOME_ACTIVITY = "Lcom/aftership/shopper/views/home/HomeActivity;"
private const val ORDER_DETAILS_ACTIVITY =
    "Lcom/aftership/shopper/views/shipment/detail/order/OrderDetailsActivity;"
private const val EMAIL_GRANT_GUIDE_ACTIVITY =
    "Lcom/aftership/shopper/views/account/EmailGrantGuideActivity;"
private const val EMAIL_ACTIVITY = "Lcom/aftership/shopper/views/email/EmailActivity;"
private const val TRACKING_ADD_ACTIVITY =
    "Lcom/aftership/shopper/views/tracking/TrackingAddActivity;"

@Suppress("unused")
val removeShipmentSyncPatch = bytecodePatch(
    name = "Remove Shipment Sync",
    description = "Removes email shipment synchronization features, including prompts, banners, dialogs, empty state sync cards, and account settings.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        patchAccountFragment()
        patchTrackingListTabFragment()
        patchTrackingListEmptyGuide()
        patchTrackingListFragment()
        patchNewTrackingListPresenter()
        patchEmailGrantHelper()
        patchHomeActivity()
        patchOrderDetailsActivity()
        patchEmailGrantGuideActivity()
        patchEmailActivity()
        patchTrackingAddActivity()
    }
}

/**
 * Hides "Add orders automatically" (`layout_email`, field `p` in `Lz2/p;`) on the Account screen.
 *
 * @throws PatchException if the target class or required implemented onViewCreated method is missing.
 */
private fun BytecodePatchContext.patchAccountFragment() {
    val classDef = classDefByOrNull(ACCOUNT_FRAGMENT)
        ?: throw PatchException("Class $ACCOUNT_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)
    val onViewCreatedMethod = mutableClass.methods.firstOrNull {
        it.name == "onViewCreated" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method onViewCreated not found in $ACCOUNT_FRAGMENT")

    val implementation = onViewCreatedMethod.implementation
        ?: throw PatchException("onViewCreated has no implementation in $ACCOUNT_FRAGMENT")

    val superCallIndex = implementation.instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE
    }
    val insertIndex = if (superCallIndex >= 0) superCallIndex + 1 else 3

    onViewCreatedMethod.addInstructions(
        insertIndex,
        """
            const/16 v0, 0x8
            iget-object v1, p0, LN5/k;->p:Lz2/p;
            iget-object v1, v1, Lz2/p;->p:LM0/d;
            iget-object v1, v1, LM0/d;->b:Ljava/lang/Object;
            check-cast v1, Landroid/view/View;
            invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
        """.trimIndent()
    )
}

/**
 * Neutralizes `m3()V` in `TrackingListTabFragment` (`LY6/i;`), preventing the
 * "Enable email sync in order to add shipments automatically from your inbox." toolbar
 * banner from ever being added or shown on the shipments screen.
 *
 * @throws PatchException if the target class or required implemented m3 method is missing.
 */
private fun BytecodePatchContext.patchTrackingListTabFragment() {
    val classDef = classDefByOrNull(TRACKING_LIST_TAB_FRAGMENT)
        ?: throw PatchException("Class $TRACKING_LIST_TAB_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "m3" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method m3 not found in $TRACKING_LIST_TAB_FRAGMENT")

    method.addInstructions(0, "return-void")
}

/**
 * In `TrackingListEmptyGuideHelper.e(boolean)` (`LZ6/o;`), forces the boolean parameter
 * to false (`const/4 p1, 0x0`), ensuring the "Sync shipment" guide card is never added
 * and "Add shipment" is styled as the sole card on the empty packages screen.
 *
 * @throws PatchException if the target class or required implemented e method is missing.
 */
private fun BytecodePatchContext.patchTrackingListEmptyGuide() {
    val classDef = classDefByOrNull(TRACKING_LIST_EMPTY_GUIDE)
        ?: throw PatchException("Class $TRACKING_LIST_EMPTY_GUIDE not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "e" && it.returnType == "Ljava/util/ArrayList;" && it.implementation != null
    } ?: throw PatchException("Method e not found in $TRACKING_LIST_EMPTY_GUIDE")

    method.addInstructions(0, "const/4 p1, 0x0")
}

/**
 * Neutralizes `G1()V` in `TrackingListFragment` (`LY6/b;`), eliminating the recurring
 * popup dialog prompting users to enable email sync ("ENABLE EMAIL SYNC: Add shipments automatically from your inbox.").
 *
 * @throws PatchException if the target class or required implemented G1 method is missing.
 */
private fun BytecodePatchContext.patchTrackingListFragment() {
    val classDef = classDefByOrNull(TRACKING_LIST_FRAGMENT)
        ?: throw PatchException("Class $TRACKING_LIST_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "G1" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method G1 not found in $TRACKING_LIST_FRAGMENT")

    method.addInstructions(0, "return-void")
}

/**
 * Neutralizes `checkEmailGrantAuth(boolean)` in `NewTrackingListPresenter`, disabling
 * background email grant polling and preventing triggered sync dialogs or banners.
 *
 * @throws PatchException if the target class or required implemented checkEmailGrantAuth method is missing.
 */
private fun BytecodePatchContext.patchNewTrackingListPresenter() {
    val classDef = classDefByOrNull(NEW_TRACKING_LIST_PRESENTER)
        ?: throw PatchException("Class $NEW_TRACKING_LIST_PRESENTER not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "checkEmailGrantAuth" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method checkEmailGrantAuth not found in $NEW_TRACKING_LIST_PRESENTER")

    method.addInstructions(0, "return-void")
}

/**
 * Neutralizes email authorization failure (`r`) and duplicate account (`s`) dialogs
 * in `EmailGrantHelper` (`LP4/i;`).
 *
 * @throws PatchException if the target class or required implemented r or s method is missing.
 */
private fun BytecodePatchContext.patchEmailGrantHelper() {
    val classDef = classDefByOrNull(EMAIL_GRANT_HELPER)
        ?: throw PatchException("Class $EMAIL_GRANT_HELPER not found")
    val mutableClass = mutableClassDefBy(classDef)

    val rMethod = mutableClass.methods.firstOrNull {
        it.name == "r" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method r not found in $EMAIL_GRANT_HELPER")
    rMethod.addInstructions(0, "return-void")

    val sMethod = mutableClass.methods.firstOrNull {
        it.name == "s" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method s not found in $EMAIL_GRANT_HELPER")
    sMethod.addInstructions(0, "return-void")
}

/**
 * Neutralizes email authorization failure / expiry dialogs (`x(int)`) in `HomeActivity`.
 *
 * @throws PatchException if the target class or required implemented x method is missing.
 */
private fun BytecodePatchContext.patchHomeActivity() {
    val classDef = classDefByOrNull(HOME_ACTIVITY)
        ?: throw PatchException("Class $HOME_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "x" && it.returnType == "V" && it.parameters.size == 1 && it.implementation != null
    } ?: throw PatchException("Method x not found in $HOME_ACTIVITY")

    method.addInstructions(0, "return-void")
}

/**
 * Neutralizes email re-authorization expiry dialogs (`x(int)`) in `OrderDetailsActivity`.
 *
 * @throws PatchException if the target class or required implemented x method is missing.
 */
private fun BytecodePatchContext.patchOrderDetailsActivity() {
    val classDef = classDefByOrNull(ORDER_DETAILS_ACTIVITY)
        ?: throw PatchException("Class $ORDER_DETAILS_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "x" && it.returnType == "V" && it.parameters.size == 1 && it.implementation != null
    } ?: throw PatchException("Method x not found in $ORDER_DETAILS_ACTIVITY")

    method.addInstructions(0, "return-void")
}

/**
 * Neutralizes `EmailGrantGuideActivity`, ensuring it immediately finishes if launched.
 *
 * @throws PatchException if the target class or required implemented onCreate method is missing.
 */
private fun BytecodePatchContext.patchEmailGrantGuideActivity() {
    val classDef = classDefByOrNull(EMAIL_GRANT_GUIDE_ACTIVITY)
        ?: throw PatchException("Class $EMAIL_GRANT_GUIDE_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $EMAIL_GRANT_GUIDE_ACTIVITY")

    method.addInstructions(
        0,
        """
            invoke-super {p0, p1}, Lcom/aftership/shopper/views/base/BaseActivity;->onCreate(Landroid/os/Bundle;)V
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent()
    )
}

/**
 * Neutralizes `EmailActivity`, ensuring it immediately finishes if launched.
 *
 * @throws PatchException if the target class or required implemented onCreate method is missing.
 */
private fun BytecodePatchContext.patchEmailActivity() {
    val classDef = classDefByOrNull(EMAIL_ACTIVITY)
        ?: throw PatchException("Class $EMAIL_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $EMAIL_ACTIVITY")

    method.addInstructions(
        0,
        """
            invoke-super {p0, p1}, Lcom/aftership/shopper/views/base/BaseMvpActivity;->onCreate(Landroid/os/Bundle;)V
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent()
    )
}

/**
 * Hides "Copy tracking numbers from email" (`copy_tracking_number_ll`, field `b` in `Lz2/w;`)
 * on the Add Shipment screen.
 *
 * @throws PatchException if the target class or required implemented onResume method is missing.
 */
private fun BytecodePatchContext.patchTrackingAddActivity() {
    val classDef = classDefByOrNull(TRACKING_ADD_ACTIVITY)
        ?: throw PatchException("Class $TRACKING_ADD_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val method = mutableClass.methods.firstOrNull {
        it.name == "onResume" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method onResume not found in $TRACKING_ADD_ACTIVITY")

    val implementation = method.implementation
        ?: throw PatchException("onResume has no implementation in $TRACKING_ADD_ACTIVITY")

    val superCallIndex = implementation.instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE
    }
    val insertIndex = if (superCallIndex >= 0) superCallIndex + 1 else 1

    method.addInstructions(
        insertIndex,
        """
            const/16 v0, 0x8
            iget-object v1, p0, Lcom/aftership/shopper/views/tracking/TrackingAddActivity;->b:Lz2/w;
            iget-object v1, v1, Lz2/w;->b:Landroid/widget/LinearLayout;
            invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
        """.trimIndent()
    )
}
