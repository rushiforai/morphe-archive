package app.ckzorigins.patches.compat

import app.ckzorigins.patches.mono.gluBackupPatch
import app.ckzorigins.patches.nativelib.NativeEdits
import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.applyByteEdits
import app.ckzorigins.patches.shared.sha256
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Element

internal const val TARGET_SDK = 25

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
        requireStockNative(NativeEdits.UNITY, NativeEdits.UNITY_SHA256)
        applyByteEdits(NativeEdits.UNITY, NativeEdits.TEXTREL)
        requireStockNative(NativeEdits.GWALLET, NativeEdits.GWALLET_SHA256)
        applyByteEdits(NativeEdits.GWALLET, NativeEdits.SERIAL_ID)
        makeBindExplicit(BindMarketBillingServiceFingerprint)
        makeBindExplicit(LicenseCheckAccessFingerprint)
        skipExpansionSizeCheck(ExpansionFileExistsFingerprint.method)
        MobileAppTrackerDeviceIdFingerprint.method.returnEarly("")
        MobileAppTrackerDeviceIdFromContextFingerprint.method.returnEarly("")
        UnityDeviceIdFingerprint.method.returnEarly("")
        zeroWorldWritableMode(PlayHavenApiRequestInitFingerprint.method)

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val usesSdk = document.getElementsByTagName("uses-sdk").item(0) as Element?
                ?: document.createElement("uses-sdk").also { manifest.insertBefore(it, manifest.firstChild) }
            usesSdk.setAttribute("android:targetSdkVersion", TARGET_SDK.toString())
        }
    }
}

/**
 * Same three instructions as the hand-packaged APK: setPackage("com.android.vending") on the
 * Intent, using the constructor's string register, which the next instruction overwrites anyway.
 */
private fun makeBindExplicit(fingerprint: Fingerprint) {
    val constructor = fingerprint.instructionMatches[1]
    val call = constructor.getInstruction<FiveRegisterInstruction>()
    val intent = call.registerC
    val scratch = call.registerD
    val method = fingerprint.method
    val next = method.getInstruction(constructor.index + 1)
    if (next.opcode != Opcode.CONST_4 || (next as OneRegisterInstruction).registerA != scratch) {
        throw PatchException("${method.name}: v$scratch is still live after the Intent constructor")
    }
    method.addInstructions(
        constructor.index + 1,
        """
            const-string v$scratch, "com.android.vending"
            invoke-virtual {v$intent, v$scratch}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            move-result-object v$intent
        """,
    )
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

private fun requireStockNative(path: String, expectedSha: String) {
    val lib = resourceFile(path, copy = true)
    if (!lib.exists()) throw PatchException("$path is missing from this APK")
    val hash = lib.readBytes().sha256()
    if (hash != expectedSha) {
        throw PatchException(
            "$path is not Glu's original (sha256 ${hash.take(12)}). " +
                "Patch the Origins 2.0.1 APK signed by Glu Mobile, not a repack or a patched build.",
        )
    }
}
