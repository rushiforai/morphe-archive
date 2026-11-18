/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.handleTargets
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireStub
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.sendToStandIn
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.extendsClass
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide save toasts"
internal const val TOAST_CONTAINER = "Lcom/pinterest/gestalt/toast/PinterestToastContainer;"
internal const val TOAST_VIEW = "Lcom/pinterest/gestalt/toast/BaseGestaltToast;"

/**
 * Resource names of the save confirmations' text, as the toast models, the text builders and the
 * screens that show them read them.
 */
internal val SAVE_TOAST_STRINGS = setOf(
    "saved_to", "saved_onto_board_bold", "pinned", "pinned_multiple", "pinned_multiple_to_board",
    "multi_board_save_saved_to_profile", "saved_onto_board", "saved_to_board_section",
    "saved_multiple_to_board_section", "pin_saved",
)

/** The text of the toast model that says a pin reached the phone. */
internal const val DOWNLOAD_TOAST_STRING = "downloaded_to_camera_roll"

/**
 * The messages after a picture or video finishes downloading. Screens hand these to toast models
 * that show other messages too, as ready-made words or as the text's id, so the extension looks
 * each one up by name while the app runs and compares both.
 */
internal val DOWNLOAD_TEXT_NAMES = setOf("pin_image_download_success", "pin_video_download_success")

/**
 * The ones a screen shows through a toast that says nothing about what it holds, a model handed a
 * ready-made text or an Android toast. The extension tells those by their words, so it looks each
 * of these up by name while the app runs.
 */
internal val SAVE_TEXT_NAMES = setOf(
    "pinned", "pinned_multiple", "saved_onto_board", "saved_to_board_section",
    "saved_multiple_to_board_section", "pin_saved",
)

private const val ANDROID_TOAST = "Landroid/widget/Toast;"

/** What Toast.makeText takes with a text, and with a text's resource id. UiHooks has an androidToast for each. */
internal val ANDROID_TOAST_SHAPES = listOf(
    listOf("Landroid/content/Context;", "Ljava/lang/CharSequence;", "I"),
    listOf("Landroid/content/Context;", "I", "I"),
)

private val TEXT_TYPES = setOf("Ljava/lang/String;", "Ljava/lang/CharSequence;")

/** The enum constant the follow suggestion after a save names when you open its creator. */
internal const val FOLLOW_UPSELL = "FollowUpsellToast"

/**
 * The enum constant the save confirmation with a "discover more ideas" line names when you tap it.
 * Pinterest shows that one in place of the plain confirmation from the third save in a row to a
 * board it suggests ideas for. Its text is built outside the model, so the model reads no save string.
 */
internal const val MORE_IDEAS_UPSELL = "BOARD_MORE_IDEAS_UPSELL_TOAST"

/**
 * A toast model that shows the text an object in one of its fields builds: the [model], that
 * [field] as smali names it, and the [sources], the classes behind the field's interface that
 * build a save confirmation.
 */
internal data class TextToast(val model: String, val field: String, val sources: List<String>)

/** One Android toast a screen shows: the [method] and where in it Toast.makeText is called. */
internal data class AndroidToast(val method: Method, val index: Int)

/**
 * The Android toasts the screens that save a pin show. [sites] are the ones the patch can send to
 * the extension. [unsure] counts the ones it leaves alone, because the toast isn't shown at once.
 */
internal data class AndroidToasts(val sites: List<AndroidToast>, val unsure: Int)

