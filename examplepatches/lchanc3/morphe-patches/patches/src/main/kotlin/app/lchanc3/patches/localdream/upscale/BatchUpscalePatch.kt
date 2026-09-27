package app.lchanc3.patches.localdream.upscale

import app.lchanc3.patches.jptt.shared.requireFreeLocals
import app.lchanc3.patches.localdream.shared.Constants.COMPATIBILITY_LOCAL_DREAM
import app.lchanc3.patches.localdream.shared.Constants.EXTENSION_BATCH_UPSCALE_ACTIVITY
import app.lchanc3.patches.localdream.shared.Constants.EXTENSION_BATCH_UPSCALE_CLASS
import app.lchanc3.patches.localdream.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val CONTEXT = "Landroid/content/Context;"
private const val URI = "Landroid/net/Uri;"
private const val GET_CONTENT = "android.intent.action.GET_CONTENT"
private const val ALLOW_MULTIPLE = "android.intent.extra.ALLOW_MULTIPLE"
private const val WAKE_LOCK = "android.permission.WAKE_LOCK"

/**
 * Declares the batch screen, which the patched picker opens, and the wake lock
 * that keeps a batch going with the screen off.
 */
private val batchUpscaleManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            // The app's backend runs in a foreground service, which keeps the
            // process alive but not the CPU awake.
            val permissions = document.getElementsByTagName("uses-permission")
            val declared = (0 until permissions.length).any {
                (permissions.item(it) as Element).getAttribute("android:name") == WAKE_LOCK
            }
            if (!declared) {
                application.parentNode.insertBefore(
                    document.createElement("uses-permission").apply {
                        setAttribute("android:name", WAKE_LOCK)
                    },
                    application,
                )
            }

            application.appendChild(
                document.createElement("activity").apply {
                    setAttribute("android:name", EXTENSION_BATCH_UPSCALE_ACTIVITY)
                    setAttribute("android:exported", "false")
                    // The same as MainActivity, which is portrait only. uiMode is
                    // left out so switching to dark mode recreates the screen in
                    // the new colors; the batch itself lives outside it.
                    setAttribute("android:screenOrientation", "portrait")
                    setAttribute(
                        "android:configChanges",
                        "orientation|screenLayout|screenSize|smallestScreenSize|density",
                    )
                    setAttribute("android:theme", "@style/Theme.LocalDream")
                },
            )
        }
    }
}

@Suppress("unused")
val batchUpscalePatch = bytecodePatch(
    name = "Batch upscale",
    description = "Lets the image upscale screen take several pictures at once. Picking " +
        "one works as before; picking more opens a screen that upscales them one after " +
        "another with the upscaler and scale chosen there, where each result can be " +
        "zoomed, compared with its original, and saved on its own or all together.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LOCAL_DREAM)

    dependsOn(extensionHookPatch, batchUpscaleManifestPatch)

    execute {
        val screen = UpscaleScreenFingerprint.method
        val instructions = screen.instructions

        // The picker is `rememberLauncherForActivityResult(GetContent())`. R8 has
        // merged every ActivityResultContract the app uses into one class that
        // picks its behavior by an int, and GetMultipleContents is one of them.
        // The upscale screen builds the one contract it uses in place, so the
        // `<init>` that takes the int is the only one here to a contract class.
        val contractInits = instructions.withIndex().filter { (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT) return@filter false
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            reference.name == "<init>" &&
                reference.parameterTypes.firstOrNull()?.toString() == "I" &&
                createIntentOf(reference.definingClass) != null
        }
        val (initIndex, init) = contractInits.singleOrNull()
            ?: throw PatchException(
                "Expected the upscale screen to build one activity result contract, " +
                    "found ${contractInits.size}.",
            )
        val contractClass = ((init as ReferenceInstruction).reference as MethodReference).definingClass
        val keyRegister = (init as FiveRegisterInstruction).registerD

        val cases = switchCases(createIntentOf(contractClass)!!)
        val singleKey = constBefore(instructions, initIndex, keyRegister)
        val singleCase = cases[singleKey]
            ?: throw PatchException("The upscale picker's contract $singleKey is not a case of $contractClass.")
        if (singleCase.any { it.isString(ALLOW_MULTIPLE) }) {
            throw PatchException("The upscale picker already allows picking several images.")
        }
        val multipleKey = cases.entries.singleOrNull { (_, block) -> block.any { it.isString(ALLOW_MULTIPLE) } }?.key
            ?: throw PatchException("$contractClass has no single contract that allows picking several images.")
        if (createIntentOf(contractClass)!!.implementation!!.instructions.none { it.isString(GET_CONTENT) }) {
            throw PatchException("$contractClass no longer builds a GET_CONTENT intent.")
        }

        // Handing the constructor a different int reuses its register, and the
        // one loaded before stays as it was for anything that still reads it.
        requireOverwrittenAfter(instructions, initIndex, keyRegister)
        screen.addInstruction(initIndex, "const/16 v$keyRegister, $multipleKey")

        // The picker's callback now gets a List where it expects a Uri. It is a
        // class of its own the screen instantiates, holding the Context among
        // the state it writes the picked image into.
        val callbacks = instructions
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
            .distinct()
            .mapNotNull { type ->
                val classDef = classDefByOrNull(type) ?: return@mapNotNull null
                val context = classDef.fields.singleOrNull { it.type == CONTEXT } ?: return@mapNotNull null
                val invoke = classDef.methods.singleOrNull { method ->
                    method.returnType == "Ljava/lang/Object;" &&
                        method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
                        // The first thing it does is take what it was given as a
                        // Uri. Lambdas R8 merged into one class switch on which
                        // one they are first, and are left out by this.
                        method.implementation?.instructions?.take(3)?.any { instruction ->
                            instruction.opcode == Opcode.CHECK_CAST &&
                                ((instruction as ReferenceInstruction).reference as TypeReference).type == URI
                        } == true
                } ?: return@mapNotNull null
                Triple(type, context.name, invoke.name)
            }
        val (callbackClass, contextField, invokeName) = callbacks.singleOrNull()
            ?: throw PatchException("Expected one picker callback in the upscale screen, found ${callbacks.size}.")

        val callback = mutableClassDefBy(callbackClass).methods.single {
            it.name == invokeName && it.parameterTypes.size == 1
        }
        requireFreeLocals(callback, 1)
        callback.addInstructions(
            0,
            """
                iget-object v0, p0, $callbackClass->$contextField:$CONTEXT
                invoke-static { v0, p1 }, $EXTENSION_BATCH_UPSCALE_CLASS->onImagesPicked($CONTEXT Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
            """,
        )
    }
}

