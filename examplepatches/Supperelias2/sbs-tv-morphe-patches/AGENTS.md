# SBS TV Morphe patch repository

- Target only `com.sbs.ondemand.tv` 6.3.1 (16470) unless a newer version is explicitly verified.
- Never commit APK/APKM files, decompiled sources, stream URLs, credentials or signing keys.
- Keep the direct VOD and live patches fail-safe: preserve original provider selection when no direct URL exists.
- Build and patch through the existing `morphe-exec` CLI environment.