@Suppress("unused")
val hideSaveToastsPatch = bytecodePatch(
    name = PATCH,
    description = "Stops the pop-up Pinterest shows after you save a pin, such as the Saved to your board message " +
        "or a suggestion to follow the creator. The pin is still saved. A second switch does the same for the " +
        "messages after a download. Starts off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideSaveToasts")
        requireStatusMethod("saveToasts")
        requireStatusMethod("downloadToasts")
        requireStub(UI_HOOKS, "isDownloadToast")
        requireStub(UI_HOOKS, "isSaveTextToast")
        requireStub(UI_HOOKS, "isMessageToast")
        requireAndroidToastStandIns()
        val show = toastShowMethod()
        val model = show.parameterTypes.single().toString()
        val (saved, follow) = saveToastModels(model)
        val texts = saveTextToasts(model)
        val readers = saveTextReaders()
        val own = try {
            nativeToast().text
        } catch (refused: PatchException) {
            null
        }
        val messages = messageToasts(model, readers, (saved + follow + texts.map { it.model }).toSet(), own)
        val android = androidToasts(readers)
        val found = handleTargets(PATCH, "save toasts", listOf(
            "no saved to board toast was found".takeIf { saved.isEmpty() },
            "no follow suggestion toast was found".takeIf { follow.isEmpty() },
            "no save confirmation in a toast that asks another class for its text was found".takeIf { texts.isEmpty() },
            "no save confirmation in a toast that's handed its text was found".takeIf { messages.isEmpty() },
            when {
                android.sites.isEmpty() -> "no save confirmation shown as an Android toast was found"
                android.unsure > 0 -> "${android.unsure} of the Android toasts on the screens that save a pin can't be taken over, because they aren't shown at once"
                else -> null
            },
        )) { it }
        val types = (saved + follow).distinct()
        val method = mutable(show)
        val register = method.freeLocalsAt(PATCH, 0, 1).single()
        val toast = method.parameterRegisterNumber(0)
        if (toast > 15) throw PatchException("$PATCH: the toast container's model register is past v15")
        // Each Android toast goes to the stand-in that takes the same arguments in the same
        // registers and answers a toast, so the move-result and the show() after it stay right.
        // The call is read again from the method that gets changed, before anything is.
        val standIns = android.sites.map { site ->
            val target = mutable(site.method)
            val call = target.instructions().getOrNull(site.index)?.androidToastCall() ?: throw PatchException(
                "$PATCH: ${site.method.definingClass}->${site.method.name} doesn't make its toast where it was found",
            )
            Triple(target, site.index, "$UI_HOOKS->androidToast(${call.parameterTypes.joinToString("")})$ANDROID_TOAST")
        }
        // Instance checks the extension asks when a toast reaches the container.
        if (types.isNotEmpty()) writeStub(UI_HOOKS, "isSaveToast", 2, instanceChecks(types))
        // The same question for a toast that shows whatever text an object it holds builds: the
        // model alone doesn't say, so each check reads that object and asks which class built it.
        if (texts.isNotEmpty()) {
            writeStub(UI_HOOKS, "isSaveTextToast", 3, texts.withIndex().joinToString("\n") { (index, text) ->
                "instance-of v0, p0, ${text.model}\nif-eqz v0, :hush_text_$index\ncheck-cast p0, ${text.model}\n" +
                    "iget-object v0, p0, ${text.field}\n" +
                    text.sources.joinToString("\n") { "instance-of v1, v0, $it\nif-nez v1, :hush_save_toast" } +
                    "\n:hush_text_$index"
            } + "\nconst/4 v0, 0x0\nreturn v0\n:hush_save_toast\nconst/4 v0, 0x1\nreturn v0")
        }
        // The models handed a ready-made text. The extension reads the text of one of these and
        // hides it only when it reads as a save, since the same models say "Moved Pin" too.
        if (messages.isNotEmpty()) writeStub(UI_HOOKS, "isMessageToast", 2, instanceChecks(messages))
        standIns.forEach { (target, index, standIn) -> target.sendToStandIn(index, standIn) }
        method.addInstructionsWithLabels(0, """
            invoke-static { v$toast }, $UI_HOOKS->hideSaveToast(Ljava/lang/Object;)Z
            move-result v$register
            if-eqz v$register, :hush_show_toast
            return-void
        """, ExternalLabel("hush_show_toast", method.getInstruction(0)))
        if (found == 5) enableCapability("saveToasts")
        // The toasts that say a pin reached the phone have their own switch, so losing it costs
        // nothing else. One kind has a model of its own. The other is told at the container by its
        // words or text id, so all it needs is a screen that reads those texts.
        val downloads = downloadToastModels(model)
        if (downloads.isNotEmpty()) writeStub(UI_HOOKS, "isDownloadToast", 2, instanceChecks(downloads))
        if (downloads.isNotEmpty() || downloadTextIsRead()) {
            enableCapability("downloadToasts")
        } else {
            patchLog.warning("$PATCH: no toast that says a pin was downloaded was found, so Hide download toasts stays out.")
        }
        enableStatus("hideSaveToasts")
    }
}

/** A stub body that answers true for an instance of one of [types]. */
private fun instanceChecks(types: List<String>) = types.joinToString("\n") { type ->
    "instance-of v0, p0, $type\nif-nez v0, :hush_save_toast"
} + "\nconst/4 v0, 0x0\nreturn v0\n:hush_save_toast\nconst/4 v0, 0x1\nreturn v0"

