package app.template.patches.all.identity

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.Random
import java.util.logging.Logger

/**
 * Universal patch: each time you apply it, new random values are generated for
 * Android ID, Wi-Fi MAC, Bluetooth MAC and Build serial.
 *
 * Intended for clones: apply together with "Clone app" so every clone APK gets
 * a different device identity (the values are baked in at patch time).
 *
 * Covers the common call sites apps use to read those identifiers
 * (Settings.Secure.ANDROID_ID, WifiInfo.getMacAddress, BluetoothAdapter.getAddress,
 * Build.getSerial / SERIAL).
 */
@Suppress("unused")
val randomDeviceIdentityPatch = bytecodePatch(
    name = "Randomize device identity",
    description = "Generates random Android ID, Wi-Fi MAC, Bluetooth MAC and serial " +
        "each time the patch is applied. Useful so every clone has a different identity.",
    default = false,
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val rng = Random()

        val androidId = randomHex(rng, 16)
        val wifiMac = randomMac(rng)
        val btMac = randomMac(rng)
        val serial = randomDigits(rng, 16)

        logger.info("Random identity → Android ID=$androidId  Wi-Fi=$wifiMac  BT=$btMac  Serial=$serial")

        var total = 0
        total += foldSettingsString(
            classes = setOf("Landroid/provider/Settings\$Secure;"),
            keys = setOf("android_id", "ANDROID_ID"),
            value = androidId,
        )
        total += foldNoArgString(
            definingClass = "Landroid/net/wifi/WifiInfo;",
            methodNames = setOf("getMacAddress"),
            value = wifiMac,
        )
        total += foldNoArgString(
            definingClass = "Landroid/bluetooth/BluetoothAdapter;",
            methodNames = setOf("getAddress"),
            value = btMac,
        )
        total += foldNoArgString(
            definingClass = "Landroid/os/Build;",
            methodNames = setOf("getSerial"),
            value = serial,
        )
        total += foldStaticStringField(
            definingClass = "Landroid/os/Build;",
            fieldNames = setOf("SERIAL"),
            value = serial,
        )

        if (total > 0) {
            logger.info("Randomized device identity at $total site(s)")
        } else {
            logger.warning(
                "No common identity reads found in this APK. " +
                    "The app may use native code or a different API; identity stays real.",
            )
        }
    }
}

// --- helpers (minimal call-site folding, same idea as nai64 GetterSpoofer) ---

private fun randomHex(rng: Random, length: Int): String {
    val hex = "0123456789abcdef"
    return buildString(length) { repeat(length) { append(hex[rng.nextInt(16)]) } }
}

private fun randomDigits(rng: Random, length: Int): String =
    buildString(length) { repeat(length) { append(('0'.code + rng.nextInt(10)).toChar()) } }

private fun randomMac(rng: Random): String {
    // Locally administered, unicast (bit 1 of first octet set, bit 0 clear)
    val bytes = ByteArray(6) { rng.nextInt(256).toByte() }
    bytes[0] = ((bytes[0].toInt() and 0xFE) or 0x02).toByte()
    return bytes.joinToString(":") { "%02x".format(it) }
}

private fun escapeSmali(value: String): String =
    value
        .replace("\\", "\\\\")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
        .replace("\r", "\\n")
        .replace("\t", "\\t")

private fun constString(reg: Int, value: String): String {
    val body = "\"${escapeSmali(value)}\""
    return if (reg <= 0xff) "const-string v$reg, $body" else "const-string/jumbo v$reg, $body"
}

