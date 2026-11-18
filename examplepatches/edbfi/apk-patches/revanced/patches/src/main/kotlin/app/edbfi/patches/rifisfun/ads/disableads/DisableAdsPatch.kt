// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.ads.disableads

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.replaceInstruction
import app.revanced.patcher.extensions.type
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// Not the app's ADS_ENABLED setting: on the free app it also unlocks the "pro" features (galleries, Imgur albums, theme
// scripts, moderator tools, notifications). Each ad path is turned off where it starts instead.
@Suppress("unused")
val disableAdsPatch =
    bytecodePatch(
        name = "Disable ads",
        description = "Removes ads and the ad consent form, and keeps the ad SDKs from starting.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))

        apply {
            val adHelperLifecycle = adHelperLifecycleMethods()
            val initAdsSdk = initAdsSdkMethod()
            val albumAdapter = albumAdapterMethod()
            val feedAdRow = feedAdRowMethod()
            val feedAdCheck = feedAdCheckResult(feedAdRow)
            val bannerCheck = bannerCheckMethod()
            val appLovinInit = appLovinInitProviderMethod()
            val mobileAdsInit = mobileAdsInitProviderMethod()
            if (localRegisters(bannerCheck) < 1 || localRegisters(appLovinInit) < 1) {
                throw PatchException("The banner check or AppLovinInitProvider.onCreate has no register for a result")
            }

            // The feed and album ad helpers stay idle: no consent form, no ad loader, and so no SDK. The activity keeps
            // them, so skipping their teardown leaves nothing behind.
            adHelperLifecycle.forEach { it.addInstructions(0, "return-void") }
            // Revoking consent from the settings would start the SDK too.
            initAdsSdk.addInstructions(0, "return-void")
            // Albums keep their own adapter, without ad slots.
            albumAdapter.addInstructions(0, "return-object p2")
            // No feed ad row, which would otherwise show "loading" forever.
            val (index, register) = feedAdCheck
            feedAdRow.replaceInstruction(index, if (register <= 15) "const/4 v$register, 0x0" else "const/16 v$register, 0x0")
            // No banner: the pane layout then hides the banner's frame, as it does on a layout without room for it.
            bannerCheck.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
            appLovinInit.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
            mobileAdsInit.addInstructions(0, "return-void")
        }
    }

/**
 * The feed ad check's result in [method]: `invoke-virtual {this}, check()Z`, `move-result vR`, then `if-eqz vR` past the
 * new ad row. Returns the move-result's index and register.
 */
private fun feedAdCheckResult(method: MutableMethod): Pair<Int, Int> {
    val code = method.instructions.toList()
    val row = code.indices.singleOrNull { code[it].opcode == Opcode.NEW_INSTANCE && code[it].type == NATIVE_AD_THING }
        ?: throw PatchException("Expected one new $NATIVE_AD_THING in ${method.name}")
    val thisRegister = localRegisters(method)
    val checks = (0 until row - 2).filter { i ->
        val call = code[i]
        val reference = call.methodReference
        val read = code[i + 1]
        val branch = code[i + 2]
        call.opcode == Opcode.INVOKE_VIRTUAL && reference?.returnType == "Z" && reference.parameterTypes.isEmpty() &&
            (call as FiveRegisterInstruction).registerC == thisRegister &&
            read.opcode == Opcode.MOVE_RESULT && branch.opcode == Opcode.IF_EQZ &&
            (branch as OneRegisterInstruction).registerA == (read as OneRegisterInstruction).registerA &&
            ((branch as BuilderOffsetInstruction).target.location.index > row)
    }
    val check = checks.singleOrNull() ?: throw PatchException("Expected one check that gates the feed ad row, found ${checks.size}")
    return check + 1 to (code[check + 1] as OneRegisterInstruction).registerA
}

/** The registers a method's parameters take, `this` included. */
private fun parameterRegisters(method: MutableMethod): Int = (if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1) +
    method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

private fun localRegisters(method: MutableMethod): Int = (method.implementation?.registerCount ?: 0) - parameterRegisters(method)
