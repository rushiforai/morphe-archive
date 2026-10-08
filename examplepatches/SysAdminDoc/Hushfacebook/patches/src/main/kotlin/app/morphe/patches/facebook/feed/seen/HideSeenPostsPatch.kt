/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.seen

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.hook.feedFilterHookPatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PATCH = "Hide seen posts"

/**
 * What the viewport logger names itself in its trace, a literal Redex keeps. The method it labels
 * is `persistSeenState`, and that name is kept too.
 */
internal const val SEEN_TRACE = "VPVDLOGGING.ViewportLoggingHandler.persistSeenState"

/** The method Facebook calls with a feed unit once it counts as seen. Its name is kept. */
internal const val SEEN_METHOD = "persistSeenState"

/** What the method reads the unit's id with, an interface method whose name is kept. */
internal const val CACHE_ID_READER = "getCacheId"

internal const val SEEN_POSTS = "Lapp/morphe/extension/facebook/feed/SeenPosts;"
internal const val SEEN = "$SEEN_POSTS->seen(Ljava/lang/Object;)V"

/**
 * Posts you've already scrolled past can stay out of the feed on later loads. Facebook's viewport
 * logger decides a post was seen: when a post leaves the screen after being on it long enough to
 * count as a view, `ViewportLoggingHandler.persistSeenState(session, feedUnit)` saves that to its
 * feed cache, and it reads the unit's cache id to do it. The patch hands the same unit to the
 * extension, first thing in that method, and the extension remembers the id. The feed guard drops a
 * remembered post before Facebook adds it, so the rule lives with the other feed rules and this
 * patch only adds the signal. It brings the guard ([feedFilterHookPatch]) itself, so picked alone
 * it hides as well as remembers.
 */
@Suppress("unused")
val hideSeenPostsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Hide seen posts",
    description = "Keeps posts you've already scrolled past out of the feed when it loads again, for 1, 3, 7 or 30 " +
        "days. The list stays on your phone. Turn it on under News feed.",
    default = false,
) {
    category("Feed")
    dependsOn(settingsPatch, feedFilterHookPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val seen = findSeenMethod()
        val unit = seen.parameterTypes.size - 1
        mutableClassDefBy(seen.definingClass).findMutableMethodOf(seen).addInstructions(
            0,
            // A range call takes any register, where a plain one only reaches v0 to v15.
            "invoke-static/range { v${seen.parameterRegisterNumber(unit)} .. v${seen.parameterRegisterNumber(unit)} }, $SEEN",
        )
        enableStatus("seenPosts")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/**
 * Whether [method] is the viewport logger's seen-state saver: an instance method of two parameters
 * that returns nothing, loads [SEEN_TRACE], and reads the unit's id through [CACHE_ID_READER].
 */
internal fun isSeenMethod(method: Method): Boolean =
    method.name == SEEN_METHOD && !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
        method.parameterTypes.size == 2 && holdsString(method, SEEN_TRACE) && readsCacheId(method)

private fun readsCacheId(method: Method): Boolean = method.implementation?.instructions?.any {
    val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
    reference != null && reference.name == CACHE_ID_READER && reference.returnType == "Ljava/lang/String;" &&
        reference.parameterTypes.isEmpty()
} == true

/** The one method that saves the seen state. Changes nothing. */
internal fun BytecodePatchContext.findSeenMethod(): Method {
    val holders = classDefByStrings(SEEN_TRACE, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val methods = holders.flatMap { classDef -> classDef.methods.filter(::isSeenMethod) }
    return methods.singleOrNull()
        ?: refuse("expected one $SEEN_METHOD loading \"$SEEN_TRACE\" and reading $CACHE_ID_READER, found ${methods.size}")
}
