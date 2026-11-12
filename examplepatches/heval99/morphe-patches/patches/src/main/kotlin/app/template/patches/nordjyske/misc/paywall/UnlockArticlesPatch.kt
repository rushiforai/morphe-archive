package app.template.patches.nordjyske.misc.paywall

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NORDJYSKE
import app.template.patches.shared.Constants.COMPATIBILITY_FYENS
import app.template.patches.shared.Constants.COMPATIBILITY_STIFTEN
import app.template.patches.shared.Constants.COMPATIBILITY_JYDSKEVESTKYSTEN

// PugPig Bolt keeps its domain classes unobfuscated; Story is the article model shared by all
// PugPig readers.
private const val STORY = "Lcom/kaldorgroup/pugpigbolt/domain/Story;"

/**
 * Nordjyske is a PugPig Bolt reader. Every paywall decision funnels through
 * `Story.isLocked()`, which is literally `!isEntitled()`, and all three paywall managers
 * (standard, metered, Zephr) call it. Making `isEntitled()` answer true marks every story as
 * entitled, so the reader renders the article instead of the paywall fragment.
 *
 * The story JSON is what the PugPig content API delivered; if the server only sends a preview for
 * a locked story, the unlocked view shows that preview. Verified statically and at runtime before
 * shipping.
 */
@Suppress("unused")
val unlockArticlesPatch = bytecodePatch(
    name = "Unlock articles",
    description = "Treats every article as entitled, so the paywall is not shown.",
) {
    compatibleWith(COMPATIBILITY_NORDJYSKE, COMPATIBILITY_FYENS, COMPATIBILITY_STIFTEN, COMPATIBILITY_JYDSKEVESTKYSTEN)

    execute {
        val story = mutableClassDefBy(STORY)
        val isEntitled = story.methods.singleOrNull {
            it.name == "isEntitled" && it.returnType == "Z" &&
                it.parameterTypes.isEmpty() && it.implementation != null
        } ?: throw PatchException("$STORY.isEntitled() not found")
        isEntitled.returnEarly(true)
    }
}
