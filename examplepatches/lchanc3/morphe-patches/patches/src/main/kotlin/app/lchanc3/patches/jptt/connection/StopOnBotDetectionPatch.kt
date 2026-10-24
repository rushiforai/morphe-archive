package app.lchanc3.patches.jptt.connection

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_BOT_BLOCK_CLASS
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_CLASS
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_CLASS_PREFIX
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_SIMPLE_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.lchanc3.patches.jptt.shared.newMethod
import app.lchanc3.patches.jptt.shared.requireFreeLocals
import app.lchanc3.patches.jptt.shared.toSmaliLiteral
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val READER_TYPE = "Ljava/io/InputStreamReader;"
private const val STREAM_TYPE = "Ljava/io/InputStream;"
private const val READER_FIELD_NAME = "in"

private const val DIALOG_TITLE = "連線被 PTT 暫時擋下"

/** The method added to JSocket, named so it cannot collide with its own. */
private const val HELPER_METHOD = "patchStopIfBotBlocked"

@Suppress("unused")
val stopOnBotDetectionPatch = bytecodePatch(
    name = "Stop on bot detection",
    description = "Shows PTT's message and stops when its DDoS/BOT detection turns the " +
        "connection away, instead of showing it as garbled text and reconnecting into " +
        "it every few seconds.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        // Every terminal reader JPTT builds is built on a stream wrapped first,
        // so the bytes the detection sends are kept before Big5 mangles them.
        // Like the reader itself, once per transport across JSocket,
        // JSocketSimple and their inner classes.
        val classDefs = buildList {
            classDefForEach { classDef ->
                if (classDef.type.startsWith(JSOCKET_CLASS_PREFIX)) add(classDef)
            }
        }

        var tapped = 0

        classDefs.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach method@{ method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@method

                val sites = instructions.indices.mapNotNull { index ->
                    readerSite(instructions, index)
                }

                // Descending, so an insertion does not shift the sites still to
                // be patched; each one only inserts at or after its own start.
                sites.sortedByDescending { it.storeIndex }.forEach { site ->
                    val stream = site.streamRegister
                    if (stream > 15 || site.socketRegister > 15) {
                        throw PatchException(
                            "The registers around ${method.definingClass}->${method.name}()'s " +
                                "terminal reader are out of reach of the injected code.",
                        )
                    }

                    // Once the reader is stored, the tap goes on record against
                    // the socket, and the register gets back the object it had
                    // (the WebSocket transport hands its PipedInputStream on to
                    // the listener afterwards).
                    method.addInstructions(
                        site.storeIndex + 1,
                        """
                            invoke-static { v${site.socketRegister}, v$stream }, $EXTENSION_BOT_BLOCK_CLASS->attach(Ljava/lang/Object;$STREAM_TYPE)$STREAM_TYPE
                            move-result-object v$stream
                            check-cast v$stream, ${site.streamType}
                        """,
                    )
                    method.addInstructions(
                        site.constructorIndex,
                        """
                            invoke-static { v$stream }, $EXTENSION_BOT_BLOCK_CLASS->tap($STREAM_TYPE)$STREAM_TYPE
                            move-result-object v$stream
                        """,
                    )
                    tapped++
                }
            }
        }

        if (tapped == 0) {
            throw PatchException(
                "Found no InputStreamReader stored in $JSOCKET_SIMPLE_CLASS->$READER_FIELD_NAME. " +
                    "JPTT's connection code has changed and this patch needs updating.",
            )
        }

        val classDef = ShowNetworkBrokenDialogFingerprint.classDef
        val method = ShowNetworkBrokenDialogFingerprint.method

        if (classDef.methods.any { it.name == HELPER_METHOD }) {
            throw PatchException("$JSOCKET_CLASS already has a $HELPER_METHOD method.")
        }
        if (classDef.methods.none {
                it.name == "showLoginErrorDialog" && it.returnType == "V" &&
                    it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z")
            }
        ) {
            throw PatchException("$JSOCKET_CLASS no longer has showLoginErrorDialog(String, String, boolean).")
        }

        // Shows JPTT's own login error dialog instead, as Stop on login ban does:
        // without a 重試 button its only way out is back to the login screen, so
        // nothing reconnects into the detection again. Only before the main
        // menu, which is where the detection answers, and not once the socket
        // has been stopped on purpose, where the original goes on as it would.
        classDef.methods.add(
            newMethod(
                JSOCKET_CLASS,
                HELPER_METHOD,
                "Z",
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                // v0 to v2, and p0 for the socket itself.
                registers = 4,
                """
                    iget-boolean v0, p0, $JSOCKET_SIMPLE_CLASS->stopall:Z
                    if-nez v0, :not_blocked
                    iget v0, p0, $JSOCKET_SIMPLE_CLASS->state:I
                    const/4 v1, 0x2
                    if-eq v0, v1, :not_blocked
                    invoke-static { p0 }, $EXTENSION_BOT_BLOCK_CLASS->message(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v1
                    if-eqz v1, :not_blocked
                    const-string v0, "${DIALOG_TITLE.toSmaliLiteral()}"
                    const/4 v2, 0x0
                    invoke-direct { p0, v0, v1, v2 }, $JSOCKET_CLASS->showLoginErrorDialog(Ljava/lang/String;Ljava/lang/String;Z)V
                    invoke-virtual { p0 }, $JSOCKET_CLASS->destroy()V
                    const/4 v0, 0x1
                    return v0
                    :not_blocked
                    const/4 v0, 0x0
                    return v0
                """,
            ),
        )

        // The original goes on to have MainActivity count down to a reconnect.
        requireFreeLocals(method, 1)
        method.addInstructionsWithLabels(
            0,
            """
                invoke-direct { p0 }, $JSOCKET_CLASS->$HELPER_METHOD()Z
                move-result v0
                if-eqz v0, :not_blocked
                return-void
                :not_blocked
                nop
            """,
        )
    }
}

