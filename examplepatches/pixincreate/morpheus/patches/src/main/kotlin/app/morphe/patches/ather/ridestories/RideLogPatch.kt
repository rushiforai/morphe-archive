/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.ridestories

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val RIDE_STATS = "Lapp/morphe/ather/RideStats;"

private const val MONTH_ROW = "Lcom/ather/ridestories/ui/allHighlights/composables/a;"
private const val MONTH_ROW_DATA = "Lcom/ather/ridestories/ui/allHighlights/d;"
private const val MONTH_ROW_FLAG = "$MONTH_ROW_DATA->d:Z"

private const val PREVIOUS_RIDES = "Lcom/ather/ridestories/ui/previousRides/k;"
private const val PREVIOUS_RIDES_DATA =
    "Lcom/ather/connectedplatformlib/dataModels/responseModels/PreviousRidesData;" // keywatch:ignore
private const val COROUTINE_CONTINUATION = "Lkotlin/coroutines/jvm/internal/c;"
private const val RIDE_CLICK_EVENT = "Lcom/ather/base/c;"

private const val JAVA_LIST = "Ljava/util/List;"

/**
 * Matches the composable that draws the "Your month so far" row.
 *
 * ```
 * public final invoke(Object, Object): Object
 * ```
 */
internal object MonthSummaryFingerprint : Fingerprint(
    definingClass = MONTH_ROW,
    name = "invoke",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
)

/**
 * Matches the coroutine that loads the previous rides list.
 *
 * ```
 * public static final i(k, PreviousRidesData, c): Object
 * ```
 */
internal object PreviousRidesFingerprint : Fingerprint(
    definingClass = PREVIOUS_RIDES,
    name = "i",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(PREVIOUS_RIDES, PREVIOUS_RIDES_DATA, COROUTINE_CONTINUATION),
)

/**
 * Matches the click handler of the previous rides list.
 *
 * ```
 * public final a(com.ather.base.c): void
 * ```
 */
internal object PreviousRideClickFingerprint : Fingerprint(
    definingClass = PREVIOUS_RIDES,
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(RIDE_CLICK_EVENT),
)

/**
 * Shows the rides recorded on this phone in the ride story screens.
 *
 * Ather keeps no rides for an incognito scooter, so the server reports a monthly total of zero
 * and sends every day of the chart at zero. The patch fills both from the ride log that
 * [RideStats] writes, and opens its own detail screen when one of those rides is tapped, because
 * Ather's screen would ask the server for a ride id the server does not know.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321), inserted after the monthly row
 * data is read:
 * ```
 * invoke-static {v12, v13}, Lapp/morphe/ather/RideStats;->adjustMonth(Ljava/lang/String;Ljava/lang/Integer;)[Ljava/lang/Object;
 * move-result-object v18
 * if-eqz v18, :morphe_month_unchanged
 * const/16 v19, 0x0
 * aget-object v12, v18, v19
 * check-cast v12, Ljava/lang/String;
 * const/16 v19, 0x1
 * aget-object v13, v18, v19
 * check-cast v13, Ljava/lang/Integer;
 * const/4 v14, 0x0
 * :morphe_month_unchanged
 * invoke-static {v11}, Lapp/morphe/ather/RideStats;->adjustChart(Ljava/util/List;)Ljava/util/List;
 * move-result-object v11
 * ```
 * inserted after the previous rides list is cast, and in place of the null list:
 * ```
 * invoke-static {v6}, Lapp/morphe/ather/RideStats;->withLocalRides(Ljava/util/List;)Ljava/util/List;
 * move-result-object v6
 * ```
 * ```
 * invoke-static {}, Lapp/morphe/ather/RideStats;->localGroups()Ljava/util/List;
 * move-result-object v10
 * ```
 * and inserted at the start of the click handler:
 * ```
 * invoke-static {p1}, Lapp/morphe/ather/RideStats;->handleRideClick(Ljava/lang/Object;)Z
 * move-result v0
 * if-eqz v0, :morphe_not_ours
 * return-void
 * :morphe_not_ours
 * ```
 */
