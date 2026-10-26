/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.profilegrid

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val WHAT = "Animated profile covers"
private const val EXTENSION = "Lapp/pixkk/extension/feed/AnimatedCovers;"
private const val FLAG_KEY = "use_dynamic_cover"
private const val DROP_REASON = "showDynamicCoverIfAvailable needDropDynamicCover"

/**
 * Every place that asks whether to show a video's animated cover. The profile grid's cell asks,
 * and so does the helper that loads the animation into it; both read the same stored switch,
 * `use_dynamic_cover`, which the server turns off.
 */
internal object DynamicCoverGateFingerprint : Fingerprint(
    strings = listOf(FLAG_KEY),
)

/** Whether a profile post's cell shows the animated cover; it reads the server's switch for it. */
internal object ProfilePostDynamicCoverFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("profile_aweme_post_use_dynamic_cover"),
    // The class and method names change on every build. The shared gate reads this key too, but
    // it reads the plain switch as well; the cell's own method reads only this one.
    custom = { method, _ ->
        method.implementation?.instructions?.none {
            it.getReference<StringReference>()?.string == FLAG_KEY
        } == true
    },
)

@Suppress("unused")
val animatedProfileCoversPatch = bytecodePatch(
    name = WHAT,
    description = "Plays the short animation TikTok used to show in each video's preview on a " +
        "profile grid. It can be turned off in the Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // The profile grid's cell asks this before it picks a cover: yes sends it through the
        // animated cover helper, no loads the still one. The server answers no.
        ProfilePostDynamicCoverFingerprint.method.guardAtEntry(
            WHAT,
            "invoke-static {}, $EXTENSION->useOnProfileGrid()Z",
            "const/4 v0, 0x1\nreturn v0",
        )

        val gates = DynamicCoverGateFingerprint.matchAllOrNull().orEmpty()
        if (gates.isEmpty()) throw PatchException("$WHAT: the animated cover switch is gone")
        var hooked = 0

        gates.forEach { gate ->
            val method = gate.method
            val instructions = method.implementation!!.instructions.toList()
            // The key is passed to a (String, boolean) -> boolean read of the stored switch.
            // The answer lands in the register right after, and is let through the extension.
            val inserts = mutableListOf<Pair<Int, Int>>()
            instructions.forEachIndexed { index, instruction ->
                val key = (instruction as? OneRegisterInstruction)
                    ?.takeIf { instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO }
                    ?.let { instruction.getReference<StringReference>()?.string }
                if (key != FLAG_KEY) return@forEachIndexed
                val call = (index + 1..minOf(index + 8, instructions.size - 2)).firstOrNull { at ->
                    if (instructions[at].opcode != Opcode.INVOKE_STATIC) return@firstOrNull false
                    val reference = instructions[at].getReference<MethodReference>() ?: return@firstOrNull false
                    reference.returnType == "Z" &&
                        reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Z") &&
                        instructions[at + 1].opcode == Opcode.MOVE_RESULT
                } ?: return@forEachIndexed
                val register = (instructions[call + 1] as OneRegisterInstruction).registerA
                if (register > 15) throw PatchException("$WHAT: the registers no longer fit a four-bit call")
                inserts += (call + 2) to register
            }
            // From the back, so an insert does not move the places still to be written.
            inserts.sortedByDescending { it.first }.forEach { (at, register) ->
                method.addInstructions(
                    at,
                    """
                        invoke-static { v$register }, $EXTENSION->keepOn(Z)Z
                        move-result v$register
                    """,
                )
                hooked++
            }
        }

        // The helper then asks whether to drop the animated cover altogether and returns without
        // loading it when the answer is yes. The answer is read by an interface call that
        // returns a boolean, just before the helper logs its reason for returning.
        gates.forEach { gate ->
            val method = gate.method
            val instructions = method.implementation!!.instructions.toList()
            val reason = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    it.getReference<StringReference>()?.string == DROP_REASON
            }
            if (reason < 0) return@forEach
            val read = (reason - 1 downTo maxOf(reason - 12, 1)).firstOrNull { at ->
                instructions[at].opcode == Opcode.MOVE_RESULT &&
                    instructions[at - 1].opcode == Opcode.INVOKE_INTERFACE &&
                    instructions[at - 1].getReference<MethodReference>()?.returnType == "Z"
            } ?: throw PatchException("$WHAT: the drop answer is not read as expected")
            val register = (instructions[read] as OneRegisterInstruction).registerA
            if (register > 15) throw PatchException("$WHAT: the registers no longer fit a four-bit call")
            method.addInstructions(
                read + 1,
                """
                    invoke-static { v$register }, $EXTENSION->keepDropOff(Z)Z
                    move-result v$register
                """,
            )
            hooked++
        }
        if (hooked == 0) throw PatchException("$WHAT: no read of the animated cover switch was found")
    }
}
