// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixredgifs

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.api.spoofclient.clientFactory
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.shared.Edit
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.fieldReference
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.replaceInstruction
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val REDGIFS = "$EXTENSION/Redgifs;"

@Suppress("unused")
val fixRedgifsPatch =
    bytecodePatch(
        name = "Fix Redgifs",
        description = "Fixes Redgifs videos not loading.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(extensionPatch)

        apply {
            val tokenRequest = clientTokenMethod()
            val lookup = tokenRequest.definingClass
            val edits =
                listOf(
                    useTemporaryTokens(tokenRequest, lookup),
                    sendTheTokensUserAgent(lookup),
                    lowercaseGifIds(lookup),
                    unpinRedgifs(),
                    extensionSwitch("Redgifs"),
                )
            edits.forEach { it.apply() }
        }
    }

/**
 * Makes the lookup's token getter hand out Redgifs' temporary tokens. The lookup tries again once with a new token
 * when Redgifs rejects one (400, 401, 403), unless its flag says the token was new already; the getter learns of a
 * rejection from the status the lookup kept, and sets that flag as the app's own token request does, so a rejected
 * new token ends the lookup instead of trying forever.
 */
private fun BytecodePatchContext.useTemporaryTokens(
    tokenRequest: MutableMethod,
    lookup: String,
): Edit {
    val getter = tokenGetterMethod(lookup)
    val send = lookupMethod(lookup, getter)
    val fields = classDefs[lookup]?.fields?.filter { !AccessFlags.STATIC.isSet(it.accessFlags) } ?: throw PatchException("No class $lookup")
    val status = fields.singleOrNull { it.type == "I" } ?: throw PatchException("Expected one int field, the last status, in $lookup")
    val renewed = fields.singleOrNull { it.type == "Z" } ?: throw PatchException("Expected one boolean field, the new-token flag, in $lookup")
    // The lookup keeps the status and reads the flag before trying again; the token request sets the flag.
    val keepsStatus = send.instructions.any { it.opcode == Opcode.IPUT && it.fieldReference?.name == status.name && it.fieldReference?.definingClass == lookup }
    val readsFlag = send.instructions.any { it.opcode == Opcode.IGET_BOOLEAN && it.fieldReference?.name == renewed.name && it.fieldReference?.definingClass == lookup }
    val setsFlag = tokenRequest.instructions.any { it.opcode == Opcode.IPUT_BOOLEAN && it.fieldReference?.name == renewed.name && it.fieldReference?.definingClass == lookup }
    if (!keepsStatus || !readsFlag || !setsFlag) throw PatchException("The Redgifs lookup no longer keeps the status and new-token flag the token getter uses")
    // Two locals and this, all within v0-v15 for iget and iput.
    val registers = getter.implementation!!.registerCount
    if (registers < 3 || registers > 16) throw PatchException("${getter.name} has $registers registers, expected 3 to 16")

    return Edit(1) {
        getter.addInstructions(
            0,
            """
                iget v0, p0, $lookup->${status.name}:I
                if-eqz v0, :first_try
                const/4 v1, 0x1
                iput-boolean v1, p0, $lookup->${renewed.name}:Z
                :first_try
                invoke-static { v0 }, $REDGIFS->token(I)Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        )
    }
}

/** Temporary tokens are bound to the User-Agent they were issued to: the lookup sends that one, not Reddit's. */
private fun BytecodePatchContext.sendTheTokensUserAgent(lookup: String): Edit {
    val setter = userAgentSetterMethod(lookup)
    val factory = clientFactory()
    // The app's User-Agent comes from the OkHttp client factory.
    val calls =
        setter.instructions.withIndex().filter { (_, instruction) ->
            val reference = instruction.methodReference
            instruction.opcode == Opcode.INVOKE_STATIC && reference != null && reference.definingClass == factory &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Ljava/lang/String;"
        }
    val index = calls.singleOrNull()?.index ?: throw PatchException("Expected one User-Agent call in ${setter.name}, found ${calls.size}")
    return Edit(1) { setter.replaceInstruction(index, "invoke-static { }, $REDGIFS->userAgent()Ljava/lang/String;") }
}

/** The API knows gif IDs only in lowercase; the app keeps the case of the link it took one from. */
private fun BytecodePatchContext.lowercaseGifIds(lookup: String): Edit {
    val path = gifPathMethod()
    if (classDefs[path.definingClass]?.superclass != lookup) throw PatchException("${path.definingClass} builds the gif path but doesn't extend $lookup")
    return Edit(1) {
        path.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $REDGIFS->gifId(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
            """,
        )
    }
}

