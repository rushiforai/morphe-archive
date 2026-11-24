# CLAUDE.md

The canonical engineering guide for this repository is [AGENTS.md](AGENTS.md).
Read it before making changes — it covers the bundle architecture, fingerprint
anchors, build/release steps and the non-negotiable rules.

Quick reminders:

- Two apps, one bundle: KICK `com.kick.mobile` 1.9.0/208 and Twitch
  `tv.twitch.android.app` 13.0.0.2/1100000018.
- Kotlin patches live in `patches/src/main/kotlin/app/morphe/patches/`; runtime
  code lives in `extension/src/` (Java 8) and `extension/js/` (Twitch WebView).
- Every feature patch needs `compatibleWith(...)`, `dependsOn(settingsPatch)` and
  `extendWith("extensions/<App><Feature>.mpe")`.
- Never edit generated files (`patches-list.json`, `extension/generated/`,
  `extension/dex/`, `dist/`, `remote/`, `patch-classes/`, `patch-dex/`,
  `build/`). Rebuild with `scripts/build-patch.ps1`.
- Build: `powershell -ExecutionPolicy Bypass -File scripts\build-patch.ps1`.
- Version bumps touch six scripts, `CHANGELOG.md`, `README.md`,
  `patches-list.json`, root `patches-bundle.json` and the root `.mpp`.
- Third-party ad-block code is MIT-derived: keep its attribution header.
