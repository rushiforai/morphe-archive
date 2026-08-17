#!/usr/bin/env bash
# Smoke-test the built .mpp against a real APK using the actual morphe-patcher,
# and verify the forced return values are present in the patched dex.
#
# Usage: scripts/verify_patch.sh [path/to/base.apk]
#   - Uses analysis/.xapk_extract/com.Meteosolutions.Meteo3b.apk by default.
#   - Builds a throwaway Gradle project under build/verify-one that depends on
#     morphe-patcher (resolved through ~/.gradle/gradle.properties creds).
set -euo pipefail

cd "$(dirname "$0")/.."
ROOT="$PWD"
ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export ANDROID_HOME ANDROID_SDK_ROOT="$ANDROID_HOME"

MPP="$ROOT/patches/build/libs/patches-$(grep -oP '(?<=^version = ).*' gradle.properties || echo 1.0.0).mpp"
APK="${1:-$ROOT/analysis/.xapk_extract/com.Meteosolutions.Meteo3b.apk}"
WORK="$ROOT/build/verify-one"

echo "MPP: $MPP"
echo "APK: $APK"
test -f "$MPP" || { echo "Build first: ./gradlew buildAndroid"; exit 1; }
test -f "$APK" || { echo "APK not found: $APK"; exit 1; }

rm -rf "$WORK"
mkdir -p "$WORK/src/main/kotlin/verify"

cat > "$WORK/settings.gradle.kts" <<'EOF'
rootProject.name = "verify-one"
EOF

cat > "$WORK/build.gradle.kts" <<EOF
plugins {
    kotlin("jvm") version "2.2.10"
    application
}
repositories {
    google()
    mavenCentral()
    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
            password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
        }
    }
    maven { url = uri("https://jitpack.io") }
}
dependencies {
    implementation("app.morphe:morphe-patcher:1.8.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.9.0")
}
kotlin { jvmToolchain(17) }
application { mainClass.set("verify.MainKt") }
EOF

cat > "$WORK/src/main/kotlin/verify/Main.kt" <<'EOF'
package verify

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import kotlinx.coroutines.runBlocking

fun main(args: Array<String>) {
    val mpp = File(args[0])
    val apk = File(args[1])
    val out = File(args[2])
    val patches = loadPatchesFromJar(setOf(mpp))
    println("Loaded ${patches.size} patch(es): ${patches.map { it.name }}")
    val patcher = Patcher(
        PatcherConfig(apkFile = apk, temporaryFilesPath = File(out, "tmp"))
    )
    patcher += patches
    runBlocking {
        var ok = 0
        patcher().collect { result ->
            val exc = result.exception
            if (exc != null) { println("FAILED: ${result.patch.name}"); exc.printStackTrace() }
            else { ok++; println("OK:    ${result.patch.name}") }
        }
        check(ok == patches.size) { "Some patches failed" }
        println("Succeeded: $ok/${patches.size}")
    }
    val result = patcher.get()
    println("Patched dex files: ${result.dexFiles.map { it.name }}")
    patcher.close()
}
EOF

cd "$WORK"
"$ROOT/gradlew" -p "$WORK" run --args="$MPP $APK $WORK/out" --console=plain 2>&1 | tail -15

# Verify the forced return values are present in the patched dex.
NEWDEX="$WORK/out/tmp/patched/dex/classes.dex"
echo
echo "=== Verifying patched methods (jadx) ==="
"$JAVA_HOME/bin/java" -Xmx2g -cp "$HOME/.local/jadx/lib/*" \
  jadx.cli.JadxCLI "$NEWDEX" -d "$WORK/out/jadx" --no-res >/dev/null 2>&1
BM="$WORK/out/jadx/sources/com/Meteosolutions/Meteo3b/manager/adv/BannerManager.java"
USR="$WORK/out/jadx/sources/com/Meteosolutions/Meteo3b/data/models/User.java"
for pat in 'evaluateProvider' 'evaluateFallback'; do
  rg -q "return \"$([ "$pat" = evaluateProvider ] && echo none || echo no_adv)\";" "$BM" \
    && echo "OK  $pat" || { echo "MISSING $pat"; exit 1; }
done
for pat in 'isPremium' 'isConsentlessPremium'; do
  rg -q "return true;" "$USR" && echo "OK  $pat" || { echo "MISSING $pat"; exit 1; }
done
echo "All patch hooks verified in patched dex."