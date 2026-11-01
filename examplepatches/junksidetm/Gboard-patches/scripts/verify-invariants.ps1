# Scripts to verify critical fork invariants for junksidetm/Gboard-patches
# Ensures custom fork features are never silently broken by upstream merges.

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot | Split-Path -Parent

function Assert-Condition($condition, $message) {
    if (-not $condition) {
        Write-Host "  [FAIL] $message" -ForegroundColor Red
        exit 1
    } else {
        Write-Host "  [OK] $message" -ForegroundColor Green
    }
}

Write-Host "==> Verifying Fork Invariants..." -ForegroundColor Cyan

# --- Invariant 1: Custom Emoji Font Feature ---
Write-Host "`n1. Checking Custom Emoji Font Feature..." -ForegroundColor Yellow
$catalogPath = Join-Path $root "patches/src/main/resources/gboard/gboard-port-product-catalog.json"
Assert-Condition (Test-Path $catalogPath) "Catalog JSON exists"

$catalogContent = Get-Content -Raw $catalogPath
Assert-Condition ($catalogContent -match '"feature_id":\s*"custom_emoji_font"') "Catalog contains custom_emoji_font"

$catalogShaPath = Join-Path $root "patches/src/main/resources/gboard/gboard-port-product-catalog.sha256"
Assert-Condition (Test-Path $catalogShaPath) "Catalog SHA-256 file exists"

$expectedSha = (Get-Content -Raw $catalogShaPath).Trim()
$hasher = [System.Security.Cryptography.SHA256]::Create()
$actualSha = [BitConverter]::ToString($hasher.ComputeHash([System.IO.File]::ReadAllBytes($catalogPath))).Replace("-", "").ToLowerInvariant()
Assert-Condition ($expectedSha -eq $actualSha) "Catalog SHA-256 hash matches"

$runtimeJava = Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/emojifont/GboardEmojiFontRuntime.java"
Assert-Condition (Test-Path $runtimeJava) "GboardEmojiFontRuntime.java exists"

$patchKt = Join-Path $root "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/emojifont/GboardEmojiFontPatch.kt"
Assert-Condition (Test-Path $patchKt) "GboardEmojiFontPatch.kt exists"

$runtimeAbiPath = Join-Path $root "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeAbi.kt"
$runtimeAbiContent = Get-Content -Raw $runtimeAbiPath
Assert-Condition ($runtimeAbiContent -match "EMOJI_FONT_RUNTIME_AFTER_SOFT_KEY_BOUND") "RuntimeAbi contains EMOJI_FONT_RUNTIME_AFTER_SOFT_KEY_BOUND"

$settingsXmlPath = Join-Path $root "extensions/extension/src/main/settings-text/gboard_settings_text.xml"
$settingsXmlContent = Get-Content -Raw $settingsXmlPath
Assert-Condition ($settingsXmlContent -match "gboard_patches_emoji_font_title") "Settings XML contains emoji font entry"

# --- Invariant 2: Voice & Rambler for English US + India ---
Write-Host "`n2. Checking Voice & Rambler Configuration..." -ForegroundColor Yellow
$voiceSettingsPath = Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceSettings.java"
$voiceSettingsContent = Get-Content -Raw $voiceSettingsPath
Assert-Condition ($voiceSettingsContent -match 'DEFAULT_BACKEND\s*=\s*BACKEND_RAMBLER') "DEFAULT_BACKEND is BACKEND_RAMBLER"

