// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixslinks

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.definingClass
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

internal const val MAIN_ACTIVITY = "Lcom/andrewshu/android/reddit/MainActivity;"
internal const val USER_PATH_ACTIVITY = "Lcom/andrewshu/android/reddit/intentfilter/UserPathDummyActivity;"
internal const val MAIL_CLICK_ACTIVITY = "Lcom/andrewshu/android/reddit/intentfilter/RedditMailClickDummyActivity;"

/**
 * The app's in-app link opener, which every link tapped in a post or comment goes through: it classifies a Reddit URL
 * and opens it in the activity for its type, or opens anything else in its browser. R8 renamed it and its class; it is
 * the only static method with its parameters: the URL, the display URL, an enum, the thread URL, the title, NSFW, the
 * ad whitelist status, a fragment manager, the context and an enum.
 */
internal fun BytecodePatchContext.linkOpenerMethod() = uniqueMethod("the in-app link opener") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("V")
    parameterTypes(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Lcom/andrewshu/android/reddit/ads/WhitelistStatus;",
        "Landroidx/fragment/app/FragmentManager;",
        "Landroid/content/Context;",
        "L",
    )
}

/** `MainActivity`'s method that opens the link of the intent it was started with. R8 renamed it; it logs the link's type. */
internal fun BytecodePatchContext.mainIntentMethod() = uniqueMethod("MainActivity's intent link handler", "reddit url type %s") {
    definingClass(MAIN_ACTIVITY)
    accessFlags(AccessFlags.PRIVATE)
    returnType("V")
    parameterTypes()
}

/** The `onCreate` of an activity the manifest names. */
internal fun BytecodePatchContext.onCreateMethod(activity: String) = uniqueMethod("$activity.onCreate") {
    definingClass(activity)
    name("onCreate")
    returnType("V")
    parameterTypes("Landroid/os/Bundle;")
}

/** The index just after the method's first instruction, which must be its `super.onCreate` call. */
internal fun MutableMethod.afterSuperOnCreate(): Int {
    val first = getInstruction<Instruction>(0)
    val reference = first.methodReference
    if (first.opcode != Opcode.INVOKE_SUPER || reference?.name != "onCreate") {
        throw PatchException("$definingClass.onCreate doesn't start with super.onCreate")
    }
    return 1
}
