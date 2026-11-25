/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading BarcelonaProgressIndicator and BarcelonaWordmarkIndicator in 457 (2026-11-24).
 */
package app.morphe.patches.threads.misc.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.classesNoted
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.holdsNote
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val HEADER_LOGO_PATCH = "HushThreads header logo"
internal const val HEADER_LOGO = "$EXTENSION_PACKAGE/theme/HeaderLogo;"

/** Where Threads keeps its refresh spinners, the Threads logo at the top of the feed among them. */
private const val PULL_TO_REFRESH = "com.instagram.barcelona.common.ui.pulltorefresh."

/** The note in the function that draws the Threads logo, which spins while the feed refreshes. */
internal const val LOGO_INDICATOR = "${PULL_TO_REFRESH}ProgressIndicator (BarcelonaProgressIndicator.kt:"

/** The note in the function that draws the Threads wordmark, which some builds show there instead. */
internal const val WORDMARK_INDICATOR = "${PULL_TO_REFRESH}WordmarkProgressIndicator (BarcelonaWordmarkIndicator.kt:"

private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val OBJECT = "Ljava/lang/Object;"
private const val ANDROID_CANVAS = "Landroid/graphics/Canvas;"

/**
 * How Threads' logo lambda reaches the Android canvas and the size under Compose's draw scope:
 * it casts the lambda's argument to the [scope] interface, asks it for its draw context with
 * [context], casts that to [contextImpl], and reads Compose's draw scope out of it with
 * [drawScope], that one's draw parameters with [params], and from those the [canvas] and the
 * [size]. Compose's [nativeCanvas] turns the canvas into an Android one.
 */
internal class CanvasPath(
    val scope: String,
    val context: MethodReference,
    val contextImpl: String,
    val drawScope: FieldReference,
    val params: FieldReference,
    val canvas: FieldReference,
    val size: FieldReference,
    val nativeCanvas: MethodReference,
)

/** A logo's drawing: the lambda Threads hands Compose's Canvas, and its invoke, where the hook goes. */
internal class LogoDrawing(val lambda: String, val invoke: Method)

/**
 * Draws the HushThreads logo at the top of the feed in place of Threads' own (#26).
 *
 * Threads draws its logo, which spins while the feed refreshes, with Compose's Canvas, handing it a
 * lambda that draws into the canvas's draw scope. The lambda for the logo, and the one for the
 * wordmark some builds show there, ask the extension first thing whether it drew HushThreads' logo
 * instead, and return when it did. The extension reaches the Android canvas and the size the way
 * Threads' own logo lambda does, through two stubs this patch writes from that lambda's code.
 *
 * Each function is found by its Compose note, has to hold it and be the only one, and has to hand
 * Compose's Canvas exactly one lambda; the path to the canvas has to read as it does in 457, and
 * Compose's helper that unwraps the canvas has to be the only one of its shape. Anything else
 * refuses before the first change.
 */
@Suppress("unused")
val headerLogoPatch = bytecodePatch(
    name = HEADER_LOGO_PATCH,
    description = "Shows the HushThreads logo at the top of your feed instead of the Threads logo. It stays still " +
        "while the feed refreshes, where Threads' logo spins. Starts off. Turn it on in HushThreads settings > Appearance.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("headerLogo")
        // Everything is found and checked before the first change.
        val logo = logoDrawing(LOGO_INDICATOR, "the Threads logo")
        val wordmark = logoDrawing(WORDMARK_INDICATOR, "the Threads wordmark")
        val path = canvasPath(logo.invoke)
        val hooks = listOf(logo, wordmark).distinctBy { it.lambda }.map { drawing ->
            mutableClassDefBy(drawing.lambda).findMutableMethodOf(drawing.invoke).also { it.requireLocals(HEADER_LOGO_PATCH, 1) }
        }

        writeStub(HEADER_LOGO, "canvasOf", 2, """
            check-cast p0, ${path.scope}
            invoke-interface {p0}, ${path.context}
            move-result-object v0
            check-cast v0, ${path.contextImpl}
            iget-object v0, v0, ${path.drawScope}
            iget-object v0, v0, ${path.params}
            iget-object v0, v0, ${path.canvas}
            invoke-static {v0}, ${path.nativeCanvas}
            move-result-object v0
            return-object v0
        """)
        writeStub(HEADER_LOGO, "sizeOf", 4, """
            check-cast p0, ${path.scope}
            invoke-interface {p0}, ${path.context}
            move-result-object v2
            check-cast v2, ${path.contextImpl}
            iget-object v2, v2, ${path.drawScope}
            iget-object v2, v2, ${path.params}
            iget-wide v0, v2, ${path.size}
            return-wide v0
        """)
        hooks.forEach { it.drawHeaderLogoFirst() }
        enableStatus("headerLogo")
    }
}

