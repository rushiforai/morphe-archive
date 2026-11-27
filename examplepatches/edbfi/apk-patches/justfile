# SPDX-License-Identifier: AGPL-3.0-or-later
set shell := ["bash", "-euo", "pipefail", "-c"]

cli_version := "6.0.0"
cli_sha256 := "c25549bc17d59d2eb94fa5f86e60e9b77a02772ca88f7050f8f1276f923a9958"
# The Morphe CLI morphe-patch runs. The release workflow reads these two to check the Morphe bundle's signature with
# Morphe's own verifier.
morphe_cli_version := "2.2.0"
morphe_cli_sha256 := "5ca0320ee05481df1ae3afd2f003bba3ff994d11d1f66ae48811ced71355e4fe"
reseam_sdk_version := "1.0.1"
reseam_cli_sha256 := "7c52bfba91e56aae7c3117840f2e76d37ab433b259aa605a40d35e5920c0c224"
jadx_sha256 := "6e5eacf500b64292bfb73c49797c1958f6ee44646e43e868039ae7feb573ff75"

# Redroid (Android in a container, no VM). Android 15: Redroid's 16 image needs ashmem, which new kernels lack.
device_image := "redroid/redroid:15.0.0_64only-latest@sha256:b51bde9cef80f7bd7581148192f2b2f4d41f23c6344cfe88eceeb8ddd67490ee"
device_serial := "127.0.0.1:5600"
device_cpus := "2"

# Reddit's login page rejects Redroid's WebView (Chromium 128). A Chromium snapshot build replaces it as an update,
# re-signed with AOSP's public test key, which the built-in WebView is signed with. The snapshot bucket isn't an
# archive: if the revision is gone, pin a newer Android_Arm64 one and update all three webview_* values.
webview_revision := "1738657"
webview_version := "159.0.8152.0"
webview_sha256 := "bf4b6bb68f246da2d1a30bd5e531cfe09506927889d8d078702d01fbc66b926c"
aosp_test_pk8_sha256 := "495675d32e89a149d5abe191f4e9c0e218b9068714e9b53a7c91e164a0741a23"
aosp_test_cert_sha256 := "a4384ba815b9499a5ce349b4e33c1755278873fe2eac150a068823f526e6dbde"

# List the recipes
default:
    @just --list

# Run what CI runs: the prek hooks, then lint, test and build each bundle
check: && revanced-check morphe-check reseam-check
    prek run --all-files --hook-stage manual

# Build every bundle
build: revanced-build morphe-build reseam-build

# Lint, test and build the ReVanced bundle
revanced-check:
    cd revanced && ./gradlew check :patches:buildAndroid

# Build revanced/patches/build/libs/patches-<version>.rvp
revanced-build:
    cd revanced && ./gradlew :patches:buildAndroid

# Apply the locally built ReVanced bundle to an APK with revanced-cli; the result lands in tmp/out/
[positional-arguments]
revanced-patch apk *args: revanced-build
    #!/usr/bin/env bash
    set -euo pipefail
    apk=$1
    shift
    cli=$(just _revanced-cli)
    # The aapt2 inside the CLI is x86_64-only: on arm64 Linux it runs under qemu-user-binfmt.
    if [[ "$(uname -sm)" == "Linux aarch64" ]]; then export QEMU_LD_PREFIX=/usr/x86_64-linux-gnu; fi
    version=$(sed -n 's/^version=//p' revanced/gradle.properties)
    mkdir -p tmp/out
    keystore=$(just test-keystore)
    # -b: a local build is unsigned, so skip signature verification.
    "${JAVA_HOME:+$JAVA_HOME/bin/}java" -jar "$cli" patch -b -p "revanced/patches/build/libs/patches-$version.rvp" \
        --keystore "$keystore" -o "tmp/out/$(basename "$apk" .apk)-patched.apk" "$@" "$apk"

# Lint, test and build the Morphe bundle
morphe-check:
    cd morphe && ./gradlew check :patches:buildAndroid

# Build morphe/patches/build/libs/patches-<version>.mpp, unsigned
morphe-build:
    cd morphe && ./gradlew :patches:buildAndroid

