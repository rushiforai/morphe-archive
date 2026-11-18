package io.github.jordanwoodson.patches.kick.hosting

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesOp
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "stay_on_host"

@Suppress("unused")
val stayOnChannelPatch = bytecodePatch(
    name = "Stay on channel when it hosts",
    description = "When the channel you're watching hosts another one, Kick's host dialog waits for you instead of " +
        "switching when its countdown ends: Watch now still switches, Cancel stays. Starts off. Turn it on in Lurk " +
        "settings > Interface." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch)

    execute {
        countdownAfterWatchNow()
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Stay on channel when it hosts",
                "The host dialog waits instead of counting down. Watch now still switches.",
                Section.INTERFACE,
                default = false,
                restart = true,
            ),
        )
    }
}

/**
 * `JoinHostDialogContent` is mounted with the stream screen and calls `useCountdown({duration, startOnMount: true,
 * onEnd})`. When it reaches zero, onEnd switches to the hosted channel on a stream, clip or VOD screen. Watch now
 * doesn't switch by itself: it sets the dialog's `pressed` state (which hides it) and shows a "taking you to ... in
 * N seconds" toast, and the countdown's end does the rest.
 *
 * The countdown now starts only once Watch now is pressed: `startOnMount` is `pressed` instead of true, so the
 * dialog waits, countdown paused, for Watch now, Cancel or close; useCountdown's start effect runs again when it
 * changes. The literal's startOnMount slot is a constant, so the store needs four bytes the function doesn't have:
 * the options object is made with the short NewObjectWithBuffer form instead of the long one, which leaves room for
 * the store right after it. Its 16-bit value offset reaches only the first 64 KiB of the literal buffer: a copy of the
 * same values there if there is one, else three nulls, since the dialog stores every slot (duration, startOnMount,
 * onEnd) before it hands the object to useCountdown, and nothing reads it in between.
 */
private fun countdownAfterWatchNow() {
    val dialog = kickHermes.function("JoinHostDialogContent")
    val code = kickHermes.instructions(dialog)
    fun fail(what: String): Nothing = throw PatchException("Kick: host dialog $what changed")

    // const [pressed, setPressed] = useState(false): the first IteratorNext after the useState read, copied once.
    val useState = code.singleOrNull { it.propertyId() == kickHermes.stringId("useState") } ?: fail("useState read")
    val next = code.firstOrNull { it.offset > useState.offset && it.opcode == HermesOp.ITERATOR_NEXT } ?: fail("state destructuring")
    val copy = code.firstOrNull { it.offset > next.offset && it.opcode == HermesOp.MOV && it.u8(2) == next.u8(1) }
        ?: fail("state destructuring")
    val pressed = copy.u8(1)

    val options = code.singleOrNull {
        it.opcode == HermesOp.NEW_OBJECT_WITH_BUFFER_LONG && kickHermes.objectKeys(it) == listOf("duration", "startOnMount", "onEnd")
    } ?: fail("countdown options")
    val target = options.u8(1)
    // PutOwnBySlotIdx rObject, rValue, slot: Kick fills duration and onEnd, then calls useCountdown with the object.
    fun store(slot: Int) = code.singleOrNull { it.opcode == HermesOp.PUT_OWN_BY_SLOT_IDX && it.u8(1) == target && it.u8(3) == slot }
        ?: fail("countdown options slot $slot")
    store(0)
    val onEnd = store(2)
    if (code.any { it.opcode == HermesOp.PUT_OWN_BY_SLOT_IDX && it.u8(1) == target && it.u8(3) == 1 }) fail("countdown options")
    // Nothing writes the state register between its copy and the options object, so it still holds `pressed` there.
    // Writes name their register first; jumps start with an offset.
    if (code.any { it.offset in (copy.offset + 1) until options.offset && it.targets().isEmpty() &&
            it.bytes.size > 1 && it.u8(1) == pressed }) {
        fail("state register")
    }
    if (onEnd.offset < options.offset) fail("countdown options order")

    val shape = options.u32(2)
    val values = options.u32(6)
    if (shape > 0xffff) fail("countdown options shape")
    val serialized = kickHermes.literal(values, kickHermes.valuesEnd(values, 3) - values)
    val short = kickHermes.shortLiteralOffset(serialized, 3) ?: kickHermes.shortNullsOffset(3)
    val after = byteArrayOf(
        HermesOp.NEW_OBJECT_WITH_BUFFER.toByte(), target.toByte(),
        shape.toByte(), (shape ushr 8).toByte(), short.toByte(), (short ushr 8).toByte(),
        HermesOp.PUT_OWN_BY_SLOT_IDX.toByte(), target.toByte(), pressed.toByte(), 1,
    )
    kickHermes.replaceInstruction(dialog, KEY, options, after, defaultEnabled = false)
}
