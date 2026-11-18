package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import patches.shared.androidAutoHostVisibility

private const val CAR_SERVICE = "LIIlIIIIlllIlIlI;"
private const val ROOT = "LlIlIlllllIlllIl;"
private const val ROOT_METHOD = "lllIlIIIlllIIII"
private const val ROOT_REQUEST = "LlIlllIIIIlllIlI;"
private const val AUTO_PACKAGE = "com.google.android.projection.gearhead"
private val GOTO = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/**
 * Deezer only builds a media-browser root for four hard-coded client packages. Any other host
 * fails the package lookup before the signature verdict, so bypassing the verdict alone is not
 * enough. The car tree is selected by the client package; use the Android Auto client entry for
 * every caller and jump straight to its host-agnostic root build.
 */
@Suppress("unused")
val deezerCustomAndroidAutoHosts = bytecodePatch(
    name = "Allow any Android Auto host",
    description = "Lets Deezer's car media browser accept any Android Auto host, including DriveDeck, " +
        "Gearslip and hosts outside Deezer's package/signature allow-list. Home, Library, Recently " +
        "played and Explore stay browsable and Deezer's own Up next queue is used. Account, catalogue " +
        "and playback services are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(originalInput, androidAutoHostVisibility, deezerKeepSessionOnColdStart)

    execute {
        val method = mutableClassDefBy(CAR_SERVICE).methods.singleOrNull { candidate ->
            candidate.name == ROOT_METHOD && candidate.returnType == ROOT &&
                candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("I", "Landroid/os/Bundle;", "Ljava/lang/String;")
        } ?: throw IllegalStateException("Deezer car browser admission method changed")

        val implementation = method.implementation
            ?: throw IllegalStateException("Deezer car browser admission has no code")
        val thisRegister = implementation.registerCount - 4

        // The fall-through of `if-eqz v7, :cond_1e` is the host-agnostic root build. Its first
        // instruction creates the tree request from v3.
        val rootBranch = (0 until implementation.instructions.size - 1).firstOrNull { index ->
            val branch = method.getInstruction(index)
            val next = method.getInstruction(index + 1)
            branch.opcode == Opcode.IF_EQZ &&
                (branch as? OneRegisterInstruction)?.registerA == 7 &&
                next.opcode == Opcode.NEW_INSTANCE &&
                (next as? ReferenceInstruction)?.reference?.toString() == ROOT_REQUEST
        } ?: throw IllegalStateException("Deezer car browser root build changed")
        val rootIndex = rootBranch + 1

        // Keep the existing verdict bypass for callers that reach it.
        val last = implementation.instructions.size - 3
        val verdicts = (0..last).filter { index ->
            val branch = method.getInstruction(index)
            if (branch.opcode != Opcode.IF_EQZ) return@filter false
            val target = (branch as? BuilderOffsetInstruction)?.target?.location?.index
                ?: return@filter false
            if (target != index + 2) return@filter false
            if (method.getInstruction(index + 1).opcode !in GOTO) return@filter false
            val nullStore = method.getInstruction(index + 2)
            nullStore.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_16, Opcode.MOVE_OBJECT_FROM16) &&
                (nullStore as TwoRegisterInstruction).registerB == thisRegister
        }
        check(verdicts.size <= 1) { "Deezer car host verdict changed" }
        if (verdicts.size == 1) {
            method.replaceInstruction(verdicts.single(), "nop")
        }

        // v0/v3/v7 are already loaded from the arguments and the browser tree. Point the tree
        // request at the built-in Android Auto client, clear p0 (the compiler's null root value)
        // and branch to the root build before any package/signature validation.
        implementation.addInstruction(
            4,
            BuilderInstruction21c(
                Opcode.CONST_STRING, 3,
                ImmutableStringReference(AUTO_PACKAGE),
            ),
        )
        implementation.addInstruction(5, BuilderInstruction11n(Opcode.CONST_4, 11, 0))
        implementation.addInstruction(6, BuilderInstruction11n(Opcode.CONST_4, 12, 1))
        implementation.addInstruction(7, BuilderInstruction21s(Opcode.CONST_16, thisRegister, 0))
        val rootLabel = implementation.newLabelForIndex(rootIndex + 4)
        implementation.addInstruction(8, BuilderInstruction30t(Opcode.GOTO_32, rootLabel))
    }
}
