/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.progressbar

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val PATCH = "Keep the progress bar"

/** The name the Reels viewer's bottom progress bar plugin gives itself, a kept literal. */
internal const val REEL_SEEK_BAR_PLUGIN = "FbShortsViewerBottomSeekBarPlugin"

/**
 * The trace names the unified video scrubber (the Reels viewer's bar on 581) gives its two looks:
 * full size, with the thumb showing, and the thin passive line. Kept literals, one per method.
 */
internal const val SCRUBBER_ACTIVE = "VDDScrubberPlugin.updateToActiveScrubber"
internal const val SCRUBBER_PASSIVE = "VDDScrubberPlugin.updateToPassiveScrubber"

/** A kept class whose superclass is the full-screen video controls every such player builds on. */
internal const val FULLSCREEN_CONTROLS = "Lcom/facebook/feed/video/fullscreen/orion/FeedFullscreenVideoControlsPlugin;"

internal const val SEEK_BAR = "Landroid/widget/SeekBar;"
internal const val SET_ALPHA = "Landroid/graphics/drawable/Drawable;->setAlpha(I)V"
internal const val SET_ENABLED = "Landroid/view/View;->setEnabled(Z)V"
internal const val SEND_DELAYED = "Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z"
internal const val REMOVE_MESSAGES = "Landroid/os/Handler;->removeMessages(I)V"

internal const val PROGRESS_BAR = "$EXTENSION_PACKAGE/media/ProgressBar;"
internal const val KEEPS_REEL_BAR = "$PROGRESS_BAR->keepsReelBar()Z"
internal const val KEEPS_CONTROLS = "$PROGRESS_BAR->keepsControls()Z"
internal const val HIDE_TIME_LABEL = "$PROGRESS_BAR->hideTimeLabel(Landroid/view/ViewGroup;)V"
internal const val VIEW_GROUP = "Landroid/view/ViewGroup;"

/**
 * Keeps a video's progress bar on screen, in the players that hide theirs a few seconds in.
 *
 * The unified video scrubber, which is the bar of 581's Reels viewer, has an "active" look (full
 * height track, thumb at full alpha) and a "passive" one (a 2 dp line, thumb hidden) that Facebook
 * switches to before a touch and again about a second after a drag ends. Both are `()V` methods
 * that begin by tracing their own name, [SCRUBBER_ACTIVE] and [SCRUBBER_PASSIVE] (581 `LX/RV4;`
 * `A18` and `A19`, 580 `LX/Rln;` `A15` and `A16`, 577 `LX/SHD;` `A18` and `A19`). The extension
 * goes first in the passive one, and while the switch is on it runs the active one instead, then
 * hides the scrubber's time label and returns. The passive look hides that label (a ViewGroup
 * holding the elapsed and total time, `A09` of the scrubber's views holder) and the active one
 * shows it, and only a drag updates the times, so without the hide the label would sit frozen at
 * 0:00 over the reel's author row. A drag still shows it, as the touch path calls the active look
 * itself and the seek bar listener sets the label's visibility.
 *
 * Older builds' Reels viewer used a bottom bar plugin, named [REEL_SEEK_BAR_PLUGIN], sizes its SeekBar with two
 * static (SeekBar, plugin) methods (581 `LX/8sg;->A00` and `A01`, still present on every declared
 * build): one shrinks it to a 2 dp line,
 * hides the thumb and turns drags off, the other makes it full size with the thumb at full alpha
 * and drags on. Facebook shrinks it when a reel's controls go away and when the reel plays on, so
 * the extension goes first in the shrinking one, and while the switch is on it calls the other
 * instead and returns.
 *
 * A full-screen video's controls are a plugin built on one class, the superclass of the kept
 * [FULLSCREEN_CONTROLS] (581 `LX/ReC;`, 580 `LX/RuU;`, 577 `LX/SHr;`), which also carries Orion,
 * live and Watch and more controls. Its one method that calls [SEND_DELAYED] (581 `A16`) sets the
 * timer whose message fades the controls out, each time they show and each time they're touched.
 * The extension goes first there, and while the switch is on no timer is set, so the controls and
 * their bar stay until a tap hides them the way it always has.
 *
 * In the default selection with its switch off: it only acts once the switch is turned on.
 */
