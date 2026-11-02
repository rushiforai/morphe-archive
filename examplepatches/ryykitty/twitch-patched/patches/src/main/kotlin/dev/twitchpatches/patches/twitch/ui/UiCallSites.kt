package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BRIDGE = "Ldev/twitchpatches/extension/ui/UiComposeBridge;"

private class MethodCallFingerprint(method: MethodReference) : Fingerprint(
    filters = listOf(methodCall(method)),
)

internal fun BytecodePatchContext.nativeCallers(target: MethodReference): List<Method> =
    MethodCallFingerprint(target).matchAll().map { it.originalMethod }.filter { it.definingClass != BRIDGE }
