package app.lchanc3.patches.jptt.terminal

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_TERMINAL_ESCAPE_CLASS
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_CLASS_PREFIX
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_SIMPLE_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val READER_TYPE = "Ljava/io/InputStreamReader;"
private const val READER_FIELD_NAME = "in"

@Suppress("unused")
val fixTerminalEscapeSequencesPatch = bytecodePatch(
    name = "Fix article list loading",
    description = "Drops the ANSI escape sequences JPTT's terminal emulator cannot " +
        "parse, which otherwise swallow the screen content that follows them. Fixes " +
        "the article list being stuck at 載入中, and keeps the next sequence PTT " +
        "adds from breaking the app again.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        // The reader is assigned once per transport (WebSocket, plain socket and
        // SSH) across JSocket, JSocketSimple and their inner classes, so wrap it
        // at every write to the field rather than naming each method.
        val classDefs = buildList {
            classDefForEach { classDef ->
                if (classDef.type.startsWith(JSOCKET_CLASS_PREFIX)) add(classDef)
            }
        }

        var wrapped = 0

        classDefs.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach method@{ method ->
                val instructions = method.implementation?.instructions ?: return@method

                // Descending, so an insertion does not shift the indexes still
                // to be visited.
                instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.IPUT_OBJECT &&
                        ((instruction as ReferenceInstruction).reference as FieldReference)
                            .let {
                                it.definingClass == JSOCKET_SIMPLE_CLASS &&
                                    it.name == READER_FIELD_NAME &&
                                    it.type == READER_TYPE
                            }
                }.map { it.index }.sortedDescending().forEach { index ->
                    // registerA of an iput holds the value being stored. The
                    // /range form is used because it takes any register number.
                    val register = (instructions[index] as TwoRegisterInstruction).registerA

                    method.addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $EXTENSION_TERMINAL_ESCAPE_CLASS->sanitize($READER_TYPE)$READER_TYPE
                            move-result-object v$register
                        """,
                    )
                    wrapped++
                }
            }
        }

        // 3.8.4 and 3.8.5 both have six: one per transport in JSocket and in
        // JSocketSimple, plus the `in = null` in destroy(), which the extension
        // passes straight back.
        if (wrapped == 0) {
            throw PatchException(
                "Found no assignment to $JSOCKET_SIMPLE_CLASS->$READER_FIELD_NAME. " +
                    "JPTT's terminal code has changed and this patch needs updating.",
            )
        }
    }
}