@Suppress("unused")
val keepProgressBarPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Keep the progress bar",
    description = "Keeps the progress bar of reels at full size, so you can drag it without tapping first, and " +
        "keeps a full-screen video's controls on screen until you tap. Its switch starts off, under Playback.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // Everything is found before anything changes, so a build missing one part is left as it was.
        val scrubber = vddScrubber(
            classDefByStrings(SCRUBBER_PASSIVE, StringComparisonType.EQUALS)
                .filterNot { it.type.startsWith(EXTENSION_CLASSES) },
        )
        // The older bottom bar plugin is kept hooked where a build still has it, but needn't exist.
        val pluginHolders = classDefByStrings(REEL_SEEK_BAR_PLUGIN, StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val plugin = if (pluginHolders.isEmpty()) null else reelSeekBarPlugin(pluginHolders)
        val sizes = plugin?.let { barSizes(it) }
        val controls = classDefByOrNull(FULLSCREEN_CONTROLS)?.superclass
            ?.let { classDefByOrNull(it) }
            ?: refuse("FeedFullscreenVideoControlsPlugin or the controls class it extends isn't in this APK")
        val timer = fadeTimer(controls)

        mutableClassDefBy(scrubber.type).methods.single { it.sameAs(scrubber.passive) }
            .activeInstead(scrubber)
        if (plugin != null && sizes != null) {
            mutableClassDefBy(plugin.type).methods.single { it.sameAs(sizes.shrink) }
                .fullSizeInstead(plugin.type, sizes.fullSize)
        }
        mutableClassDefBy(controls.type).methods.single { it.sameAs(timer) }.noTimerWhileKept()
        enableStatus("keepProgressBar")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

private fun Method.calls(reference: String) = implementation?.instructions?.any {
    it.opcode.name.startsWith("invoke") && (it as ReferenceInstruction).reference.toString() == reference
} == true

/**
 * The Reels viewer's bottom progress bar plugin: the one class of [holders] with a `()String`
 * method loading [REEL_SEEK_BAR_PLUGIN], the name the plugin gives itself.
 */
internal fun reelSeekBarPlugin(holders: List<ClassDef>): ClassDef {
    val plugins = holders.filter { holder ->
        methodsHolding(holder, REEL_SEEK_BAR_PLUGIN).any {
            it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }
    }.distinctBy { it.type }
    return plugins.singleOrNull()
        ?: refuse("expected one plugin naming itself \"$REEL_SEEK_BAR_PLUGIN\", found ${plugins.size}")
}

/** The unified scrubber's class and its two looks. */
internal class ScrubberLooks(
    val type: String,
    val active: Method,
    val passive: Method,
    /** The scrubber's field holding its views (581 `A0I`), and the time label field in that holder (`A09`). */
    val viewsField: String,
    val labelField: String,
)

/**
 * The scrubber class: the one of [holders] with an instance `()V` method tracing
 * [SCRUBBER_ACTIVE] and another tracing [SCRUBBER_PASSIVE]. Refuses unless there's exactly one
 * such class with exactly one method of each.
 */
internal fun vddScrubber(holders: List<ClassDef>): ScrubberLooks {
    fun look(holder: ClassDef, string: String) = methodsHolding(holder, string).filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.parameterTypes.isEmpty()
    }
    val scrubbers = holders.distinctBy { it.type }.filter { look(it, SCRUBBER_ACTIVE).size == 1 && look(it, SCRUBBER_PASSIVE).size == 1 }
    val scrubber = scrubbers.singleOrNull()
        ?: refuse("expected one class tracing both \"$SCRUBBER_ACTIVE\" and \"$SCRUBBER_PASSIVE\", found ${scrubbers.size}")
    val passive = look(scrubber, SCRUBBER_PASSIVE).single()
    val (viewsField, labelField) = timeLabelFields(scrubber.type, passive)
    return ScrubberLooks(scrubber.type, look(scrubber, SCRUBBER_ACTIVE).single(), passive, viewsField, labelField)
}

/**
 * The time label's two fields, read from the passive look, which hides the label: the one
 * `iget-object` of a [VIEW_GROUP] field in it, straight after the `iget-object` of the scrubber's
 * own field that holds the views class declaring it. Refuses unless that's exactly one field.
 */
