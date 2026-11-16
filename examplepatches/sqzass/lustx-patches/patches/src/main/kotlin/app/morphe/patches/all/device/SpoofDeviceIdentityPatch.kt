package app.morphe.patches.all.device

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.all.shared.isControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlin.random.Random

private val LIB_PREFIXES = listOf(
    "Landroidx/", "Landroid/", "Lkotlin/", "Lkotlinx/",
    "Lcom/google/android/", "Lokhttp3/", "Lokio/", "Lretrofit2/",
    "Lcom/bumptech/", "Lcom/squareup/", "Ljava/", "Ljavax/",
)

private fun isLibraryClass(type: String) = LIB_PREFIXES.any(type::startsWith)

private class SimPreset(
    val label: String,
    val iso: String,
    val mcc: String,
    val mnc: String,
    val carrier: String,
) {
    val operator: String get() = mcc + mnc
}

private val SIM_PRESETS = listOf(
    SimPreset("US - T-Mobile", "us", "310", "260", "T-Mobile"),
    SimPreset("US - AT&T", "us", "310", "410", "AT&T"),
    SimPreset("US - Verizon", "us", "310", "012", "Verizon"),
    SimPreset("UK - EE", "gb", "234", "30", "EE"),
    SimPreset("UK - Vodafone", "gb", "234", "15", "Vodafone"),
    SimPreset("UK - O2", "gb", "234", "10", "O2"),
    SimPreset("DE - Telekom", "de", "262", "01", "Telekom"),
    SimPreset("DE - Vodafone", "de", "262", "02", "Vodafone"),
    SimPreset("FR - Orange", "fr", "208", "01", "Orange"),
    SimPreset("FR - SFR", "fr", "208", "10", "SFR"),
    SimPreset("ES - Movistar", "es", "214", "07", "Movistar"),
    SimPreset("IT - TIM", "it", "222", "01", "TIM"),
    SimPreset("NL - KPN", "nl", "204", "08", "KPN"),
    SimPreset("PL - Orange", "pl", "260", "03", "Orange"),
    SimPreset("BR - Vivo", "br", "724", "06", "Vivo"),
    SimPreset("IN - Jio", "in", "405", "854", "Jio"),
    SimPreset("IN - Airtel", "in", "404", "10", "Airtel"),
    SimPreset("JP - docomo", "jp", "440", "10", "docomo"),
    SimPreset("KR - SK Telecom", "kr", "450", "05", "SK Telecom"),
    SimPreset("AU - Telstra", "au", "505", "01", "Telstra"),
    SimPreset("CA - Rogers", "ca", "302", "720", "Rogers"),
    SimPreset("SG - StarHub", "sg", "525", "05", "StarHub"),
    SimPreset("AE - etisalat", "ae", "424", "02", "etisalat"),
    SimPreset("TR - Turkcell", "tr", "286", "01", "Turkcell"),
)

private class DevicePreset(
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
    val tags: String = "release-keys",
    val type: String = "user",
    val user: String = "android-build",
    val host: String = "abfarm",
) {
    val fingerprint get() = "$brand/$product/$device:$release/$id/$incremental:$type/$tags"
    val display get() = id
}

