// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.disablelemmysheet

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.instructions
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import app.revanced.patcher.type

private const val MAIN_ACTIVITY = "Lcom/laurencedawson/reddit_sync/ui/activities/MainActivity;"

/** The Sync for Lemmy sheet (`ClosingBottomSheetFragment`) returns its sign-up button label from this method. */
internal fun BytecodePatchContext.lemmySheetButtonMethod() = uniqueMethod("the Sync for Lemmy sheet", "Signup to Sync for Lemmy") {
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom { isDeclaredIn(this, "ClosingBottomSheetFragment.java") }
}

/** `MainActivity.onCreate` names the sheet class to show it on a fresh start. */
internal fun BytecodePatchContext.mainActivityOnCreateMethod(sheet: String) = uniqueMethod("MainActivity.onCreate showing the Sync for Lemmy sheet") {
    definingClass(MAIN_ACTIVITY)
    name("onCreate")
    returnType("V")
    parameterTypes("Landroid/os/Bundle;")
    instructions(type(sheet))
}
