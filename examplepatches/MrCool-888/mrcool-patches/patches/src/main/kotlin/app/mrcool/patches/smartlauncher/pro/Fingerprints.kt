/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package app.mrcool.patches.smartlauncher.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PurchaseItemsCtor : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("unlockpro"),
    filters = listOf(
        string("lifetime"),
        opcode(Opcode.INVOKE_DIRECT_RANGE),
        opcode(Opcode.SPUT_OBJECT),
        opcode(Opcode.NEW_INSTANCE)
    )
)

object HasChangedIntentFingerprint : Fingerprint(
    classFingerprint = PurchaseItemsCtor,
    strings = listOf("ginlemon.action.hasPremiumAccessChanged")
)

object PurchasableItemSetFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Z"),
    returnType = "V"
)

object PurchasableItemGetFingerprint : Fingerprint(
    parameters = listOf(),
    returnType = "Z"
)

object LicenseRefreshFingerprint : Fingerprint(
    parameters = listOf(
        "Lk19;",
        "Ljava/util/ArrayList;",
        "Z",
        "Lginlemon/flower/App;"
    ),
    returnType = "V"
)

object GetAppFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    returnType = "Lginlemon/flower/App;"
)
