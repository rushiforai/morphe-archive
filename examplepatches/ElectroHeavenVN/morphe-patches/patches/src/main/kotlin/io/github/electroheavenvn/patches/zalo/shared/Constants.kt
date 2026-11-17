package io.github.electroheavenvn.patches.zalo.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_ZALO = Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        appIconColor = 0x0068FF,
        // NPatch does not support 32 bit architectures
        // and Zalo does not support x86/x86_64 ABI
        // TODO: migrate to / add LSPatch JingMatrix support
        targets = listOf(
            AppTarget(
                version = "26.09.01",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 260901903),
            ),
            AppTarget(
                version = "26.10.01",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 261001905),
            ),
            AppTarget(
                version = "26.10.02",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 261002901),
            ),
            AppTarget(
                version = "26.11.01",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 261101901),
            ),
            AppTarget(
                version = "26.11.02",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 261102901),    
            )
        ),
    )
    
    val ZINGTALK_CERT =
        """
        3082019d30820106a00302010202044f178971300d06092a864886f70d0101
        05050030133111300f060355040313087a696e6774616c6b301e170d313230
        3131393033303933375a170d3337303131323033303933375a30133111300f
        060355040313087a696e6774616c6b30819f300d06092a864886f70d010101
        050003818d0030818902818100d8dc86eeaccd8d7fe722391a3a1ae034082b
        24af0ca63244d2ff12cc9fda4d6a9c1bdff5c587c648ac3e99e54852ca52ce
        e01203cb99f594593ab1e023bcd8a6be9b1e056c3de73631c56f85f5ed8576
        e850f67ddbca000b5338481df238a0d27c293b9e28b69ace24c9c926306322
        3832094c85201001b7be7f2107a452835f0203010001300d06092a864886f7
        0d010105050003818100aebd8af27fc3178b6082d1db7a5f66aad1db55c823
        145c5dd21fe721e229f90b7702738654432b5c5e8667f4995e9d206adb7d26
        c3db70f2c971638d44b762416df5d510a08526ed91fdd1c1e8e6751d8832ec
        32154c11680e647e605c0e8612702c70524324a611424c69c4d3e43a275655
        1eec5f4e4de966331194c74484a1
        """.trimIndent().replace("\n", "")
}