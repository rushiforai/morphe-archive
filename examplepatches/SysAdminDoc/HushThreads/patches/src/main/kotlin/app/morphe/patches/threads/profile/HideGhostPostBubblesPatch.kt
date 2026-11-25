/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450 (2026-10-10), and the moved tray in 451 (2026-10-13).
 */
package app.morphe.patches.threads.profile

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.classesNoted
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.holdsNote
import app.morphe.patches.threads.misc.extension.noteSites
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireParameterIntact
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.argumentRegister
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide ghost post bubbles"
internal const val GHOST_POST_BUBBLES = "$EXTENSION_PACKAGE/profile/GhostPostBubbles;"
internal const val SHOW_ON_PROFILE = "$GHOST_POST_BUBBLES->showOnProfile(Z)Z"
internal const val SHOW_TRAY = "$GHOST_POST_BUBBLES->showTray(Z)Z"

/** Compose's notes, cut before the line number, which moves from build to build. */
internal const val PROFILE_BUBBLE_NOTE =
    "com.instagram.barcelona.profile.ui.ProfileGhostPostEntryBubble (ProfileGhostPostEntryBubble.kt:"
internal const val FEED_TRAY_NOTE = "com.instagram.barcelona.feed.ui.GhostPostFeedTray (GhostPostFeedTray.kt:"
internal const val MOVED_FEED_TRAY_NOTE = "com.instagram.barcelona.ghost.tray.ui.GhostPostFeedTray (GhostPostFeedTray.kt:"
internal val FEED_TRAY_NOTES = listOf(FEED_TRAY_NOTE, MOVED_FEED_TRAY_NOTE)
internal const val ANIMATED_VISIBILITY_NOTE = "androidx.compose.animation.AnimatedVisibility (AnimatedVisibility.kt:"

/** The call at [call] in [method] to one of Compose's AnimatedVisibility functions, which takes its visible flag in v[flag]. */
internal class VisibilityCall(val method: Method, val call: Int, val flag: Int)

/** The profile header's bubble: [method], and its declared [parameter] that [call] shows the bubble by. */
internal class ProfileBubble(val method: Method, val parameter: Int, val call: Int)

/**
 * Hides the ghost post bubbles on profile pictures.
 *
 * Threads shows a ghost post as a thought bubble on its author's picture, on the profile's header
 * and in a row of pictures at the top of the main feed. Each sits in a Compose AnimatedVisibility,
 * and Threads already hands it false when there's nothing to show, so the bubble or the row takes
 * no room. The header bubble's function is asked for its flag first thing, and the feed hands the
 * row's flag to the extension right before AnimatedVisibility gets it. While the switch is on the
 * answer is false. Your own profile and other people's share the header's function. The picture
 * under the bubble, its tap, and the ghost posts themselves stay as they are.
 *
 * The header bubble is found by its note, the row by its own note, then the one main feed method
 * that draws it, then the one main feed AnimatedVisibility that builds that drawer. The patch
 * refuses rather than guessing when any of those isn't exactly one, when the header's flag isn't a
 * boolean parameter that reaches its AnimatedVisibility unchanged, or when anything but the
 * instruction before it leads to the feed's AnimatedVisibility call.
 */
@Suppress("unused")
val hideGhostPostBubblesPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the ghost post bubbles off profile pictures, on profiles and in the row at the top of your " +
        "feed. The pictures and the ghost posts themselves stay. Good for a calmer look. Starts off. Turn it on in " +
        "HushThreads settings > Appearance.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("hideGhostPostBubbles")
        // Both are found and checked before either changes.
        val profile = profileBubble()
        val tray = feedTray()
        val flag = profile.method.parameterRegister(profile.parameter)
        mutable(profile.method).addInstructions(
            0,
            """
                invoke-static/range { $flag .. $flag }, $SHOW_ON_PROFILE
                move-result $flag
            """,
        )
        mutable(tray.method).addInstructions(
            tray.call,
            """
                invoke-static/range { v${tray.flag} .. v${tray.flag} }, $SHOW_TRAY
                move-result v${tray.flag}
            """,
        )
        enableStatus("hideGhostPostBubbles")
    }
}

/** The profile header's ghost post bubble, and the parameter it's shown by. */
internal fun BytecodePatchContext.profileBubble(): ProfileBubble {
    val method = composable(PROFILE_BUBBLE_NOTE, "the profile header's ghost post bubble")
    val call = visibilityCall(method, "the profile header's ghost post bubble")
    val parameter = method.parameterTypes.indices.firstOrNull { method.parameterRegisterNumber(it) == call.flag }
        ?: throw PatchException("$PATCH: ${method.signature()} shows its bubble by v${call.flag}, which isn't a parameter")
    if (method.parameterTypes[parameter].toString() != "Z") {
        throw PatchException("$PATCH: ${method.signature()} shows its bubble by parameter $parameter, " +
            "a ${method.parameterTypes[parameter]}, not a boolean")
    }
    // The hook goes in first thing, so the call has to read the parameter as it came in.
    method.requireParameterIntact(PATCH, parameter, listOf(call.call))
    return ProfileBubble(method, parameter, call.call)
}

