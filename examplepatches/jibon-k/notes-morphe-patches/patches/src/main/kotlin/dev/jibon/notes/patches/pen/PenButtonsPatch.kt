package dev.jibon.notes.patches.pen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.jibon.notes.patches.compat.frameworkCompatPatch
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES
import dev.jibon.notes.patches.shared.featureFingerprint

private const val PEN_SETTINGS = "Lsamsungcompat/PenButtonSettings;"
private const val COMPOSER = "Lcom/samsung/android/support/senl/nt/composer/main/base/BaseComposerActivity;"

/** Note list: the key code read in dispatchKeyEvent. */
private object NoteListKeyFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/app/main/common/view/NotesPenRecyclerView;",
    name = "dispatchKeyEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/KeyEvent;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/view/KeyEvent;", name = "getKeyCode"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

/** Main settings screen: the preferences are loaded from XML, then the extension adds its row. */
private object SettingsScreenFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/app/settings/main/SettingsMainFragment;",
    name = "onCreatePreferences",
    returnType = "V",
    filters = listOf(methodCall(name = "addPreferencesFromResource")),
)

@Suppress("unused")
val penButtonsPatch = bytecodePatch(
    name = "Pen button actions",
    description = "Lets the pen's two buttons run actions (pen, eraser, undo, colour picker, page up/down...) " +
        "with single, double and long press. Set up in Settings > Pen button actions. Works with pens whose " +
        "buttons send key presses (the Redmi Smart Pen sends Page Up / Page Down).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch)

    val upperKey by intOption(
        key = "upperKey",
        default = 92,
        values = mapOf("Page Up (Redmi Smart Pen)" to 92, "Volume up" to 24),
        title = "Upper button key code",
        description = "Android key code the pen's upper button sends. Find it with `adb shell getevent -l` or a key tester app.",
        required = true,
    )
    val lowerKey by intOption(
        key = "lowerKey",
        default = 93,
        values = mapOf("Page Down (Redmi Smart Pen)" to 93, "Volume down" to 25),
        title = "Lower button key code",
        description = "Android key code the pen's lower button sends.",
        required = true,
    )
    val deviceName by stringOption(
        key = "deviceName",
        default = "Redmi Smart Pen",
        values = mapOf("Redmi Smart Pen" to "Redmi Smart Pen", "Any stylus" to "@stylus", "Any device" to ""),
        title = "Pen device name",
        description = "Only keys from an input device whose name contains this count as pen buttons. " +
            "@stylus: any device that reports itself as a stylus. Empty: any device (a keyboard's " +
            "Page Up / Page Down would then run pen actions too). Buttons learned in the app " +
            "(Settings > Pen button actions > Learn buttons) replace these options.",
    )

    execute {
        featureFingerprint("penKeyUpper").method.returnEarly(upperKey!!)
        featureFingerprint("penKeyLower").method.returnEarly(lowerKey!!)
        featureFingerprint("penDeviceName").method.returnEarly(deviceName ?: "")

        // Note list: replace the key code with the mapped one; -2 = consumed by a pen action.
        NoteListKeyFingerprint.let {
            val moveResult = it.instructionMatches.last()
            val keyRegister = moveResult.getInstruction<OneRegisterInstruction>().registerA
            val index = moveResult.index + 1
            it.method.apply {
                val free = findFreeRegister(index, keyRegister)
                addInstructionsWithLabels(
                    index,
                    """
                        invoke-static {p0, p1}, $PEN_SETTINGS->mapKeyCode(Landroid/view/View;Landroid/view/KeyEvent;)I
                        move-result v$keyRegister
                        const/4 v$free, -0x2
                        if-ne v$keyRegister, v$free, :not_consumed
                        const/4 v$free, 0x1
                        return v$free
                    """,
                    ExternalLabel("not_consumed", getInstruction(index)),
                )
            }
        }

        // Editor: handle pen keys in dispatchKeyEvent, before the editor's own key handling.
        mutableClassDefBy(COMPOSER).apply {
            val existing = methods.firstOrNull { method ->
                method.name == "dispatchKeyEvent" && method.parameterTypes.map { p -> p.toString() } == listOf("Landroid/view/KeyEvent;")
            }
            if (existing != null) {
                val free = existing.findFreeRegister(0)
                existing.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0, p1}, $PEN_SETTINGS->handleKey(Landroid/content/Context;Landroid/view/KeyEvent;)Z
                        move-result v$free
                        if-eqz v$free, :not_consumed
                        return v$free
                    """,
                    ExternalLabel("not_consumed", existing.getInstruction(0)),
                )
            } else {
                methods.add(
                    ImmutableMethod(
                        type, "dispatchKeyEvent",
                        listOf(ImmutableMethodParameter("Landroid/view/KeyEvent;", null, null)),
                        "Z", AccessFlags.PUBLIC.value, null, null,
                        MutableMethodImplementation(3),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                invoke-static {p0, p1}, $PEN_SETTINGS->handleKey(Landroid/content/Context;Landroid/view/KeyEvent;)Z
                                move-result v0
                                if-eqz v0, :call_super
                                return v0
                                :call_super
                                invoke-super {p0, p1}, $superclass->dispatchKeyEvent(Landroid/view/KeyEvent;)Z
                                move-result v0
                                return v0
                            """,
                        )
                    },
                )
            }
        }

        // Settings > Pen button actions.
        SettingsScreenFingerprint.let {
            it.method.addInstruction(
                it.instructionMatches.first().index + 1,
                "invoke-static {p0}, $PEN_SETTINGS->addSettingsEntry(Ljava/lang/Object;)V",
            )
        }
    }
}
