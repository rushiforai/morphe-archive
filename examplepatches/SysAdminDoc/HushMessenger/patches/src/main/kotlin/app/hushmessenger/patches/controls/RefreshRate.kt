package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * #208: the refresh rate Messenger's screens ask Android for. Nearly every Messenger screen is an FbFragmentActivity,
 * which keeps its real name in every build, and its onResume runs each time the screen comes to the front. The extension
 * gets the screen there, first thing, and sets the window's preferred display mode.
 */
internal const val REFRESH_RATE = "refresh_rate"
internal const val REFRESH_RATE_CALL = "Lapp/hushmessenger/extension/RefreshRate;->resumed(Landroid/app/Activity;)V"

/** FbFragmentActivity.onResume: an instance method with code that takes nothing and returns nothing. */
internal fun Method.isScreenResume() = definingClass == FB_FRAGMENT_ACTIVITY && name == "onResume" &&
    parameterTypes.isEmpty() && returnType == "V" && !AccessFlags.STATIC.isSet(accessFlags) &&
    !AccessFlags.ABSTRACT.isSet(accessFlags) && implementation != null

/** The methods REFRESH_RATE hooks, by their shape on the stock builds. scripts/compat/Looks.java's refreshRate mirrors it. */
internal fun findRefreshRate(classes: Iterable<ClassDef>): List<Method> {
    val found = classes.filter { it.type == FB_FRAGMENT_ACTIVITY }.flatMap { it.methods }.filter { it.isScreenResume() }
    return if (found.size == 1) found else emptyList()
}

/** Checks a hook's stock shape before anything is changed, and refuses a shape it doesn't know. */
internal fun MutableMethod.validateRefreshRate() {
    if (!isScreenResume()) throw PatchException("Messenger controls: refresh_rate expected FbFragmentActivity.onResume, not ${hookId()}")
}

/** Hands the screen to RefreshRate.resumed before Messenger's own onResume work. */
internal fun MutableMethod.injectRefreshRate() {
    validateRefreshRate()
    addInstructions(0, "invoke-static/range {p0 .. p0}, $REFRESH_RATE_CALL")
}