private val DEVICE_PRESETS = listOf(
    // ── Google ──
    DevicePreset("Pixel 9 Pro XL", "Google", "google", "Pixel 9 Pro XL", "komodo", "komodo", "komodo", "zumapro", "14", 34, "2024-09-05", "AP2A.240905.003", "12231197", "komodo-1.0-12231197", "unknown"),
    DevicePreset("Pixel 9 Pro", "Google", "google", "Pixel 9 Pro", "caiman", "caiman", "caiman", "zumapro", "14", 34, "2024-09-05", "AP2A.240905.003", "12231197", "caiman-1.0-12231197", "unknown"),
    DevicePreset("Pixel 9", "Google", "google", "Pixel 9", "tokay", "tokay", "tokay", "zumapro", "14", 34, "2024-09-05", "AP2A.240905.003", "12231197", "tokay-1.0-12231197", "unknown"),
    DevicePreset("Pixel 8 Pro", "Google", "google", "Pixel 8 Pro", "husky", "husky", "husky", "tensor", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "husky-1.0-11677807", "unknown"),
    DevicePreset("Pixel 8", "Google", "google", "Pixel 8", "shiba", "shiba", "shiba", "zuma", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "shiba-1.0-11677807", "unknown"),
    DevicePreset("Pixel 8a", "Google", "google", "Pixel 8a", "akita", "akita", "akita", "zuma", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "akita-1.0-11677807", "unknown"),
    DevicePreset("Pixel 7a", "Google", "google", "Pixel 7a", "lynx", "lynx", "lynx", "gs201", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "lynx-1.0-11677807", "unknown"),
    DevicePreset("Pixel 7", "Google", "google", "Pixel 7", "panther", "panther", "panther", "tensor", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "panther-1.0-11677807", "unknown"),
    DevicePreset("Pixel 6", "Google", "google", "Pixel 6", "oriole", "oriole", "oriole", "gs101", "14", 34, "2024-05-05", "AP1A.240505.004", "11677807", "oriole-1.0-11677807", "unknown"),

    // ── Samsung ──
    DevicePreset("Galaxy S24 Ultra", "samsung", "samsung", "SM-S928B", "e3q", "e3qxxx", "e3q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S928BXXU1AXCA", "S928BXXU1AXCA", "S928BXXU1AXCA"),
    DevicePreset("Galaxy S24+", "samsung", "samsung", "SM-S926B", "e2q", "e2qxxx", "e2q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S926BXXU1AXCA", "S926BXXU1AXCA", "S926BXXU1AXCA"),
    DevicePreset("Galaxy S24", "samsung", "samsung", "SM-S921B", "e1q", "e1qxxx", "e1q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S921BXXU1AXCA", "S921BXXU1AXCA", "S921BXXU1AXCA"),
    DevicePreset("Galaxy S23", "samsung", "samsung", "SM-S911B", "dm3q", "dm3qxxx", "dm3q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S911BXXU3CWK1", "S911BXXU3CWK1", "S911BXXU3CWK1"),
    DevicePreset("Galaxy S22 Ultra", "samsung", "samsung", "SM-S908B", "b0q", "b0qxxx", "b0q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "S908BXXU3CWK1", "S908BXXU3CWK1", "S908BXXU3CWK1"),
    DevicePreset("Galaxy S21 FE", "samsung", "samsung", "SM-G990B", "r9q", "r9qxxx", "r9q", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "G990BXXU3CWK1", "G990BXXU3CWK1", "G990BXXU3CWK1"),
    DevicePreset("Galaxy A54", "samsung", "samsung", "SM-A546B", "a54x", "a54xnsxx", "a54x", "s5e8835", "14", 34, "2024-01-01", "UP1A.231005.007", "A546BXXU3AWK1", "A546BXXU3AWK1", "A546BXXU3AWK1"),

    // ── Xiaomi / POCO ──
    DevicePreset("Xiaomi 14", "Xiaomi", "Xiaomi", "23127PN0CG", "houji", "houji", "houji", "qcom", "14", 34, "2024-01-01", "UKQ1.230917.001", "V816.0.4.0.UNCCNXM", "unknown", "unknown"),
    DevicePreset("Xiaomi 13", "Xiaomi", "Xiaomi", "2211133G", "fuxi", "fuxi", "fuxi", "qcom", "14", 34, "2024-01-01", "UKQ1.230917.001", "V14.0.3.0.UMCCNXM", "unknown", "unknown"),
    DevicePreset("POCO F5", "POCO", "POCO", "23049PCD8G", "marble", "marble", "marble", "qcom", "14", 34, "2024-01-01", "UKQ1.230917.001", "V14.0.5.0.TMRCNXM", "unknown", "unknown"),

    // ── OnePlus ──
    DevicePreset("OnePlus 12", "OnePlus", "OnePlus", "CPH2581", "OP594DL1", "CPH2581", "aston", "qcom", "14", 34, "2024-01-05", "UKQ1.230924.001", "R.20240105", "CPH2581_11.A.01", "unknown"),
    DevicePreset("OnePlus 11", "OnePlus", "OnePlus", "CPH2449", "salami", "salami", "kalama", "qcom", "14", 34, "2024-01-05", "UKQ1.230924.001", "R.20240105", "unknown", "unknown"),

    // ── Nothing ──
    DevicePreset("Nothing Phone (2a)", "Nothing", "Nothing", "A142", "Pacman", "Pacman", "Pacman", "mt6886", "14", 34, "2024-03-05", "UP1A.231005.007", "20240305", "unknown", "unknown"),
    DevicePreset("Nothing Phone (2)", "Nothing", "Nothing", "A065", "Pong", "Pong", "Pong", "qcom", "14", 34, "2024-01-05", "UP1A.231005.007", "20240105", "unknown", "unknown"),
    DevicePreset("Nothing Phone (1)", "Nothing", "Nothing", "A063", "Spacewar", "Spacewar", "Spacewar", "qcom", "14", 34, "2024-01-05", "UP1A.231005.007", "20240105", "unknown", "unknown"),

    // ── other brands ──
    DevicePreset("Motorola Edge 40", "motorola", "motorola", "motorola edge 40", "lyriq", "lyriq", "lyriq", "mt6895", "14", 34, "2024-01-01", "UP1A.231005.007", "12345", "unknown", "unknown"),
    DevicePreset("Xperia 1 V", "Sony", "Sony", "XQ-DQ72", "pdx234", "pdx234", "kalama", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "67.1.A.2.100", "unknown", "unknown"),
    DevicePreset("Zenfone 10", "asus", "asus", "ASUS_AI2302", "AI2302", "AI2302", "kalama", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "34.0210.0210.100", "unknown", "unknown"),
    DevicePreset("ROG Phone 8", "asus", "asus", "ASUS_AI2401", "AI2401", "AI2401", "pineapple", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "34.0210.0210.200", "unknown", "unknown"),
    DevicePreset("Fairphone 5", "Fairphone", "Fairphone", "FP5", "FP5", "FP5", "FP5", "qcom", "14", 34, "2024-01-01", "UP1A.231005.007", "FP5.20240101", "unknown", "unknown"),

    // ── emulator presets ──
    DevicePreset(
        label = "Generic emulator (ranchu)",
        manufacturer = "Google",
        brand = "google",
        model = "sdk_gphone64_x86_64",
        device = "ranchu",
        product = "sdk_gphone64_x86_64",
        board = "ranchu",
        hardware = "ranchu",
        release = "14",
        sdk = 34,
        patch = "2024-09-05",
        id = "UE1A.230829.050",
        incremental = "10811458",
        bootloader = "unknown",
        radio = "unknown",
        tags = "dev-keys",
        type = "userdebug",
        user = "buildbot",
        host = "abfarm-release",
    ),
    DevicePreset(
        label = "Genymotion",
        manufacturer = "Genymotion",
        brand = "Genymotion",
        model = "GS101T",
        device = "vbox86p",
        product = "vbox86p",
        board = "vbox86p",
        hardware = "vbox86p",
        release = "8.0.0",
        sdk = 26,
        patch = "2018-09-05",
        id = "GPD28P",
        incremental = "1234",
        bootloader = "unknown",
        radio = "unknown",
        tags = "test-keys",
        type = "userdebug",
        user = "builder",
        host = "buildhost",
    ),
    DevicePreset(
        label = "BlueStacks",
        manufacturer = "BlueStacks",
        brand = "BlueStacks",
        model = "HFX5W",
        device = "HFX5W",
        product = "HFX5W",
        board = "HFX5W",
        hardware = "HFX5W",
        release = "9",
        sdk = 28,
        patch = "2019-01-01",
        id = "PI2.181005.003",
        incremental = "eng.bstack.20190101.123456",
        bootloader = "unknown",
        radio = "unknown",
        tags = "test-keys",
        type = "userdebug",
        user = "bstack",
        host = "buildhost",
    ),
    DevicePreset(
        label = "Nox Player",
        manufacturer = "Nox",
        brand = "Nox",
        model = "VM",
        device = "VM",
        product = "VM",
        board = "VM",
        hardware = "VM",
        release = "9",
        sdk = 28,
        patch = "2019-01-01",
        id = "PI2.181005.003",
        incremental = "eng.nox.20190101.123456",
        bootloader = "unknown",
        radio = "unknown",
        tags = "test-keys",
        type = "userdebug",
        user = "nox",
        host = "buildhost",
    ),
)

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(
        ins.registerC,
        ins.registerD,
        ins.registerE,
        ins.registerF,
        ins.registerG,
    ).take(ins.registerCount)

    is RegisterRangeInstruction -> (
        ins.startRegister until ins.startRegister + ins.registerCount
        ).toList()

    else -> null
}

