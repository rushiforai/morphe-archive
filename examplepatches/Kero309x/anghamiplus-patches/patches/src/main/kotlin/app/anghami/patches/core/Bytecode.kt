package app.anghami.patches.core

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Smali stubs shared by the patch set.
 *
 * The patches in this bundle almost always neutralise a guard by making the
 * target method report a constant value. Keeping the emitted bytecode in one
 * place means the stubs are written once and stay consistent between patches.
 *
 * Every helper prepends its instructions at index `0`, so the original method
 * body becomes unreachable instead of being removed.
 */

/** Makes the method return `true` regardless of its original logic. */
fun MutableMethod.forceTrue() = addInstructions(0, TRUE)

/** Makes the method return `false` regardless of its original logic. */
fun MutableMethod.forceFalse() = addInstructions(0, FALSE)

/** Makes the method return `null` regardless of its original logic. */
fun MutableMethod.forceNull() = addInstructions(0, NULL)

/** Turns the method into a no-op that returns immediately. */
fun MutableMethod.forceVoid() = addInstructions(0, VOID)

private const val TRUE = "const/4 v0, 0x1\nreturn v0"
private const val FALSE = "const/4 v0, 0x0\nreturn v0"
private const val NULL = "const/4 v0, 0x0\nreturn-object v0"
private const val VOID = "return-void"
