package io.github.sabopura.morphe.patches.twitch.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.app.methodWith
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.registerDeadAt
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private const val CLOSE = "Lio/github/sabopura/morphe/extension/twitch/player/PlayerClose;"

private fun MethodReference.parameters() = parameterTypes.map { it.toString() }

private fun MethodReference.sameAs(other: MethodReference) = definingClass == other.definingClass && name == other.name &&
    returnType == other.returnType && parameters() == other.parameters()

/**
 * The call that closes the player screen, as the shrink itself makes it while casting:
 * `router.close(activity, tracker)`, each a field of the player screen. The close button of the
 * mini player ("DismissTheatre") makes the same call.
 */
internal fun theatreClose(theatre: ClassDef, shrink: Method): MethodReference? {
    val held = theatre.instanceFields.groupingBy { it.type }.eachCount().filterValues { it == 1 }.keys
    return (shrink.implementation?.instructions ?: emptyList())
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
        .filter { call ->
            call.returnType == "V" && call.parameterTypes.size == 2 &&
                call.parameters()[0].startsWith("Landroidx/fragment/app/") &&
                (call.parameters() + call.definingClass).all(held::contains)
        }
        .distinctBy { it.toString() }.singleOrNull()
}

/** Where a hook goes after the back handler's shrink: the index, the player screen's register and one for the result. */
internal class BackShrink(val after: Int, val theatre: Int, val scratch: Int)

/**
 * The call of [shrink] that [method] makes with the BACK_PRESS source, or null when it makes
 * none. Twitch drops the result there, so the hook reads it into a register nothing reads again.
 */
internal fun backShrink(method: Method, shrink: MethodReference, source: String): BackShrink? {
    val implementation = method.implementation ?: return null
    val code = implementation.instructions.toList()
    val call = code.indices.filter { index ->
        val target = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
        val loaded = (code.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? FieldReference
        index > 0 && code[index].opcode == Opcode.INVOKE_VIRTUAL && target != null && target.sameAs(shrink) &&
            code[index - 1].opcode == Opcode.SGET_OBJECT && loaded != null &&
            loaded.definingClass == source && loaded.name == "BACK_PRESS" && loaded.type == source &&
            (code[index - 1] as OneRegisterInstruction).registerA == (code[index] as FiveRegisterInstruction).registerD
    }.singleOrNull() ?: return null
    if (code.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT)
        throw PatchException("Twitch: the back handler of the player screen now reads whether it shrank")
    val theatre = (code[call] as FiveRegisterInstruction).registerC
    val parameters = method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    // Both registers go into one plain invoke, which reaches the first sixteen only.
    val scratch = (0 until minOf(implementation.registerCount - parameters, 16))
        .firstOrNull { it != theatre && registerDeadAt(method, call + 1, it) }
    if (scratch == null || theatre > 15)
        throw PatchException("Twitch: the back handler of the player screen has no register for the hook")
    return BackShrink(call + 1, theatre, scratch)
}

/**
 * Tells the extension when back shrank the player to the mini player, and gives it the call that
 * closes the player screen. Only back comes this way: the minimise button and the swipe down keep
 * the mini player, and so do the screens that shrink the player to show themselves.
 */
internal val backCloseHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val shrink = methodWith("player screen shrink", "dismiss_gesture") { it.returnType == "Z" && it.parameterTypes.size == 1 }
        val theatre = classDefBy(shrink.definingClass)
        val source = shrink.parameterTypes[0].toString()
        if (classDefBy(source).fields.none { it.name == "BACK_PRESS" && it.type == source })
            throw PatchException("Twitch: the player screen's shrink no longer takes a source with BACK_PRESS")

        val close = theatreClose(theatre, shrink) ?: throw PatchException("Twitch: the player screen's close call is not unique")
        val router = classDefBy(close.definingClass)
        val closeMethod = router.methods.filter { it.sameAs(close) }.uniqueContract("player screen close method")
        if (listOf(theatre.accessFlags, router.accessFlags, closeMethod.accessFlags).any { !AccessFlags.PUBLIC.isSet(it) })
            throw PatchException("Twitch: the player screen's close call is not public")
        fun held(type: String, what: String) = theatre.instanceFields.filter { it.type == type }
            .uniqueContract("player screen $what").also { requirePublicField(it, "Player screen $what") }
        mutableClassDefBy(CLOSE).methods.single { it.name == "close" }.addInstructions(0, """
            check-cast p0, ${theatre.type}
            iget-object p1, p0, ${held(close.definingClass, "router")}
            iget-object p2, p0, ${held(close.parameters()[0], "activity")}
            iget-object p0, p0, ${held(close.parameters()[1], "tracker")}
            invoke-virtual {p1, p2, p0}, $close
        """)

        val (owner, handler, at) = classesMatching { c -> c.instanceFields.any { it.type == theatre.type } }
            .flatMap { c -> c.methods.mapNotNull { m -> backShrink(m, shrink, source)?.let { Triple(c, m, it) } } }
            .uniqueContract("back handler of the player screen")
        mutableClassDefBy(owner).methods.single { it.sameAs(handler) }.addInstructions(at.after, """
            move-result v${at.scratch}
            invoke-static {v${at.theatre}, v${at.scratch}}, $CLOSE->afterBack(Ljava/lang/Object;Z)V
        """)
    }
}
