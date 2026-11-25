/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val API_CREDENTIALS = "$EXTENSION_PACKAGE/misc/ApiCredentials;"
internal const val APPLY_SAVED_API_CREDENTIALS = "$API_CREDENTIALS->applySaved()V"
internal const val SAVED_API_NATIVE_VERSION = "$API_CREDENTIALS->nativeVersion(I)I"

/**
 * The two places in a connection manager's per-account constructor the saved pair goes in: [apply],
 * the instruction after its super constructor, and [initCall], its call to init, whose build number
 * sits in [version], the register after init's receiver.
 */
internal class SavedApiCredentialsSites(val apply: Int, val initCall: Int, val version: Int)

/**
 * The sites in [this], or null when it isn't the per-account constructor, either call isn't there,
 * or something branches onto one, which would skip the hook. Nothing before the super call may touch
 * the object, the API ID is read after it, and init is the constructor's last call.
 */
internal fun Method.savedApiCredentialsSites(): SavedApiCredentialsSites? {
    if (origName != "<init>" || parameterTypes.map { it.toString() } != listOf("I")) return null
    val code = implementation?.instructions?.toList() ?: return null
    val self = implementation!!.registerCount - 2
    fun call(index: Int) = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
    val superCall = code.indices.firstOrNull { index ->
        val reference = call(index) ?: return@firstOrNull false
        reference.name == "<init>" && reference.definingClass != definingClass && when (code[index].opcode) {
            Opcode.INVOKE_DIRECT -> (code[index] as FiveRegisterInstruction).registerC == self
            Opcode.INVOKE_DIRECT_RANGE -> (code[index] as RegisterRangeInstruction).startRegister == self
            else -> false
        }
    } ?: return null
    val init = code.indices.filter { index ->
        val reference = call(index)
        code[index].opcode == Opcode.INVOKE_VIRTUAL_RANGE && reference != null && reference.definingClass == definingClass &&
            reference.origName == "init" && reference.returnType == "V" &&
            reference.parameterTypes.take(3).map { it.toString() } == listOf("I", "I", "I")
    }.singleOrNull() ?: return null
    // init's receiver is a copy of the object (v1 on the 13.x builds), so only its shape is checked.
    val range = code[init] as RegisterRangeInstruction
    if (init <= superCall + 1 || range.registerCount < 4 ||
        code.getOrNull(init + 1)?.opcode != Opcode.RETURN_VOID) return null
    val flow = ControlFlow.of(this)
    fun straight(at: Int) = code.indices.filter { at in flow.normal[it] } == listOf(at - 1) && flow.exceptional.none { at in it }
    if (!straight(superCall + 1) || !straight(init)) return null
    return SavedApiCredentialsSites(superCall + 1, init, range.startRegister + 1)
}

/**
 * Lets an API ID typed into the app (Enter your API ID, from the sign-in refusal) take the place of the
 * one the app was patched with. Each connection manager asks the extension first thing after its super
 * constructor, before it reads BuildVars.APP_ID for the native layer, and the extension writes a saved
 * pair into BuildVars once per process. The build number it hands init goes through the extension too:
 * the native connection sends the API ID to the server again only when that number changes, so a saved
 * pair gets a number of its own. Without a saved pair nothing changes. Part of sign-in help, which
 * every selection carries; a build that moves the constructor patches on with a warning.
 */
internal val savedApiCredentialsPatch = bytecodePatch {
    dependsOn(telegramExtensionPatch)

    execute {
        controlHook(API_CREDENTIALS, "applySaved", emptyList(), "V")
        controlHook(API_CREDENTIALS, "nativeVersion", listOf("I"), "I")
        val constructor = tgMutableClassDefByOrNull(CONNECTIONS)?.methods?.singleOrNull { it.savedApiCredentialsSites() != null }
        if (constructor == null) {
            patchLog.warning("Sign-in help: Telegram's connection setup wasn't found, so an API ID typed into the app " +
                "isn't used.")
            return@execute
        }
        val sites = constructor.savedApiCredentialsSites()!!
        // The later site first, so the earlier index still points where it did.
        constructor.addInstructions(sites.initCall, """
            invoke-static/range {v${sites.version} .. v${sites.version}}, $SAVED_API_NATIVE_VERSION
            move-result v${sites.version}
        """)
        constructor.addInstructions(sites.apply, "invoke-static {}, $APPLY_SAVED_API_CREDENTIALS")
    }
}
