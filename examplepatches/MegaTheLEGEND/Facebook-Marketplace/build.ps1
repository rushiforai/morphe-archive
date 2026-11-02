# One-command build + patch for the Facebook "Marketplace only" Morphe patch (Windows).
#   powershell -ExecutionPolicy Bypass -File .\build.ps1 -Apk "C:\path\to\facebook.apk"
# Needs: Java 21+, git, internet. Build command/output path taken from morphe-patches' own CI.
param(
  [string]$Apk,                        # facebook APK to patch (not needed with -ExportMpp)
  [switch]$ExportMpp,                  # only build the patch bundle and copy it to dist\marketplace-patches.mpp
  [string]$JavaExe = "java",          # path to a Temurin/Zulu/OpenJDK java.exe if Oracle JDK is first on PATH
  [switch]$KeepTabBar,                 # only change the startup tab; leave the bottom tab bar visible
  [switch]$KeepNavigation,             # do NOT lock swiping between tabs / the left Facebook menu
  [switch]$KeepInAppBrowser,           # do NOT force links into the system browser
  [switch]$KeepReels,                  # do NOT block the Reels / fullscreen video viewer
  [switch]$KeepHomeBack,               # back on Marketplace goes to Facebook Home (stock behavior)
  [switch]$Inspector,                  # DEBUG: also apply "Debug touch inspector" (tools/inspect.py); never ship
  [switch]$KeepAboutPage,              # do NOT add the "About" row to the Marketplace account menu
  [switch]$KeepProfileNote,            # do NOT hide the Marketplace profile "Go to settings" paragraph
  [switch]$KeepOriginalPackage         # do NOT rename: keep com.facebook.katana and the name "Facebook"
)

# Native tools (java, git, gradle) write progress to stderr. Under "Stop", Windows PowerShell
# turns that into a fatal error, so keep "Continue" and check $LASTEXITCODE explicitly instead.
$ErrorActionPreference = "Continue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Fail($msg) { Write-Host "ERROR: $msg" -ForegroundColor Red; exit 1 }

if (-not $ExportMpp) {
  if (-not $Apk -or -not (Test-Path -LiteralPath $Apk)) { Fail "APK not found: $Apk (or use -ExportMpp)" }
  $Apk = (Resolve-Path -LiteralPath $Apk).Path
}
$Here = $PSScriptRoot
$Work = Join-Path $Here "work"; New-Item -ItemType Directory -Force $Work | Out-Null

if (-not (Get-Command $JavaExe -ErrorAction SilentlyContinue)) { Fail "java not found: $JavaExe" }

