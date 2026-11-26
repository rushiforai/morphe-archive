package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * #240: the row of stories and notes above the chats, drawn smaller. The extension finds the row's list on screen and
 * sizes it there, so all it needs is each Messenger screen as it comes to the front: FbFragmentActivity.onResume, the
 * method [REFRESH_RATE] hooks too, found the same way. Each hook puts its own call first, so the two share the method.
 */
internal const val STORY_ROW_SIZE = "story_row_size"
internal const val STORY_ROW_SIZE_CALL = "Lapp/hushmessenger/extension/StoryRowSize;->resumed(Landroid/app/Activity;)V"

/** The method STORY_ROW_SIZE hooks, the one [findRefreshRate] finds. scripts/compat/Controls.java reuses refreshRate for it. */
internal fun findStoryRowSize(classes: Iterable<ClassDef>): List<Method> = findRefreshRate(classes)

/** Checks the hook's stock shape before anything is changed. */
internal fun MutableMethod.validateStoryRowSize() {
    if (!isScreenResume()) throw PatchException("Messenger controls: story_row_size expected FbFragmentActivity.onResume, not ${hookId()}")
}

/** Hands the screen to StoryRowSize.resumed before Messenger's own onResume work. */
internal fun MutableMethod.injectStoryRowSize() {
    validateStoryRowSize()
    addInstructions(0, "invoke-static/range {p0 .. p0}, $STORY_ROW_SIZE_CALL")
}