# Apply the locally built Morphe bundle to an APK with the Morphe CLI; the result lands in tmp/out/
[positional-arguments]
morphe-patch apk *args: morphe-build
    #!/usr/bin/env bash
    set -euo pipefail
    apk=$1
    shift
    cli=.tools/morphe-desktop-{{ morphe_cli_version }}-all.jar
    just _fetch "https://github.com/MorpheApp/morphe-desktop/releases/download/v{{ morphe_cli_version }}/morphe-desktop-{{ morphe_cli_version }}-all.jar" "$cli" {{ morphe_cli_sha256 }}
    version=$(sed -n 's/^version=//p' morphe/gradle.properties)
    mkdir -p tmp/out
    # The CLI keeps its data next to its jar unless told otherwise.
    export MORPHE_DATA_DIR=.tools/morphe-data
    # Morphe may write to the keystore, so it gets a copy.
    keystore=$(just test-keystore)
    copy=$(mktemp)
    trap 'rm -f "$copy"' EXIT
    cp "$keystore" "$copy"
    # A local build is unsigned, and the CLI checks only downloaded bundles' signatures.
    "${JAVA_HOME:+$JAVA_HOME/bin/}java" -jar "$cli" patch -p "morphe/patches/build/libs/patches-$version.mpp" \
        --keystore "$copy" --keystore-entry-alias "ReVanced Key" --keystore-entry-password= \
        -o "tmp/out/$(basename "$apk" .apk)-morphe.apk" "$@" "$apk"

# Print the shared test keystore path, creating the key once if needed
test-keystore:
    #!/usr/bin/env bash
    set -euo pipefail
    keystore=$(cd "$(git rev-parse --path-format=absolute --git-common-dir)/.." && pwd)/tmp/test-signing.keystore
    if [[ ! -f "$keystore" ]]; then
        cli=$(just _revanced-cli)
        umask 077
        mkdir -p "$(dirname "$keystore")"
        scratch=$(mktemp -d "$(dirname "$keystore")/test-signing.XXXXXXXX")
        trap 'rm -rf "$scratch"' EXIT
        "${JAVA_HOME:+$JAVA_HOME/bin/}java" -cp "$cli" scripts/CreateTestKeystore.java "$scratch/keystore" >&2
        # Publish atomically and keep the winner if another worktree created the key too.
        ln "$scratch/keystore" "$keystore" || [[ -f "$keystore" ]]
    fi
    echo "$keystore"

_revanced-cli:
    @just _fetch "https://github.com/ReVanced/revanced-cli/releases/download/v{{ cli_version }}/revanced-cli-{{ cli_version }}-all.jar" ".tools/revanced-cli-{{ cli_version }}-all.jar" {{ cli_sha256 }}
    @realpath ".tools/revanced-cli-{{ cli_version }}-all.jar"

# Build the unsigned Reseam bundle with the pinned release CLI and SDK
reseam-build version="0.0.0":
    #!/usr/bin/env bash
    set -euo pipefail
    sdk_version={{ quote(reseam_sdk_version) }}
    {{ reseam_environment }}
    cd reseam
    RESEAM_BIN="$cli" RESEAM_RELEASE_VERSION={{ quote(version) }} ./gradlew unsignedBundle

# Build the Reseam bundle and inspect it with a temporary test signature
reseam-check: reseam-build
    #!/usr/bin/env bash
    set -euo pipefail
    sdk_version={{ quote(reseam_sdk_version) }}
    {{ reseam_environment }}
    scratch=$(mktemp -d)
    trap 'rm -rf "$scratch"' EXIT
    (cd reseam && RESEAM_BIN="$cli" ./gradlew test)
    just _reseam-sign-local "$cli" "$scratch"
    "$cli" bundle pubkey --key "$scratch/bundle.key" > "$scratch/bundle.pub"
    printf 'Local verification build.\n' > "$scratch/notes.md"
    script=scripts/reseam-release.sh
    bash "$script" index "$cli" "$scratch/edbfi-patches.reseam" v0.0.0 \
        http://127.0.0.1:18765 "$scratch/notes.md" "$scratch/site" "$scratch/bundle.pub"
    "$cli" bundle keygen --out "$scratch/wrong.key"
    "$cli" bundle pubkey --key "$scratch/wrong.key" > "$scratch/wrong.pub"
    if bash "$script" index "$cli" "$scratch/edbfi-patches.reseam" v0.0.0 \
            http://127.0.0.1:18765 "$scratch/notes.md" "$scratch/wrong-site" "$scratch/wrong.pub"; then
        echo "Reseam bundle verification accepted an unrelated key." >&2
        exit 1
    fi
    test ! -e "$scratch/wrong-site/patches.json"
    python3 scripts/reseam-check-docs.py reseam/build/reseam/unsigned/edbfi-patches.reseam

