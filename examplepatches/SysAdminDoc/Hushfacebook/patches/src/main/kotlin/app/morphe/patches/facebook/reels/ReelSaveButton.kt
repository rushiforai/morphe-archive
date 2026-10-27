/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.downloads.reel.SIDEBAR
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsNaming
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.util.classDefForEachReferencing
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * The Save and direct WhatsApp buttons down a reel's right side (#190, #243). Read from 584
 * arm64; obfuscated names here are for reviewers, the code never writes one down.
 *
 * - The shared per-type factory (LX/93I;->A06) names "whatsapp_button" and both sidebar
 *   components. Its four callers walk a list of icon enum constants (LX/1Wz;), casting each
 *   Iterator.next() answer straight away: the UDDSideBarComponent and FbShortsSideBarComponent
 *   renders (LX/AF0; and LX/Th4;), their list builder (LX/U58;) and the VddVerticalUfiComponent
 *   builder (LX/93Q;). The old Save hook covered only the first render.
 * - Save is BOOKMARK (ordinal 274). APP_WHATSAPP (146) builds "whatsapp_button", with the
 *   WhatsApp icon and its own click. Like, Comment and Share are LIKE, COMMENT and SHARE.
 *   The enum's names are strings in its <clinit>, so name() reads them at run time.
 * - Skipping a type before it's built leaves each caller's component and metadata lists in step,
 *   since nothing has been added for it yet. The renders also use the input list to locate a badge.
 * - The hook goes right after the cast: the extension is handed the type, and true jumps back to
 *   the walk's hasNext(), as the walk's own `continue` does.
 */

internal const val REEL_SIDEBAR_BUTTON = "$EXTENSION_PACKAGE/reels/ReelDeclutter;->hideSidebarButton(Ljava/lang/Object;)Z"
internal const val WHATSAPP_BUTTON_ID = "whatsapp_button"
internal const val WHATSAPP_SIDEBAR_TYPE = "APP_WHATSAPP"
internal const val SHORTS_SIDEBAR = "FbShortsSideBarComponent"

private const val PATCH = "Clean up Reels"
private const val ITERATOR = "Ljava/util/Iterator;"
private const val ENUM = "Ljava/lang/Enum;"

/** Where the sidebar builder reads one button type: the next() call, its cast, and the loop's hasNext(). */
internal data class ButtonTypeWalk(val next: Int, val cast: Int, val hasNext: Int, val type: Int, val enumType: String)

/**
 * The one place [builder] takes a button type off an iterator and casts it to an enum, with the
 * hasNext() on the same iterator nearest before it. [isEnum] answers whether a type extends
 * java.lang.Enum. Null unless there's exactly one.
 */
internal fun buttonTypeWalk(builder: Method, isEnum: (String) -> Boolean): ButtonTypeWalk? {
    val code = builder.implementation?.instructions?.toList() ?: return null
    val walks = code.indices.mapNotNull { at ->
        val call = code[at].iteratorCall("next") ?: return@mapNotNull null
        val result = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
            ?: return@mapNotNull null
        val cast = code.getOrNull(at + 2)?.takeIf { it.opcode == Opcode.CHECK_CAST } ?: return@mapNotNull null
        if ((cast as OneRegisterInstruction).registerA != result.registerA) return@mapNotNull null
        val type = ((cast as ReferenceInstruction).reference as TypeReference).type
        if (!isEnum(type)) return@mapNotNull null
        val hasNext = (at - 1 downTo 0).firstOrNull { code[it].iteratorCall("hasNext") == call } ?: return@mapNotNull null
        ButtonTypeWalk(at, at + 2, hasNext, result.registerA, type)
    }
    return walks.singleOrNull()
}

/** The iterator register of an Iterator.[name]() call, or null when [this] isn't one. */
private fun Instruction.iteratorCall(name: String): Int? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (reference.definingClass != ITERATOR || reference.name != name || reference.parameterTypes.isNotEmpty()) return null
    return when (this) {
        is RegisterRangeInstruction -> startRegister.takeIf { registerCount == 1 }
        is FiveRegisterInstruction -> registerC.takeIf { registerCount == 1 }
        else -> null
    }
}

/**
 * Puts the sidebar switches' check right after each builder casts a button type: the type
 * goes to the extension, and true goes back to hasNext() before anything is built for it. Refuses
 * unless the shared factory has the four proven callers, each with one such walk over the same
 * enum, and a free local for the answer. No component or aligned-list entry exists at that point.
 */
internal fun BytecodePatchContext.hideReelSaveButton() {
    val factories = methodsNaming(WHATSAPP_BUTTON_ID) { holdsString(it, SIDEBAR) && holdsString(it, SHORTS_SIDEBAR) }
    val factory = factories.singleOrNull()
        ?: throw PatchException("$PATCH: expected one shared sidebar factory naming $WHATSAPP_BUTTON_ID, found ${factories.size}")
    val enumType = factory.parameterTypes.map(CharSequence::toString).singleOrNull { type ->
        classDefByOrNull(type)?.let { icons ->
            icons.superclass == ENUM && icons.methods.any { it.name == "<clinit>" && holdsString(it, WHATSAPP_SIDEBAR_TYPE) }
        } == true
    } ?: throw PatchException("$PATCH: the shared sidebar factory has no unique enum naming $WHATSAPP_SIDEBAR_TYPE")
    val builders = mutableListOf<Pair<String, Method>>()
    classDefForEachReferencing(types = listOf(factory.definingClass)) { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEachReferencing
        classDef.methods.filter { method ->
            method.implementation?.instructions?.any {
                val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                call != null && call.definingClass == factory.definingClass && isCalledBy(factory, call)
            } == true
        }.forEach { builders += classDef.type to it }
    }
    if (builders.size != 4) throw PatchException("$PATCH: expected four shared sidebar factory callers, found ${builders.size}")
    for ((owner, found) in builders) {
        // Download any reel edits the UDD builder too, and either patch can run first.
        val builder = mutableClassDefBy(owner).methods.single {
            it.name == found.name && it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString)
        }
        val walk = buttonTypeWalk(builder) { it == enumType }
            ?: throw PatchException("$PATCH: $owner->${found.name} doesn't read the sidebar's enum in one iterator walk")
        val at = walk.cast + 1
        val answer = builder.freeLocalsAt("$PATCH: the sidebar switches' answer", at, 1, targets = listOf(walk.hasNext), highest = 255).single()
        builder.addInstructionsWithLabels(
            at,
            """
                invoke-static/range { v${walk.type} .. v${walk.type} }, $REEL_SIDEBAR_BUTTON
                move-result v$answer
                if-nez v$answer, :next_button
            """,
            ExternalLabel("next_button", builder.getInstruction(walk.hasNext)),
        )
    }
}
