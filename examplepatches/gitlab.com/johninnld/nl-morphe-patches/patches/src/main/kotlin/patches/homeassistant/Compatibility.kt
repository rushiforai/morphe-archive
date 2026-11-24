package patches.homeassistant

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val homeAssistant = Compatibility(
    name = "Home Assistant",
    packageName = "io.homeassistant.companion.android",
    apkFileType = ApkFileType.APKS,
    signatures = setOf(
        "11194ba809b42ddf0e1a7dec6842a59c7ff1119c5482e95febffd5c6014daa5a",
    ),
    targets = listOf(
        AppTarget(version = "2026.10.1-full", minSdk = 29,
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 24906)),
    ),
)

internal val homeAssistantAutomotive = Compatibility(
    name = "Home Assistant (Automotive)",
    packageName = "io.homeassistant.companion.android",
    apkFileType = ApkFileType.APK,
    signatures = homeAssistant.signatures,
    targets = listOf(AppTarget(version = "2026.11.2-full", versionCode = 25803, minSdk = 29)),
)

internal val originalInput = patches.shared.originalInput(homeAssistant, variants = listOf(homeAssistantAutomotive))