# Apply the local Reseam bundle to a clean APK and sign with the shared test certificate
[positional-arguments]
reseam-patch apk *args: reseam-build
    #!/usr/bin/env bash
    set -euo pipefail
    apk=$1
    shift
    sdk_version={{ quote(reseam_sdk_version) }}
    {{ reseam_environment }}
    keystore=$(just test-keystore)
    provider=$(just _revanced-cli)
    mkdir -p tmp/out
    scratch=$(mktemp -d tmp/out/reseam.XXXXXXXX)
    trap 'rm -rf "$scratch"' EXIT
    just _reseam-sign-local "$cli" "$scratch"
    password=reseam-local-test
    "${JAVA_HOME:+$JAVA_HOME/bin/}keytool" -importkeystore -noprompt \
        -srckeystore "$keystore" -srcstoretype BKS -srcstorepass '' -srcalias "ReVanced Key" -srckeypass '' \
        -providerclass org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath "$provider" \
        -destkeystore "$scratch/signing.p12" -deststoretype PKCS12 -deststorepass "$password"
    "${JAVA_HOME:+$JAVA_HOME/bin/}keytool" -genkeypair -storetype PKCS12 -keyalg EC -groupname secp256r1 \
        -alias disposable -dname "CN=Reseam Local Test" -validity 1 -storepass "$password" \
        -keystore "$scratch/disposable.p12"
    RESEAM_KEYSTORE_PASSWORD="$password" "$cli" patch \
        --bundle "$scratch/edbfi-patches.reseam" --trust "$("$cli" bundle pubkey --key "$scratch/bundle.key")" \
        --keystore "$scratch/disposable.p12" --output "$scratch/reseam.apk" "$@" -- "$apk"
    apksigner=$(find "${ANDROID_HOME:?Set ANDROID_HOME to the Android SDK}/build-tools" -name apksigner | sort -V | tail -n 1)
    [[ -x "$apksigner" ]] || { echo "Install Android SDK Build Tools." >&2; exit 1; }
    "$apksigner" sign --ks "$scratch/signing.p12" --ks-pass "pass:$password" --v4-signing-enabled false \
        --out "$scratch/final.apk" "$scratch/reseam.apk"
    expected=$("${JAVA_HOME:+$JAVA_HOME/bin/}keytool" -exportcert -keystore "$scratch/signing.p12" -storepass "$password" \
        -alias "ReVanced Key" | sha256sum | cut -d' ' -f1)
    actual=$("$apksigner" verify --print-certs "$scratch/final.apk" | sed -n 's/^Signer #1 certificate SHA-256 digest: //p')
    [[ "$actual" == "$expected" ]] || { echo "Patched APK signer does not match the shared test key." >&2; exit 1; }
    output="tmp/out/$(basename "$apk" .apk)-reseam.apk"
    mv -f "$scratch/final.apk" "$output"
    echo "$output"

[positional-arguments]
_reseam-sign-local cli scratch:
    @ "$1" bundle keygen --out "$2/bundle.key"
    @ "$1" bundle sign --key "$2/bundle.key" --out "$2/edbfi-patches.reseam" reseam/build/reseam/unsigned/edbfi-patches.reseam

reseam_environment := """
    cli=$(just _reseam-cli)
    if [[ -z "${RESEAM_BIN:-}" && "$(uname -sm)" == "Linux aarch64" ]]; then
        export RESEAM_X64_BIN="$cli"
        export RESEAM_X64_JAVA_HOME=${RESEAM_X64_JAVA_HOME:-"${cli%/inputs/*}/inputs/temurin-17-x64"}
        cli="$PWD/scripts/reseam-arm64.sh"
    fi
    version=$("$cli" --version)
    [[ "$version" == "reseam $sdk_version" ]] ||
        { echo "Expected Reseam $sdk_version, got: $version" >&2; exit 1; }
    """

