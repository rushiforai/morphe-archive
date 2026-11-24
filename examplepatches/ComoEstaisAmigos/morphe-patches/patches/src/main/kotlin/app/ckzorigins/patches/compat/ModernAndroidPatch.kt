package app.ckzorigins.patches.compat

import app.ckzorigins.patches.mono.gluBackupPatch
import app.ckzorigins.patches.mono.stubMobileAppTrackerDeviceIds
import app.ckzorigins.patches.nativelib.NativeEdits
import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.Constants.ORIGINAL_APK
import app.adebisi.patches.shared.applyByteEdits
import app.adebisi.patches.shared.makeBindExplicit
import app.adebisi.patches.shared.requireStockNative
import app.adebisi.patches.shared.setTargetSdk
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * targetSdk 25, TEXTREL, GetSerialID, and the Play Store bindService setPackage belong together:
 * from 21 an implicit Intent throws, from 23 the linker refuses a text relocation, and from 10
 * TelephonyManager.getDeviceId throws for third-party apps.
 */
@Suppress("unused")
val modernAndroidPatch = patch(
    name = "Modern Android compatibility",
    description = "Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later " +
        "install the game normally.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch)

    execute {
        requireStockNative(NativeEdits.UNITY, NativeEdits.UNITY_SHA256, "Glu", ORIGINAL_APK)
        applyByteEdits(NativeEdits.UNITY, NativeEdits.TEXTREL, ORIGINAL_APK)
        requireStockNative(NativeEdits.GWALLET, NativeEdits.GWALLET_SHA256, "Glu", ORIGINAL_APK)
        applyByteEdits(NativeEdits.GWALLET, NativeEdits.SERIAL_ID + NativeEdits.JNI_GUARDS, ORIGINAL_APK)
        makeBindExplicit(BindMarketBillingServiceFingerprint)
        makeBindExplicit(LicenseCheckAccessFingerprint)
        skipExpansionSizeCheck(ExpansionFileExistsFingerprint.method)
        stubMobileAppTrackerDeviceIds()
        UnityDeviceIdFingerprint.method.returnEarly("")
        zeroPlayHavenWorldWritableIfPresent()

        document("AndroidManifest.xml").use { setTargetSdk(it) }
    }
}

/** Same as the hand-packaged APK: return File.exists() and skip the expansion size check. */
private fun skipExpansionSizeCheck(method: MutableMethod) {
    val exists = ExpansionFileExistsFingerprint.instructionMatches[0]
    val move = method.getInstruction(exists.index + 1)
    if (move.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("${method.name}: expected move-result after File.exists")
    }
    val dest = (move as OneRegisterInstruction).registerA
    method.addInstruction(exists.index + 2, "return v$dest")
}

/**
 * Disable telemetry empties PlayHaven, so the Context constructor is gone and the
 * MODE_WORLD_WRITEABLE write cannot run. When telemetry is off the original method is
 * still here and needs the same const/4 2 -> 0 edit as the hand-packaged APK.
 */
private fun zeroPlayHavenWorldWritableIfPresent() {
    val init = mutableClassDefBy("Lcom/playhaven/src/common/PHAPIRequest;").methods.find {
        it.name == "<init>" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/content/Context;") &&
            it.implementation != null
    } ?: return
    zeroWorldWritableMode(init)
}

/** Same in-place edit as the hand-packaged APK: MODE_WORLD_WRITEABLE (2) becomes MODE_PRIVATE (0). */
private fun zeroWorldWritableMode(method: MutableMethod) {
    val insns = method.implementation?.instructions
        ?: throw PatchException("${method.definingClass}->${method.name} has no code")
    val hits = insns.indices.filter { i ->
        val insn = insns[i]
        insn.opcode == Opcode.CONST_4 && (insn as NarrowLiteralInstruction).narrowLiteral == 2
    }
    val index = hits.singleOrNull()
        ?: throw PatchException(
            "${method.definingClass}->${method.name}: ${hits.size} const/4 2, expected 1",
        )
    val dest = (insns[index] as OneRegisterInstruction).registerA
    method.replaceInstruction(index, "const/4 v$dest, 0x0")
}