/** Throws unless UiHooks has a public static androidToast for each shape Toast.makeText comes in. */
private fun BytecodePatchContext.requireAndroidToastStandIns() {
    val hooks = mutableClassDefBy(UI_HOOKS)
    ANDROID_TOAST_SHAPES.forEach { shape ->
        hooks.methods.singleOrNull { method ->
            method.name == "androidToast" && method.parameters() == shape && method.returnType == ANDROID_TOAST &&
                AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags)
        } ?: throw PatchException("$UI_HOOKS has no androidToast(${shape.joinToString("")})")
    }
}

/** The Toast.makeText call this instruction makes, in either of [ANDROID_TOAST_SHAPES], or null. */
internal fun Instruction.androidToastCall(): MethodReference? {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return null
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return call.takeIf {
        it.definingClass == ANDROID_TOAST && it.name == "makeText" && it.returnType == ANDROID_TOAST &&
            it.parameters() in ANDROID_TOAST_SHAPES
    }
}

/**
 * True when the toast made at [index] goes into a register and is shown by the very next
 * instruction. The extension's stand-in answers a toast that never shows in place of a save
 * confirmation, and show() is the one thing known to be safe to ask of that.
 */
internal fun Method.showsAtOnce(index: Int): Boolean {
    val body = instructions()
    val kept = body.getOrNull(index + 1)
    val shown = body.getOrNull(index + 2)
    if (kept?.opcode != Opcode.MOVE_RESULT_OBJECT || shown?.opcode != Opcode.INVOKE_VIRTUAL) return false
    val call = (shown as ReferenceInstruction).reference as MethodReference
    return call.definingClass == ANDROID_TOAST && call.name == "show" && call.parameterTypes.isEmpty() && call.returnType == "V" &&
        (shown as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == (kept as OneRegisterInstruction).registerA }
}

/**
 * Pinterest's methods that read a save confirmation's text: the toast models and text builders,
 * and the screens that save a pin and word the confirmation themselves. The extension's own
 * classes are left out.
 */
internal fun BytecodePatchContext.saveTextReaders(): List<Method> {
    val readers = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(readers) { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.SGET && ((instruction as ReferenceInstruction).reference as FieldReference).let {
                    it.type == "I" && it.name in SAVE_TOAST_STRINGS
                }
            } == true
        }
    }
    return readers
}

/**
 * Toast models that show a text they were handed, as far as a save goes: the ones a method that
 * reads a save text builds, other than the [named] models a save toast is told by already. Each is
 * public, so the extension's check can name it, and keeps a text in a field of its own or of a
 * class it extends. [own], the model HushPinterest's messages are built with, is never one: the
 * extension tells these toasts by their words, and a message of ours can start with "Saved to".
 */
internal fun BytecodePatchContext.messageToasts(model: String, readers: List<Method>, named: Set<String>, own: String?): List<String> =
    readers.flatMap { it.instructions() }.filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }.distinct()
        .filter { type ->
            val owner = classDefByOrNull(type)
            owner != null && type != model && type !in named && extendsClass(type, model) &&
                AccessFlags.PUBLIC.isSet(owner.accessFlags) && !AccessFlags.ABSTRACT.isSet(owner.accessFlags) &&
                (own == null || !extendsClass(own, type)) &&
                superclassChain(type).takeWhile { it != model }.mapNotNull { classDefByOrNull(it) }.any { holder ->
                    holder.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type in TEXT_TYPES }
                }
        }.sorted()

/**
 * Where a save confirmation is shown as an Android toast: the Toast.makeText calls in the methods
 * that read a save text, and in a helper one of them hands its text to, a static method that takes
 * what makeText takes and answers nothing. The same calls show other messages, a moved pin for
 * one, so the extension goes by the text.
 */
internal fun BytecodePatchContext.androidToasts(readers: List<Method>): AndroidToasts {
    val helpers = readers.flatMap { it.instructions() }
        .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .map { (it as ReferenceInstruction).reference as MethodReference }
        .filter { it.returnType == "V" && it.parameters() == ANDROID_TOAST_SHAPES.first() && !it.definingClass.startsWith(EXTENSION_ROOT) }
        .distinct().mapNotNull { call ->
            classDefByOrNull(call.definingClass)?.methods?.singleOrNull { method ->
                method.name == call.name && method.returnType == "V" && method.parameters() == call.parameters() &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
            }
        }
    val made = (readers + helpers).distinctBy { "${it.definingClass}->${it.name}(${it.parameters().joinToString("")})${it.returnType}" }
        .flatMap { method ->
            method.instructions().withIndex().filter { it.value.androidToastCall() != null }.map { AndroidToast(method, it.index) }
        }
    val (sites, unsure) = made.partition { it.method.showsAtOnce(it.index) }
    return AndroidToasts(sites, unsure.size)
}

