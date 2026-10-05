<# Compiles multidex fixtures and checks member resolution, invocation shapes and SDK guard proofs. #>
[CmdletBinding()]
param(
    [string]$Root,
    [string]$Java,
    [string]$DesktopJar,
    [string]$AndroidJar,
    [string]$ApiVersions,
    [string]$WorkDir
)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $Root -Required
$compiler = Join-Path (Split-Path -Parent $Java) $(if ($env:OS -eq 'Windows_NT') { 'javac.exe' } else { 'javac' })
if (-not (Test-Path -LiteralPath $compiler -PathType Leaf)) { throw "A full JDK with javac is required: $Java" }
if (-not $AndroidJar) {
    $sdkRoots = @($env:ANDROID_HOME, $env:ANDROID_SDK_ROOT)
    if ($env:LOCALAPPDATA) { $sdkRoots += Join-Path $env:LOCALAPPDATA 'Android/Sdk' }
    foreach ($sdk in $sdkRoots | Where-Object { $_ }) {
        $candidate = Join-Path $sdk 'platforms/android-36/android.jar'
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { $AndroidJar = $candidate; break }
    }
}
if (-not $AndroidJar -or -not (Test-Path -LiteralPath $AndroidJar -PathType Leaf)) { throw 'Pass -AndroidJar for an Android SDK public stub JAR.' }
if (-not $ApiVersions) { $ApiVersions = Join-Path (Split-Path -Parent $AndroidJar) 'data/api-versions.xml' }
if (-not (Test-Path -LiteralPath $ApiVersions -PathType Leaf)) { throw "SDK API history is missing: $ApiVersions" }
if (-not $WorkDir) { $WorkDir = Join-Path ([IO.Path]::GetTempPath()) ('host-references-' + [Guid]::NewGuid().ToString('N')) }
if (Test-Path -LiteralPath $WorkDir) { throw "Fixture output must be a new directory: $WorkDir" }
New-Item -ItemType Directory -Path $WorkDir | Out-Null
$classes = Join-Path $WorkDir 'classes'
New-Item -ItemType Directory -Path $classes | Out-Null
$separator = [IO.Path]::PathSeparator
$classpath = "$classes$separator$DesktopJar"
function Invoke-Native {
    param([string]$Program, [string[]]$Arguments)
    $ErrorActionPreference = 'Continue'
    $text = @(& $Program @Arguments 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ Code = $LASTEXITCODE; Text = ($text -join "`n") }
}
$compiled = Invoke-Native $compiler @('-cp', $DesktopJar, '-d', $classes,
    (Join-Path $Root 'scripts/HostReferences.java'), (Join-Path $Root 'scripts/HostReferenceFixture.java'),
    (Join-Path $Root 'scripts/DexDiff.java'))