/** Asks the extension first thing, and returns Kotlin's Unit when it drew the HushThreads logo. */
internal fun MutableMethod.drawHeaderLogoFirst() = addInstructionsWithLabels(
    0,
    """
        invoke-static/range {p1 .. p1}, $HEADER_LOGO->draw(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :threads
        sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
        return-object v0
    """,
    ExternalLabel("threads", getInstruction(0)),
)

/** The function holding [note], and the one lambda it hands Compose's Canvas to draw [what]. */
internal fun BytecodePatchContext.logoDrawing(note: String, what: String): LogoDrawing {
    val function = classesNoted(note).flatMap { it.methods }.filter { it.holdsNote(note) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .singleOrPatchException("$HEADER_LOGO_PATCH: $what, the function holding \"$note\"")
    val body = function.implementation!!.instructions.toList()
    val calls = body.indices.filter { body[it].canvasCall() }
    val call = calls.singleOrNull()
        ?: throw PatchException("$HEADER_LOGO_PATCH: ${function.signature()} hands Compose's Canvas ${calls.size} lambdas, not one")
    val lambda = body.newInstanceOf(call, body[call].argumentRegister(2))
        ?: throw PatchException("$HEADER_LOGO_PATCH: ${function.signature()} hands Compose's Canvas a lambda made somewhere else")
    val lambdaClass = classDefByOrNull(lambda)
        ?: throw PatchException("$HEADER_LOGO_PATCH: Threads carries no $lambda")
    if (FUNCTION1 !in lambdaClass.interfaces) throw PatchException("$HEADER_LOGO_PATCH: $lambda isn't a Function1")
    val invoke = lambdaClass.methods.singleOrNull {
        it.name == "invoke" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) && it.returnType == OBJECT
    } ?: throw PatchException("$HEADER_LOGO_PATCH: $lambda has no single invoke(Object)")
    val code = invoke.implementation?.instructions?.toList().orEmpty()
    // Redex merges look-alike lambdas into one class with a switch, and an early return there would
    // stop the others too.
    if (code.any { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }) {
        throw PatchException("$HEADER_LOGO_PATCH: ${invoke.signature()} switches, so it may draw more than $what")
    }
    if (code.firstCast() == null) throw PatchException("$HEADER_LOGO_PATCH: ${invoke.signature()} doesn't cast its draw scope first")
    return LogoDrawing(lambda, invoke)
}

/** Compose's Canvas(composer, modifier, onDraw, changed), a static void taking a Function1 third and an int last. */
private fun Instruction.canvasCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val callee = getReference<MethodReference>() ?: return false
    val parameters = callee.parameterTypes.map(CharSequence::toString)
    return callee.returnType == "V" && parameters.size == 4 && parameters[2] == FUNCTION1 && parameters[3] == "I" &&
        parameters.take(2).all { it.startsWith("L") && it != FUNCTION1 }
}

/** The register holding argument [index] of this call. None of the calls read here pass a wide value. */
private fun Instruction.argumentRegister(index: Int): Int = when (this) {
    is RegisterRangeInstruction -> startRegister + index
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG)[index]
    else -> throw PatchException("$HEADER_LOGO_PATCH: $opcode isn't a call")
}

/**
 * The class the `new-instance` nearest above [before] makes in [register], past its casts, or null
 * when something else writes the register first.
 */