/**
 * Replaces Settings.Secure.getString(..., "android_id") (and similar) call sites
 * with a const-string of [value].
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.foldSettingsString(
    classes: Set<String>,
    keys: Set<String>,
    value: String,
): Int {
    var patched = 0
    classDefForEach { classDef ->
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        for (method in classDef.methods) {
            val implementation = method.implementation ?: continue
            val instructions = implementation.instructions.toList()
            val mutableMethod by lazy {
                mutableClass.methods.first {
                    it.name == method.name &&
                        it.parameterTypes == method.parameterTypes &&
                        it.returnType == method.returnType
                }
            }
            for ((index, instruction) in instructions.withIndex()) {
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: continue
                if (reference.definingClass !in classes) continue
                if (reference.name != "getString") continue
                if (reference.parameterTypes.size < 2) continue
                if (reference.parameterTypes[0] != "Landroid/content/ContentResolver;") continue
                if (reference.parameterTypes[1] != "Ljava/lang/String;") continue

                val keyRegister = when (instruction) {
                    is BuilderInstruction35c -> instruction.registerC
                    is BuilderInstruction3rc -> instruction.startRegister + 1
                    else -> continue
                }

                var keyValue: String? = null
                for (j in index - 1 downTo 0) {
                    val prev = instructions[j]
                    val reg = (prev as? OneRegisterInstruction)?.registerA ?: continue
                    if (reg != keyRegister) continue
                    when (prev.opcode) {
                        Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> {
                            keyValue = ((prev as? ReferenceInstruction)?.reference as? StringReference)?.string
                            break
                        }
                        Opcode.SGET_OBJECT -> {
                            val field = (prev as? ReferenceInstruction)?.reference as? FieldReference
                                ?: continue
                            if (field.name in keys || field.name.lowercase() in keys) {
                                keyValue = field.name.lowercase()
                                break
                            }
                        }
                        else -> continue
                    }
                }
                if (keyValue == null || keyValue !in keys && keyValue.lowercase() !in keys) continue

                val next = instructions.getOrNull(index + 1) ?: continue
                if (next.opcode != Opcode.MOVE_RESULT_OBJECT) continue
                val resultRegister = (next as OneRegisterInstruction).registerA

                mutableMethod.replaceInstruction(index, constString(resultRegister, value))
                mutableMethod.replaceInstruction(index + 1, "nop")
                patched++
            }
        }
    }
    return patched
}

/**
 * Replaces no-arg String getters (getMacAddress, getAddress, getSerial…) with const-string.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.foldNoArgString(
    definingClass: String,
    methodNames: Set<String>,
    value: String,
): Int {
    var patched = 0
    classDefForEach { classDef ->
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        for (method in classDef.methods) {
            val implementation = method.implementation ?: continue
            val instructions = implementation.instructions.toList()
            val mutableMethod by lazy {
                mutableClass.methods.first {
                    it.name == method.name &&
                        it.parameterTypes == method.parameterTypes &&
                        it.returnType == method.returnType
                }
            }
            for ((index, instruction) in instructions.withIndex()) {
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: continue
                if (reference.definingClass != definingClass) continue
                if (reference.name !in methodNames) continue
                if (reference.parameterTypes.isNotEmpty()) continue
                if (reference.returnType != "Ljava/lang/String;") continue

                val next = instructions.getOrNull(index + 1) ?: continue
                if (next.opcode != Opcode.MOVE_RESULT_OBJECT) continue
                val resultRegister = (next as OneRegisterInstruction).registerA

                mutableMethod.replaceInstruction(index, constString(resultRegister, value))
                mutableMethod.replaceInstruction(index + 1, "nop")
                patched++
            }
        }
    }
    return patched
}

/**
 * Replaces sget-object of static String fields (e.g. Build.SERIAL) with const-string.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.foldStaticStringField(
    definingClass: String,
    fieldNames: Set<String>,
    value: String,
): Int {
    var patched = 0
    classDefForEach { classDef ->
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        for (method in classDef.methods) {
            val implementation = method.implementation ?: continue
            val instructions = implementation.instructions.toList()
            val mutableMethod by lazy {
                mutableClass.methods.first {
                    it.name == method.name &&
                        it.parameterTypes == method.parameterTypes &&
                        it.returnType == method.returnType
                }
            }
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode != Opcode.SGET_OBJECT) continue
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: continue
                if (reference.definingClass != definingClass) continue
                if (reference.name !in fieldNames) continue
                if (reference.type != "Ljava/lang/String;") continue

                val resultRegister = (instruction as OneRegisterInstruction).registerA
                mutableMethod.replaceInstruction(index, constString(resultRegister, value))
                patched++
            }
        }
    }
    return patched
}
