/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/16464b2ba606745de0ebe9cc52f18ef42e6a05d8/patches/src/main/kotlin/app/andrewliang/patches/facebook/hidepostprompts/HidePostPromptsPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: each answer goes through a switch instead of
 * being replaced.
 */
package app.morphe.patches.facebook.feed.postprompts

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.filterBooleanReturns
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

internal const val PATCH = "Hide post prompts"

/** The name the bumper component gives itself, in its constructor and one other method. */
internal const val BUMPER_COMPONENT = "NTFeedStoryBumperComponent"

internal const val POST_PROMPTS = "Lapp/morphe/extension/facebook/feed/PostPrompts;"
internal const val KEEP = "$POST_PROMPTS->keep(I)Z"

/**
 * The strip Facebook draws on some posts ("Are you interested in this post?", "Show less", who
 * recently commented, follow, chat and post suggestions) goes. On 580 the recently commented one
 * sits above the post's header. Facebook calls it a story bumper, and
 * NTFeedStoryBumperComponent (580 `LX/2Zb;`, 577 `LX/2Xd;`) has one static predicate, (props) -> Z,
 * that answers whether a story has one. The bumper plugin and every row that makes room for a
 * bumper ask it, so a no leaves the post as Facebook draws it without a bumper, gap included. Each
 * of its answers goes through the extension, which turns a yes into a no while the switch is on.
 */
@Suppress("unused")
val hidePostPromptsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Hide post prompts",
    description = "Removes the strip Facebook adds to some posts, like \"Are you interested in this post?\", " +
        "\"Show less\", who recently commented, or follow and chat suggestions, with no gap left behind. " +
        "The post stays.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val check = findBumperCheck()
        mutableClassDefBy(check.definingClass).findMutableMethodOf(check).filterBooleanReturns(PATCH, KEEP)
        enableStatus("postPrompts")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** Whether [classDef] is the bumper component: its public no-argument constructor loads [BUMPER_COMPONENT]. */
internal fun isBumperComponent(classDef: ClassDef): Boolean = classDef.methods.any {
    it.name == "<init>" && AccessFlags.PUBLIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() &&
        holdsString(it, BUMPER_COMPONENT)
}

/** Whether [method] is the component's has-bumper predicate: static, one argument, answering Z. */
internal fun isBumperCheck(method: Method): Boolean =
    AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" && method.parameterTypes.size == 1 &&
        method.implementation != null

/** The bumper component's has-bumper predicate. Changes nothing. */
internal fun BytecodePatchContext.findBumperCheck(): Method {
    val components = classDefByStrings(BUMPER_COMPONENT, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .filter(::isBumperComponent)
    val component = components.singleOrNull()
        ?: refuse("expected one class whose no-argument constructor loads \"$BUMPER_COMPONENT\", found ${components.size}")
    val checks = component.methods.filter(::isBumperCheck)
    return checks.singleOrNull()
        ?: refuse("expected one static (props) -> Z predicate on ${component.type}, found ${checks.size}")
}
