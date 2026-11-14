package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val INSTANT_GALLERY = "instant_gallery"
internal const val INSTANT_PICK_ACTIVITY = "app.hushmessenger.extension.InstantPickActivity"

/** What the capture callback logs when copying the photo runs out of memory. Nothing else in Messenger logs it. */
internal const val INSTANT_PHOTO_COPY = "photo_copy"

/** The recipe the capture callback builds for the Instant it sends. */
internal const val INSTANT_CAPTURE_RECIPE = "Lcom/facebook/messaging/quicksnap/creation/engine/model/MsgrQuicksnapCaptureRecipe;"

private const val INSTANT_BITMAP = "Landroid/graphics/Bitmap;"
private const val INSTANT_EXCEPTION = "Ljava/lang/Exception;"
private const val INSTANT_CAPTURE_CALL = "Lapp/hushmessenger/extension/InstantGallery;->capture(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)I"
private const val INSTANT_FRAME_CALL = "Lapp/hushmessenger/extension/InstantGallery;->frame(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;"
private val INSTANT_STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val INSTANT_INSTANCE_CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)

private fun instantChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the Instants camera moved ($detail)")

private fun Instruction.instantArguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * The Instants camera's capture callback: an instance method, void, handed one object (the camera's result), that
 * builds the capture recipe for the Instant and logs "photo_copy" when copying the photo runs out of memory.
 */
internal fun Method.isInstantCapture(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.size != 1 ||
        !parameterTypes.single().toString().startsWith("L")) return false
    val code = implementation?.instructions ?: return false
    var copy = false
    var recipe = false
    for (instruction in code) {
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (reference is StringReference && reference.string == INSTANT_PHOTO_COPY) copy = true
        if (reference is MethodReference && reference.definingClass == INSTANT_CAPTURE_RECIPE && reference.name == "<init>") recipe = true
    }
    return copy && recipe
}

/** Where a frame read ends, so the swap goes in at [at], and the register the frame is in there. */
internal data class InstantFrameRead(val at: Int, val register: Int)

/**
 * Each place the callback reads the camera's photo out of its result. Most builds call a static getter handed only the
 * result that returns a Bitmap; armv7 calls the result's own no-argument getter and casts what it hands back to a Bitmap.
 */
internal fun Method.instantFrameReads(): List<InstantFrameRead> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    val result = parameterRegister(1)
    val resultType = parameterTypes.single().toString()
    val reads = mutableListOf<InstantFrameRead>()
    for ((index, call) in code.withIndex()) {
        val method = (call as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (call.instantArguments() != listOf(result)) continue
        val moved = code.getOrNull(index + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction ?: continue
        val register = moved.registerA
        val getter = call.opcode in INSTANT_STATIC_CALLS && method.returnType == INSTANT_BITMAP &&
            method.parameterTypes.map { it.toString() } == listOf(resultType)
        if (getter) {
            reads += InstantFrameRead(index + 2, register)
            continue
        }
        if (call.opcode !in INSTANT_INSTANCE_CALLS || method.definingClass != resultType || method.parameterTypes.isNotEmpty() ||
            method.returnType != "Ljava/lang/Object;") continue
        val cast = code.getOrNull(index + 2)
        if (cast?.opcode == Opcode.CHECK_CAST && (cast as OneRegisterInstruction).registerA == register &&
            (cast as ReferenceInstruction).reference.toString() == INSTANT_BITMAP) reads += InstantFrameRead(index + 3, register)
    }
    return reads
}

internal fun findInstantGallery(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isInstantCapture() }

/**
 * The callback, its frame reads, and that each read sits in a try block whose handler takes an Exception: a gallery
 * back-out throws from the first read, and that handler is Messenger's own drop of a capture it couldn't use.
 */
internal fun MutableMethod.validateInstantGallery(): List<InstantFrameRead> {
    if (!isInstantCapture()) instantChanged("${hookId()} isn't the capture callback")
    validateScratch()
    // Three locals for the entry check, which runs before the method has put anything in them.
    if (implementation!!.registerCount - 2 < 3) instantChanged("too few registers in ${hookId()}")
    val reads = instantFrameReads()
    if (reads.isEmpty() || reads.size > 4) instantChanged("${reads.size} photo reads in ${hookId()}")
    val code = implementation!!.instructions.toList()
    val addresses = IntArray(code.size + 1)
    for (i in code.indices) addresses[i + 1] = addresses[i] + code[i].codeUnits
    val landings = jumpTargets()
    if (0 in landings) instantChanged("a branch to the start of ${hookId()}")
    for (read in reads) {
        if (read.at in landings || read.at >= code.size) instantChanged("a branch to a photo read in ${hookId()}")
        // The read and the instruction after it both sit in one block that catches Exception.
        val caught = implementation!!.tryBlocks.any { block ->
            val range = block.startCodeAddress until block.startCodeAddress + block.codeUnitCount
            addresses[read.at - 1] in range && addresses[read.at] in range &&
                block.exceptionHandlers.any { it.exceptionType == INSTANT_EXCEPTION || it.exceptionType == null }
        }
        if (!caught) instantChanged("a photo read outside the capture's try block in ${hookId()}")
    }
    return reads
}

/**
 * With the switch on, a capture first asks the extension, which holds it and opens the gallery, then runs the callback
 * again once something is picked. Each photo read then goes through the extension, which hands back the pick on the
 * first read of that run (and throws on a back-out, into Messenger's own drop). Off, Pause and safe mode run the
 * callback as it is, and every read hands back the camera's own photo.
 */
internal fun MutableMethod.injectInstantGallery() {
    val reads = validateInstantGallery()
    // Bottom up, so the earlier indexes stay where they were read.
    for (read in reads.sortedByDescending { it.at }) {
        addInstructions(read.at, """
            invoke-static/range {v${read.register} .. v${read.register}}, $INSTANT_FRAME_CALL
            move-result-object v${read.register}
        """.trimIndent())
    }
    addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        move-object/from16 v1, p1
        const-string v2, "$name"
        invoke-static {v0, v1, v2}, $INSTANT_CAPTURE_CALL
        move-result v0
        if-eqz v0, :stock_capture
        return-void
    """.trimIndent(), ExternalLabel("stock_capture", getInstruction(0)))
}

/**
 * Declares the pick screen, since Messenger's launcher only starts Messenger's own screens, and a photo pick among what
 * Messenger looks for in other apps: Android hides them from Messenger unless its manifest names one.
 */
internal fun Document.addInstantGallery() {
    val root = documentElement ?: throw PatchException("Messenger controls: the manifest has no root")
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("Messenger controls: expected one application")
    application.appendChild(createElement("activity").also { screen ->
        listOf("name" to INSTANT_PICK_ACTIVITY, "exported" to "false", "excludeFromRecents" to "true",
            "theme" to "@android:style/Theme.Translucent.NoTitleBar",
            "configChanges" to "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden")
            .forEach { (name, value) -> screen.setAttribute("android:$name", value) }
    })
    val children = root.childNodes
    val queries = (0 until children.length).map { children.item(it) }.filterIsInstance<Element>().firstOrNull { it.tagName == "queries" }
        ?: createElement("queries").also { root.appendChild(it) }
    val intent = createElement("intent")
    intent.appendChild(createElement("action").also { it.setAttribute("android:name", "android.intent.action.PICK") })
    intent.appendChild(createElement("data").also { it.setAttribute("android:mimeType", "image/*") })
    queries.appendChild(intent)
}