/** Where a terminal reader is built on a stream and stored in the socket. */
private class ReaderSite(
    /** The `InputStreamReader.<init>(InputStream, …)` call. */
    val constructorIndex: Int,
    /** The `iput-object` that stores the reader in `JSocketSimple.in`. */
    val storeIndex: Int,
    val streamRegister: Int,
    val streamType: String,
    val socketRegister: Int,
)

/**
 * The site whose store is at [index], or null when that is no store of a
 * freshly built reader (`destroy()` stores null).
 */
private fun readerSite(instructions: List<Instruction>, index: Int): ReaderSite? {
    val store = instructions[index]
    if (store.opcode != Opcode.IPUT_OBJECT) return null
    val field = (store as ReferenceInstruction).reference as FieldReference
    if (field.definingClass != JSOCKET_SIMPLE_CLASS || field.name != READER_FIELD_NAME || field.type != READER_TYPE) {
        return null
    }
    val readerRegister = (store as TwoRegisterInstruction).registerA

    // The constructor call is right before the store, give or take what another
    // patch (Fix article list loading) puts between them.
    val constructorIndex = (index - 1 downTo maxOf(0, index - 8)).firstOrNull { candidate ->
        val instruction = instructions[candidate]
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_DIRECT &&
            reference?.definingClass == READER_TYPE &&
            reference.name == "<init>" &&
            reference.parameterTypes.firstOrNull()?.toString() == STREAM_TYPE &&
            (instruction as FiveRegisterInstruction).registerC == readerRegister
    } ?: return null

    val streamRegister = (instructions[constructorIndex] as FiveRegisterInstruction).registerD
    val streamType = typeWrittenTo(instructions, constructorIndex, streamRegister)
        ?: throw PatchException("Cannot tell what type the terminal reader's stream has.")

    return ReaderSite(
        constructorIndex = constructorIndex,
        storeIndex = index,
        streamRegister = streamRegister,
        streamType = streamType,
        socketRegister = store.registerB,
    )
}

/**
 * The type of what the last instruction before [before] to write [register]
 * put there, as far as the verifier knows it, or null if it is not obvious.
 */
private fun typeWrittenTo(instructions: List<Instruction>, before: Int, register: Int): String? {
    for (index in before - 1 downTo 0) {
        val instruction = instructions[index]
        if (!instruction.opcode.setsRegister()) continue
        val written = when (instruction) {
            is OneRegisterInstruction -> instruction.registerA
            is TwoRegisterInstruction -> instruction.registerA
            else -> continue
        }
        if (written != register) continue

        return when (instruction.opcode) {
            Opcode.NEW_INSTANCE ->
                ((instruction as ReferenceInstruction).reference as TypeReference).type
            Opcode.IGET_OBJECT, Opcode.SGET_OBJECT ->
                ((instruction as ReferenceInstruction).reference as FieldReference).type
            Opcode.MOVE_RESULT_OBJECT ->
                ((instructions.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.returnType
            else -> null
        }
    }
    return null
}
