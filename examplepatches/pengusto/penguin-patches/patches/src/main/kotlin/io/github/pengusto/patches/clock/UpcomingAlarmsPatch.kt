package io.github.pengusto.patches.clock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import io.github.pengusto.patches.codeDigest

private const val context = "Landroid/content/Context;"
private const val alarm = "Lorg/fossify/clock/models/Alarm;"
private const val intent = "Landroid/content/Intent;"
private const val pending = "Landroid/app/PendingIntent;"
private const val runtime = "Lio/github/pengusto/patches/extension/clock/UpcomingAlarms;"
private const val hooks = "Lio/github/pengusto/patches/extension/clock/ClockHooks;"
private const val receivers = "Lorg/fossify/clock/receivers/"

@Suppress("unused")
val upcomingAlarmsPatch = bytecodePatch(
    name = "Choose upcoming alarm notification time",
    description = "Choose the advance notice in Morphe, with separate notifications and skip actions for each alarm occurrence. Keeps native ringing times and alarm definitions.",
    default = true,
) {
    compatibleWith(Compatibility(name = "Fossify Clock", packageName = "org.fossify.clock",
        targets = listOf(AppTarget(version = "1.6.0"))))
    extendWith("extensions/clock.mpe")
    val lead = intOption(
        key = "leadMinutes", default = 120,
        values = linkedMapOf("10 minutes" to 10, "30 minutes" to 30, "1 hour" to 60,
            "2 hours" to 120, "6 hours" to 360, "12 hours" to 720, "24 hours" to 1440),
        title = "Upcoming alarm notice (minutes)",
        description = "Minutes before each alarm, from 1 to 1440. Chosen when patching; patch the original APK again to change it.",
        required = true,
    )
    execute {
        // Desktop silently falls back to the default when an option validator rejects
        // a value. Validate here so an out-of-range request fails the patch instead.
        val leadMinutes = lead.value
        require(leadMinutes != null && leadMinutes in 1..1440) {
            "Invalid leadMinutes: choose a whole number from 1 to 1440."
        }
        fun MutableMethod.body(registers: Int, code: String) {
            val replacement = MutableMethod(ImmutableMethod(definingClass, name, parameters,
                returnType, accessFlags, annotations, hiddenApiRestrictions,
                ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, code.trimIndent())
            mutableClassDefBy(definingClass).methods.apply {
                check(remove(this@body)) { "Clock binding method was not present: ${this@body}" }
                add(replacement)
            }
        }
        val hashes = mapOf(
            "Lj5/e;" to "604e795647b94deeb8d7feca7f3ec7a21ddf0637d8f280ae989fd048898c5062",
            "Lm5/d;" to "2daff57670fc6072a5d7576d131fb1a65d0541f7afee448f36374207ad87b696",
            "Lm5/h;" to "669245148680adb9ac3ff0835bbae0f7af09e65355a402f80c1aaf8bc902fd0f",
            alarm to "16cf30b5e0e771694e8c847ec6ebe63010e74b99cdf9afeab5ee94fe8f268e16",
            "${receivers}AlarmReceiver;" to "0d0cf43fb473133a9185a3aee1956250a6b1d940c3ee93e4bae6c7d6ad154d2b",
            "${receivers}RescheduleAlarmsReceiver;" to "f9b79095a9079118fa27d34e6ca2ec5322e657a6c73d0c84e3c9e4fa1cc7f43b",
            "${receivers}SkipUpcomingAlarmReceiver;" to "dbce7cab4c828f21d73abb5a72675fe4ad2b47415a530d890ad6c80d89c174e3",
            "${receivers}UpcomingAlarmReceiver;" to "99fad6224f7f3f525ead1bb2847fe513b6aa6d52a462e96d3b3d4ad36898d27c",
        )
        hashes.forEach { (type, expected) ->
            check(classDefBy(type).codeDigest() == expected) {
                "Unsupported or already patched Clock bytecode: $type. Use the original official 1.6.0 APK."
            }
        }
        fun method(owner: String, name: String, vararg parameters: String) =
            Fingerprint(definingClass = owner, name = name, parameters = parameters.toList()).method

        method(runtime, "leadMinutes").body(1, "const/16 v0, $leadMinutes\nreturn v0")
        method("Lj5/e;", "x", context, alarm, "J").body(4, """
            invoke-static {p0, p1, p2, p3}, $runtime->setup($context${alarm}J)V
            return-void
        """)
        method("Lj5/e;", "a", context, alarm).body(2, """
            invoke-static {p0, p1}, $runtime->cancel($context$alarm)V
            return-void
        """)
        method("Lj5/e;", "v", context, alarm).body(3, """
            invoke-virtual {p1}, $alarm->getId()I
            move-result v0
            invoke-static {p0, v0}, $runtime->upcoming(${context}I)$pending
            move-result-object v0
            return-object v0
        """)
        for ((name, skip) in listOf("UpcomingAlarmReceiver" to 0, "SkipUpcomingAlarmReceiver" to 1)) {
            method("$receivers$name;", "onReceive", context, intent).body(4, """
                const/4 v0, $skip
                invoke-static {p0, p1, p2, v0}, $runtime->receive(Landroid/content/BroadcastReceiver;$context${intent}Z)V
                return-void
            """)
        }
        method("${receivers}AlarmReceiver;", "onReceive", context, intent).addInstructions(0,
            "invoke-static {p1, p2}, $runtime->ringing($context$intent)V")
        method("${receivers}RescheduleAlarmsReceiver;", "onReceive", context, intent).addInstructions(0,
            "invoke-static {p1}, $runtime->migrate($context)V")

        // Bind concrete APIs only after validating the actual R8 classes above.
        method(hooks, "mainIntent", context, alarm).body(2, """
            invoke-static {p0, p1}, Lj5/e;->g($context$alarm)$pending
            move-result-object p0
            return-object p0
        """)
        method(hooks, "openIntent", context).body(1, """
            invoke-static {p0}, Lj5/e;->q($context)$pending
            move-result-object p0
            return-object p0
        """)
        method(hooks, "alarm", context, "I").body(3, """
            invoke-static {p0}, Lj5/e;->l($context)Lm5/h;
            move-result-object v0
            invoke-virtual {v0, p1}, Lm5/h;->i(I)$alarm
            move-result-object v0
            return-object v0
        """)
        for (name in listOf("a", "b")) {
            mutableClassDefBy("Lm5/d;").methods.single { it.name == name }.apply {
                accessFlags = (accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value
            }
        }
        method(hooks, "finishOneTime", context, alarm).body(3, """
            invoke-static {p0}, Lj5/e;->f($context)Lm5/d;
            move-result-object v0
            invoke-virtual {v0, p1}, Lm5/d;->a($alarm)V
            return-void
        """)
        method(hooks, "refresh", context).body(1, """
            invoke-static {p0}, Lj5/e;->f($context)Lm5/d;
            move-result-object p0
            invoke-virtual {p0}, Lm5/d;->b()V
            return-void
        """)
        method(hooks, "error", context, "Ljava/lang/Exception;").body(2, """
            invoke-static {p0, p1}, Lf4/f;->Z(${context}Ljava/lang/Exception;)V
            return-void
        """)
        method(hooks, "is24Hour", context).body(1, """
            invoke-static {p0}, Lj5/e;->k($context)Lm5/e;
            move-result-object p0
            invoke-virtual {p0}, LJ5/c;->q()Z
            move-result p0
            return p0
        """)
    }
}
