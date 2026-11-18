// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixslinks

import app.edbfi.patches.shared.hasFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val MAIN_ACTIVITY = "Lcom/andrewshu/android/reddit/MainActivity;"
internal const val USER_PATH_ACTIVITY = "Lcom/andrewshu/android/reddit/intentfilter/UserPathDummyActivity;"
internal const val MAIL_CLICK_ACTIVITY = "Lcom/andrewshu/android/reddit/intentfilter/RedditMailClickDummyActivity;"

/**
 * The app's in-app link opener, which every link tapped in a post or comment goes through: it classifies a Reddit URL
 * and opens it in the activity for its type, or opens anything else in its browser. R8 renamed it and its class; it is
 * the only static method with its parameters: the URL, the display URL, an enum, the thread URL, the title, NSFW, the
 * ad whitelist status, a fragment manager, the context and an enum.
 */
internal object LinkOpenerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
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
    ),
    custom = { method, _ -> method.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)

/** `MainActivity`'s method that opens the link of the intent it was started with. R8 renamed it; it logs the link's type. */
internal object MainIntentFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("reddit url type %s"),
    custom = { method, _ -> method.hasFlags(AccessFlags.PRIVATE) },
)

/** The `onCreate` of an activity the manifest names. */
internal class OnCreateFingerprint(activity: String) :
    Fingerprint(
        definingClass = activity,
        name = "onCreate",
        returnType = "V",
        parameters = listOf("Landroid/os/Bundle;"),
    )

/** The index just after the method's first instruction, which must be its `super.onCreate` call. */
internal fun MutableMethod.afterSuperOnCreate(): Int {
    val first = getInstruction<Instruction>(0)
    val reference = first.getReference<MethodReference>()
    if (first.opcode != Opcode.INVOKE_SUPER || reference?.name != "onCreate") {
        throw PatchException("$definingClass.onCreate doesn't start with super.onCreate")
    }
    return 1
}

/** How many registers of the method aren't its parameters'. */
internal fun MutableMethod.localRegisters(): Int {
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return implementation!!.registerCount - self - parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 }
}
