# Patches YouTube Music with the official Morphe bundle + our bundle, the same way Morphe Manager does,
# and optionally installs it on the emulator.
#
# Patch selection:
# - Morphe bundle: all 51 YouTube Music patches (Morphe's defaults + "Network proxy", which is off by default).
#   The 5 universal patches (Clone app, Change installer source, Override certificate pinning,
#   Spoof signature, Disable Play Store updates) stay off, as they are by default.
# - Our bundle: its defaults.
# Signing: Morphe's default shared keystore in work/morphe-data (alias/password "Morphe", same as Manager),
# so every build installs over the previous one.
param(
    [string]$Apk = "com.google.android.apps.youtube.music@9.30.53.xapk",
    [string]$MorpheBundle = "patches-2.4.0.mpp",
    [switch]$Install
)
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$work = Join-Path $root "work"
$ours = Get-ChildItem "$work\bundles\ayham-patches-*.mpp" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $ours) { throw "No ayham-patches-*.mpp in work\bundles; run scripts\build-bundle.ps1 first" }

# The patcher logs warnings on stderr; PowerShell 5.1 would treat them as errors, so judge by the exit code only.
$ErrorActionPreference = "Continue"
docker run --rm -v "${work}:/w" -v "${work}\morphe-data:/opt/tools/morphe-data" ytm-patches-tools `
    morphe patch `
    -p "/w/bundles/$MorpheBundle" -e "Network proxy" -d "Apple Music animated artwork" `
    -p "/w/bundles/$($ours.Name)" `
    -r /w/out/result.json -o /w/out/ytm-patched.apk "/w/apk/$Apk"
if ($LASTEXITCODE -ne 0) { throw "Patching failed (see work\out\result.json)" }

if ($Install) {
    & "D:\LDPlayer\LDPlayer14\adb.exe" install -r "$work\out\ytm-patched.apk"
    if ($LASTEXITCODE -ne 0) { throw "adb install failed" }
}
