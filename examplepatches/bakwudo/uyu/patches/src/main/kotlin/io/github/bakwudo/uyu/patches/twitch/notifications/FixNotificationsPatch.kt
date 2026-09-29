/*
 * Based on "Fix notifications" from hoomans-morphe-patches by arandomhooman (GPLv3).
 * https://github.com/arandomhooman/hoomans-morphe-patches
 */

package io.github.bakwudo.uyu.patches.twitch.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.TWITCH_PACKAGE_NAME

/** SHA-1 of Twitch's original signing certificate. */
private const val STOCK_CERT_SHA1 = "8C68C13822723A2B1FA844BED340031BEB1F9463"

@Suppress("unused")
val fixNotificationsPatch = bytecodePatch(
    name = "Fix notifications",
    description = "Fixes push notifications after patching. Firebase rejects device registration " +
        "because the patched app has a different signing certificate, and a different package name " +
        "when it is installed as a separate app. This sends Twitch's original certificate " +
        "fingerprint and package name with Firebase Installations requests only.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        val connectionBuilder = FirebaseInstallationsConnectionFingerprint.method

        // Replace only the values passed to these headers. PackageManager and every other
        // consumer still see the patched app's real certificate and package name.
        connectionBuilder.overrideRequestHeader("X-Android-Cert", STOCK_CERT_SHA1)
        connectionBuilder.overrideRequestHeader("X-Android-Package", TWITCH_PACKAGE_NAME)
    }
}

/**
 * Makes the first `addRequestProperty(name, value)` call after the string [name] send [value].
 */
private fun MutableMethod.overrideRequestHeader(name: String, value: String) {
    val nameIndex = instructions.withIndex().filter { (_, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == name
    }.map { it.index }.singleOrNull()
        ?: throw PatchException("$name header not found uniquely.")

    val headerCallIndex = instructions.indices.firstOrNull { index ->
        if (index <= nameIndex) return@firstOrNull false
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Ljava/net/URLConnection;" &&
            reference.name == "addRequestProperty" &&
            reference.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;")
    } ?: throw PatchException("$name addRequestProperty call not found.")

    val call = instructions[headerCallIndex] as? FiveRegisterInstruction
        ?: throw PatchException("$name request call changed instruction shape.")
    if (call.registerCount != 3 || call.registerE > 0xff) {
        throw PatchException("$name value register changed shape.")
    }

    addInstructions(headerCallIndex, "const-string v${call.registerE}, \"$value\"")
}
