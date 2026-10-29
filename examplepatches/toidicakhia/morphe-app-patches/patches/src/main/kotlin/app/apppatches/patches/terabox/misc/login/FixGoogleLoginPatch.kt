/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.patches.terabox.misc.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly
import app.apppatches.patches.shared.Constants
import app.apppatches.patches.shared.misc.smali.addMethod
import app.apppatches.patches.terabox.misc.fix.signature.spoofSignaturePatch
import app.morphe.util.findInstructionIndicesReversed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/apppatches/extension/terabox/GoogleLoginChromeClient;"

@Suppress("unused")
val fixGoogleLoginPatch = bytecodePatch(
    name = "Fix Google login",
    description = "Makes Sign in with Google work in the patched app, where it would " +
        "otherwise fail. Works as soon as you patch it in, with no switch.",
    default = true,
) {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    dependsOn(spoofSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        NativeAccountPageFingerprint.matchSingle().method.returnEarly(false)

        OfflinePackageManifestFingerprint.matchSingle().method.returnEarly(null)

        WebViewSetupFingerprint.matchSingle().method.apply {
            val registers = getFreeRegisterProvider(0, 2)
            val enabled = registers.getFreeRegister4Bit()
            val receiver = registers.getFreeRegister4Bit()

            addInstructions(
                0,
                """
                    const/4 v$enabled, 0x1
                    invoke-virtual { p1 }, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
                    move-result-object v$receiver
                    invoke-virtual { v$receiver, v$enabled }, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V
                    invoke-virtual { v$receiver, v$enabled }, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V
                    invoke-static { }, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
                    move-result-object v$receiver
                    invoke-virtual { v$receiver, p1, v$enabled }, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V
                """,
            )
        }

        WebViewUserAgentFingerprint.matchSingle().method.apply {
            findInstructionIndicesReversed {
                opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.name == "setUserAgentString"
            }.forEach { index ->
                val instruction = getInstruction<FiveRegisterInstruction>(index)

                replaceInstruction(
                    index,
                    "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
                        "$EXTENSION_CLASS->setBrowserUserAgent(" +
                        "Landroid/webkit/WebSettings;Ljava/lang/String;)V",
                )
            }
        }

        WebChromeClientFingerprint.matchSingle().apply {
            method.addInstructions(
                0,
                """
                    invoke-static { p1, p2 }, $EXTENSION_CLASS->injectLoginScript(
                        Landroid/webkit/WebView;I)V
                """,
            )

            classDef.addMethod(
                "onCreateWindow",
                listOf(
                    "Landroid/webkit/WebView;",
                    "Z",
                    "Z",
                    "Landroid/os/Message;",
                ),
                "Z",
                AccessFlags.PUBLIC.value,
                5,
                """
                    invoke-static { p1, p2, p3, p4 }, $EXTENSION_CLASS->openPopup(
                        Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
                    move-result p1
                    return p1
                """,
            )
        }
    }
}
