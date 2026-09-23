<#
Build the current Kotlin source and native resources into a local experimental MPP,
then run 26 isolated Morphe APK cases from that archive and generate all catalogs.
Requires the final native helpers to have been built first. Does not build/sign/install
APKs on a device, use ADB, modify SteamVR, or change Gradle release metadata.
The previous 5002363-local MPP is preserved. Repeated runs use unique workspace output
directories; replacing this experiment's artifact/catalogs preserves their previous bytes.
#>
[CmdletBinding()]
param(
    [string]$JavaHome = 'F:/Runtimes/Java21',
    [string]$Python,
    [string]$Apk5002322,
    [string]$Apk5002363,
    [string]$OutputDirectory,
    [string]$Version,
    [switch]$KeepTemporary
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$buildRoot = [IO.Path]::GetFullPath((Join-Path $repo 'build/decoder-buffering'))
if (!$OutputDirectory) {
    $OutputDirectory = Join-Path $buildRoot ('archive-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N').Substring(0,8))
}
$run = [IO.Path]::GetFullPath($(if ([IO.Path]::IsPathRooted($OutputDirectory)) { $OutputDirectory } else { Join-Path $repo $OutputDirectory }))
function Assert-ChildPath([string]$Path, [string]$Parent) {
    $resolved = [IO.Path]::GetFullPath($Path)
    $prefix = [IO.Path]::GetFullPath($Parent).TrimEnd('\','/') + [IO.Path]::DirectorySeparatorChar
    if (!$resolved.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Target is outside the intended workspace directory: $resolved"
    }
}
Assert-ChildPath $run $buildRoot
if (Test-Path -LiteralPath $run) { throw "Refusing to reuse build output: $run" }
if (!$Python) { $Python = (Get-Command python).Source }
$java = (Resolve-Path (Join-Path $JavaHome 'bin/java.exe')).Path
if (!$Apk5002322) { $Apk5002322 = Join-Path $repo '../Best Apks/android-steamlinkvr-release-2.0.22-5002322.apk' }
if (!$Apk5002363) { $Apk5002363 = Join-Path $repo '../Best Apks/android-steamlinkvr-release-2.0.23-5002363.apk' }
$Apk5002322 = (Resolve-Path -LiteralPath $Apk5002322).Path
$Apk5002363 = (Resolve-Path -LiteralPath $Apk5002363).Path
$inputs = @(
    @{ Version = '2.0.22'; Code = '5002322'; Path = $Apk5002322; Hash = 'c80cae013125c37ae781a0065b258ba5c83f7d908f26a52609139f3e846829bf' },
    @{ Version = '2.0.23'; Code = '5002363'; Path = $Apk5002363; Hash = '36b21974db9f5cd9f54cdf850565b80d31c76a2dd7608406fe160e3005d976d6' }
)
foreach ($apkInput in $inputs) {
    if ((Get-FileHash -LiteralPath $apkInput.Path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $apkInput.Hash) {
        throw "Source APK hash differs from verified original $($apkInput.Version)/$($apkInput.Code): $($apkInput.Path)"
    }
}
$null = New-Item -ItemType Directory -Path $run
$inputs | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $run 'original-apks.json') -Encoding utf8
$versionMatch = [regex]::Match((Get-Content -LiteralPath (Join-Path $repo 'gradle.properties') -Raw), '(?m)^version\s*=\s*(\S+)')
if (!$versionMatch.Success) { throw 'Missing current Gradle version' }
if (!$Version) { $Version = $versionMatch.Groups[1].Value }
if ($Version -ne $versionMatch.Groups[1].Value) { throw 'Requested archive version must match the existing Gradle version' }
$artifactName = "patches-$Version-decoder-pipeline-v2-local.mpp"
$catalogNames = @('patches-list.json','patches-list-all.json','patches-list-stable.json','patches-list-experimental.json')
$catalogBefore = Join-Path $run 'catalogs-before'
$null = New-Item -ItemType Directory -Path $catalogBefore
$catalogHashes = @{}
foreach ($name in $catalogNames) {
    $path = Join-Path $repo $name
    $document = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    if ($document.version -ne $Version) { throw "Current catalog and Gradle versions differ: $name" }
    Copy-Item -LiteralPath $path -Destination (Join-Path $catalogBefore $name)
    $catalogHashes[$name] = (Get-FileHash -LiteralPath $path).Hash
}
$selectedChannel = (Get-Content -LiteralPath (Join-Path $catalogBefore 'patches-list.json') -Raw | ConvertFrom-Json).channel
if ($selectedChannel -notin @('stable','experimental','all')) { throw 'Unrecognized current catalog channel' }
function Invoke-CheckedJava([string[]]$Arguments, [string]$Log) {
    & $java @Arguments 2>&1 | Tee-Object -FilePath $Log
    if ($LASTEXITCODE -ne 0) { throw "Java failed ($LASTEXITCODE); see $Log" }
}
function Remove-CaseTemporary([string]$CaseDirectory) {
    if ($KeepTemporary) { return }
    foreach ($name in @('temporary','isolated-input.apk')) {
        $target = [IO.Path]::GetFullPath((Join-Path $CaseDirectory $name))
        Assert-ChildPath $target (Join-Path $run 'apks')
        if (Test-Path -LiteralPath $target) { Remove-Item -LiteralPath $target -Recurse -Force }
    }
}
Push-Location $repo
try {
    $compiled = Join-Path $run 'compiled'
    & (Join-Path $repo 'diagnostics/steamlink-5002363/Compile-CachedAudit.ps1') -JavaHome $JavaHome -OutputDirectory $compiled 2>&1 |
        Tee-Object -FilePath (Join-Path $run 'compile.log')
    $staged = Join-Path $run $artifactName
    # No old archive contents: current classes, source resources, freshly assembled helper DEX.
    @'
import sys, json, time, re, hashlib, zipfile
from pathlib import Path
from xml.etree import ElementTree as ET
root, compiled, output = map(Path, sys.argv[1:4])
version = sys.argv[4]
reports = list((compiled/'test-results').glob('TEST-*.xml'))
assert reports, 'Missing JUnit results'
for p in reports:
    r=ET.parse(p).getroot()
    assert int(r.get('failures',0)) == int(r.get('errors',0)) == 0, str(p)
patcher = re.search(r'morphe-patcher\s*=\s*"([^"]+)"',(root/'gradle/libs.versions.toml').read_text()).group(1)
fields = {'Manifest-Version':'1.0','Name':'Steam Link GalaxyXR Patches',
 'Description':'Local decoder input buffering experiment; exact 5002322 and 5002363',
 'Version':version,'Timestamp':str(int(time.time()*1000)),
 'Source':'https://github.com/AngelDark92/steamlink-patches','Author':'AngelDark92',
 'Contact':'na','Website':'na','License':'GPLv3','Patcher-Version':patcher,
 'Experimental-Id':'decoder-staging-v1'}
lines=[]
for k,v in fields.items():
    line=f'{k}: {v}'
    while len(line)>70:
        lines.append(line[:70]);line=' '+line[70:]
    lines.append(line)
entries={'META-INF/MANIFEST.MF':('\r\n'.join(lines)+'\r\n\r\n').encode('ascii')}
for base,classes in [(compiled/'classes',True),(root/'patches/src/main/resources',False),(compiled/'resources',False)]:
    for p in sorted(base.rglob('*')):
        if not p.is_file() or (classes and p.suffix not in ('.class','.kotlin_module')):continue
        name=p.relative_to(base).as_posix()
        assert name not in entries,f'Duplicate archive entry: {name}'
        entries[name]=p.read_bytes()
for n in ('extension','minimal-extension','battery-extension'):
    assert entries[f'extensions/{n}.mpe'].startswith(b'dex\n')
for c in ('5002322','5002363'):
    assert entries[f'steamlink/decoder/libgxr_dbuf_{c}.so'].startswith(b'\x7fELF')
assert 'util/DecoderInputBufferingApkAudit.class' in entries
assert not output.exists()
with zipfile.ZipFile(output,'x',zipfile.ZIP_DEFLATED) as z:
    for name,data in entries.items():z.writestr(name,data)
summary={'archive':str(output),'sha256':hashlib.sha256(output.read_bytes()).hexdigest(),
 'manifest_version':version,'entries':len(entries),'build':'cached current Kotlin/Morphe; not Gradle release'}
(output.parent/'archive.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary))
'@ | & $Python - $repo $compiled $staged $Version
    if ($LASTEXITCODE -ne 0) { throw 'MPP packaging failed' }
    $toolDirectory = Join-Path $repo 'build/startup-boundary-tools'
    $dependencyClasspath = @('gson.jar','jcommander.jar','junit.jar','kotlin-test-junit5.jar','kotlin-test.jar','morphe-desktop-1.13.1-all.jar') |
        ForEach-Object { (Resolve-Path (Join-Path $toolDirectory $_)).Path }
    # Crucially exclude compiled/classes, compiled/resources and source resource directories.
    $archiveClasspath = (@($staged) + $dependencyClasspath) -join ';'
    [IO.File]::WriteAllText((Join-Path $run 'archive-classpath.txt'), $archiveClasspath)
    $null = New-Item -ItemType Directory -Path (Join-Path $run 'apks')
    foreach ($apkInput in $inputs) {
        $baselineDirectory = Join-Path $run "apks/$($apkInput.Code)-baseline"
        Invoke-CheckedJava @('-cp',$archiveClasspath,'util.DecoderInputBufferingApkAudit',
            $staged,$apkInput.Path,$apkInput.Version,$apkInput.Code,'buffered','baseline',$baselineDirectory) (Join-Path $run "$($apkInput.Code)-baseline.log")
        Remove-CaseTemporary $baselineDirectory
        $baselineApk = Join-Path $baselineDirectory 'result-unsigned.apk'
        foreach ($mode in @('observe','buffered','observe-telemetry','buffered-telemetry')) {
            foreach ($selection in @('standalone','bundle-first','decoder-first')) {
                $name = "$($apkInput.Code)-$mode-$selection"
                $caseDirectory = Join-Path $run "apks/$name"
                $arguments = @('-cp',$archiveClasspath,'util.DecoderInputBufferingApkAudit',
                    $staged,$apkInput.Path,$apkInput.Version,$apkInput.Code,$mode,$selection,$caseDirectory)
                if ($selection -ne 'standalone') { $arguments += $baselineApk }
                Invoke-CheckedJava $arguments (Join-Path $run "$name.log")
                Remove-CaseTemporary $caseDirectory
            }
        }
    }
    $catalogRoot = Join-Path $run 'catalogs'
    $catalogWork = Join-Path $catalogRoot 'work'
    $null = New-Item -ItemType Directory -Force -Path (Join-Path $catalogWork 'build/libs')
    Copy-Item -LiteralPath $staged -Destination (Join-Path $catalogWork 'build/libs/decoder-experiment.mpp')
    Push-Location $catalogWork
    try { Invoke-CheckedJava @('-cp',$archiveClasspath,'util.PatchListGeneratorKt',$selectedChannel) (Join-Path $run 'catalogs.log') }
    finally { Pop-Location }
    foreach ($name in $catalogNames) {
        $path = Join-Path $catalogRoot $name
        if (!(Test-Path -LiteralPath $path)) { throw "Missing generated catalog: $name" }
        $json = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
        if ($json.version -ne $Version) { throw "Unexpected catalog version in $name" }
    }
    @'
import sys, json
from pathlib import Path
before, after = map(Path, sys.argv[1:3])
version = sys.argv[3]
patch = 'Decoder input buffering (experimental)'
rows=[]
for name in ('patches-list.json','patches-list-all.json','patches-list-stable.json','patches-list-experimental.json'):
    a=json.loads((before/name).read_text(encoding='utf-8-sig'))
    b=json.loads((after/name).read_text(encoding='utf-8-sig'))
    assert a['version']==b['version']==version,name
    old=[p for p in a['patches'] if p['name']==patch]
    new=[p for p in b['patches'] if p['name']==patch]
    assert len(old)<=1,name
    assert len(new)==(0 if b['channel']=='stable' else 1),name
    if b['channel']=='stable':
        assert a==b,'Stable catalog changed'
    else:
        # On a repeat run, compare all pre-existing patches independently of this experiment.
        clean=lambda d: dict(d,patches=[p for p in d['patches'] if p['name']!=patch])
        assert clean(a)==clean(b),f'An existing target/default/option/dependency changed: {name}'
        assert new[0]['default'] is False and new[0]['dependencies']==[],name
    rows.append({'catalog':name,'prior_experiment_entries':len(old),'new_experiment_entries':len(new),
                 'all_other_json_unchanged':True,'version':version})
(after.parent/'catalog-regression.json').write_text(json.dumps(rows,indent=2)+'\n')
print('PASS catalog regression: all existing JSON preserved; stable catalog entirely unchanged')
'@ | & $Python - $catalogBefore $catalogRoot $Version
    if ($LASTEXITCODE -ne 0) { throw 'Catalog regression failed; nothing published' }
    # Publish only after every APK case and catalog generation succeeded.
    $artifact = Join-Path (Join-Path $repo 'patches/build/libs') $artifactName
    $backup = Join-Path $run 'previous-published-files'
    $null = New-Item -ItemType Directory -Path $backup
    foreach ($name in $catalogNames) {
        if ((Get-FileHash -LiteralPath (Join-Path $repo $name)).Hash -ne $catalogHashes[$name]) {
            throw "Catalog changed during build; refusing to replace newer work: $name"
        }
    }
    foreach ($path in @($artifact) + @($catalogNames | ForEach-Object { Join-Path $repo $_ })) {
        if (Test-Path -LiteralPath $path) {
            $saved = Join-Path $backup ([IO.Path]::GetFileName($path))
            Copy-Item -LiteralPath $path -Destination $saved
            if ((Get-FileHash -LiteralPath $path).Hash -ne (Get-FileHash -LiteralPath $saved).Hash) { throw "Backup verification failed: $path" }
        }
    }
    $null = New-Item -ItemType Directory -Force -Path (Split-Path -Parent $artifact)
    Copy-Item -LiteralPath $staged -Destination $artifact -Force
    foreach ($name in $catalogNames) { Copy-Item -LiteralPath (Join-Path $catalogRoot $name) -Destination (Join-Path $repo $name) -Force }
    if ((Get-FileHash -LiteralPath $staged).Hash -ne (Get-FileHash -LiteralPath $artifact).Hash) { throw 'Published artifact differs from audited bytes' }
    $summary = [ordered]@{ Status = 'passed'; Artifact = $artifact; Sha256 = (Get-FileHash -LiteralPath $artifact).Hash.ToLowerInvariant();
        AuditDirectory = $run; ApkCases = 26; Inputs = '2 verified original APKs; no reconstructed fallback';
        Validation = 'Cached compile/JUnit; MPP-first Morphe APK audits; 4 catalogs'; SignedOrInstalled = $false }
    $summary | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $run 'result.json') -Encoding utf8
    $summary | ConvertTo-Json
}
finally { Pop-Location }
