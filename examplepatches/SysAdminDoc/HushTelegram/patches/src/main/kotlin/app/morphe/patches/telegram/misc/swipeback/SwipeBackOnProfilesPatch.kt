/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.swipeback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SWIPE_BACK = "$EXTENSION_PACKAGE/misc/SwipeBack;"
internal const val PROFILE_ACTIVITY = "Lorg/telegram/ui/ProfileActivity;"
internal const val PROFILE_SWIPE = "$PROFILE_ACTIVITY->isSwipeBackEnabled(Landroid/view/MotionEvent;)Z"
internal const val HIT_TEST = "Landroid/graphics/Rect;->contains(II)Z"
internal const val TOUCH_BLOCKS = "$SWIPE_BACK->touchBlocks(Z)Z"
private const val FIRST_TAB = "Lorg/telegram/ui/Components/ScrollSlidingTextTabStrip;->getFirstTabId()I"

@Suppress("unused")
val swipeBackOnProfilesPatch = bytecodePatch(
    name = "Swipe back on profiles",
    description = "Makes a swipe right on a profile's photos or media tabs go back, like the rest of the profile. " +
        "Starts off. Turn it on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveSwipeBackOnProfiles()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        site.insert(MutableMethod(ImmutableMethod.of(site.method)))
        site.insert(site.method)
        enableStatus("swipeBackOnProfiles")
    }
}

/** The profile's swipe check, whose two hit test answers land at [results]. */
internal class SwipeBackSite(val method: MutableMethod, val results: List<Int>) {
    /** Each answer passes through the extension into the same register, last first so the earlier index holds. */
    fun insert(target: MutableMethod) {
        for (index in results.sortedDescending()) {
            val register = target.controlBody()[index].namedRegisters().single()
            target.addInstructions(index + 1, """
                invoke-static/range {v$register .. v$register}, $TOUCH_BLOCKS
                move-result v$register
            """)
        }
    }
}

/**
 * The profile refuses a swipe back that starts on its photo gallery while it has more than one photo,
 * and one that starts on its shared media while a tab past the first is showing. Each refusal is a hit
 * test of the touch against that view, the photos first and the media second.
 */
internal fun BytecodePatchContext.resolveSwipeBackOnProfiles(): SwipeBackSite {
    requireStatusMethod("swipeBackOnProfiles")
    controlHook(SWIPE_BACK, "touchBlocks", listOf("Z"), "Z")

    val profile = mutableClassDefByOrNull(PROFILE_ACTIVITY)
    controlShape(profile != null, "ProfileActivity is missing")
    val method = profile!!.methods.filter { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == PROFILE_SWIPE }
        .controlSingle("profile swipe check")
    val body = method.controlBody()
    val tests = body.indices.filter { body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef() == HIT_TEST }
    controlShape(tests.size == 2, "the profile's swipe check no longer makes two hit tests")
    controlShape(tests.all { body.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT }, "the profile's swipe check no longer reads a hit test")
    val (photos, media) = tests
    val refs = body.map { it.controlRef() }
    // The photos count before their hit test, and the media tab is compared with the first one after its own.
    controlShape(refs.subList(0, photos).any { it?.endsWith("->getRealCount()I") == true },
        "the profile's swipe check no longer looks at the photo count")
    controlShape(refs.subList(media + 2, refs.size).let { after -> after.any { it?.endsWith("->getSelectedTab()I") == true } && FIRST_TAB in after },
        "the profile's swipe check no longer compares the media tab with the first one")
    // Only the answer itself leads on, so no path skips the extension.
    val flow = ControlFlow.of(method)
    controlShape(tests.all { test -> body.indices.filter { test + 2 in flow.normal[it] } == listOf(test + 1) },
        "something jumps past a hit test answer in the profile's swipe check")
    return SwipeBackSite(method, tests.map { it + 1 })
}
