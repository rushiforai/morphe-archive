#!/usr/bin/env bash
#
# verify_patch.sh — apply the built .mpp to a base APK and optionally check patterns.
#
# Usage:
#   scripts/verify_patch.sh <app_id> [base_apk_path]
#   scripts/verify_patch.sh <app_id> --assert <relative-java-file> <pattern> [label]
#
# Assertions can come from:
#   - config/apps/<app_id>.yaml verify.assertions (when no --assert flags)
#   - repeated --assert flags on the command line
#
# If no assertions are configured, only checks that patches apply successfully.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

show_help() {
  usage "$(basename "$0")" "[base_apk_path] [--assert file pattern [label] ...]

  Applies patches/build/libs/patches-*.mpp via morphe-patcher.
  Optional assertions grep decompiled patched dex sources."
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

[[ $# -ge 1 ]] || { show_help; exit 1; }

APP_ARG="$1"
shift

load_app_config "$APP_ARG"
require_cmd rg

ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export ANDROID_HOME ANDROID_SDK_ROOT="$ANDROID_HOME"

VERSION="$(grep -oP '(?<=^version = ).*' "$ROOT_DIR/gradle.properties" 2>/dev/null || echo 1.0.0)"
MPP="$ROOT_DIR/patches/build/libs/patches-${VERSION}.mpp"
WORK="$ROOT_DIR/build/verify-one"

APK=""
ASSERT_MODE="config"
ASSERTIONS_JSON="[]"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --assert)
      shift
      [[ $# -ge 2 ]] || die "--assert requires <file> <pattern> [label]"
      file="$1"
      pattern="$2"
      if [[ $# -ge 3 && "${3:-}" != --assert ]]; then
        label="$3"
        shift 3
      else
        label="$file"
        shift 2
      fi
      ASSERT_MODE="cli"
      ASSERTIONS_JSON="$(python3 -c "
import json, sys
items = json.loads(sys.argv[1]) if sys.argv[1] else []
items.append({'file': sys.argv[2], 'pattern': sys.argv[3], 'label': sys.argv[4]})
print(json.dumps(items))
" "$ASSERTIONS_JSON" "$file" "$pattern" "$label")"
      ;;
    *)
      [[ -z "$APK" ]] || die "unexpected argument: $1"
      APK="$1"
      shift
      ;;
  esac
done

if [[ -z "$APK" ]]; then
  rel_apk="$(config_verify_apk "$APP_ID")"
  if [[ -n "$rel_apk" ]]; then
    APK="$ROOT_DIR/$rel_apk"
  else
    APK="$(find_base_apk "$APP_EXTRACT_DIR" "$APP_PACKAGE")" || true
  fi
fi

[[ -f "$MPP" ]] || die "patch bundle not found: $MPP (run build.sh first)"
[[ -n "$APK" && -f "$APK" ]] || die "base APK not found (run extract_apk.sh or pass path)"

if [[ "$ASSERT_MODE" == "config" ]]; then
  ASSERTIONS_JSON="$(config_verify_assertions "$APP_ID")"
fi

log "MPP: $MPP"
log "APK: $APK"

rm -rf "$WORK"
mkdir -p "$WORK/src/main/kotlin/verify"

cat > "$WORK/settings.gradle.kts" <<'EOF'
rootProject.name = "verify-one"
EOF

cat > "$WORK/build.gradle.kts" <<'EOF'
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
            if (exc != null) {
                println("FAILED: ${result.patch.name}")
                exc.printStackTrace()
            } else {
                ok++
                println("OK:    ${result.patch.name}")
            }
        }
        check(ok == patches.size) { "Some patches failed" }
        println("Succeeded: $ok/${patches.size}")
    }
    val result = patcher.get()
    println("Patched dex files: ${result.dexFiles.map { it.name }}")
    patcher.close()
}
EOF

log "Applying patches..."
cd "$WORK"
"$ROOT_DIR/gradlew" -p "$WORK" run --args="$MPP $APK $WORK/out" --console=plain 2>&1 | tail -20

ASSERT_COUNT="$(python3 -c "import json,sys; print(len(json.loads(sys.argv[1])))" "$ASSERTIONS_JSON")"
if [[ "$ASSERT_COUNT" == "0" ]]; then
  log "No assertions configured — patch apply check only."
  exit 0
fi

NEWDEX="$WORK/out/tmp/patched/dex/classes.dex"
[[ -f "$NEWDEX" ]] || die "patched dex not found at $NEWDEX"

JADX_OUT="$WORK/out/jadx"
log "Decompiling patched dex for assertion checks..."
if [[ -n "${JAVA_HOME:-}" && -x "${JAVA_HOME}/bin/java" ]] && [[ -d "${HOME}/.local/jadx/lib" ]]; then
  "${JAVA_HOME}/bin/java" -Xmx2g -cp "${HOME}/.local/jadx/lib/*" \
    jadx.cli.JadxCLI "$NEWDEX" -d "$JADX_OUT" --no-res >/dev/null 2>&1
elif command -v jadx >/dev/null 2>&1; then
  jadx -d "$JADX_OUT" "$NEWDEX" --no-res >/dev/null 2>&1
else
  die "jadx required for assertion checks"
fi

FAILED=0
while IFS= read -r line; do
  file="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d['file'])")"
  pattern="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d['pattern'])")"
  label="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d.get('label', d['file']))")"
  target="$JADX_OUT/sources/$file"
  if rg -q "$pattern" "$target" 2>/dev/null; then
    echo "OK   $label"
  else
    echo "MISS $label ($file: $pattern)"
    FAILED=1
  fi
done < <(python3 -c "import json,sys; [print(json.dumps(x)) for x in json.loads(sys.argv[1])]" "$ASSERTIONS_JSON")

if [[ "$FAILED" -ne 0 ]]; then
  die "assertion check(s) failed"
fi

log "All assertions passed."
