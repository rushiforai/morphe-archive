package dev.jibon.notes.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

import dev.jibon.notes.patches.shared.filterCallResults

private object IrisDeviceAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/app/biometrics/iris/IrisApi;",
    name = "isDeviceAvailable",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Share through the app's FileProvider or through MediaStore? One UI 8.5+ uses the FileProvider; older One UI
 * (and a patched app, whose One UI version reads 0) inserts the file into MediaStore, which only Samsung's
 * MediaProvider allows for a file in the app's own folder. Elsewhere the insert throws and nothing is shared.
 */
private object SupportedFileProviderFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/base/common/util/DeviceUtils;",
    name = "isSupportedFileProvider",
    returnType = "Z",
    parameters = listOf(),
)

private const val SHARE_AUTHORITY = "com.samsung.android.app.notes.shareprovider"
private const val SCLOUD_LIB = "Lcom/samsung/android/scloud/lib/"

/** `ContentResolver.notifyChange(Uri, ContentObserver)`. */
private fun Instruction.isNotifyChange(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val ref = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return ref.definingClass == "Landroid/content/ContentResolver;" && ref.name == "notifyChange" &&
        ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/net/Uri;", "Landroid/database/ContentObserver;")
}

@Suppress("unused")
val crashFixesPatch = bytecodePatch(
    name = "Crash fixes",
    description = "Reports no iris scanner, makes Share (PDF, image, Word...) open the app chooser, and finds " +
        "the pen settings layouts, colour palettes and share provider after a package rename, and keeps Samsung " +
        "Cloud sync from crashing on Samsung phones.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch)

    execute {
        IrisDeviceAvailableFingerprint.method.returnEarly(false)

        // These lookups assume the resources are filed under the running package name; after a rename
        // that depends on the tool (Clone app renames the resource table too, a manifest-only rename doesn't).
        val filter = "Lsamsungcompat/ResourcePackage;->get(Ljava/lang/String;)Ljava/lang/String;"
        val layouts = filterCallResults(
            "Lcom/samsung/android/sdk/pen/util/SpenLayoutUtil;",
            "Lcom/samsung/android/sdk/pen/Spen\$Companion;", "getSpenPackageName", filter,
        )
        val palettes = filterCallResults(
            "Lcom/samsung/android/sdk/pen/setting/color/SpenColorPaletteUtil;",
            "Landroid/content/Context;", "getPackageName", filter,
        )
        if (layouts == 0 || palettes == 0) {
            throw PatchException("Resource package lookups not found (layouts $layouts, palettes $palettes)")
        }

        SupportedFileProviderFingerprint.method.returnEarly(true)

        // The share provider's authority is written into the code; a renamed app declares its own.
        var authorities = 0
        classDefByStrings(SHARE_AUTHORITY).forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                for (index in instructions.size - 1 downTo 0) {
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) continue
                    val string = (instruction as ReferenceInstruction).reference as StringReference
                    if (string.string != SHARE_AUTHORITY) continue
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static { v$register }, Lsamsungcompat/ResourcePackage;->authority(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v$register
                        """,
                    )
                    authorities++
                }
            }
        }
        if (authorities == 0) throw PatchException("Share provider authority not found")

        // Samsung Cloud's settings library tells the cloud's settings screen about sync progress. On a Samsung phone
        // that provider is the official Notes', closed to other apps: the SecurityException would crash the sync.
        var notifies = 0
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(SCLOUD_LIB)) return@classDefForEach
            val calls = classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.isNotifyChange() } == true
            }
            if (!calls) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                for (index in instructions.indices) {
                    val instruction = instructions[index]
                    if (!instruction.isNotifyChange()) continue
                    val i = instruction as FiveRegisterInstruction
                    method.replaceInstruction(
                        index,
                        "invoke-static { v${i.registerC}, v${i.registerD}, v${i.registerE} }, " +
                            "Lsamsungcompat/CR;->notifyChange(Landroid/content/ContentResolver;Landroid/net/Uri;" +
                            "Landroid/database/ContentObserver;)V",
                    )
                    notifies++
                }
            }
        }
        if (notifies == 0) throw PatchException("Samsung Cloud sync status notifications not found")
    }
}
