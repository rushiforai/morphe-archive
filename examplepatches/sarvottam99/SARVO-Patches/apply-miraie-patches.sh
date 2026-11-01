#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

# Run this from the root of a fresh Morphe patches-template repository clone.
# Example: bash apply-miraie-patches.sh

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$ROOT" ]]; then
  echo "ERROR: Run this script from inside your cloned patches repository."
  exit 1
fi
cd "$ROOT"

[[ -f patches/build.gradle.kts && -f settings.gradle.kts && -f gradle/libs.versions.toml ]] || {
  echo "ERROR: This does not look like the Morphe patches-template project."
  exit 1
}

REMOTE="$(git remote get-url origin 2>/dev/null || true)"
REMOTE="${REMOTE%.git}"
REPO_PATH="${REMOTE##*github.com[:/]}"
OWNER="${REPO_PATH%%/*}"
REPO="${REPO_PATH##*/}"
if [[ -z "$OWNER" || -z "$REPO" || "$OWNER" == "$REMOTE" ]]; then
  echo "ERROR: Could not read the GitHub owner/repository from origin."
  echo "Set origin to https://github.com/OWNER/Miraie-Patches.git and rerun."
  exit 1
fi

fetch() {
  local url="$1" out="$2"
  mkdir -p "$(dirname "$out")"
  curl -fL --retry 3 --retry-delay 2 "$url" -o "$out"
}

RAW="https://raw.githubusercontent.com/MorpheApp/morphe-patches/main"
RAWLIB="https://raw.githubusercontent.com/MorpheApp/morphe-patches-library/main"

# Remove template demonstration patches, leaving the generator/utilities intact.
rm -rf patches/src/main/kotlin/app/template
rm -f extensions/extension/src/main/java/app/template/extension/extension/ExamplePatch.java

# Miraie app compatibility metadata.
mkdir -p patches/src/main/kotlin/app/miraie/patches/{shared,installer,signature,updates,theme}
cat > patches/src/main/kotlin/app/miraie/patches/shared/Constants.kt <<'KOTLIN'
package app.miraie.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MIRAIE = Compatibility(
        name = "MirAIe",
        packageName = "com.panasonic.in.miraie",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "1.4.32"))
    )
}
KOTLIN

# The two selected universal patches use Morphe's shared patch-library implementations.
fetch "$RAW/patches/src/main/kotlin/app/morphe/patches/all/misc/installer/ChangeInstallerSource.kt" \
  patches/src/main/kotlin/app/miraie/patches/installer/ChangeInstallerSource.kt
fetch "$RAW/patches/src/main/kotlin/app/morphe/patches/all/misc/signature/SpoofSignaturePatch.kt" \
  patches/src/main/kotlin/app/miraie/patches/signature/SpoofSignaturePatch.kt

sed -i 's/^package app\.morphe\.patches\.all\.misc\.installer$/package app.miraie.patches.installer/' \
  patches/src/main/kotlin/app/miraie/patches/installer/ChangeInstallerSource.kt
sed -i '/^import app\.morphe\.patches\.all\.misc\.fix\.changepackageinstaller\.changePackageInstallerPatch/a import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE' \
  patches/src/main/kotlin/app/miraie/patches/installer/ChangeInstallerSource.kt
sed -i '/^    default = false$/a\    compatibleWith(COMPATIBILITY_MIRAIE)' \
  patches/src/main/kotlin/app/miraie/patches/installer/ChangeInstallerSource.kt

sed -i 's/^package app\.morphe\.patches\.all\.misc\.signature$/package app.miraie.patches.signature/' \
  patches/src/main/kotlin/app/miraie/patches/signature/SpoofSignaturePatch.kt
sed -i 's/import app\.morphe\.patches\.all\.misc\.fix\.spoofsignature\.spoofSignaturePatch/import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch as baseSpoofSignaturePatch/' \
  patches/src/main/kotlin/app/miraie/patches/signature/SpoofSignaturePatch.kt
