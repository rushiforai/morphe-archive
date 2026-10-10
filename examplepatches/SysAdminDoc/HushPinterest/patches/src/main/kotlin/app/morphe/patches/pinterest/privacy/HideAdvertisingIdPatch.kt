/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Hide advertising ID"
internal const val ADVERTISING_ID = "$EXTENSION_PACKAGE/privacy/AdvertisingId;"
internal const val ADVERTISING_INFO = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"

/** Google's public getters every reader goes through, and the hook that filters each one's answer. */
internal val ADVERTISING_ID_GETTERS = mapOf(
    "$ADVERTISING_INFO->getId()Ljava/lang/String;" to "$ADVERTISING_ID->id(Ljava/lang/String;)Ljava/lang/String;",
    "$ADVERTISING_INFO->isLimitAdTrackingEnabled()Z" to "$ADVERTISING_ID->limitTracking(Z)Z",
)

@Suppress("unused")
val hideAdvertisingIdPatch = bytecodePatch(
    name = PATCH,
    description = "Pinterest sees an empty advertising ID with ad tracking limited, the same as if you deleted your" +
        " ad ID in Android. Good for keeping ads from following you. On by default. Turn it off in " +
        "HushPinterest settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideAdvertisingId")
        requireStatusMethod("advertisingId")
        val edits = ADVERTISING_ID_GETTERS.map { (getter, hook) -> answerFilter(getter, hook) }
        edits.forEach { it.apply(this) }
        enableCapability("advertisingId")
        enableStatus("hideAdvertisingId")
    }
}

/** Sends each value the getter returns through the hook, leaving the getter's own read untouched. */
private fun BytecodePatchContext.answerFilter(getter: String, hook: String): PrivacyMethodEdit {
    val owner = classDefByOrNull(getter.substringBefore("->"))
        ?: throw PatchException("$PATCH: Google's advertising ID info class wasn't found")
    val original = owner.methods.singleOrNull { it.identity() == getter }
        ?: throw PatchException("$PATCH: $getter wasn't found")
    val extension = classDefByOrNull(ADVERTISING_ID)?.methods?.singleOrNull { it.identity() == hook }
    if (extension == null || !AccessFlags.PUBLIC.isSet(extension.accessFlags) || !AccessFlags.STATIC.isSet(extension.accessFlags)) {
        throw PatchException("$PATCH: no callable hook $hook")
    }
    if (AccessFlags.STATIC.isSet(original.accessFlags) || original.implementation == null) {
        throw PatchException("$PATCH: $getter isn't an instance method with a body")
    }
    val answer = if (original.returnType == "Z") Opcode.RETURN else Opcode.RETURN_OBJECT
    val returns = original.implementation!!.instructions.withIndex().filter { (_, it) ->
        it.opcode in setOf(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE, Opcode.RETURN_VOID)
    }
    if (returns.isEmpty() || returns.any { (_, it) -> it.opcode != answer || (it as OneRegisterInstruction).registerA > 15 }) {
        throw PatchException("$PATCH: $getter doesn't return its answer from a register the hook can take")
    }
    val move = if (answer == Opcode.RETURN) "move-result" else "move-result-object"
    val method = ImmutableMethod.of(original).toMutable()
    for ((index, instruction) in returns.asReversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        method.addInstructions(index, "invoke-static { v$register }, $hook\n$move v$register")
    }
    return PrivacyMethodEdit(getter, ImmutableMethod.of(method))
}
