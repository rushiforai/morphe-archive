package patches.rox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * ROX's Dart code takes its version from the package_info_plus plugin, sends it as x-appVersion and
 * shows a blocking "Update Available ... Please update to new version to continue using ROX App"
 * dialog (forceUpdate) when a newer version is required. A patched copy is then unusable until a
 * new patched build exists.
 *
 * The plugin class is R8-obfuscated (3.0.14: o/AbstractConcatenatedTimeline), so it is matched by its
 * onMethodCall body, which builds the getAll result map with the literal keys "version",
 * "buildNumber" and "installerStore". The values put under "version" and "buildNumber" are passed
 * through UpdatePrompt first, so only the Flutter side sees a higher version.
 */

private const val UPDATE_PROMPT = "Lapp/proxma/rox/UpdatePrompt;"
private const val METHOD_CALL_TYPE = "Lio/flutter/plugin/common/MethodCall;"
private const val METHOD_RESULT_TYPE = "Lio/flutter/plugin/common/MethodChannel\$Result;"

internal val roxPackageInfoOnMethodCallFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(METHOD_CALL_TYPE, METHOD_RESULT_TYPE),
    strings = listOf("getAll", "buildNumber", "installerStore"),
    custom = { method, _ -> method.name == "onMethodCall" },
)

@Suppress("unused")
val skipForcedUpdatePatch = bytecodePatch(
    name = "Skip forced update prompt",
    description = "Stops the \"Update Available\" screen that blocks ROX until you install a newer " +
        "version, so this patched copy keeps working after ROX releases an update. ROX's own code is " +
        "told the app is a newer version than it is; Android still sees the real version. Off by " +
        "default: turn it on only if ROX shows that screen again before a new patched build is out.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")

    execute {
        val method = roxPackageInfoOnMethodCallFingerprint.method
        val instructions = method.instructions.toList()

        // Index of the map put() that stores the value for [key], and the register holding the value.
        fun putFor(key: String): Pair<Int, Int> {
            val keyIndex = instructions.indexOfFirst { instruction ->
                (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((instruction as ReferenceInstruction).reference as StringReference).string == key
            }
            if (keyIndex < 0) throw PatchException("package_info onMethodCall has no \"$key\" key")
            val keyRegister = (instructions[keyIndex] as OneRegisterInstruction).registerA
            for (index in keyIndex + 1 until instructions.size) {
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_INTERFACE) continue
                val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
                if (reference.name != "put" || reference.parameterTypes.size != 2) continue
                val call = instruction as FiveRegisterInstruction
                if (call.registerCount != 3 || call.registerD != keyRegister) {
                    throw PatchException("put() after \"$key\" does not take the key register v$keyRegister")
                }
                return index to call.registerE
            }
            throw PatchException("package_info onMethodCall has no put() after \"$key\"")
        }

        val version = putFor("version")
        val buildNumber = putFor("buildNumber")
        // Insert at the later index first so the earlier index stays valid.
        listOf(
            version to "version",
            buildNumber to "buildNumber",
        ).sortedByDescending { it.first.first }.forEach { (put, name) ->
            val (index, register) = put
            method.addInstructions(
                index,
                """
                    invoke-static/range {v$register .. v$register}, $UPDATE_PROMPT->$name(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """,
            )
        }
    }
}