/** `createIntent(Context, Object)` of [type], when [type] is an activity result contract. */
private fun BytecodePatchContext.createIntentOf(type: String): Method? =
    classDefByOrNull(type)?.methods?.singleOrNull { method ->
        method.returnType == "Landroid/content/Intent;" &&
            method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, "Ljava/lang/Object;")
    }

/**
 * The instructions each case of the one switch in [method] runs, up to where it
 * returns, by the value it is taken for.
 */
private fun switchCases(method: Method): Map<Int, List<Instruction>> {
    val instructions = method.implementation?.instructions?.toList()
        ?: throw PatchException("${method.definingClass}->${method.name}() has no body.")

    val addresses = IntArray(instructions.size)
    var address = 0
    instructions.forEachIndexed { index, instruction ->
        addresses[index] = address
        address += instruction.codeUnits
    }
    val indexAt = addresses.withIndex().associate { (index, value) -> value to index }

    val switches = instructions.indices.filter {
        instructions[it].opcode == Opcode.PACKED_SWITCH || instructions[it].opcode == Opcode.SPARSE_SWITCH
    }
    val switchIndex = switches.singleOrNull()
        ?: throw PatchException("${method.definingClass}->${method.name}() no longer has a single switch.")
    val switchAddress = addresses[switchIndex]
    val payload = instructions[
        indexAt.getValue(switchAddress + (instructions[switchIndex] as OffsetInstruction).codeOffset),
    ] as SwitchPayload

    return payload.switchElements.associate { element ->
        val start = indexAt.getValue(switchAddress + element.offset)
        element.key to instructions.drop(start).takeWhile {
            it.opcode != Opcode.RETURN_OBJECT && it.opcode != Opcode.THROW
        }
    }
}

/** The constant the instructions leading up to [index] load into [register]. */
private fun constBefore(instructions: List<Instruction>, index: Int, register: Int): Int {
    for (i in index - 1 downTo maxOf(0, index - 8)) {
        val instruction = instructions[i]
        if (instruction !is OneRegisterInstruction || instruction.registerA != register) continue
        if (instruction is NarrowLiteralInstruction &&
            instruction.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)
        ) {
            return instruction.narrowLiteral
        }
        break
    }
    throw PatchException("The upscale picker's contract is no longer built from a constant.")
}

/**
 * Fails unless the next instruction after [index] that touches [register] writes
 * a new value to it, with nothing that could branch in between: only then does
 * changing what it holds at [index] leave the rest of the method as it was.
 */
private fun requireOverwrittenAfter(instructions: List<Instruction>, index: Int, register: Int) {
    for (instruction in instructions.drop(index + 1)) {
        val opcode = instruction.opcode
        val registers = instruction.registers()
        if (register in registers) {
            val overwrites = instruction is OneRegisterInstruction &&
                instruction.registerA == register &&
                registers.size == 1 &&
                opcode in OVERWRITING_OPCODES
            if (overwrites) return
            break
        }
        if (!opcode.canContinue() || instruction is OffsetInstruction) break
    }
    throw PatchException("The register the upscale picker's contract is built from is read again afterwards.")
}

/** Opcodes that only write their one register. */
private val OVERWRITING_OPCODES = setOf(
    Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT,
    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16,
    Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO, Opcode.CONST_CLASS,
)

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

private fun Instruction.isString(value: String) =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string == value