_reseam-cli:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ -n "${RESEAM_BIN:-}" ]]; then
        resolved=$(command -v -- "$RESEAM_BIN") ||
            { echo "RESEAM_BIN is not executable: $RESEAM_BIN" >&2; exit 1; }
        [[ -f "$resolved" && -x "$resolved" ]] ||
            { echo "RESEAM_BIN is not executable: $RESEAM_BIN" >&2; exit 1; }
        printf '%s/%s\n' "$(cd "$(dirname "$resolved")" && pwd -P)" "$(basename "$resolved")"
        exit 0
    fi
    case "$(uname -sm)" in
        'Linux x86_64'|'Linux aarch64')
            asset=reseam-linux-x64
            hash={{ reseam_cli_sha256 }}
            ;;
        'MSYS_NT'*' x86_64'|'MINGW64_NT'*' x86_64'|'CYGWIN_NT'*' x86_64')
            asset=reseam-windows-x64.exe
            hash=9879469cee0e09477d027ce4cb65da5771874063500bf05d032dddcbc3991eb9
            ;;
        *)
            echo "No pinned Reseam {{ reseam_sdk_version }} CLI asset for $(uname -sm). Set RESEAM_BIN to a compatible executable." >&2
            exit 1
            ;;
    esac
    executable=${asset/reseam-linux-x64/reseam}
    cli=$(cd "$(git rev-parse --path-format=absolute --git-common-dir)/.." && pwd)/tmp/inputs/reseam-{{ reseam_sdk_version }}/"$executable"
    just _fetch "https://github.com/Reseam/reseam/releases/download/v{{ reseam_sdk_version }}/$asset" "$cli" "$hash" executable
    echo "$cli"

# Start the test device (Android 15 in Docker) and connect adb to it on loopback
device:
    #!/usr/bin/env bash
    set -euo pipefail
    serial={{ device_serial }}
    command -v docker >/dev/null && command -v adb >/dev/null || { echo "Install docker and adb first." >&2; exit 1; }
    grep -qw binder /proc/filesystems || { echo "The kernel has no binderfs, which Redroid needs." >&2; exit 1; }
    # Without PSI, Android's low-memory killer exits and every app start stalls on it.
    [[ -e /proc/pressure/memory ]] || { echo "PSI is off: boot the kernel with psi=1." >&2; exit 1; }
    # An existing device keeps the image and boot arguments it was created with; device-reset applies new ones.
    if docker container inspect revanced-device >/dev/null 2>&1; then
        docker update --cpus={{ device_cpus }} revanced-device >/dev/null
        docker start revanced-device >/dev/null
        # Docker can restore an older explicit CpuQuota=-1 over NanoCPUs at startup.
        docker update --cpus={{ device_cpus }} revanced-device >/dev/null
    else
        data=${XDG_DATA_HOME:-$HOME/.local/share}/revanced-device
        mkdir -p "$data"
        # DNS is set so a host resolver that filters ad domains can't hide an app's ad requests.
        docker run -d --name revanced-device --privileged --memory=3g --cpus={{ device_cpus }} \
            -v "$data:/data" -p "$serial:5555" \
            {{ device_image }} androidboot.use_memfd=true androidboot.redroid_gpu_mode=guest \
            androidboot.redroid_width=1080 androidboot.redroid_height=2400 androidboot.redroid_dpi=420 \
            androidboot.redroid_net_ndns=1 androidboot.redroid_net_dns1=1.1.1.1 >/dev/null
    fi
    for _ in $(seq 60); do
        adb connect "$serial" >/dev/null 2>&1 || true
        [[ "$(adb -s "$serial" shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" == 1 ]] && break
        sleep 2
    done
    [[ "$(adb -s "$serial" shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" == 1 ]] ||
        { echo "The device didn't boot within 2 minutes; see docker logs revanced-device." >&2; exit 1; }
    # Bluetooth crash-loops in a container (no real-time scheduling); animations only slow UI checks down.
    adb -s "$serial" shell 'pm disable-user --user 0 com.android.bluetooth >/dev/null
        for scale in window_animation_scale transition_animation_scale animator_duration_scale; do
            settings put global "$scale" 0
        done'
    just _device-webview "$serial"
    echo "ANDROID_SERIAL=$serial"

