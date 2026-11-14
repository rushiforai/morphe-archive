package app.morphe.patches.all.spoof.device

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private class Preset(
    val label: String,
    val manufacturer: String,
    val brand: String,
    val model: String,
    val device: String,
    val product: String,
    val board: String,
    val hardware: String,
    val release: String,
    val sdk: Int,
    val patch: String,
    val id: String,
    val incremental: String,
    val bootloader: String,
    val radio: String,
) {
    val fingerprint get() = "$brand/$product/$device:$release/$id/$incremental:user/release-keys"
    val display get() = id
}

private val PRESETS = listOf(
    // ── Google ──
    Preset("Pixel 9 Pro XL", "Google", "google", "Pixel 9 Pro XL", "komodo", "komodo", "komodo", "zumapro", "14", 34, "2024-09-05", "AP2A.240905.003", "12231197", "komodo-1.0-12231197", "unknown"),
    Preset("Pixel 9 Pro", "Google", "google", "Pixel 9 Pro", "caiman", "caiman", "caiman", "zumapro", "14", 34, "2024-09-05", "AP2A.240905.003", "12231197", "caiman-1.0-12231197", "unknown"),
    Preset("Pixel 9", "Google", "google", "Pixel 9", "tokay", "tokay", "tokay", "zumapro", "14", 34, "2024-09-05", "AP2A.240905.003", "12231197", "tokay-1.0-12231197", "unknown"),
    Preset("Pixel 8 Pro", "Google", "google", "Pixel 8 Pro", "husky", "husky", "husky", "tensor", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "husky-1.0-11677807", "unknown"),
    Preset("Pixel 8", "Google", "google", "Pixel 8", "shiba", "shiba", "shiba", "zuma", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "shiba-1.0-11677807", "unknown"),
    Preset("Pixel 8a", "Google", "google", "Pixel 8a", "akita", "akita", "akita", "zuma", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "akita-1.0-11677807", "unknown"),
    Preset("Pixel 7a", "Google", "google", "Pixel 7a", "lynx", "lynx", "lynx", "gs201", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "lynx-1.0-11677807", "unknown"),
    Preset("Pixel 7", "Google", "google", "Pixel 7", "panther", "panther", "panther", "tensor", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "panther-1.0-11677807", "unknown"),
    Preset("Pixel 6", "Google", "google", "Pixel 6", "oriole", "oriole", "oriole", "gs101", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "oriole-1.0-11677807", "unknown"),
    // ── Samsung ──
    Preset("Galaxy S24 Ultra", "samsung", "samsung", "SM-S928B", "e3q", "e3qxxx", "e3q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S928BXXU1AXCA", "S928BXXU1AXCA", "S928BXXU1AXCA"),
    Preset("Galaxy S24+", "samsung", "samsung", "SM-S926B", "e2q", "e2qxxx", "e2q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S926BXXU1AXCA", "S926BXXU1AXCA", "S926BXXU1AXCA"),
    Preset("Galaxy S24", "samsung", "samsung", "SM-S921B", "e1q", "e1qxxx", "e1q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S921BXXU1AXCA", "S921BXXU1AXCA", "S921BXXU1AXCA"),
    Preset("Galaxy S23", "samsung", "samsung", "SM-S911B", "dm3q", "dm3qxxx", "dm3q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S911BXXU3CWK1", "S911BXXU3CWK1", "S911BXXU3CWK1"),
    Preset("Galaxy S22 Ultra", "samsung", "samsung", "SM-S908B", "b0q", "b0qxxx", "b0q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S908BXXU3CWK1", "S908BXXU3CWK1", "S908BXXU3CWK1"),
    Preset("Galaxy S21 FE", "samsung", "samsung", "SM-G990B", "r9q", "r9qxxx", "r9q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "G990BXXU3CWK1", "G990BXXU3CWK1", "G990BXXU3CWK1"),
    Preset("Galaxy A54", "samsung", "samsung", "SM-A546B", "a54x", "a54xnsxx", "a54x", "s5e8835", "14", 34, "2024-01-01", "UP1A.231005.007", "A546BXXU3AWK1", "A546BXXU3AWK1", "A546BXXU3AWK1"),
    // ── Xiaomi / POCO ──
    Preset("Xiaomi 14", "Xiaomi", "Xiaomi", "23127PN0CG", "houji", "houji", "houji", "qcom", "14", 34, "2024-01-01", "UKQ1.230917.001", "V816.0.4.0.UNCCNXM", "unknown", "unknown"),
    Preset("Xiaomi 13", "Xiaomi", "Xiaomi", "2211133G", "fuxi", "fuxi", "fuxi", "qcom", "14", 34, "2024-01-01", "UKQ1.230917.001", "V14.0.3.0.UMCCNXM", "unknown", "unknown"),
    Preset("POCO F5", "POCO", "POCO", "23049PCD8G", "marble", "marble", "marble", "qcom", "14", 34, "2024-01-01", "UKQ1.230917.001", "V14.0.5.0.TMRCNXM", "unknown", "unknown"),
    // ── OnePlus ──
    Preset("OnePlus 12", "OnePlus", "OnePlus", "CPH2581", "OP594DL1", "CPH2581", "aston", "qcom", "14", 34, "2024-01-05", "UKQ1.230924.001", "R.20240105", "CPH2581_11.A.01", "unknown"),
    Preset("OnePlus 11", "OnePlus", "OnePlus", "CPH2449", "salami", "salami", "kalama", "qcom", "14", 34, "2024-01-05", "UKQ1.230924.001", "R.20240105", "unknown", "unknown"),
    // ── Nothing ──
    Preset("Nothing Phone (2a)", "Nothing", "Nothing", "A142", "Pacman", "Pacman", "Pacman", "mt6886", "14", 34, "2024-03-05", "UP1A.231005.007", "20240305", "unknown", "unknown"),
    Preset("Nothing Phone (2)", "Nothing", "Nothing", "A065", "Pong", "Pong", "Pong", "qcom", "14", 34, "2024-01-05", "UP1A.231005.007", "20240105", "unknown", "unknown"),
    Preset("Nothing Phone (1)", "Nothing", "Nothing", "A063", "Spacewar", "Spacewar", "Spacewar", "qcom", "14", 34, "2024-01-05", "UP1A.231005.007", "20240105", "unknown", "unknown"),
    // ── other brands ──
    Preset("Motorola Edge 40", "motorola", "motorola", "motorola edge 40", "lyriq", "lyriq", "lyriq", "mt6895", "14", 34, "2024-01-01", "UP1A.231005.007", "12345", "unknown", "unknown"),
    Preset("Xperia 1 V", "Sony", "Sony", "XQ-DQ72", "pdx234", "pdx234", "kalama", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "67.1.A.2.100", "unknown", "unknown"),
    Preset("Zenfone 10", "asus", "asus", "ASUS_AI2302", "AI2302", "AI2302", "kalama", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "34.0210.0210.100", "unknown", "unknown"),
    Preset("ROG Phone 8", "asus", "asus", "ASUS_AI2401", "AI2401", "AI2401", "pineapple", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "34.0210.0210.200", "unknown", "unknown"),
    Preset("Fairphone 5", "Fairphone", "Fairphone", "FP5", "FP5", "FP5", "FP5", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "FP5.20240101", "unknown", "unknown"),
)

@Suppress("unused")
val spoofDevicePatch = bytecodePatch(
    name = "Spoof device information",
    description = "Replaces android.os.Build device identity fields with a chosen device preset.",
    default = false,
) {
    val deviceOption = stringOption(
        key = "device",
        default = PRESETS[0].label,
        values = PRESETS.associate { it.label to it.label },
        title = "Device preset",
        description = "The device to impersonate.",
        required = true,
    )
    val spoofVersion by booleanOption(
        key = "spoofVersion",
        default = false,
        title = "Also spoof OS version",
        description = "Also spoof Build.VERSION (RELEASE, SDK_INT, ...). Can break apps; off by default.",
    )

    execute {
        val p = PRESETS.first { it.label == deviceOption.value }
        val buildStrings = mapOf(
            "MANUFACTURER" to p.manufacturer, "BRAND" to p.brand, "MODEL" to p.model,
            "DEVICE" to p.device, "PRODUCT" to p.product, "BOARD" to p.board, "HARDWARE" to p.hardware,
            "FINGERPRINT" to p.fingerprint, "DISPLAY" to p.display, "ID" to p.id,
            "BOOTLOADER" to p.bootloader, "RADIO" to p.radio,
            "TAGS" to "release-keys", "TYPE" to "user", "USER" to "android-build", "HOST" to "abfarm",
        )
        val versionStrings = mapOf(
            "RELEASE" to p.release,
            "SECURITY_PATCH" to p.patch,
            "INCREMENTAL" to p.incremental,
            "CODENAME" to "REL",
        )
        val ver = spoofVersion == true

        fun Instruction.isTarget(): Boolean {
            val f = getReference<FieldReference>()
            if (f != null) {
                if (opcode == Opcode.SGET_OBJECT && f.definingClass == "Landroid/os/Build;" && f.name in buildStrings) return true
                if (ver && f.definingClass == "Landroid/os/Build\$VERSION;") {
                    if (opcode == Opcode.SGET && f.name == "SDK_INT") return true
                    if (opcode == Opcode.SGET_OBJECT && f.name in versionStrings) return true
                }
                return false
            }
            val m = getReference<MethodReference>() ?: return false
            return m.definingClass == "Landroid/os/Build;" && m.name == "getRadioVersion"
        }

        classDefForEach { classDef ->
            val mc by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                if (impl.instructions.none { it.isTarget() }) return@forEach
                val mm = mc.findMutableMethodOf(method)
                val idxs = mm.instructions.withIndex().filter { it.value.isTarget() }.map { it.index }
                for (i in idxs) {
                    val ins = mm.getInstruction(i)
                    val f = ins.getReference<FieldReference>()
                    if (f != null) {
                        val reg = (ins as OneRegisterInstruction).registerA
                        when {
                            f.definingClass == "Landroid/os/Build;" && f.name in buildStrings ->
                                mm.replaceInstruction(i, "const-string v$reg, \"${buildStrings.getValue(f.name)}\"")
                            ver && f.definingClass == "Landroid/os/Build\$VERSION;" && f.name == "SDK_INT" ->
                                mm.replaceInstruction(i, "const v$reg, ${p.sdk}")
                            ver && f.definingClass == "Landroid/os/Build\$VERSION;" && f.name in versionStrings ->
                                mm.replaceInstruction(i, "const-string v$reg, \"${versionStrings.getValue(f.name)}\"")
                        }
                    } else {
                        val ni = i + 1
                        if (ni < mm.instructions.size && mm.getInstruction(ni).opcode == Opcode.MOVE_RESULT_OBJECT) {
                            val reg = (mm.getInstruction(ni) as OneRegisterInstruction).registerA
                            mm.replaceInstruction(ni, "const-string v$reg, \"${p.radio}\"")
                        }
                    }
                }
            }
        }
    }
}
