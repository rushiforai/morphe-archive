// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.cash

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The place where the application puts the cash requests on the mobile network.
 *
 * The cash service talks to the operator through a network manager of its own,
 * and before it makes a request the application sets that manager as the base
 * of the network it uses, so that the request goes out over the mobile data
 * connection. The shrinker renamed the class and the method, so the class and
 * the signature together identify it.
 */
private object CashNetworkInstanceFingerprint : Fingerprint(
    definingClass = "Lo/FailureInfo;",
    name = "AnimatedBarCharthGBTI10",
    isStatic = false,
    returnType = "V",
    parameters = emptyList(),
)

/**
 * The screen that refuses to open without the mobile data.
 *
 * The cash section of the application opens on a screen of its own, and that
 * screen checks the connection of the device before it shows anything. When the
 * device is on a connection that is not the mobile data of the line, the screen
 * shows the message that the mobile data has to be turned on and the section
 * cannot be opened. The check and the message are in a method of their own.
 * The shrinker renamed the class and the method, so the class and the
 * signature together identify them.
 */
private object CashScreenConnectionFingerprint : Fingerprint(
    definingClass = "Lo/r8lambdaJxYYgvdy3elmxJSlXdbEzZMIL8;",
    name = "getFlags",
    isStatic = false,
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Lets the cash service use the connection the device already has.
 *
 * The cash service of the operator is tied to the mobile data connection of
 * the line: the operator checks that a transaction comes from the mobile
 * network of the line, and the application makes it so by putting the cash
 * network manager on the mobile data connection before every request. When the
 * mobile data is off, the application shows the message that the mobile data
 * has to be turned on, and the cash service cannot be reached.
 *
 * The patch leaves the network as it is, so the cash requests go out over the
 * connection the device is already using, and the screen that opens the cash
 * section no longer refuses to open for the same reason. Whether the operator
 * answers the requests is the operator's own decision, and this patch does not
 * change what the operator answers.
 *
 * Nothing else about the cash service changes: the same requests are made and
 * the same answers are shown.
 */
@Suppress("unused")
val useCurrentConnectionForCashPatch = bytecodePatch(
    name = "Use the current connection for Vodafone Cash",
    description = "Lets the Vodafone Cash service use the connection the device already has, instead of asking for mobile data.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.INTERFACE.label)

    execute {
        CashNetworkInstanceFingerprint.method.returnEarly()
        CashScreenConnectionFingerprint.method.returnEarly()
    }
}