/**
 * The main feed's AnimatedVisibility around its row of ghost post bubbles. The row's function is
 * drawn from one case of a content lambda class the feed shares with other screens, a three
 * argument invoke, as AnimatedVisibility's content is. Those screens build the class too, and only
 * the feed hands one to AnimatedVisibility.
 */
internal fun BytecodePatchContext.feedTray(): VisibilityCall {
    val tray = composable(FEED_TRAY_NOTES, "the feed's row of ghost post bubbles")
    val drawers = HashSet<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        val draws = classDef.methods.any { method ->
            method.name == "invoke" && method.parameterTypes.size == 3 &&
                method.implementation?.instructions?.any { it.calls(tray) } == true
        }
        if (draws) drawers += classDef.type
    }
    val builders = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.filterTo(builders) { method ->
            method.implementation?.instructions?.any {
                it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type in drawers
            } == true
        }
    }
    val wrapper = builders.distinctBy { it.signature() }
        .filter { method -> method.body().any { visibleSlot(it) != null } }
        .singleOrPatchException("$PATCH: the AnimatedVisibility around the lambda that draws ${tray.signature()}")
    val call = visibilityCall(mutable(wrapper), "the feed's row of ghost post bubbles")
    // The hook goes in right before the call, so nothing may reach the call past it.
    val flow = ControlFlow.of(call.method)
    val into = flow.instructions.indices.filter { from -> call.call in flow.normal[from] || call.call in flow.exceptional[from] }
    if (into != listOf(call.call - 1)) {
        throw PatchException("$PATCH: ${call.method.signature()} reaches its AnimatedVisibility call at ${call.call} " +
            "from $into, not only from the instruction before it")
    }
    return call
}

/** The one method outside the extension that holds [note], and holds it once, as a Compose function does. */
private fun BytecodePatchContext.composable(note: String, label: String): Method =
    composable(listOf(note), label)

/** The tray moved packages in 451. Its two exact notes still have to identify one function once. */
private fun BytecodePatchContext.composable(notes: List<String>, label: String): Method =
    notes.flatMap { classesNoted(it) }
        .flatMap { it.methods }
        .distinctBy { it.signature() }
        .filter { method -> notes.any { method.holdsNote(it) } }
        // Read through the mutable copy, so what's checked is what the hook goes into.
        .map { mutable(it) }
        .flatMap { method -> notes.flatMap { method.body().noteSites(it) }.map { method } }
        .singleOrPatchException("$PATCH: $label, the method holding one of $notes")

/** The one call in [method] to an AnimatedVisibility function, and the register its visible flag goes in. */
private fun BytecodePatchContext.visibilityCall(method: Method, label: String): VisibilityCall {
    val body = method.body()
    val (call, flag) = body.indices.mapNotNull { at ->
        visibleSlot(body[at])?.let { slot -> body[at].argumentRegister(slot)?.let { at to it } }
    }.singleOrPatchException("$PATCH: $label's AnimatedVisibility call in ${method.signature()}")
    return VisibilityCall(method, call, flag)
}

/**
 * Where a call to one of Compose's AnimatedVisibility functions takes its visible flag, or null for
 * anything else. R8 renames them and moves their parameters, so one is known by the note Compose
 * put in it, or, for the shorter overloads R8 keeps as forwarders, by a call to one that has it.
 * The flag is the only boolean each of them takes.
 */
private fun BytecodePatchContext.visibleSlot(instruction: Instruction): Int? {
    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return null
    val target = instruction.getReference<MethodReference>() ?: return null
    val types = target.parameterTypes.map { it.toString() }
    if (types.count { it == "Z" } != 1 || !animatesVisibility(target, forwarder = true)) return null
    return types.takeWhile { it != "Z" }.sumOf { if (it == "J" || it == "D") 2 else 1 }
}

private fun BytecodePatchContext.animatesVisibility(target: MethodReference, forwarder: Boolean): Boolean {
    val method = classDefByOrNull(target.definingClass)?.methods?.firstOrNull { it.matches(target) } ?: return false
    if (method.holdsNote(ANIMATED_VISIBILITY_NOTE)) return true
    return forwarder && method.body().any { inner ->
        (inner.opcode == Opcode.INVOKE_STATIC || inner.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            inner.getReference<MethodReference>()?.let { animatesVisibility(it, forwarder = false) } == true
    }
}

private fun Method.matches(reference: MethodReference) = name == reference.name && returnType == reference.returnType &&
    parameterTypes.map { it.toString() } == reference.parameterTypes.map { it.toString() }

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

/** A method's full signature. A Method is a MethodReference too. */
private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Instruction.calls(method: Method) = getReference<MethodReference>()?.signature() == method.signature()

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).findMutableMethodOf(method)