private fun randomHex(len: Int): String = List(len) { "0123456789abcdef"[Random.nextInt(16)] }.joinToString("")

private fun randomMac(): String = List(6) { "%02x".format(Random.nextInt(256)) }.joinToString(":")

private fun MutableMethod.replaceStringResult(
    invokeIndex: Int,
    value: String,
) {
    val resultIndex = invokeIndex + 1
    if (resultIndex >= instructions.size) return

    val result = getInstruction(resultIndex)
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return

    val reg = (result as OneRegisterInstruction).registerA
    replaceInstruction(resultIndex, "const-string v$reg, \"$value\"")
}

private fun MutableMethod.isAndroidIdArg(
    invokeIndex: Int,
    reg: Int,
): Boolean {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = getInstruction(j)
        val op = ins.opcode

        if (isControlFlow(op)) return false

        if (
            op == Opcode.GOTO ||
            op == Opcode.GOTO_16 ||
            op == Opcode.GOTO_32 ||
            op == Opcode.PACKED_SWITCH ||
            op == Opcode.SPARSE_SWITCH ||
            op.name.startsWith("IF_") ||
            op.name.startsWith("RETURN")
        ) {
            return false
        }
    }

    return false
}

private fun spoofAndroidId(fakeId: String) {
    val targets = listOf(
        "Landroid/provider/Settings\$Secure;->getString(" +
            "Landroid/content/ContentResolver;Ljava/lang/String;" +
            ")Ljava/lang/String;",
        "Landroid/provider/Settings\$Secure;->getStringForUser(" +
            "Landroid/content/ContentResolver;Ljava/lang/String;I" +
            ")Ljava/lang/String;",
    )

    targets.forEach { target ->
        methodCall(target).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            val regs = argRegisters(getInstruction(index))
                ?: return@matchAllMethodIndicesForEach

            if (regs.size < 2) return@matchAllMethodIndicesForEach
            if (!isAndroidIdArg(index, regs[1])) return@matchAllMethodIndicesForEach

            replaceStringResult(index, fakeId)
        }
    }
}