sed -i '/^import app\.morphe\.patches\.all\.misc\.fix\.spoofsignature\.spoofSignaturePatch as baseSpoofSignaturePatch/a import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE' \
  patches/src/main/kotlin/app/miraie/patches/signature/SpoofSignaturePatch.kt
sed -i 's/dependsOn(spoofSignaturePatch)/dependsOn(baseSpoofSignaturePatch)/' \
  patches/src/main/kotlin/app/miraie/patches/signature/SpoofSignaturePatch.kt
sed -i '/^    default = false$/a\    compatibleWith(COMPATIBILITY_MIRAIE)' \
  patches/src/main/kotlin/app/miraie/patches/signature/SpoofSignaturePatch.kt

# Disable Play Store updates: upstream patch plus its small runtime extension.
fetch "$RAW/patches/src/main/kotlin/app/morphe/patches/all/misc/updates/DisablePlayStoreUpdatesPatch.kt" \
  patches/src/main/kotlin/app/miraie/patches/updates/DisablePlayStoreUpdatesPatch.kt
sed -i 's/^package app\.morphe\.patches\.all\.misc\.updates$/package app.miraie.patches.updates/' \
  patches/src/main/kotlin/app/miraie/patches/updates/DisablePlayStoreUpdatesPatch.kt
sed -i '/^import app\.morphe\.util\.getNode$/d' \
  patches/src/main/kotlin/app/miraie/patches/updates/DisablePlayStoreUpdatesPatch.kt
sed -i 's/document\.getNode("manifest") as Element/document.documentElement as Element/g' \
  patches/src/main/kotlin/app/miraie/patches/updates/DisablePlayStoreUpdatesPatch.kt
sed -i '/^import java\.util\.logging\.Logger/i import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE' \
  patches/src/main/kotlin/app/miraie/patches/updates/DisablePlayStoreUpdatesPatch.kt
sed -i '/^    default = false$/a\    compatibleWith(COMPATIBILITY_MIRAIE)' \
  patches/src/main/kotlin/app/miraie/patches/updates/DisablePlayStoreUpdatesPatch.kt

# Keep the extension module already supplied by the template, but repurpose its output name.
cat > extensions/extension/build.gradle.kts <<'GRADLE'
extension {
    name = "extensions/all/versioncode/change-version-code.mpe"
}

android {
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly(libs.annotation)
}
GRADLE
mkdir -p extensions/extension/src/main/java/app/morphe/extension/all/versioncode
fetch "$RAW/extensions/all/change-version-code/src/main/java/app/morphe/extension/all/versioncode/DisablePlayStoreUpdatesPatch.java" \
  extensions/extension/src/main/java/app/morphe/extension/all/versioncode/DisablePlayStoreUpdatesPatch.java

# Dark mode: switch AppCompat.Light to DayNight and add night-qualified MirAIe colors.
cat > patches/src/main/kotlin/app/miraie/patches/theme/MiraieDarkModePatch.kt <<'KOTLIN'
package app.miraie.patches.theme