if ($compiled.Code -ne 0) { throw "Reference checker compilation failed.`n$($compiled.Text)" }
$generated = Invoke-Native $Java @('-cp', $classpath, 'HostReferenceFixture', $WorkDir)
if ($generated.Code -ne 0) { throw "Fixture compilation failed.`n$($generated.Text)" }
$pass = @('good', 'unreferenced-removal', 'guarded', 'guarded-helper', 'array-clone', 'changed-host', 'reviewed-bridge')
$fail = [ordered]@{
    'missing-method' = 'missing method Lcom/google/android/material/widget/FixtureWidget;->present()V'
    'missing-field' = 'missing field Lcom/google/android/material/widget/FixtureWidget;->value:I'
    'missing-parent' = 'missing declaring class or ancestor'
    'static-method' = 'static/instance invocation shape mismatch'
    'static-field' = 'static/instance field shape mismatch'
    'direct-method' = 'invoke-direct target is neither private nor a constructor'
    'interface-owner' = 'invoke-interface owner is a class'
    'private-method' = 'target is private'
    'inherited-constructor' = 'missing method Lcom/google/android/material/widget/FixtureWidget;-><init>()V'
    'field-opcode' = 'field value shape mismatch'
    'missing-framework' = 'missing method Landroid/view/View;->notAnAndroidMethod()V'
    'unguarded-api' = 'no sufficient SDK guard'
    'wrong-guard' = 'proven SDK >= 29'
    'clobbered-guard' = 'no sufficient SDK guard'
    'bypass-guard' = 'no sufficient SDK guard'
    'exception-bypass' = 'no sufficient SDK guard'
    'unguarded-helper' = 'no sufficient SDK guard'
    'escaped-helper' = 'no sufficient SDK guard'
    'bad-handle-register' = 'no sufficient SDK guard'
    'good-handle-register' = 'no sufficient SDK guard'
    'unguarded-bridge' = 'API-entry contract requires SDK >= 30'
    'empty' = 'No inserted method or field references were checked'
    'changed-host-missing' = 'Lfixture/Host;->run('
}
$inherited = [ordered]@{
    'owner-method' = @(33, 'invoke-virtual Landroid/app/LocaleManager;->toString()Ljava/lang/String;')
    'owner-field' = @(30, 'sget Landroid/widget/inline/InlineContentView;->VISIBLE:I')
    'owner-method-handle' = @(33, 'const-method-handle -> invoke-virtual-handle Landroid/app/LocaleManager;->toString()Ljava/lang/String;')
    'owner-field-handle' = @(30, 'const-method-handle -> sget-handle Landroid/widget/inline/InlineContentView;->VISIBLE:I')
    'member-method' = @(31, 'invoke-virtual Landroid/widget/inline/InlineContentView;->setScrollCaptureHint(I)V')
    'member-field' = @(31, 'sget Landroid/widget/inline/InlineContentView;->SCROLL_CAPTURE_HINT_AUTO:I')
    'member-method-handle' = @(31, 'const-method-handle -> invoke-virtual-handle Landroid/widget/inline/InlineContentView;->setScrollCaptureHint(I)V')
    'member-field-handle' = @(31, 'const-method-handle -> sget-handle Landroid/widget/inline/InlineContentView;->SCROLL_CAPTURE_HINT_AUTO:I')
}
foreach ($family in $inherited.Keys) {
    $since = $inherited[$family][0]
    $pass += "guarded-$family"
    $fail["unguarded-$family"] = "requires API $since above minSdk 28; proven SDK >= 28, no sufficient SDK guard"
    $fail["wrong-$family"] = "requires API $since above minSdk 28; proven SDK >= $($since - 1), no sufficient SDK guard"
}
foreach ($name in @($pass) + @($fail.Keys)) {
    $report = Join-Path $WorkDir "$name.txt"
    $arguments = @('-cp', $classpath, 'HostReferences', (Join-Path $WorkDir 'clean.apk'),
        (Join-Path $WorkDir "$name.apk"), $report, $AndroidJar, $ApiVersions, '28')
    if ($name -match 'bridge$') { $arguments += Join-Path $WorkDir 'reviewed.txt' }
    $result = Invoke-Native $Java $arguments
    $content = [IO.File]::ReadAllText($report)
    if ($name -in $pass) {
        if ($result.Code -ne 0 -or $content -notmatch 'findings=0\r?\n') { throw "Expected $name to pass.`n$($result.Text)" }
    } elseif ($result.Code -eq 0 -or -not $content.Contains($fail[$name])) {
        throw "Expected $name to fail with '$($fail[$name])'.`n$($result.Text)"
    }
    if ($name -match 'guarded' -and $name -in $pass -and $content -notmatch 'guarded=[1-9]') { throw "No newer API review was emitted for $name" }
    if ($name -match '^(guarded|unguarded|wrong)-(owner|member)-') {
        $family = $name.Substring($name.IndexOf('-') + 1)
        $since, $reference = $inherited[$family]
        if (-not $content.Contains(" $reference => ")) { throw "The inherited symbolic reference was not checked for $name" }
        if ($name -in $pass) {
            if ($content -notmatch 'guarded=1 ' -or -not $content.Contains("available since API $since, proven SDK >= $since")) {
                throw "The inherited API floor or guard was wrong for $name"
            }
        } elseif ($content -notmatch 'findings=1\r?\n') { throw "Expected only the inherited API violation for $name" }
    }
    if ($name -in @('escaped-helper', 'bad-handle-register', 'good-handle-register') -and $content -notmatch 'const-method-handle -> invoke-static-handle') {
        throw "DEX 039 method handle was hidden by the decoder for $name"
    }
}
$stale = Invoke-Native $Java @('-cp', $classpath, 'HostReferences', (Join-Path $WorkDir 'clean.apk'),
    (Join-Path $WorkDir 'good.apk'), (Join-Path $WorkDir 'stale-contract.txt'), $AndroidJar, $ApiVersions, '28', (Join-Path $WorkDir 'stale.txt'))
if ($stale.Code -eq 0 -or $stale.Text -notmatch 'Stale, duplicate or invalid API-entry') { throw "Stale review contract was accepted.`n$($stale.Text)" }
foreach ($case in @('good-handle-register', 'bad-handle-register')) {
    $dexReport = Join-Path $WorkDir "dexdiff-$case.txt"
    $checked = Invoke-Native $Java @('-cp', $classpath, 'DexDiff', (Join-Path $WorkDir 'clean.apk'),
        (Join-Path $WorkDir "$case.apk"), $dexReport, (Join-Path $WorkDir 'empty-removals.txt'))
    if ($case -eq 'good-handle-register') {
        if ($checked.Code -ne 0 -or $checked.Text -notmatch 'structural findings: 0') { throw "Valid modern handle failed structural verification.`n$($checked.Text)" }
    } elseif ($checked.Code -eq 0 -or $checked.Text -notmatch 'register: const-method-handle at 0 reaches v1, and the method declares 1 register') {
        throw "DEX 039 handle destination escaped structural verification.`n$($checked.Text)"
    }
}
Write-Host "[scripts] host reference contracts passed ($($pass.Count) valid, $($fail.Count + 1) rejected). Reports: $WorkDir"
$global:LASTEXITCODE = 0
