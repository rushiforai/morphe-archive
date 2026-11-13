package app.template.patches.lockstar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal const val CLOCK_ITEM = "Lcom/samsung/android/sdk/aodservice/factory/item/ClockItemImpl;"

/**
 * The single constructor of the clock record LockStar saves for SystemUI.
 * copy() and the Builder both go through it, so every clock LockStar writes passes here.
 */
internal object ClockItemConstructorFingerprint : Fingerprint(
    definingClass = CLOCK_ITEM,
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string("cityClockList"),
        string("themeClock"),
    ),
)
