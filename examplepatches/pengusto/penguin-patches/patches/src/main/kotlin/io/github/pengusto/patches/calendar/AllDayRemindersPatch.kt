package io.github.pengusto.patches.calendar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.*
import io.github.pengusto.patches.codeDigest

private const val eventActivity = "Lorg/fossify/calendar/activities/EventActivity;"
private const val settingsActivity = "Lorg/fossify/calendar/activities/SettingsActivity;"
private const val activity = "Landroid/app/Activity;"
private const val contextType = "Landroid/content/Context;"
private const val bundle = "Landroid/os/Bundle;"
private const val reminders = "Lio/github/pengusto/patches/extension/calendarreminders/AllDayReminders;"
private const val bindings = "Lio/github/pengusto/patches/extension/calendarreminders/CalendarHooks;"

@Suppress("unused")
val allDayRemindersPatch = bytecodePatch(
    name = "Separate all-day reminder defaults",
    description = "Choose three separate default reminders for new all-day events in Calendar settings. Keeps timed-event defaults, existing events and the use-last-reminders setting.",
    default = true,
) {
    compatibleWith(Compatibility(name = "Fossify Calendar", packageName = "org.fossify.calendar",
        targets = listOf(AppTarget(version = "1.12.0"))))
    extendWith("extensions/calendarreminders.mpe")
    execute {
        mapOf(
            "Lcp0;" to "33996e1d2cce9c3d6efacfff279c9b8fd26f90c00174e3eb037b19e4263d9754",
            eventActivity to "95f13f1ab3e117f6a546608dbf67811d1dec313a631a0f48e6cb7f30703abbff",
            settingsActivity to "a5f774d78b3c85484471cb1f73653ef68283366b95e816b067874339bcb871f7",
        ).forEach { (type, hash) ->
            // The independently selectable HTML patch only changes EventActivity.onResume.
            check(classDefBy(type).codeDigest { type != eventActivity || it.name != "onResume" } == hash) {
                "Unsupported or already patched Calendar bytecode: $type. Use the original official 1.12.0 APK."
            }
        }
        fun method(owner: String, name: String, vararg parameters: String) =
            Fingerprint(definingClass = owner, name = name, parameters = parameters.toList()).method
        fun MutableMethod.body(registers: Int, code: String) {
            val replacement = MutableMethod(ImmutableMethod(definingClass, name, parameters,
                returnType, accessFlags, annotations, hiddenApiRestrictions,
                ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, code.trimIndent())
            mutableClassDefBy(definingClass).methods.apply {
                check(remove(this@body)) { "Missing Calendar binding: ${this@body}" }
                add(replacement)
            }
        }
        fun MutableMethod.beforeReturns(code: String) {
            implementation!!.instructions.indices.filter {
                implementation!!.instructions[it].opcode == Opcode.RETURN_VOID
            }.reversed().forEach { addInstructions(it, code) }
        }

        val fresh = method("Lcp0;", "run")
        val instructions = fresh.implementation!!.instructions
        val starts = instructions.indices.filter { i ->
            val field = (instructions[i] as? ReferenceInstruction)?.reference as? FieldReference
            field?.definingClass == eventActivity && field.name == "b0" &&
                instructions[i].opcode == Opcode.IPUT && instructions[i + 1].opcode == Opcode.IF_NEZ
        }
        check(starts.size == 1) { "Unexpected fresh Calendar draft branch" }
        val start = starts.single()
        val owner = (instructions[start] as TwoRegisterInstruction).registerB
        val ends = instructions.indices.filter { i ->
            val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == eventActivity && ref.name == "r0" && ref.parameterTypes.isEmpty()
        }
        check(ends.size == 1) { "Unexpected Calendar gotEvent completion" }
        val end = ends.single()
        val endOwner = (instructions[end] as FiveRegisterInstruction).registerC
        fresh.addInstructions(end + 1,
            "invoke-static/range {v$endOwner .. v$endOwner}, $reminders->complete($activity)V")
        // Skip saved-instance restoration; existing events and duplicates use another branch.
        fresh.addInstructions(start + 2,
            "invoke-static/range {v$owner .. v$owner}, $reminders->begin($activity)V")
        // R8 reuses p1 for objects inside v0; capture the boolean at entry.
        // Native toggling only updates dates/times and does not rewrite reminders.
        method(eventActivity, "v0", "Z").addInstructions(0,
            "invoke-static/range {p0 .. p1}, $reminders->toggle(${activity}Z)V")
        method(eventActivity, "onSaveInstanceState", bundle).addInstructions(0,
            "invoke-static/range {p0 .. p1}, $reminders->save($activity$bundle)V")
        method(eventActivity, "onRestoreInstanceState", bundle).addInstructions(0,
            "invoke-static/range {p0 .. p1}, $reminders->restore($activity$bundle)V")
        method(settingsActivity, "onResume").beforeReturns(
            "invoke-static/range {p0 .. p0}, $reminders->settings($activity)V")
        // R8 also reuses this method's p0 for the native holder array.
        method(settingsActivity, "Z", "Z").addInstructions(0,
            "invoke-static/range {p0 .. p1}, $reminders->visibility(${activity}Z)V")

        val fields = listOf("Z", "a0", "b0", "c0", "d0", "e0")
        method(bindings, "read", activity).body(5, buildString {
            appendLine("check-cast p0, $eventActivity")
            appendLine("const/4 v0, 0x6\nnew-array v0, v0, [I")
            fields.forEachIndexed { index, field ->
                appendLine("const/4 v1, $index\niget v2, p0, $eventActivity->$field:I\naput v2, v0, v1")
            }
            appendLine("return-object v0")
        })
        method(bindings, "write", activity, "[I").body(4, buildString {
            appendLine("check-cast p0, $eventActivity")
            fields.forEachIndexed { index, field ->
                appendLine("const/4 v0, $index\naget v1, p1, v0\niput v1, p0, $eventActivity->$field:I")
            }
            appendLine("invoke-virtual {p0}, $eventActivity->U()V\nreturn-void")
        })
        method(bindings, "reuse", contextType).body(1, """
            invoke-static {p0}, Lr50;->h($contextType)Ly10;
            move-result-object p0
            invoke-virtual {p0}, Ly10;->i0()Z
            move-result p0
            return p0
        """)
        method(bindings, "format", contextType, "I").body(2, """
            invoke-static {p0, p1}, Lu91;->R(${contextType}I)Ljava/lang/String;
            move-result-object p0
            return-object p0
        """)
        method(bindings, "allDay", activity, "Z").body(3, """
            check-cast p0, $eventActivity
            invoke-virtual {p0}, $eventActivity->c0()Lz3;
            move-result-object v0
            iget-object v0, v0, Lz3;->h:Lorg/fossify/commons/views/MyMaterialSwitch;
            invoke-virtual {v0, p1}, Lw03;->setChecked(Z)V
            return-void
        """)
    }
}
