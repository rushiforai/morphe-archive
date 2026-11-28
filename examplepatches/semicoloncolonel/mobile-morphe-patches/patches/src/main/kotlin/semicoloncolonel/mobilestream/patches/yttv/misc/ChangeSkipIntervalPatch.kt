package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Change skip interval.
//
// The player skips 15 seconds, and the amount comes from two places.
//
// The skip buttons (in the player, the mini player, picture-in-picture, the
// notification, and the media session) read two static fields of one
// constants class: the forward amount, 15000 ms, and the back amount,
// -15000 ms. The class is found by its static initializer, which sets those
// two values next to a "\n\n" string. The fields are set at run time, so
// callers read them, and new values written at the end of the initializer
// reach every button. The same initializer also sets a separate 15000 ms
// threshold for the "skip to start" logic, which this patch leaves alone.
//
// Double-tap reads its amount from a player-library method that returns a
// Duration: the value saved in the player's settings store, or a default of
// 15 seconds. YouTube TV writes that store on every launch, so the saved
// value always wins, and the method itself has to return the new amount. The
// "N seconds" label on the double-tap overlay is computed from the same
// method, so it changes too.
//
// The circular arrow icons on the skip buttons have "15" drawn into them, and
// they keep showing 15.
// ─────────────────────────────────────────────────────────────────────────────

private const val DURATION = "Lj\$/time/Duration;"

internal object SkipConstantsFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf("\n\n"),
    custom = { method, _ ->
        val literals = method.implementation?.instructions
            ?.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
            .orEmpty()
        15000L in literals && -15000L in literals && 4000L in literals && 10000L in literals
    },
)

// The double-tap amount: public final, no parameters, returns a Duration,
// reads the settings store's presence bit, and builds two Durations with
// Duration.ofSeconds(J). Its class keeps the app's Resources.
internal object DoubleTapSkipDurationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = DURATION,
    parameters = listOf(),
    custom = { method, classDef ->
        val calls = method.implementation?.instructions
            ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .orEmpty()
        calls.count { it.definingClass == DURATION && it.name == "ofSeconds" } == 2 &&
            classDef.fields.any { it.type == "Landroid/content/res/Resources;" } &&
            classDef.methods.any { m ->
                m.name == "<init>" && m.parameterTypes.size == 3 &&
                    m.parameterTypes.first().toString() == "Landroid/content/Context;"
            }
    },
)

@Suppress("unused")
val changeSkipIntervalPatch: BytecodePatch = bytecodePatch(
    name = "Change skip interval",
    description = "Changes how far the skip buttons and double-tap move in the player. The skip button icons keep showing 15, " +
        "and the button labels read by TalkBack follow the new interval.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(skipIntervalLabelsPatch)

    val seconds by stringOption(
        key = "skipSeconds",
        default = "10",
        values = mapOf(
            "5 seconds" to "5",
            "10 seconds" to "10",
            "15 seconds" to "15",
            "20 seconds" to "20",
            "30 seconds" to "30",
            "60 seconds" to "60",
        ),
        title = "Skip interval",
        description = "How many seconds the skip buttons and double-tap move, from 1 to 600.",
        required = true,
    ) { it?.toIntOrNull()?.let { s -> s in 1..600 } == true }

    execute {
        val amount = seconds!!.toLong()
        val millis = amount * 1000

        // Buttons: the field written right after -15000 is the back amount,
        // and the field written right before that literal is the forward one.
        val constants = SkipConstantsFingerprint.method
        val instructions = constants.instructions.toList()
        val back = instructions.indexOfFirst { (it as? WideLiteralInstruction)?.wideLiteral == -15000L }
        if (back < 0) throw PatchException("Skip back amount not found")
        fun field(index: Int): FieldReference {
            val instruction = instructions.getOrNull(index)
            if (instruction?.opcode != Opcode.SPUT_WIDE) throw PatchException("Skip amount field not found at $index")
            return (instruction as ReferenceInstruction).reference as FieldReference
        }
        val backField = field(back + 1)
        val forwardField = field(back - 1)
        if (forwardField == backField || forwardField.type != "J") throw PatchException("Skip amount fields not found")

        val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        constants.addInstructions(
            end,
            """
                const-wide v0, $millis
                sput-wide v0, $forwardField
                const-wide v0, ${-millis}
                sput-wide v0, $backField
            """.trimIndent(),
        )

        // Double-tap.
        DoubleTapSkipDurationFingerprint.method.addInstructions(
            0,
            """
                const-wide v0, $amount
                invoke-static { v0, v1 }, $DURATION->ofSeconds(J)$DURATION
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
    }
}