private fun spoofMac(fakeMac: String) {
    val targets = listOf(
        "Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;",
        "Landroid/bluetooth/BluetoothAdapter;->getAddress()Ljava/lang/String;",
    )

    targets.forEach { target ->
        methodCall(target).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            replaceStringResult(index, fakeMac)
        }
    }
}

private fun spoofSim(p: SimPreset) {
    val targets = mapOf(
        "Landroid/telephony/TelephonyManager;->getNetworkCountryIso()" +
            "Ljava/lang/String;" to p.iso,
        "Landroid/telephony/TelephonyManager;->getSimCountryIso()" +
            "Ljava/lang/String;" to p.iso,
        "Landroid/telephony/TelephonyManager;->getNetworkOperator()" +
            "Ljava/lang/String;" to p.operator,
        "Landroid/telephony/TelephonyManager;->getSimOperator()" +
            "Ljava/lang/String;" to p.operator,
        "Landroid/telephony/TelephonyManager;->getSimOperatorName()" +
            "Ljava/lang/String;" to p.carrier,
        "Landroid/telephony/TelephonyManager;->getNetworkOperatorName()" +
            "Ljava/lang/String;" to p.carrier,
        "Landroid/telephony/SubscriptionInfo;->getCountryIso()" +
            "Ljava/lang/String;" to p.iso,
        "Landroid/telephony/SubscriptionInfo;->getCarrierName()" +
            "Ljava/lang/CharSequence;" to p.carrier,
        "Landroid/telephony/SubscriptionInfo;->getDisplayName()" +
            "Ljava/lang/CharSequence;" to p.carrier,
        "Landroid/telephony/SubscriptionInfo;->getMccString()" +
            "Ljava/lang/String;" to p.mcc,
        "Landroid/telephony/SubscriptionInfo;->getMncString()" +
            "Ljava/lang/String;" to p.mnc,
    )

    targets.forEach { (target, value) ->
        methodCall(target).matchAllMethodIndicesForEach(requireMatches = false) { index ->
            replaceStringResult(index, value)
        }
    }
}

