package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.insertBeforeWithLabels

// Hide before entering the renderer's Compose group.
internal fun validateOptionalRenderer(method: Method) {
    val implementation = method.implementation ?: throw PatchException("Promotion renderer has no body")
    val words = method.parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || !AccessFlags.STATIC.isSet(method.accessFlags) ||
        method.returnType != "V" || implementation.registerCount <= words || method.code().isEmpty()) {
        throw PatchException("Promotion renderer needs a public static void body and an entry scratch register")
    }
    if (implementation.tryBlocks.any { it.startCodeAddress == 0 })
        throw PatchException("Promotion renderer entry is protected; inspect its exception contract before gating")
}

internal fun MutableMethod.gateOptionalRenderer(policy: String) {
    validateOptionalRenderer(this)
    insertBeforeWithLabels(0, """
        invoke-static {}, $policy->blocked()Z
        move-result v0
        if-eqz v0, :original
        return-void
        :original
        nop
    """)
}
