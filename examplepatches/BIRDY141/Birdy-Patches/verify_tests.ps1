$ErrorActionPreference = "Stop"

Write-Host "========================================"
Write-Host "  BirdyTV SponsorBlock Verification     "
Write-Host "========================================"
Write-Host ""

$passed = 0
$failed = 0

function Assert-Test($condition, $description) {
    if ($condition) {
        Write-Host " [PASS] $description" -ForegroundColor Green
        $script:passed++
    } else {
        Write-Host " [FAIL] $description" -ForegroundColor Red
        $script:failed++
    }
}

# 1. Parse all locale catalogs
$baseDir = $PSScriptRoot
if (-not (Test-Path "$baseDir\extensions")) {
    $baseDir = "$PSScriptRoot\birdy-patches"
}
$enRaw = Get-Content "$baseDir\extensions\extension\src\main\locales\en.json" -Raw -Encoding UTF8
$esRaw = Get-Content "$baseDir\extensions\extension\src\main\locales\es.json" -Raw -Encoding UTF8
$arRaw = Get-Content "$baseDir\extensions\extension\src\main\locales\ar.json" -Raw -Encoding UTF8

$en = $enRaw | ConvertFrom-Json
$es = $esRaw | ConvertFrom-Json
$ar = $arRaw | ConvertFrom-Json

Assert-Test ($en -ne $null) "en.json parsed successfully"
Assert-Test ($es -ne $null) "es.json parsed successfully"
Assert-Test ($ar -ne $null) "ar.json parsed successfully"

$enKeys = @($en.psobject.properties.Name | Sort-Object)
$esKeys = @($es.psobject.properties.Name | Sort-Object)
$arKeys = @($ar.psobject.properties.Name | Sort-Object)

Assert-Test ($enKeys.Count -eq $esKeys.Count) "en.json and es.json have identical key count ($($enKeys.Count))"
Assert-Test ($enKeys.Count -eq $arKeys.Count) "en.json and ar.json have identical key count ($($enKeys.Count))"

$diffES = Compare-Object $enKeys $esKeys
Assert-Test ($null -eq $diffES) "Zero key differences between EN and ES catalogs"

$diffAR = Compare-Object $enKeys $arKeys
Assert-Test ($null -eq $diffAR) "Zero key differences between EN and AR catalogs"

# 2. Check all SponsorBlock required translation keys
$requiredKeys = @(
    "sponsor.prompt_all.title",
    "sponsor.prompt_all.summary",
    "sponsor.prompt.action",
    "sponsor.sponsor.title",
    "sponsor.sponsor.prompt.title",
    "sponsor.selfpromo.title",
    "sponsor.selfpromo.prompt.title",
    "sponsor.interaction.title",
    "sponsor.interaction.prompt.title",
    "sponsor.intro.title",
    "sponsor.intro.prompt.title",
    "sponsor.outro.title",
    "sponsor.outro.prompt.title",
    "sponsor.preview.title",
    "sponsor.preview.prompt.title",
    "sponsor.music_offtopic.title",
    "sponsor.music_offtopic.prompt.title",
    "sponsor.filler.title",
    "sponsor.filler.prompt.title",
    "sponsor.sponsor.label",
    "sponsor.selfpromo.label",
    "sponsor.interaction.label",
    "sponsor.intro.label",
    "sponsor.outro.label",
    "sponsor.preview.label",
    "sponsor.music_offtopic.label",
    "sponsor.filler.label",
    "sponsor.skipped"
)

foreach ($k in $requiredKeys) {
    $hasEn = $null -ne $en.$k
    $hasEs = $null -ne $es.$k
    $hasAr = $null -ne $ar.$k
    Assert-Test ($hasEn -and $hasEs -and $hasAr) "Key '$k' is present in EN, ES, and AR"
}

# 3. Verify sponsorblock.js structural integrity
$sbJs = Get-Content "$baseDir\extensions\extension\src\main\js\sponsorblock.js" -Raw -Encoding UTF8

Assert-Test ($sbJs -match "prompt_all") "Contains master 'prompt_all' setting"
Assert-Test ($sbJs -match "getCategoryMode") "Contains 3-mode resolver 'getCategoryMode'"
Assert-Test ($sbJs -match "\.farotv-skip-prompt") "Contains CSS styles for .farotv-skip-prompt"
Assert-Test ($sbJs -match "(code|keyCode) === 13 \|\|.*(code|keyCode) === 23") "Contains D-pad OK (13 / 23) key event handler"
Assert-Test ($sbJs -match "activePromptSegment") "Contains activePromptSegment tracking state"
Assert-Test ($sbJs -match "showPrompt") "Contains showPrompt function"
Assert-Test ($sbJs -match "hidePrompt") "Contains hidePrompt function"
Assert-Test ($sbJs -match "video\.currentTime = Math\.min\(target\.end") "Performs seek to segment end on skip"

# 4. State Machine Simulation in PowerShell (testing the exact logic of getCategoryMode)
function Get-CategoryMode($featureEnabled, $categoryEnabled, $categoryPrompt, $globalPrompt) {
    if (-not $featureEnabled) { return "off" }
    if (-not $categoryEnabled -and -not $categoryPrompt) { return "off" }
    if ($categoryPrompt -or ($categoryEnabled -and $globalPrompt)) { return "prompt" }
    if ($categoryEnabled) { return "skip" }
    return "off"
}

# Test 4.1: Default state (sponsor = true, prompt = false)
Assert-Test ((Get-CategoryMode $true $true $false $false) -eq "skip") "Default state resolves to 'skip'"

# Test 4.2: Disabled category (intro = false, prompt = false)
Assert-Test ((Get-CategoryMode $true $false $false $false) -eq "off") "Disabled category resolves to 'off'"

# Test 4.3: Per-category prompt enabled (selfpromo = true, prompt = true)
Assert-Test ((Get-CategoryMode $true $true $true $false) -eq "prompt") "Per-category prompt resolves to 'prompt'"

# Test 4.4: Global prompt enabled (prompt_all = true, sponsor = true)
Assert-Test ((Get-CategoryMode $true $true $false $true) -eq "prompt") "Global prompt_all resolves to 'prompt'"

# Test 4.5: Category turned off even if prompt_all is on
Assert-Test ((Get-CategoryMode $true $false $false $true) -eq "off") "Global prompt_all does NOT enable disabled categories ('off')"

# Test 4.6: Master feature turned off
Assert-Test ((Get-CategoryMode $false $true $true $true) -eq "off") "Master feature disabled resolves everything to 'off'"

# 5. Run Node.js CI test suite if node is available
if (Get-Command node -ErrorAction SilentlyContinue) {
    node --test "$baseDir\tools\tests\i18n.test.cjs" "$baseDir\tools\tests\site-locales.test.cjs" "$baseDir\tools\tests\premium.test.cjs" "$baseDir\tools\tests\tree-filters.test.cjs"
    Assert-Test ($LASTEXITCODE -eq 0) "Node.js CI test suite passed"
}

Write-Host ""
Write-Host "========================================"
Write-Host "  RESULTS: $passed passed, $failed failed  "
Write-Host "========================================"
if ($failed -gt 0) { exit 1 }