private fun Instruction.isDeviceTarget(
    buildStrings: Map<String, String>,
    versionStrings: Map<String, String>,
    spoofVersion: Boolean,
): Boolean {
    val f = getReference<FieldReference>()

    if (f != null) {
        if (
            opcode == Opcode.SGET_OBJECT &&
            f.definingClass == "Landroid/os/Build;" &&
            f.name in buildStrings
        ) {
            return true
        }

        if (spoofVersion && f.definingClass == "Landroid/os/Build\$VERSION;") {
            if (opcode == Opcode.SGET && f.name == "SDK_INT") return true
            if (opcode == Opcode.SGET_OBJECT && f.name in versionStrings) return true
        }

        return false
    }

    val m = getReference<MethodReference>() ?: return false
    return m.definingClass == "Landroid/os/Build;" && m.name == "getRadioVersion"
}

private fun processDeviceMethod(
    mc: MutableClass,
    method: Method,
    p: DevicePreset,
    buildStrings: Map<String, String>,
    versionStrings: Map<String, String>,
    spoofVersion: Boolean,
) {
    val impl = method.implementation ?: return

    if (impl.instructions.none { it.isDeviceTarget(buildStrings, versionStrings, spoofVersion) }) {
        return
    }

    val mm = mc.findMutableMethodOf(method)
    val indices = mm.instructions
        .withIndex()
        .filter { it.value.isDeviceTarget(buildStrings, versionStrings, spoofVersion) }
        .map { it.index }

    for (i in indices) {
        val ins = mm.getInstruction(i)
        val f = ins.getReference<FieldReference>()

        if (f != null) {
            val reg = (ins as OneRegisterInstruction).registerA

            when {
                f.definingClass == "Landroid/os/Build;" && f.name in buildStrings ->
                    mm.replaceInstruction(
                        i,
                        "const-string v$reg, \"${buildStrings.getValue(f.name)}\"",
                    )

                spoofVersion &&
                    f.definingClass == "Landroid/os/Build\$VERSION;" &&
                    f.name == "SDK_INT" ->
                    mm.replaceInstruction(i, "const v$reg, ${p.sdk}")

                spoofVersion &&
                    f.definingClass == "Landroid/os/Build\$VERSION;" &&
                    f.name in versionStrings ->
                    mm.replaceInstruction(
                        i,
                        "const-string v$reg, \"${versionStrings.getValue(f.name)}\"",
                    )
            }
        } else {
            val next = i + 1

            if (
                next < mm.instructions.size &&
                mm.getInstruction(next).opcode == Opcode.MOVE_RESULT_OBJECT
            ) {
                val reg = (mm.getInstruction(next) as OneRegisterInstruction).registerA
                mm.replaceInstruction(next, "const-string v$reg, \"${p.radio}\"")
            }
        }
    }
}

private fun processDeviceClass(
    classDef: ClassDef,
    p: DevicePreset,
    buildStrings: Map<String, String>,
    versionStrings: Map<String, String>,
    spoofVersion: Boolean,
) {
    if (isLibraryClass(classDef.type)) return

    val hasTarget = classDef.methods.any { method ->
        method.implementation?.instructions?.any { ins ->
            ins.isDeviceTarget(buildStrings, versionStrings, spoofVersion)
        } == true
    }

    if (!hasTarget) return

    val mc = mutableClassDefBy(classDef)

    classDef.methods.forEach { method ->
        processDeviceMethod(mc, method, p, buildStrings, versionStrings, spoofVersion)
    }
}