# java -version prints to stderr; run it through cmd so PowerShell doesn't treat that as an error.
$jvText = (cmd /c "`"$JavaExe`" -version 2>&1" | Out-String)
if ($jvText -notmatch 'version "(\d+)') { Fail "Could not read Java version from: $jvText" }
$jv = [int]$Matches[1]
if ($jv -lt 21) { Fail "Java 21+ required (found $jv)" }
Write-Host "Java $jv OK"
if ($jvText -notmatch '(?i)openjdk') {
  Write-Host "WARNING: this looks like Oracle JDK. Morphe's signing step fails on it ('JCE cannot authenticate the provider BC')." -ForegroundColor Yellow
  Write-Host "         Install Eclipse Temurin 21 (https://adoptium.net) and re-run with  -JavaExe ""C:\Program Files\Eclipse Adoptium\jdk-21...\bin\java.exe""" -ForegroundColor Yellow
}

# Morphe's Gradle plugin is on GitHub Packages, which needs a token even for public reads.
# Classic token with only read:packages: https://github.com/settings/tokens
if (-not $env:GITHUB_ACTOR) { Fail "GITHUB_ACTOR not set (your GitHub username)" }
if (-not $env:GITHUB_TOKEN) { Fail "GITHUB_TOKEN not set (token with read:packages)" }

$P = $Here   # standalone Gradle project

# Verify the token against the registry BEFORE the long Gradle build.
$ver = (Select-String -Path (Join-Path $P "gradle\libs.versions.toml") -Pattern '^morphe-patcher\s*=\s*"([^"]+)"').Matches[0].Groups[1].Value
if ($ver) {
  $pomUrl = "https://maven.pkg.github.com/MorpheApp/registry/app/morphe/morphe-patcher/$ver/morphe-patcher-$ver.pom"
  $b64 = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($env:GITHUB_ACTOR):$($env:GITHUB_TOKEN)"))
  try {
    $r = Invoke-WebRequest -UseBasicParsing -Uri $pomUrl -Headers @{ Authorization = "Basic $b64" }
    Write-Host "Token check OK (HTTP $($r.StatusCode))"
  } catch {
    $code = 0; if ($_.Exception.Response) { $code = [int]$_.Exception.Response.StatusCode }
    if ($code -eq 401 -or $code -eq 403) {
      Fail ("GitHub rejected the token (HTTP $code). Use a CLASSIC personal access token (not fine-grained) with the read:packages scope, " +
            "and make sure GITHUB_ACTOR is your exact GitHub username. Create one at https://github.com/settings/tokens")
    }
    Write-Host "Token check inconclusive (HTTP $code); continuing anyway." -ForegroundColor Yellow
  }
}

Write-Host "==> Building patch bundle (first run downloads a lot; this can take several minutes)"
Push-Location $P
$gprUser = "-Pgpr.user=" + $env:GITHUB_ACTOR
$gprKey  = "-Pgpr.key=" + $env:GITHUB_TOKEN
& .\gradlew.bat :patches:buildAndroid --no-daemon $gprUser $gprKey
$gradleExit = $LASTEXITCODE
Pop-Location
if ($gradleExit -ne 0) { Fail "Gradle build failed (exit $gradleExit) - copy the error above and send it to Claude" }

$bundle = Get-ChildItem (Join-Path $P "patches\build\libs") -Filter "patches-*.mpp" -ErrorAction SilentlyContinue |
  Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $bundle) { Fail "Build finished but no patches-*.mpp in patches\build\libs" }
Write-Host "    bundle: $($bundle.FullName)"
$dist = Join-Path $Here "dist"; New-Item -ItemType Directory -Force $dist | Out-Null
$mpp = Join-Path $dist "marketplace-patches.mpp"
Copy-Item -LiteralPath $bundle.FullName $mpp -Force
Write-Host "    exported: $mpp" -ForegroundColor Green
if ($ExportMpp) { Write-Host "Done. Import this .mpp into Morphe Manager / Desktop." -ForegroundColor Green; exit 0 }

Write-Host "==> Getting Morphe Desktop (CLI)"
$desk = Join-Path $Work "morphe-desktop.jar"
if (-not (Test-Path $desk)) {
  $rel = Invoke-RestMethod https://api.github.com/repos/MorpheApp/morphe-desktop/releases/latest
  $asset = $rel.assets | Where-Object { $_.name -match '^morphe-desktop-.*-all\.jar$' } | Select-Object -First 1
  if (-not $asset) { Fail "Could not find the desktop jar; download it manually to $desk" }
  Invoke-WebRequest $asset.browser_download_url -OutFile $desk
}

Write-Host "==> Patching (works on a copy; original untouched)"
$workApk = Join-Path $Work "facebook.apk"
Copy-Item -LiteralPath $Apk $workApk -Force
$patchArgs = @("-jar", $desk, "patch", "-p", $bundle.FullName, "--exclusive", "-e", "Marketplace only")
# Rename to io.focalpoint.prism / "Marketplace" (pulls in Morphe's "Clone app" patch as a dependency).
if (-not $KeepOriginalPackage) { $patchArgs += @("-e", "Marketplace rename") }
if ($KeepTabBar) { $patchArgs += "-OhideTabBar=false" }
if ($KeepNavigation) { $patchArgs += "-OlockNavigation=false" }
if ($KeepInAppBrowser) { $patchArgs += "-OexternalLinks=false" }
if ($KeepReels) { $patchArgs += "-OblockReels=false" }
if ($Inspector) { $patchArgs += @("-e", "Debug touch inspector") }
if ($KeepAboutPage) { $patchArgs += "-OaboutPage=false" }
if ($KeepProfileNote) { $patchArgs += "-OhideProfileSettingsNote=false" }
if ($KeepHomeBack) { $patchArgs += "-OmarketplaceIsHome=false" }
$patchArgs += $workApk
& $JavaExe @patchArgs
if ($LASTEXITCODE -ne 0) { Fail "Patching failed (exit $LASTEXITCODE) - copy the output above and send it to Claude" }

# Morphe writes the result to <work>\facebook\facebook-<version>-patches-<bundle>.apk; find the newest one.
$out = Get-ChildItem -Path (Join-Path $Work "facebook") -Filter *.apk -File -ErrorAction SilentlyContinue |
       Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $out) { Fail "Patching finished but no output APK was found under $Work\facebook" }
$final = Join-Path $Work "facebook-patched.apk"
Copy-Item -LiteralPath $out.FullName $final -Force

Write-Host ""
Write-Host "Done. Patched APK: $final" -ForegroundColor Green
Write-Host "Install on a test device first. Keep your original APK."