internal fun timeLabelFields(scrubber: String, passive: Method): Pair<String, String> {
    val code = passive.implementation!!.instructions.toList()
    val found = code.indices.mapNotNull { index ->
        val label = (code[index] as? ReferenceInstruction)?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.reference as? FieldReference
        val views = (code.getOrNull(index - 1) as? ReferenceInstruction)?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.reference as? FieldReference
        if (label != null && views != null && label.type == VIEW_GROUP && views.definingClass == scrubber &&
            views.type == label.definingClass
        ) {
            views.toString() to label.toString()
        } else {
            null
        }
    }.distinct()
    return found.singleOrNull()
        ?: refuse("$scrubber->${passive.name} reads ${found.size} view group fields off the scrubber's views, expected the one time label")
}

/** The plugin's two size methods. */
internal class BarSizes(val shrink: Method, val fullSize: Method)

/**
 * The plugin's static `(SeekBar, plugin)V` size methods, both setting the thumb's alpha and whether
 * the bar takes drags: the full-size one loads 255 for the alpha, the shrinking one doesn't.
 * Refuses unless there's exactly one of each.
 */
internal fun barSizes(plugin: ClassDef): BarSizes {
    val sizes = plugin.methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.map(CharSequence::toString) == listOf(SEEK_BAR, plugin.type) &&
            method.calls(SET_ALPHA) && method.calls(SET_ENABLED)
    }
    val (fullSize, shrink) = sizes.partition { method ->
        method.implementation!!.instructions.any { (it as? WideLiteralInstruction)?.wideLiteral == 255L }
    }
    if (fullSize.size != 1 || shrink.size != 1) {
        refuse(
            "${plugin.type} has ${fullSize.size} method(s) making its SeekBar full size and ${shrink.size} " +
                "shrinking it, expected one of each",
        )
    }
    return BarSizes(shrink.single(), fullSize.single())
}

/**
 * The full-screen controls' fade timer: the one instance `()V` method of [controls] that calls
 * [SEND_DELAYED], after [REMOVE_MESSAGES] drops the timer already set.
 */
internal fun fadeTimer(controls: ClassDef): Method {
    val timers = controls.methods.filter { it.calls(SEND_DELAYED) }
    val timer = timers.singleOrNull()
        ?: refuse("${controls.type} sets a delayed message in ${timers.size} methods, expected one, its fade timer")
    if (AccessFlags.STATIC.isSet(timer.accessFlags) || timer.returnType != "V" || timer.parameterTypes.isNotEmpty() ||
        !timer.calls(REMOVE_MESSAGES)
    ) {
        refuse("${controls.type}->${timer.name}, its fade timer, is no longer an instance ()V that drops the old timer first")
    }
    return timer
}

/**
 * First thing in the scrubber's passive look: while the extension keeps the bar, run the active
 * look on the same instance, hide the time label the way the passive look does, and return.
 * Otherwise Facebook's own code runs from its first instruction. The range form names p0, which
 * can sit past v15 in these long methods, and so does the move that reads it into v0 (format 22x).
 */
internal fun MutableMethod.activeInstead(looks: ScrubberLooks) {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $KEEPS_REEL_BAR
            move-result v0
            if-eqz v0, :facebook
            invoke-virtual/range { p0 .. p0 }, ${looks.type}->${looks.active.name}()V
            move-object/from16 v0, p0
            iget-object v0, v0, ${looks.viewsField}
            iget-object v0, v0, ${looks.labelField}
            invoke-static { v0 }, $HIDE_TIME_LABEL
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}

/**
 * First thing in the method that shrinks the bar: while the extension keeps it, call [fullSize]
 * with the same two arguments and return, so the bar is made full size instead. Otherwise
 * Facebook's own code runs from its first instruction.
 */
internal fun MutableMethod.fullSizeInstead(plugin: String, fullSize: Method) {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $KEEPS_REEL_BAR
            move-result v0
            if-eqz v0, :facebook
            invoke-static { p0, p1 }, $plugin->${fullSize.name}($SEEK_BAR$plugin)V
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}

/**
 * First thing in the fade timer: while the extension keeps the controls, return without setting
 * a timer. Otherwise Facebook's own code runs from its first instruction.
 */
internal fun MutableMethod.noTimerWhileKept() {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $KEEPS_CONTROLS
            move-result v0
            if-eqz v0, :facebook
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