/** The container's one method that takes a toast model and asks it for its view. */
internal fun BytecodePatchContext.toastShowMethod(): Method {
    val container = classDefByOrNull(TOAST_CONTAINER) ?: throw PatchException("$PATCH: Pinterest's toast container wasn't found")
    return container.methods.filter { method ->
        val model = method.parameterTypes.singleOrNull()?.toString()
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && model != null &&
            method.calls().any { it.definingClass == model && it.returnType == TOAST_VIEW && it.parameters() == listOf(TOAST_CONTAINER) }
    }.one("$PATCH: toast container show method")
}

/**
 * Concrete toast models whose own methods read a save confirmation's text or name the "more ideas"
 * confirmation, and the follow suggestion's.
 */
internal fun BytecodePatchContext.saveToastModels(model: String): Pair<List<String>, List<String>> {
    val saved = mutableListOf<String>()
    val follow = mutableListOf<String>()
    classDefForEach { owner ->
        if (AccessFlags.ABSTRACT.isSet(owner.accessFlags) || AccessFlags.INTERFACE.isSet(owner.accessFlags) ||
            owner.type == model || !extendsClass(owner.type, model)) return@classDefForEach
        val fields = owner.methods.flatMap { it.fields() }
        if (fields.any { it.type == "I" && it.name in SAVE_TOAST_STRINGS || it.name == MORE_IDEAS_UPSELL && it.type == it.definingClass }) {
            saved += owner.type
        }
        if (fields.any { it.name == FOLLOW_UPSELL && it.type == it.definingClass }) follow += owner.type
    }
    return saved.sorted() to follow.sorted()
}

/** Concrete toast models whose own methods read the text that says a pin was downloaded to the phone. */
internal fun BytecodePatchContext.downloadToastModels(model: String): List<String> {
    val found = mutableListOf<String>()
    classDefForEach { owner ->
        if (AccessFlags.ABSTRACT.isSet(owner.accessFlags) || AccessFlags.INTERFACE.isSet(owner.accessFlags) ||
            owner.type == model || !extendsClass(owner.type, model)) return@classDefForEach
        if (owner.methods.any { method -> method.fields().any { it.type == "I" && it.name == DOWNLOAD_TOAST_STRING } }) found += owner.type
    }
    return found.sorted()
}

/** True when one of Pinterest's methods reads the text shown after a picture or video finishes downloading. */
private fun BytecodePatchContext.downloadTextIsRead(): Boolean {
    var read = false
    classDefForEach { owner ->
        if (read || owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        read = owner.methods.any { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.SGET && ((instruction as ReferenceInstruction).reference as FieldReference).let {
                    it.type == "I" && it.name in DOWNLOAD_TEXT_NAMES
                }
            } == true
        }
    }
    return read
}

/**
 * Toast models that ask an interface they hold in a public field for their text, where a class
 * behind that interface reads a save confirmation's text. The same model shows other messages
 * through the interface's other classes, a removal for one, so the model alone isn't a save toast.
 * Everything the extension's check names has to be public, since it runs outside Pinterest's packages.
 */
internal fun BytecodePatchContext.saveTextToasts(model: String): List<TextToast> {
    val asks = mutableListOf<Triple<String, String, String>>()
    val sources = mutableMapOf<String, MutableList<String>>()
    classDefForEach { owner ->
        if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || AccessFlags.ABSTRACT.isSet(owner.accessFlags) ||
            AccessFlags.INTERFACE.isSet(owner.accessFlags) || owner.type == model) return@classDefForEach
        if (extendsClass(owner.type, model)) {
            // What the model's view builder asks for a CharSequence.
            val asked = owner.methods.filter { it.returnType == TOAST_VIEW && it.parameters() == listOf(TOAST_CONTAINER) }
                .flatMap { it.calls() }.filter { it.returnType == "Ljava/lang/CharSequence;" }.map { it.definingClass }.toSet()
            owner.fields.filter { field ->
                field.type in asked && AccessFlags.PUBLIC.isSet(field.accessFlags) && !AccessFlags.STATIC.isSet(field.accessFlags)
            }.forEach { asks += Triple(owner.type, it.name, it.type) }
        } else if (owner.interfaces.isNotEmpty() &&
            owner.methods.any { method -> method.fields().any { it.type == "I" && it.name in SAVE_TOAST_STRINGS } }) {
            owner.interfaces.forEach { sources.getOrPut(it) { mutableListOf() } += owner.type }
        }
    }
    return asks.mapNotNull { (owner, name, type) ->
        sources[type]?.let { TextToast(owner, "$owner->$name:$type", it.sorted()) }
    }.sortedBy { it.field }
}