$voiceRuntimeSettingsPath = if (Test-Path (Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntimeSettings.java")) {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntimeSettings.java"
} else {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoice1803RuntimeSettings.java"
}
$voiceRuntimeSettingsContent = Get-Content -Raw $voiceRuntimeSettingsPath
Assert-Condition ($voiceRuntimeSettingsContent -match 'public static boolean isRamblerEnabled\(\)') "isRamblerEnabled() is defined"
Assert-Condition ($voiceRuntimeSettingsContent -match 'BACKEND_RAMBLER\.equals\(backend\)') "isRamblerEnabled() checks BACKEND_RAMBLER"

$ramblerSelectorRuntimePath = if (Test-Path (Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime.java")) {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime.java"
} else {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/rambler/GboardRambler1803OfficialSelectionRuntime.java"
}
$ramblerSelectorContent = Get-Content -Raw $ramblerSelectorRuntimePath
Assert-Condition ($ramblerSelectorContent -match 'isRamblerEnabled\(\)') "Rambler selection checks isRamblerEnabled()"

$voiceRuntimePath = if (Test-Path (Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime.java")) {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime.java"
} else {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoice1803Runtime.java"
}
$voiceRuntimeContent = Get-Content -Raw $voiceRuntimePath
Assert-Condition ($voiceRuntimeContent -match 'UniversalSupportedLocaleSet') "UniversalSupportedLocaleSet exists"
Assert-Condition ($voiceRuntimeContent -match 'Locale\.forLanguageTag\("en-IN"\)') "en-IN locale explicitly supported"
Assert-Condition ($voiceRuntimeContent -match 'Locale\.US') "en-US locale explicitly supported"

# --- Invariant 3: AI Writing Tools Persistence ---
Write-Host "`n3. Checking AI Writing Tools..." -ForegroundColor Yellow
$writingToolsRuntimePath = Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsRuntime.java"
$writingToolsContent = Get-Content -Raw $writingToolsRuntimePath
Assert-Condition ($writingToolsContent -match 'FLAG_CONFIG_PROOFREAD') "Writing tools handles proofread flag"
Assert-Condition ($writingToolsContent -match 'FLAG_WRITING_TOOLS') "Writing tools handles writing_tools flag"
Assert-Condition ($writingToolsContent -match 'ALL_LANGUAGES_ALLOWLIST_VALUE') "Writing tools includes universal language tags allowlist"

# --- Invariant 4: Attribution & Credits ---
Write-Host "`n4. Checking Attribution & Credits..." -ForegroundColor Yellow
$constantsPath = Join-Path $root "patches/src/main/kotlin/dev/jason/gboardpatches/patches/shared/Constants.kt"
$constantsContent = Get-Content -Raw $constantsPath
Assert-Condition ($constantsContent -match 'github\.com/junksidetm') "Constants.kt attributes author to junksidetm"
Assert-Condition ($constantsContent -match 'github\.com/jasonwu1994') "Constants.kt credits upstream jasonwu1994"

# --- Invariant 5: Cursor Trackpad Mode Permanence ---
Write-Host "`n5. Checking Cursor Trackpad Mode Permanence..." -ForegroundColor Yellow
$trackpadPolicyPath = if (Test-Path (Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpadPolicy.java")) {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpadPolicy.java"
} else {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpad1803Policy.java"
}
$trackpadPolicyContent = Get-Content -Raw $trackpadPolicyPath
Assert-Condition ($trackpadPolicyContent -match 'isCursorTrackpadFlag') "Policy defines isCursorTrackpadFlag"
Assert-Condition (-not ($trackpadPolicyContent -match '!Boolean\.FALSE\.equals\(stockResult\)')) "Policy does not restrict forcing to Boolean.FALSE (permanent override)"

$trackpadSettingsPath = Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpadSettings.java"
$trackpadSettingsContent = Get-Content -Raw $trackpadSettingsPath
Assert-Condition ($trackpadSettingsContent -match 'isCachedEnabled') "Settings provides cached fallback for transient preference resolution failures"

$trackpadRuntimePath = if (Test-Path (Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpadRuntime.java")) {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpadRuntime.java"
} else {
    Join-Path $root "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/cursortrackpad/GboardCursorTrackpad1803Runtime.java"
}
$trackpadRuntimeContent = Get-Content -Raw $trackpadRuntimePath
Assert-Condition ($trackpadRuntimeContent -match 'isCursorTrackpadFlag') "Runtime checks isCursorTrackpadFlag directly"
Assert-Condition (-not ($trackpadRuntimeContent -match '!Boolean\.FALSE\.equals\(stockResult\)')) "Runtime does not bypass override on non-FALSE stock results"

Write-Host "`n==> ALL INVARIANTS PASSED SUCCESSFULLY!" -ForegroundColor Green