@Suppress("unused")
val rideLogPatch = bytecodePatch(
    name = "Ride log",
    description = "Shows the rides recorded on this phone in the ride story screens, including " +
        "their detail screen.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        MonthSummaryFingerprint.method.applyMonthOverrides()
        PreviousRidesFingerprint.method.applyLocalRides()
        PreviousRideClickFingerprint.method.interceptRideClick()
    }
}

/**
 * Replaces the server's monthly figures and chart with the rides recorded on this phone.
 */
private fun MutableMethod.applyMonthOverrides() {
    val body = implementation ?: throw IllegalStateException(
        "Monthly ride summary has no body to patch.",
    )

    val monthRowIndex = body.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == MONTH_ROW_FLAG
    }
    if (monthRowIndex < 0) {
        throw IllegalStateException("Monthly ride summary does not read its row data.")
    }

    // Insert the chart override first, so it becomes the target of the branch below.
    addInstructions(
        monthRowIndex + 1,
        """
            invoke-static {v11}, $RIDE_STATS->adjustChart(Ljava/util/List;)Ljava/util/List;
            move-result-object v11
        """.trimIndent(),
    )

    // Then the month override. The branch skips the array unpacking and lands on the chart
    // override inserted above, which is why the label must not be declared in the smali:
    // addInstructionsWithLabels appends its own label with the same name.
    addInstructionsWithLabels(
        monthRowIndex + 1,
        """
            invoke-static {v12, v13}, $RIDE_STATS->adjustMonth(Ljava/lang/String;Ljava/lang/Integer;)[Ljava/lang/Object;
            move-result-object v18
            if-eqz v18, :morphe_month_unchanged
            const/16 v19, 0x0
            aget-object v12, v18, v19
            check-cast v12, Ljava/lang/String;
            const/16 v19, 0x1
            aget-object v13, v18, v19
            check-cast v13, Ljava/lang/Integer;
            const/4 v14, 0x0
        """.trimIndent(),
        ExternalLabel("morphe_month_unchanged", getInstruction(monthRowIndex + 1)),
    )
}

/**
 * Falls back to the rides recorded on this phone when the server sends none.
 *
 * The list is also kept when the server does send rides, so the detail screen can still open a
 * ride the server never stored.
 */
private fun MutableMethod.applyLocalRides() {
    val body = implementation ?: throw IllegalStateException(
        "Previous rides loader has no body to patch.",
    )

    val nullListIndex = body.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_4 &&
            (instruction as? OneRegisterInstruction)?.registerA == 10 &&
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
    }
    if (nullListIndex < 0) {
        throw IllegalStateException("Previous rides loader does not build an empty list.")
    }

    // The empty list is a branch target, so the injected call has to take its place.
    replaceInstruction(
        nullListIndex,
        "invoke-static {}, $RIDE_STATS->localGroups()Ljava/util/List;",
    )
    addInstructions(nullListIndex + 1, "move-result-object v10")

    // The loader casts the server list twice. Only the second cast feeds the null check below,
    // and the injected call is written against its register.
    val listIndex = body.instructions.withIndex().firstOrNull { (index, instruction) ->
        instruction.opcode == Opcode.CHECK_CAST &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == JAVA_LIST &&
            (instruction as? OneRegisterInstruction)?.registerA == 6 &&
            body.instructions.elementAtOrNull(index + 1)?.opcode == Opcode.IF_EQZ
    }?.index ?: throw IllegalStateException("Previous rides loader does not read the server list.")

    addInstructions(
        listIndex + 1,
        """
            invoke-static {v6}, $RIDE_STATS->withLocalRides(Ljava/util/List;)Ljava/util/List;
            move-result-object v6
        """.trimIndent(),
    )
}

/**
 * Opens the patch's own detail screen for a ride recorded on this phone.
 */
private fun MutableMethod.interceptRideClick() {
    if (implementation == null) {
        throw IllegalStateException("Previous ride click handler has no body to patch.")
    }

    // The branch lands on the original first instruction, which is why the label must not be
    // declared in the smali: addInstructionsWithLabels appends its own label with the same name.
    addInstructionsWithLabels(
        0,
        """
            invoke-static {p1}, $RIDE_STATS->handleRideClick(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :morphe_not_ours
            return-void
        """.trimIndent(),
        ExternalLabel("morphe_not_ours", getInstruction(0)),
    )
}
