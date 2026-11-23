/*
 * Ported from MrCool-888/mrcool-patches (GPL-3.0), adapted from hoo-dles/morphe-patches
 * (copyright 2026 Hoo-dles, GPL-3.0). See the commit trailer and NOTICE.
 */

package app.template.patches.smartlauncher.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// The PurchasableItems holder's static initializer: "unlockpro" first, then the "lifetime"
// item built and stored. The second SPUT_OBJECT names the lifetime item field.
object PurchaseItemsCtor : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("unlockpro"),
    filters = listOf(
        string("lifetime"),
        opcode(Opcode.INVOKE_DIRECT_RANGE),
        opcode(Opcode.SPUT_OBJECT),
        opcode(Opcode.NEW_INSTANCE),
    ),
)

object HasChangedIntentFingerprint : Fingerprint(
    classFingerprint = PurchaseItemsCtor,
    strings = listOf("ginlemon.action.hasPremiumAccessChanged"),
)

// The item's own setter/getter, matched inside the PurchasableItem class.
object PurchasableItemSetFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Z"),
    returnType = "V",
)

object PurchasableItemGetFingerprint : Fingerprint(
    parameters = listOf(),
    returnType = "Z",
)

// Play Billing returns no purchases for a sideloaded app; this refresh treats the empty list
// as authoritative and revokes the local licence. Its last boolean is the revoke flag.
object LicenseRefreshFingerprint : Fingerprint(
    parameters = listOf(
        "Lk19;",
        "Ljava/util/ArrayList;",
        "Z",
        "Lginlemon/flower/App;",
    ),
    returnType = "V",
)

object GetAppFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    returnType = "Lginlemon/flower/App;",
)