private fun spoofDevice(
    p: DevicePreset,
    spoofVersion: Boolean,
) {
    val buildStrings = mapOf(
        "MANUFACTURER" to p.manufacturer,
        "BRAND" to p.brand,
        "MODEL" to p.model,
        "DEVICE" to p.device,
        "PRODUCT" to p.product,
        "BOARD" to p.board,
        "HARDWARE" to p.hardware,
        "FINGERPRINT" to p.fingerprint,
        "DISPLAY" to p.display,
        "ID" to p.id,
        "BOOTLOADER" to p.bootloader,
        "RADIO" to p.radio,
    )

    val versionStrings = mapOf(
        "RELEASE" to p.release,
        "SECURITY_PATCH" to p.patch,
        "INCREMENTAL" to p.incremental,
        "CODENAME" to "REL",
    )

    classDefForEach { classDef ->
        processDeviceClass(classDef, p, buildStrings, versionStrings, spoofVersion)
    }
}

@Suppress("unused")
val spoofDeviceIdentityPatch = bytecodePatch(
    name = "Spoof device identity",
    description = "Unified device spoofing with per-category toggles: " +
        "Android ID, MAC address, SIM/carrier, and Build device fields. " +
        "Includes emulator presets. Library packages keep the real device " +
        "so their internal behavior is unaffected.",
    default = false,
) {
    val enableAndroidId by booleanOption(
        key = "enableAndroidId",
        default = false,
        title = "Spoof Android ID",
        description = "Overrides Settings.Secure 'android_id' reads.",
    )

    val androidIdValue = stringOption(
        key = "androidIdValue",
        default = "Random",
        values = mapOf("Random" to "Random"),
        title = "Android ID value",
        description = "16 hex chars, or 'Random' to generate one per build.",
        required = false,
    ) {
        it == "Random" || (it != null && it.matches(Regex("^[0-9a-f]{16}$")))
    }

    val enableMac by booleanOption(
        key = "enableMac",
        default = false,
        title = "Spoof MAC address",
        description = "Overrides WifiInfo.getMacAddress() and BluetoothAdapter.getAddress().",
    )

    val macValue = stringOption(
        key = "macValue",
        default = "Random",
        values = mapOf("Random" to "Random"),
        title = "MAC address value",
        description = "Format AA:BB:CC:DD:EE:FF, or 'Random'.",
        required = false,
    ) {
        it == "Random" ||
            (it != null && it.matches(Regex("^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$")))
    }

    val enableSim by booleanOption(
        key = "enableSim",
        default = false,
        title = "Spoof SIM / carrier",
        description = "Overrides TelephonyManager and SubscriptionInfo country/operator getters.",
    )

    val simPreset = stringOption(
        key = "simPreset",
        default = SIM_PRESETS.first().label,
        values = SIM_PRESETS.associate { it.label to it.label },
        title = "SIM preset",
        description = "The simulated SIM/network identity.",
        required = false,
    )

    val enableDevice by booleanOption(
        key = "enableDevice",
        default = false,
        title = "Spoof device / Build fields",
        description = "Overrides Build device identity fields using read-site patching. " +
            "Includes emulator presets.",
    )

    val devicePreset = stringOption(
        key = "devicePreset",
        default = DEVICE_PRESETS.first().label,
        values = DEVICE_PRESETS.associate { it.label to it.label },
        title = "Device preset",
        description = "Target device identity.",
        required = false,
    )

    val spoofVersion by booleanOption(
        key = "spoofVersion",
        default = false,
        title = "Also spoof OS version",
        description = "Also spoof Build.VERSION RELEASE, SDK_INT, SECURITY_PATCH, INCREMENTAL " +
            "in app code. Can break apps; off by default.",
    )

    execute {
        if (enableAndroidId == true) {
            val id = when {
                androidIdValue.value == "Random" -> randomHex(16)
                androidIdValue.value != null -> androidIdValue.value!!
                else -> randomHex(16)
            }

            spoofAndroidId(id)
        }

        if (enableMac == true) {
            val mac = when {
                macValue.value == "Random" -> randomMac()
                macValue.value != null -> macValue.value!!
                else -> randomMac()
            }

            spoofMac(mac)
        }

        if (enableSim == true) {
            val p = SIM_PRESETS.firstOrNull { it.label == simPreset.value }

            if (p != null) {
                spoofSim(p)
            }
        }

        if (enableDevice == true) {
            val p = DEVICE_PRESETS.firstOrNull { it.label == devicePreset.value }
                ?: DEVICE_PRESETS.first()

            spoofDevice(p, spoofVersion == true)
        }
    }
}
