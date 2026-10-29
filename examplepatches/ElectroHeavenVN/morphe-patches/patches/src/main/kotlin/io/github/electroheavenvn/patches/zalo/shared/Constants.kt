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
                isExperimental = true,
            ),
        ),
    )
}

