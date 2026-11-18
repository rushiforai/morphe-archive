// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.requesthook

import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.extensions.ExternalLabel
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.addInstructionsWithLabels
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOOK = "$EXTENSION/RequestHook;"

/**
 * Routes the Reddit request engine through the extension's `RequestHook`, which changes nothing until a feature turns
 * a handler on. Three calls go into the engine's send method: with the URL (and the token and form) just before it
 * builds the request, where it adds the form, and with the reply's body before it parses it. The form is read only for
 * the engine's form subclasses (POST, PUT); other requests pass none.
 */
internal val requestHookPatch =
    bytecodePatch {
        dependsOn(extensionPatch)

        apply {
            val send = sendMethod()
            val engine = send.definingClass

            val forms = formRequests(engine)

            val urlString = send.single("the request URL") { reference("Landroid/net/Uri;", "toString", "Ljava/lang/String;") }
            val url = send.resultRegister(urlString)
            val addForm = send.single("the form call") { engineCall(engine) { size == 2 && this[1] == "Z" } }
            val addAuth = send.single("the authorization call") { engineCall(engine) { size == 4 && this[2] == "Ljava/lang/String;" && this[3] == "Landroid/net/Uri;" } }
            val parse = send.single("the reply parser call") { engineCall(engine) { this == listOf("Ljava/io/InputStream;") } && methodReference!!.returnType == "Ljava/lang/Object;" }
            if (!(urlString < addForm && addForm < addAuth && addAuth < parse)) throw PatchException("The engine's send method has its calls in an unexpected order")

            val formCall = send.getInstruction<FiveRegisterInstruction>(addForm)
            val authCall = send.getInstruction<FiveRegisterInstruction>(addAuth)
            val parseCall = send.getInstruction<FiveRegisterInstruction>(parse)
            val engineRegister = formCall.registerC
            val token = authCall.registerF
            val stream = parseCall.registerD
            if (authCall.registerC != engineRegister || parseCall.registerC != engineRegister) throw PatchException("The engine's calls use different registers for it")

            // The last local: the send method writes it (as half of a long) before the request URL and never touches it
            // after, so the hook may use it from there on.
            val scratch = send.implementation!!.registerCount - 2
            val used = setOf(engineRegister, url, token, stream)
            if (scratch in used || (used + scratch).any { it > 15 }) throw PatchException("The engine's send method has no free low register")
            val touches = send.instructions.withIndex().filter { (index, instruction) -> index > urlString && scratch in instruction.registers() }
            if (touches.isNotEmpty()) throw PatchException("v$scratch is in use after the request URL, at ${touches.first().index}")
            // Inserting before an instruction a branch lands on would leave the branch skipping the hook.
            for (index in listOf(urlString + 2, addForm, parse)) {
                if (send.getInstruction<BuilderInstruction>(index).location.labels.isNotEmpty()) {
                    throw PatchException("A branch lands on instruction $index of the engine's send method")
                }
            }
            // The skip lands after the form call, which must not leave a result there: a branch can't land on its
            // move-result.
            val afterForm = send.getInstruction<BuilderInstruction>(addForm + 1)
            if (afterForm.opcode in listOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT)) {
                throw PatchException("The engine's form call keeps its result")
            }

            val readForm = forms.withIndex().joinToString("") { (index, form) -> form.read(index, scratch, engineRegister) }

            // Last first, so the indices above stay right.
            send.addInstructions(
                parse,
                """
                    invoke-static { v$stream }, $HOOK->response(Ljava/io/InputStream;)Ljava/io/InputStream;
                    move-result-object v$stream
                """,
            )
            send.addInstructionsWithLabels(
                addForm,
                """
                    invoke-static { }, $HOOK->sendsForm()Z
                    move-result v$scratch
                    if-eqz v$scratch, :skip_form
                """,
                ExternalLabel("skip_form", afterForm),
            )
            send.addInstructionsWithLabels(
                urlString + 2,
                """
                    $readForm
                    const/4 v$scratch, 0x0
                    :hook
                    invoke-static { v$engineRegister, v$url, v$token, v$scratch }, $HOOK->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$url
                """,
            )
        }
    }

/** Smali that puts the form in [scratch] and jumps to `:hook` when the engine is a [FormRequest] of this type. */
private fun FormRequest.read(
    index: Int,
    scratch: Int,
    engine: Int,
) = """
    instance-of v$scratch, v$engine, $type
    if-eqz v$scratch, :not_form_$index
    move-object/from16 v$scratch, v$engine
    check-cast v$scratch, $type
    invoke-virtual { v$scratch }, $type->$getter()$pairs
    move-result-object v$scratch
    goto :hook
    :not_form_$index
"""

private fun MutableMethod.single(
    what: String,
    predicate: Instruction.() -> Boolean,
): Int {
    val found = instructions.withIndex().filter { it.value.predicate() }.map { it.index }
    return found.singleOrNull() ?: throw PatchException("Expected one $what in $definingClass->$name, found ${found.size}")
}

/** The register the call at [index] leaves its result in. */
private fun MutableMethod.resultRegister(index: Int): Int {
    val next = getInstruction<Instruction>(index + 1)
    if (next.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("The call at $index in $name keeps no result")
    return (next as OneRegisterInstruction).registerA
}

private fun Instruction.reference(
    definingClass: String,
    name: String,
    returnType: String,
): Boolean {
    val reference = methodReference ?: return false
    return reference.definingClass == definingClass && reference.name == name && reference.returnType == returnType
}

private fun Instruction.engineCall(
    engine: String,
    parameters: List<String>.() -> Boolean,
): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val reference: MethodReference = methodReference ?: return false
    return reference.definingClass == engine && reference.parameterTypes.map { it.toString() }.parameters()
}

/** Every register the instruction names, both halves of a wide value included. */
private fun Instruction.registers(): Set<Int> {
    val named =
        when (this) {
            is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
            is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
            is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
            is TwoRegisterInstruction -> listOf(registerA, registerB)
            is OneRegisterInstruction -> listOf(registerA)
            else -> emptyList()
        }
    val wide = listOf("WIDE", "LONG", "DOUBLE").any { it in opcode.name }
    return (if (wide) named.flatMap { listOf(it, it + 1) } else named).toSet()
}