# Install the pinned WebView on the device unless it already runs it
[positional-arguments]
_device-webview serial:
    #!/usr/bin/env bash
    set -euo pipefail
    serial=$1
    abi=$(adb -s "$serial" shell getprop ro.product.cpu.abi | tr -d '\r')
    if [[ $abi != arm64-v8a ]]; then
        echo "No pinned WebView for $abi: Reddit's login won't load on this device." >&2
        exit 0
    fi
    current=$(adb -s "$serial" shell dumpsys webviewupdate | sed -n 's/.*Current WebView package (name, version): ([^,]*, \(.*\))/\1/p' | tr -d '\r')
    [[ $current == {{ webview_version }} ]] && exit 0
    apk=.tools/webview-{{ webview_version }}.apk
    if [[ ! -f $apk ]]; then
        zip=.tools/chrome-android-{{ webview_revision }}.zip
        just _fetch "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Android_Arm64/{{ webview_revision }}/chrome-android.zip" "$zip" {{ webview_sha256 }}
        key=https://android.googlesource.com/platform/build/+/refs/tags/android-15.0.0_r1/target/product/security/testkey
        curl -fsSL "$key.pk8?format=TEXT" | base64 -d > .tools/testkey.pk8
        curl -fsSL "$key.x509.pem?format=TEXT" | base64 -d > .tools/testkey.x509.pem
        printf '%s  %s\n' {{ aosp_test_pk8_sha256 }} .tools/testkey.pk8 {{ aosp_test_cert_sha256 }} .tools/testkey.x509.pem | sha256sum -c --quiet -
        unzip -p "$zip" chrome-android/apks/SystemWebView.apk > "$apk.unsigned"
        apksigner=$(ls -d "${ANDROID_HOME:?Set ANDROID_HOME to the Android SDK}"/build-tools/*/apksigner | sort -V | tail -n 1)
        "$apksigner" sign --v4-signing-enabled false --key .tools/testkey.pk8 --cert .tools/testkey.x509.pem --out "$apk.part" "$apk.unsigned"
        mv "$apk.part" "$apk"
        rm "$apk.unsigned" "$zip"
    fi
    adb -s "$serial" install -r "$apk" >/dev/null
    echo "WebView ${current:-?} replaced by {{ webview_version }}"

# Delete the test device and its data
[confirm("Delete the test device and all its data?")]
device-reset:
    #!/usr/bin/env bash
    set -euo pipefail
    docker info >/dev/null # fail loudly if docker is unreachable, rather than mistake that for "no device"
    if docker container inspect revanced-device >/dev/null 2>&1; then docker rm -f revanced-device >/dev/null; fi
    adb disconnect {{ device_serial }} >/dev/null 2>&1 || true
    data=${XDG_DATA_HOME:-$HOME/.local/share}/revanced-device
    # Android owns the files under /data, so remove them from a container instead of with sudo.
    if [[ -d "$data" ]]; then
        docker run --rm -v "$(dirname "$data"):/parent" \
            alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf \
            rm -rf "/parent/$(basename "$data")"
    fi

# Install this checkout's rea pin where every worktree finds it, vendor its skill and check Ghidra and JADX
setup-rea:
    #!/usr/bin/env bash
    set -euo pipefail
    install=$(cd "$(git rev-parse --path-format=absolute --git-common-dir)/.." && pwd)/.rea/install
    mkdir -p "$install"
    cp .rea/package.json .rea/package-lock.json "$install/"
    npm ci --prefix "$install" --no-audit --no-fund
    just _fetch https://github.com/1013503897/jadx-headless-mcp/releases/download/v0.7.1/jadx-headless-mcp-0.7.1-all.jar "$install/jadx-headless-mcp-0.7.1-all.jar" {{ jadx_sha256 }}
    # The skill must match the installed server, so it comes from the package, never from rea's main branch.
    skills=.agents/skills
    rm -rf "$skills/reverse-engineer-anything"
    mkdir -p "$skills"
    cp -R "$install/node_modules/rea-agents/skills/reverse-engineer-anything" "$skills/"
    cp "$install/node_modules/rea-agents/LICENSE" "$skills/reverse-engineer-anything.LICENSE"
    scripts/rea.sh doctor --provider ghidra --provider jadx --json \
        | jq -e '[.scope_checks[] | select(.ok | not)] as $failed | if $failed == [] then "rea: Ghidra and JADX ready" else ($failed | error) end'

# Download a pinned file unless it is already there with the right SHA-256
[positional-arguments]
_fetch url path sha256 kind="data":
    #!/usr/bin/env bash
    set -euo pipefail
    url=$1 path=$2 sha256=$3
    if [[ -f "$path" ]] && echo "$sha256  $path" | sha256sum -c --status -; then
        if [[ "$4" == executable && ! -x "$path" ]]; then chmod u+x "$path"; fi
        exit 0
    fi
    mkdir -p "$(dirname "$path")"
    scratch=$(mktemp "$path.part.XXXXXXXX")
    trap 'rm -f "$scratch"' EXIT
    curl -fsSL --retry 3 -o "$scratch" "$url"
    printf '%s  %s\n' "$sha256" "$scratch" | sha256sum -c --quiet -
    if [[ "$4" == executable ]]; then chmod u+x "$scratch"; fi
    mv -f "$scratch" "$path"