/**
 * The app pins api.redgifs.com to keys Redgifs no longer uses, so every request there fails. Each host's pins go
 * through the extension, which drops only api.redgifs.com's: the host's name is scrambled in the app and decoded at
 * runtime. The other hosts keep their pins, and api.redgifs.com is still checked against the system's CAs.
 */
private fun BytecodePatchContext.unpinRedgifs(): Edit {
    val pinner = pinnerMethod(clientFactory())
    val adds = pinner.instructions.withIndex().filter { it.value.methodReference?.isAddPins() == true }.map { it.index }
    val inserts =
        adds.map { index ->
            val (host, pins) = pinner.hostAndPins(index)
            if (host == pins) throw PatchException("${pinner.name} passes one register as both host and pins at $index")
            if (pinner.getInstruction<BuilderInstruction>(index).location.labels.isNotEmpty()) throw PatchException("A branch lands on instruction $index of ${pinner.name}")
            // The insert leaves the filtered pins in the array's register: nothing after the call may read the original.
            pinner.checkUnreadAfter(index, pins)
            Triple(index, host, pins)
        }
    return Edit(inserts.size) {
        // Last first, so the indices above stay right.
        for ((index, host, pins) in inserts.sortedByDescending { it.first }) {
            val call = if (host + 1 == pins) "invoke-static/range { v$host .. v$pins }" else "invoke-static { v$host, v$pins }"
            pinner.addInstructions(
                index,
                """
                    $call, $REDGIFS->pins(Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
                    move-result-object v$pins
                """,
            )
        }
    }
}

/**
 * Fails unless [register] is written before it is read again on the straight-line code after [index]. Any branch
 * before that fails too, rather than follow it.
 */
private fun MutableMethod.checkUnreadAfter(
    index: Int,
    register: Int,
) {
    for (at in index + 1 until instructions.size) {
        val instruction = getInstruction<Instruction>(at)
        val destination = (instruction as? OneRegisterInstruction)?.registerA.takeIf { instruction.opcode.setsRegister() }
        val written =
            when {
                destination == null -> emptySet()
                instruction.opcode.setsWideRegister() -> setOf(destination, destination + 1)
                else -> setOf(destination)
            }
        val read = instruction.registersRead(destination != null)
        if (register in read) throw PatchException("$name reads v$register again at $at after adding its pins at $index")
        if (register in written) return
        // Branches first: a goto can't continue either, and its target may still read the register.
        if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) {
            throw PatchException("$name branches at $at before v$register, the pins added at $index, is written again")
        }
        if (!instruction.opcode.canContinue()) return
    }
}

/** The registers the instruction reads: all it names but its destination, both halves of a wide value included. */
private fun Instruction.registersRead(setsA: Boolean): Set<Int> {
    val read =
        when (this) {
            is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
            is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
            is ThreeRegisterInstruction -> listOfNotNull(registerA.takeUnless { setsA }, registerB, registerC)
            is TwoRegisterInstruction -> listOfNotNull(registerA.takeUnless { setsA }, registerB)
            is OneRegisterInstruction -> listOfNotNull(registerA.takeUnless { setsA })
            else -> emptyList()
        }
    // A wide operand names the first of two registers.
    val wide = listOf("WIDE", "LONG", "DOUBLE").any { it in opcode.name }
    return (if (wide) read.flatMap { listOf(it, it + 1) } else read).toSet()
}

/** The registers of the host and pins of the `add(pattern, pins)` call at [index]. */
private fun MutableMethod.hostAndPins(index: Int): Pair<Int, Int> {
    val (host, pins) =
        when (val call = getInstruction<Instruction>(index)) {
            is FiveRegisterInstruction -> call.registerD to call.registerE
            is RegisterRangeInstruction -> call.startRegister + 1 to call.startRegister + 2
            else -> throw PatchException("Unexpected call at $index of $name")
        }
    if (host + 1 != pins && (host > 15 || pins > 15)) throw PatchException("${this.name} holds a host's pins in registers above v15 at $index")
    return host to pins
}