import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val miraieDarkModePatch = resourcePatch(
    name = "Dark mode",
    description = "Adds a system-following dark theme to MirAIe when Android dark mode is enabled.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MIRAIE)

    execute {
        document("res/values/styles.xml").use { doc ->
            val styles = doc.getElementsByTagName("style")
            val appTheme = (0 until styles.length)
                .mapNotNull { styles.item(it) as? Element }
                .firstOrNull { it.getAttribute("name") == "AppTheme" }
                ?: throw PatchException("MirAIe AppTheme was not found; this patch targets MirAIe 1.4.32")

            val parent = appTheme.getAttribute("parent")
            val dayNightParent = when {
                parent.contains("Theme.AppCompat.Light") ->
                    parent.replace("Theme.AppCompat.Light", "Theme.AppCompat.DayNight")
                parent.contains("Theme.MaterialComponents.Light") ->
                    parent.replace("Theme.MaterialComponents.Light", "Theme.MaterialComponents.DayNight")
                else -> throw PatchException("Unexpected MirAIe AppTheme parent: '$parent'. The app theme may have changed.")
            }
            appTheme.setAttribute("parent", dayNightParent)

            fun setItem(name: String, value: String) {
                val items = appTheme.getElementsByTagName("item")
                val existing = (0 until items.length)
                    .mapNotNull { items.item(it) as? Element }
                    .firstOrNull { it.getAttribute("name") == name }

                if (existing != null) {
                    existing.textContent = value
                } else {
                    appTheme.appendChild(doc.createElement("item").apply {
                        setAttribute("name", name)
                        textContent = value
                    })
                }
            }

            setItem("android:windowBackground", "@color/screen_background_color")
            setItem("android:colorBackground", "@color/screen_background_color")
            setItem("android:statusBarColor", "@color/title_bar_color")
            setItem("android:navigationBarColor", "@color/screen_background_color")
        }

        val nightColors = get("res/values-night/colors.xml", false)
        nightColors.parentFile?.mkdirs()
        nightColors.writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="screen_background_color">#121212</color>
    <color name="settings_page_bg">#121212</color>
    <color name="title_bar_color">#181818</color>
    <color name="card_view_color">#242424</color>
    <color name="sp_list_item_bg">#242424</color>
    <color name="primary_text_color">#F5F5F5</color>
    <color name="text_view_color">#E0E0E0</color>
    <color name="text_view_subtitle_color">#BDBDBD</color>
    <color name="settings_text_greyish_brown">#D6D6D6</color>
    <color name="title_bar_text_color">#F5F5F5</color>
    <color name="title_bar_icon_color">#E0E0E0</color>
    <color name="edit_text_color">#F5F5F5</color>
    <color name="edit_hint_text_color">#9E9E9E</color>
    <color name="divider">#383838</color>
    <color name="newBg">#121212</color>
    <color name="feedback_bg">#1B2230</color>
    <color name="light_grey">#2D2D2D</color>
    <color name="language_text_color">#F5F5F5</color>
    <color name="language_sub_heading_text_color">#BDBDBD</color>
    <color name="nw_read_notification_bg_color">#252525</color>
    <color name="nw_unread_notification_bg_color">#1C1C1C</color>
</resources>
"""
        )
    }
}
KOTLIN

# Pin the published common patch library and annotation API.
TOML="gradle/libs.versions.toml"
grep -q '^morphe-patches-library = ' "$TOML" || \
  sed -i '/^morphe-patcher = /a\morphe-patches-library = "2.1.0"' "$TOML"
grep -q '^annotation = ' "$TOML" || \
  sed -i '/^gson = /a\annotation = "1.10.0"' "$TOML"
grep -q '^annotation = { module = "androidx.annotation:annotation"' "$TOML" || \
  sed -i '/^gson = { module = "com.google.code.gson:gson"/a\annotation = { module = "androidx.annotation:annotation", version.ref = "annotation" }' "$TOML"
grep -q '^morphe-patches-library = { module = "app.morphe:morphe-patches-library"' "$TOML" || \
  sed -i '/^gson = { module = "com.google.code.gson:gson"/a\morphe-patches-library = { module = "app.morphe:morphe-patches-library", version.ref = "morphe-patches-library" }' "$TOML"

# Add the shared patch library dependency to the patch bundle.
sed -i 's/group = "app\.template"/group = "app.miraie"/' patches/build.gradle.kts
sed -i 's/name = "UserXYZ Patches"/name = "Miraie Patches"/; s/description = "Patches for apps I like"/description = "Patches for Panasonic MirAIe, compatible with Morphe Manager"/; s|source = .*|source = "https://github.com/'"$OWNER"'/'"$REPO"'.git"|; s/author = "Awesome dev"/author = "Miraie Patches contributors"/' patches/build.gradle.kts
if ! grep -q 'implementation(libs.morphe.patches.library)' patches/build.gradle.kts; then
  sed -i '/^dependencies {/a\    implementation(libs.morphe.patches.library)' patches/build.gradle.kts
fi

# Pass a dedicated read:packages token through both plugin and dependency resolution.
sed -i 's|providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")|providers.gradleProperty("gpr.user").orNull ?: System.getenv("MORPHE_GPR_USER") ?: System.getenv("GITHUB_ACTOR")|g; s|providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")|providers.gradleProperty("gpr.key").orNull ?: System.getenv("MORPHE_GPR_KEY") ?: System.getenv("GITHUB_TOKEN")|g' settings.gradle.kts

# Add the package repository used to resolve Morphe's shared patch library.
if ! grep -q 'maven.pkg.github.com/MorpheApp/morphe-patches-library' settings.gradle.kts; then
  cat >> settings.gradle.kts <<'GRADLE'

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven {
            name = "MorphePatchesLibrary"
            url = uri("https://maven.pkg.github.com/MorpheApp/morphe-patches-library")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("MORPHE_GPR_USER") ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("MORPHE_GPR_KEY") ?: System.getenv("GITHUB_TOKEN")
            }
        }
    }
}
GRADLE
fi
sed -i 's/rootProject.name = "morphe-patches-template"/rootProject.name = "miraie-patches"/' settings.gradle.kts

# Let GitHub Actions authenticate to Morphe's public GitHub Packages registry.
if [[ -f .github/workflows/release.yml ]] && ! grep -q 'MORPHE_GPR_USER:' .github/workflows/release.yml; then
  sed -i '/^    runs-on: ubuntu-latest$/a\    env:\n      MORPHE_GPR_USER: ${{ secrets.MORPHE_GPR_USER }}\n      MORPHE_GPR_KEY: ${{ secrets.MORPHE_GPR_KEY }}' .github/workflows/release.yml
fi

# Preserve the template's notice and append upstream notices required by reused Morphe code.
if ! grep -q 'Morphe Patches upstream notice' NOTICE; then
  {
    printf '\n\n---\n\nMorphe Patches upstream notice (preserved for reused source)\n\n'
    curl -fsSL "$RAW/NOTICE"
    printf '\n\nMorphe Patches Library upstream notice (preserved for reused source)\n\n'
    curl -fsSL "$RAWLIB/NOTICE"
  } >> NOTICE
fi

# Remove template branding and fix the Morphe Manager source URL in the README.
sed -i 's/Morphe Patches template/Miraie Patches/g; s|https://github.com/xyz-user/xyz-patches|https://github.com/'"$OWNER"'/'"$REPO"'|g; s|xyz-user/xyz-patches|'"$OWNER"'/'"$REPO"'|g; s/UserXYZ Patches/Miraie Patches/g; s/Patches for apps I like\./Panasonic MirAIe patches for Morphe Manager./g' README.md

cat <<README_ADD >> README.md

## MirAIe support

This repository contains patches for Panasonic MirAIe Android app package
\`com.panasonic.in.miraie\`, targeting version \`1.4.32\` (XAPK).
The bundle is intended for use with Morphe Manager; it is an independent,
community-maintained project and is not affiliated with the Morphe project
or Panasonic.

Included patches: Dark mode (follows Android system dark mode), Change
installer source, Disable Play Store updates, and Spoof signature.
README_ADD

# Remove any now-empty template package directories.
find patches/src/main/kotlin/app/template -type d -empty -delete 2>/dev/null || true
find extensions/extension/src/main/java/app/template -type d -empty -delete 2>/dev/null || true

echo
echo "Finished adding the four MirAIe patches."
echo "Repository: $OWNER/$REPO"
echo "Review the changes with: git status --short"
echo "Next: commit on dev and push; GitHub Actions will compile the patch bundle."
