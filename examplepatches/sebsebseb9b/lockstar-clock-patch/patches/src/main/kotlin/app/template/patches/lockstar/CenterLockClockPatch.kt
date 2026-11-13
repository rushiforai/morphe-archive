package app.template.patches.lockstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_LOCKSTAR

/*
 * How LockStar 9.5.00.0 stores the lock screen clock:
 *  - The clock is a data record (ClockItemImpl) with x / y / width / height fields and an
 *    isDefaultPosition flag. LockStar never draws the clock; it serializes this record and
 *    SystemUI draws it.
 *
 * Both patches append code at the end of the ClockItemImpl constructor, right before
 * return-void. The constructor has 4 locals (v0-v3) that are all dead at that point, so the
 * injected code reuses them and the register frame does not grow.
 */

private const val DIRECTION_DIM = "Lcom/samsung/android/sdk/aodservice/entities/dimen/DirectionDimension;"
private const val REL_ROOT_X = "Lcom/samsung/android/sdk/aodservice/factory/RelativeRootDimensionXImpl;"
private const val DIM_TYPE = "Lcom/samsung/android/sdk/aodservice/entities/dimen/Dimension\$Type;"
private const val H_POS = "Lcom/samsung/android/sdk/aodservice/entities/attrs/HorizontalPosition;"

private fun injectBeforeReturn(smali: String) {
    val method = ClockItemConstructorFingerprint.method
    val returnIndex = method.implementation!!.instructions.size - 1
    method.addInstructions(returnIndex, smali)
}

@Suppress("unused")
val centerLockClockPatch = patch(
    name = "Center lock screen clock",
    description = "Anchors the lock screen clock to the horizontal center of the screen. " +
        "Your vertical position is kept. Re-save the clock in LockStar after installing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LOCKSTAR)

    execute {
        // x = 0px offset from the screen's horizontal Center.
        injectBeforeReturn(
            """
                new-instance v0, $REL_ROOT_X
                const/4 v1, 0x0
                sget-object v2, $DIM_TYPE->PX:$DIM_TYPE
                sget-object v3, $H_POS->Center:$H_POS
                invoke-direct {v0, v1, v2, v3}, $REL_ROOT_X-><init>(F$DIM_TYPE$H_POS)V
                iput-object v0, p0, $CLOCK_ITEM->x:$DIRECTION_DIM
            """
        )
    }
}

@Suppress("unused")
val defaultClockPositionPatch = patch(
    name = "Use default clock position",
    description = "Alternative to 'Center lock screen clock': makes SystemUI use its stock " +
        "(centered) clock position. Your vertical position is not kept. Enable only one of the two.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LOCKSTAR)

    execute {
        injectBeforeReturn(
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, $CLOCK_ITEM->isDefaultPosition:Z
            """
        )
    }
}
