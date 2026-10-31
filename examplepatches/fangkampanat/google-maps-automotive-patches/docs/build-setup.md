# Building the patch bundle

## Gradle authentication

This project's Morphe settings plugin requires GitHub Packages credentials during configuration, even when dependencies are cached.

1. Create a GitHub classic personal access token with the `read:packages` scope.
2. Add `gpr.user` for your GitHub username and `gpr.key` for the token to your user-level Gradle properties file. On Windows, the default path is `%USERPROFILE%\.gradle\gradle.properties`. If you set `GRADLE_USER_HOME`, use `gradle.properties` in that directory.
3. Keep the file outside the repository and restrict access to your user account and any build service that needs it.

The settings also accept `GITHUB_ACTOR` and `GITHUB_TOKEN` environment variables. Gradle properties take precedence. GitHub CLI login does not configure these values.

From the repository root, check configuration without building a bundle:

```powershell
.\gradlew.bat --no-daemon --console=plain help
```

If authentication fails, check that the token is valid and can read the required packages. `--offline` does not replace authentication.

## Problem report server (optional)

Maps Car's "Report a problem" sends reports to a server that is set when the bundle is built. Without it the app shows the reports screen without a send button. To set it, add both to your user-level Gradle properties:

```properties
mapsCarReportUrl=https://reports.example.com
mapsCarReportKeyFile=C:/path/to/report-app-key
```

The key file's first line is the app key, 32 or more URL-safe base64 characters. The environment variables `MAPS_CAR_REPORT_URL` and `MAPS_CAR_REPORT_KEY` work too. The URL and key end up in the published `.mpp`, so treat the key as public. The build prints whether the report is configured, never the key.

## Build

Requires JDK 21 and the Android SDK.

1. Set the same version in `gradle.properties` and `patches-bundle.json`. `created_at` is the release time in UTC without an offset or `Z` (for example `2026-10-29T10:00:00`); Morphe Manager cannot read other formats. The build checks both.
2. Build the bundle and regenerate `patches-list.json`:

   ```powershell
   .\gradlew.bat :patches:generatePatchesList
   .\gradlew.bat buildAndroid
   ```

   The bundle is `patches/build/libs/patches-<version>.mpp`.
3. Update the patch list in `README.md`:

   ```powershell
   python .github/scripts/generate_patches_readme.py fangkampanat/google-maps-automotive-patches main
   ```

Keep the patcher version in `gradle/libs.versions.toml` at or below the patcher inside Morphe Desktop. A bundle built against a newer patcher API compiles but fails in the GUI.