private fun List<Instruction>.newInstanceOf(before: Int, register: Int): String? {
    for (index in before - 1 downTo 0) {
        val instruction = this[index]
        if (!instruction.opcode.setsRegister() || (instruction as? OneRegisterInstruction)?.registerA != register) continue
        return when (instruction.opcode) {
            Opcode.CHECK_CAST -> continue
            Opcode.NEW_INSTANCE -> instruction.getReference<TypeReference>()?.type
            else -> null
        }
    }
    return null
}

/** The first cast in a body, the one a Compose lambda opens with on its argument. */
private fun List<Instruction>.firstCast(): Instruction? = firstOrNull { it.opcode == Opcode.CHECK_CAST }

/**
 * Reads the path from Compose's draw scope to the canvas and its size out of Threads' logo lambda,
 * [invoke]: its argument's cast, the call that takes the draw context, the cast after it, and the
 * three objects and the size it reads from there, in the order 457 reads them.
 */
internal fun BytecodePatchContext.canvasPath(invoke: Method): CanvasPath {
    val code = invoke.implementation!!.instructions.toList()
    fun refuse(what: String): Nothing = throw PatchException("$HEADER_LOGO_PATCH: ${invoke.signature()} $what")
    val scope = code.firstCast()?.getReference<TypeReference>()?.type ?: refuse("casts nothing")

    // The draw context: the first object the lambda asks its draw scope for. 457 asks for nothing else.
    val contextAt = code.indices.firstOrNull { index ->
        code[index].opcode == Opcode.INVOKE_INTERFACE && code[index].getReference<MethodReference>()?.let {
            it.definingClass == scope && it.parameterTypes.isEmpty() && it.returnType.startsWith("L") && it.returnType != OBJECT
        } == true && code.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    } ?: refuse("never asks its draw scope for an object")
    val context = code[contextAt].getReference<MethodReference>()!!
    val castAt = (contextAt + 2..minOf(contextAt + 4, code.lastIndex)).firstOrNull { code[it].opcode == Opcode.CHECK_CAST }
        ?: refuse("doesn't cast ${context.returnType} right after taking it")
    val contextImpl = code[castAt].getReference<TypeReference>()!!.type
    var holder = (code[castAt] as OneRegisterInstruction).registerA

    val fields = mutableListOf<Pair<Int, FieldReference>>()
    var from = castAt + 1
    repeat(3) { step ->
        val read = (from..code.lastIndex).firstOrNull {
            code[it].opcode == Opcode.IGET_OBJECT && (code[it] as TwoRegisterInstruction).registerB == holder
        } ?: refuse("reads ${step + 1} object(s) from its draw context, not 3")
        fields += read to code[read].getReference<FieldReference>()!!
        holder = (code[read] as TwoRegisterInstruction).registerA
        from = read + 1
    }
    val (paramsAt, params) = fields[1]
    val paramsHolder = (code[paramsAt] as TwoRegisterInstruction).registerA
    val size = (paramsAt + 1..code.lastIndex).firstOrNull {
        code[it].opcode == Opcode.IGET_WIDE && (code[it] as TwoRegisterInstruction).registerB == paramsHolder &&
            code[it].getReference<FieldReference>()?.type == "J"
    }?.let { code[it].getReference<FieldReference>()!! } ?: refuse("reads no size from ${params.type}")
    val canvas = fields[2].second
    if (code[fields[2].first + 1].let { it.opcode != Opcode.INVOKE_INTERFACE || it.getReference<MethodReference>()?.definingClass != canvas.type }) {
        refuse("doesn't draw on ${canvas.type} right after reading it")
    }

    val helpers = mutableListOf<Method>()
    classDefForEach { classDef: ClassDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.filterTo(helpers) {
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                it.returnType == ANDROID_CANVAS && it.parameterTypes.map(CharSequence::toString) == listOf(canvas.type)
        }
    }
    val nativeCanvas = helpers.singleOrPatchException("$HEADER_LOGO_PATCH: Compose's nativeCanvas, a static (${canvas.type}) that returns $ANDROID_CANVAS")
    return CanvasPath(scope, context, contextImpl, fields[0].second, params, canvas, size, nativeCanvas)
}

private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
