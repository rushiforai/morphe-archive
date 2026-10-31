<#
.SYNOPSIS
    Patch a YouTube VR APK with this repo's patches and install it on a Quest.

.DESCRIPTION
    Runs the whole pipeline, in the order the Quest requires:

      1. our bundle                  -> the ad-free app, patched *as a clone*: this bundle's
                                        "Install as clone" patch renames the package
                                        (default app.morphe.android.youtube), because a
                                        differently signed APK cannot update the store
                                        app in place. Defaults are the recommended
                                        configuration: streaming spoof ON, diagnostics OFF
      2. official "Clone app"        -> only with -OfficialClone, and it disables ours for
                                        that run: the official patch is universal, so the
                                        patcher can never default-select it and Manager's
                                        Simple mode never applies it at all
      3. adb install -r

    It verifies the *effective* patch options from the patch result file, so a silently
    dropped option cannot produce a build that looks fine but is not what was asked for.
    That includes the clone's package id: a rename that quietly no-ops leaves the output
    under the store app's own id, which is the one outcome this script exists to prevent.
    Options are passed through a generated `--options-file`, never as `-O`: the CLI binds
    every `-O` on the command line to the FIRST `--enable`, so a second option-bearing
    patch silently keeps its default (see docs/INTERNALS.md).

.EXAMPLE
    pwsh -File scripts/patch-and-install.ps1 -Apk C:\apk\youtube-vr-1.88.10.apk

.EXAMPLE
    # A/B: same patches with the streaming spoof off (ad-bearing player).
    pwsh -File scripts/patch-and-install.ps1 -Apk C:\apk\youtube-vr.apk -NoSpoof
#>
[CmdletBinding()]
param(
    # The stock YouTube VR APK to patch (com.google.android.apps.youtube.vr.oculus).
    [Parameter(Mandatory = $true)]
    [string] $Apk,

    # Our patch bundle. Defaults to the newest build in patches/build/libs.
    [string] $OurBundle,

    # The official Morphe bundle. Only needed for -OfficialClone (see below).
    [string] $OfficialBundle,

    # Morphe Desktop CLI jar.
    [string] $MorpheCli,

    # Java executable.
    [string] $Java,

    # Package name for the clone, handed to this bundle's "Install as clone" patch. Must be
    # unique per install. Any name works; this one makes no claim about the vendor and cannot
    # be confused with the store app. Passing the app's own id is refused unless -NoClone or
    # -OfficialClone is also given: that would make the rename a no-op, i.e. a build that
    # replaces the store app, which is not what "clone" means.
    [string] $PackageName = 'app.morphe.android.youtube',

    # Name shown in the headset's library (App name patch). Pass '' to keep the stock name.
    [string] $AppName = 'YouTube VR (patched)',

    # Where the intermediate and final APKs are written.
    [string] $OutDir,

    # Apply the patches with the streaming spoof OFF (A/B comparisons only).
    [switch] $NoSpoof,

    # Turn the extension's verbose diagnostics on (innertube route log, per-request media log, the
    # DataSpec resolver report). Needed to compare a build against the logged expectations in
    # docs/INTERNALS.md ("Verifying a change").
    [switch] $Diagnostics,

    # Log from the app's first line and IGNORE the "Verbose logging" row's stored value. This is
    # the switch a local test build wants: unlike -Diagnostics it sets no extra hooks and makes no
    # probe request, and unlike the row's own default it also wins over a stored value (the row is
    # sticky across `adb install -r`, so a device that once had it off stays silent otherwise).
    [switch] $VerboseLogging,

    # Run the one-shot identity-matrix probe at app start (development only). It costs ~14
    # *unauthenticated* requests per launch, which is the traffic that gets an IP's
    # unauthenticated innertube requests refused, so the patch additionally requires
    # -Diagnostics (its output is unreadable without the route log) and this script refuses the
    # combination rather than silently producing a build without the probe.
    [switch] $IdentityProbe,

    # Native-formats mode: keep the app's own ANDROID_VR streaming data (8K VP9 formats) but
    # blank its SABR stream URI and run the ad-free infrastructure (GET normalisation, SABR
    # disable, ad-slot clear). The spoof option must stay ON so the infrastructure installs;
    # only the VISIONOS fetch/swap is skipped. The 8K experiment.
    [switch] $NativeFormats,

    # Force the native fallback on every video (development only): the state a refused spoof leaves
    # the app in, and the only state in which its client-side ad machinery runs at all. Measured
    # 2026-10-13: with the spoof healthy the app asks for ad breaks four times per video and the
    # "Hide ads" hooks answer "none", so the fallback's ad path cannot be observed -- and waiting for
    # YouTube to refuse the spoof is not a test plan. It changes nothing except which response plays.
    [switch] $ForceFallback,

    # Launch the app after installing and report whether it survives (development only). This is the
    # check that catches an injected hook the verifier rejects: the app dies inside
    # `Application.onCreate`, so it "does not open" rather than crashing visibly, and every static
    # check in audit-patched-apk.ps1 passed it -- measured 2026-10-13, an invalid register in an
    # injected early return. No process at all is reported as INCONCLUSIVE rather than a pass, because
    # a headset that is not being worn sleeps and the shell caches the launch instead of running it.
    [switch] $SmokeTest,

    # Patches that MUST end up applied. Catches the silent failure mode where a newer app version
    # is outside the declared AppTarget in Constants.kt, so the patcher *skips* the patch instead
    # of failing: without this check the result is an unpatched app and a green-looking run.
    # Every patch in the bundle is on by default (the last opt-in one, QUIC, became the switch that
    # installs the in-headset QUIC row), so all of them are listed. Override with -RequirePatches.
    [string[]] $RequirePatches = @(
        'App name',
        'Default video quality',
        'Extension',
        'Hide ads',
        'Install as clone',
        'QUIC (HTTP/3)',
        'Patch settings',
        'Remove viewer discretion dialog',
        'SponsorBlock',
        'Spoof app version',
        'Spoof package name in User-Agent'
    ),

    # Extra patches to turn on for this run. Nothing is off by default any more, but naming
    # SponsorBlock keeps a run against an older bundle from silently dropping the settings screens,
    # and it stays in this list for that reason. Passing -ExtraPatches replaces this list, so name
    # SponsorBlock alongside anything else you need. Its options keep their defaults.
    [string[]] $ExtraPatches = @('SponsorBlock'),

    # Rename with the official bundle's universal "Clone app" instead of this bundle's
    # "Install as clone", which is disabled for this run. Two renamers must never run together:
    # both finalise, and the official one wins (patches execute alphabetically and the finalize
    # blocks run in reverse), so a run that ticked both would silently get the official patch's
    # rename. Kept as an escape hatch for comparing against the official patch; it costs a second
    # apply pass, which is exactly what a default-on patch in our own bundle removes.
    [switch] $OfficialClone,

    # Do not rename at all: our "Install as clone" patch is disabled, so the output keeps the
    # official package id and cannot be installed over the store app (a differently signed APK
    # cannot update it). Only useful for an A/B build to inspect, not to install.
    [switch] $NoClone,

    # Skip adb install.
    [switch] $NoInstall,

    # Skip the post-patch audit (scripts\audit-patched-apk.ps1). That audit is what catches a stale
    # bundle and an injected call with no check-cast; skip it only to inspect a half-built APK.
    [switch] $SkipAudit,

    # adb executable; resolved from PATH / common install locations when not given.
    [string] $Adb
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Fail([string] $message) {
    Write-Host "ERROR: $message" -ForegroundColor Red
    exit 1
}

function Resolve-Java {
    if ($script:Java) { return $script:Java }
    if ($env:JAVA_HOME) {
        $candidate = Join-Path $env:JAVA_HOME 'bin/java.exe'
        if (Test-Path $candidate) { return $candidate }
    }
    $cmd = Get-Command java -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    Fail 'no java found: set -Java, or JAVA_HOME, or put java on PATH'
}

function Resolve-MorpheCli {
    if ($script:MorpheCli) { return $script:MorpheCli }
    if ($env:MORPHE_CLI) { return $env:MORPHE_CLI }
    # The bundle needs a patcher 2.x host (docs/INTERNALS.md, "The patcher 2.x alignment"):
    # Desktop releases now ship versioned jar names (morphe-desktop-<v>-all.jar), and the old
    # unversioned morphe-desktop-all.jar can be a pre-2.x host that fails the bundle with a
    # misleading NoSuchMethodError at patch time. Prefer the highest versioned jar found, then
    # fall back to the unversioned name; the winner's version is probed below.
    $dirs = @(
        (Join-Path $PSScriptRoot '..\apk'),
        (Join-Path $PSScriptRoot '..\tools\morphe'),
        (Join-Path $HOME 'tools\morphe')
    )
    $versioned = @()
    foreach ($dir in $dirs) {
        $full = [System.IO.Path]::GetFullPath($dir)
        if (Test-Path $full) {
            $versioned += @(Get-ChildItem $full -Filter 'morphe-desktop-*-all.jar' -ErrorAction SilentlyContinue)
        }
    }
    $best = $versioned |
        ForEach-Object { if ($_.Name -match 'morphe-desktop-(\d+(\.\d+)*)-all\.jar') {
            [pscustomobject]@{ Jar = $_.FullName; Ver = [version]$Matches[1] }
        } } |
        Sort-Object Ver -Descending |
        Select-Object -First 1
    if ($best) { return $best.Jar }
    foreach ($dir in $dirs) {
        $legacy = Join-Path ([System.IO.Path]::GetFullPath($dir)) 'morphe-desktop-all.jar'
        if (Test-Path $legacy) { return $legacy }
    }
    Fail 'morphe-desktop-all.jar not found: set -MorpheCli or MORPHE_CLI'
}

function Resolve-OurBundle {
    if ($script:OurBundle) {
        if (-not (Test-Path $script:OurBundle)) { Fail "our bundle not found: $script:OurBundle" }
        return (Resolve-Path $script:OurBundle).Path
    }
    $libs = Join-Path $PSScriptRoot '..\patches\build\libs'
    # Exclude the -sources and -javadoc variants: Gradle writes all three with the same
    # timestamp, so ordering by time alone can hand the patcher a sources jar instead of the
    # bundle (the release workflow's asset glob excludes them for the same reason).
    $newest = Get-ChildItem $libs -Filter 'patches-*.mpp' -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notmatch '-(sources|javadoc)\.mpp$' } |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if (-not $newest) {
        Fail "no bundle in $libs -- run ./gradlew buildAndroid first, or pass -OurBundle"
    }
    return $newest.FullName
}

<#
    Runs one patch apply and returns the parsed --result-file JSON.

    Options go through a generated `--options-file`, never as `-O`: the CLI binds every `-O` on
    the command line to the FIRST `--enable`, so with two option-bearing patches the second one
    silently falls back to its defaults. Measured:
    `-OdisableQuic=true -e "Disable QUIC protocol" -OappName=X -e "App name"` applies disableQuic
    and drops appName (it keeps the patch's own default), and the same happens with both `-O`s
    adjacent before the first `-e`. An options file sets any number of patches at once; patches it
    does not mention keep their defaults and the CLI says so on stdout.

    `$PatchOptions` is patch name -> @{ option key = value }, which is the shape the file needs.
#>
function Invoke-Patch {
    param(
        [string] $Bundle,
        [string] $InputApk,
        [string] $OutputApk,
        [string[]] $Enable = @(),
        [string[]] $Disable = @(),
        [hashtable] $PatchOptions = @{},
        [switch] $Exclusive,
        # When set, the options file marks exactly these patches enabled and every other one
        # enabled=false. Desktop 2.x applies a patch that the file marks enabled even in an
        # --exclusive run (measured: the official bundle's universal 'Spoof signature' ran in a
        # --exclusive pass), so a whitelist pass must speak through the file, not through the
        # flag. The file is written for this list alone; it does not also need -PatchOptions.
        [string[]] $OnlyEnable = @()
    )
    $resultFile = [System.IO.Path]::ChangeExtension($OutputApk, '.result.json')
    $arguments = @('-jar', $script:MorpheCliPath, 'patch', '--patches', $Bundle)
    # -OnlyEnable writes the file even with no option values to overlay: the whitelist is an
    # enabled=false on every other patch, and that only exists once the file exists.
    if ($PatchOptions.Count -gt 0 -or $OnlyEnable.Count -gt 0) {
        # Full-coverage options file: a bundle-generated skeleton (every patch + every option,
        # defaults explicit) with this run's values overlaid. A minimal hand-rolled file used to
        # make the CLI warn "Options file is out of date" on every run, because the bundle's new
        # options (updatePermissions, the category pickers, ...) were never listed in it.
        $optionsFile = [System.IO.Path]::ChangeExtension($OutputApk, '.options.json')
        # Start clean: options-create MERGES with an existing file, and a legacy-shaped leftover
        # (array root, minimal patch set) merges into a malformed skeleton (measured: array of 2
        # entries, 9 added patches lost). The file is a per-run artifact -- regenerate it whole.
        if (Test-Path $optionsFile) { Remove-Item $optionsFile -Force }
        & $script:JavaPath -jar $script:MorpheCliPath options-create `
            -p $Bundle -o $optionsFile | ForEach-Object { Write-Host "   $_" }
        if ($LASTEXITCODE -ne 0) { Fail "options-create failed (exit $LASTEXITCODE) -> $optionsFile" }
        $skeleton = Get-Content $optionsFile -Raw | ConvertFrom-Json
        foreach ($patchName in $PatchOptions.Keys) {
            $prop = $skeleton.patches.PSObject.Properties[$patchName]
            if (-not $prop) {
                Fail "options skeleton from the bundle has no patch '$patchName' (name drift?)"
            }
            $entry = $prop.Value
            $entry | Add-Member -NotePropertyName enabled -NotePropertyValue $true -Force
            foreach ($key in $PatchOptions[$patchName].Keys) {
                $value = $PatchOptions[$patchName][$key]
                if ($entry.PSObject.Properties['options']) {
                    $entry.options | Add-Member -NotePropertyName $key -NotePropertyValue $value -Force
                } else {
                    $entry | Add-Member -NotePropertyName options `
                        -NotePropertyValue ([pscustomobject]@{ $key = $value }) -Force
                }
            }
        }
        if ($OnlyEnable.Count -gt 0) {
            $known = @($skeleton.patches.PSObject.Properties.Name)
            foreach ($name in $OnlyEnable) {
                if ($known -notcontains $name) {
                    Fail "options skeleton from the bundle has no patch '$name' (OnlyEnable)"
                }
            }
            # Force the flag both ways. Clearing only the others would leave a default-off
            # whitelist entry disabled in the file, so the file itself would not be what
            # enables it.
            foreach ($p in $skeleton.patches.PSObject.Properties) {
                $on = $OnlyEnable -contains $p.Name
                $p.Value | Add-Member -NotePropertyName enabled -NotePropertyValue $on -Force
            }
        }
        # The patch command's --options-file wants an ARRAY root ("The root must be a JSON
        # array; a bare object is rejected outright" -- measured in the original shape) even
        # though options-create itself writes a bare object, so wrap the skeleton.
        # Depth 8 stops inside a nested option value and stringifies it as a type name.
        # The skeleton today is shallower than that; 16 leaves room for a map or list value.
        $json = ConvertTo-Json -InputObject @($skeleton) -Depth 16
        [System.IO.File]::WriteAllText(
            $optionsFile, $json, (New-Object System.Text.UTF8Encoding($false)))
        $arguments += @('--options-file', $optionsFile)
    }
    if ($Exclusive) { $arguments += '--exclusive' }
    foreach ($name in $Enable) { $arguments += @('--enable', $name) }
    # Desktop checks --disable before the file, so this still wins over a patch the file
    # marks enabled. -OnlyEnable already writes enabled=false for everyone else.
    foreach ($name in $Disable) { $arguments += @('--disable', $name) }
    $arguments += @('--result-file', $resultFile, '-o', $OutputApk, $InputApk)

    Write-Host ">> $script:JavaPath $($arguments -join ' ')" -ForegroundColor DarkGray
    & $script:JavaPath @arguments | ForEach-Object { Write-Host "   $_" }
    if ($LASTEXITCODE -ne 0) { Fail "patching failed (exit $LASTEXITCODE) -> $OutputApk" }
    if (-not (Test-Path $resultFile)) { Fail "no result file written: $resultFile" }
    return (Get-Content $resultFile -Raw | ConvertFrom-Json)
}

function Assert-NoFailedPatches($result, [string] $stage) {
    if ($result.failedPatches -and $result.failedPatches.Count -gt 0) {
        $names = ($result.failedPatches | ForEach-Object { if ($_.PSObject.Properties['name']) { $_.name } else { $_ } }) -join ', '
        Fail "${stage}: patch(es) failed: $names"
    }
    # Desktop 2.x writes appliedPatches as plain strings; older hosts wrote objects with .name.
    $applied = ($result.appliedPatches | ForEach-Object { if ($_.PSObject.Properties['name']) { $_.name } else { $_ } }) -join ', '
    Write-Host "   applied ($stage): $applied" -ForegroundColor Green
}

<#
    A patch whose package/version is not in the bundle's compatibility list is *skipped*, not
    failed -- the release is green, nothing errors, and the output is an app with none of the
    fixes. The expected patch set has to be checked explicitly.
#>
function Assert-RequiredPatches($result, [string[]] $required, [string] $stage) {
    if (-not $required -or $required.Count -eq 0) { return }
    $applied = @($result.appliedPatches | ForEach-Object { if ($_.PSObject.Properties['name']) { $_.name } else { $_ } })
    $missing = @($required | Where-Object { $applied -notcontains $_ })
    if ($missing.Count -gt 0) {
        Fail ("${stage}: expected patch(es) were not applied: " + ($missing -join ', ') +
            ". This is what a version skip looks like: the app version is not in the declared " +
            "AppTarget (see patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt), so " +
            "the patcher skipped them and the output would be an unpatched app.")
    }
}

function Get-OptionValue($result, [string] $patchName, [string] $key) {
    # Desktop 2.x result files carry no per-patch options at all (name-only appliedPatches), so
    # every readback here returns $null on such a host and the assertions below must tolerate
    # that: each one fails only when the value is PRESENT and wrong.
    $patch = $result.appliedPatches | Where-Object { $_.PSObject.Properties['name'] -and $_.name -eq $patchName } | Select-Object -First 1
    if (-not $patch -or -not $patch.PSObject.Properties['options']) { return $null }
    $option = $patch.options | Where-Object { $_.key -eq $key } | Select-Object -First 1
    if (-not $option) { return $null }
    return $option.value
}

# Desktop 2.x result files carry no per-patch options, so Get-OptionValue cannot verify the
# run's options there. The options file CAN: it is this script's own deterministic product
# (bundle skeleton + overlay), and re-reading it catches an overlay that silently failed to
# merge (Add-Member mistakes, name drift) -- the input half of the verification the result-file
# assertions used to provide on 1.x hosts.
function Assert-OptionsFileValues([string] $File, [hashtable] $Options) {
    if ($Options.Count -eq 0) { return }
    if (-not (Test-Path $File)) { Fail "options file missing: $File" }
    $doc = Get-Content $File -Raw | ConvertFrom-Json
    $patches = if ($doc -is [array]) { $doc[0].patches } else { $doc.patches }
    if (-not $patches) { Fail "options file has no patches object: $File" }
    foreach ($patchName in $Options.Keys) {
        $entry = $patches.PSObject.Properties[$patchName]
        if (-not $entry) { Fail "options file has no patch '$patchName': $File" }
        foreach ($key in $Options[$patchName].Keys) {
            $opt = if ($entry.Value.PSObject.Properties['options']) {
                $entry.Value.options.PSObject.Properties[$key]
            } else { $null }
            if (-not $opt) { Fail "options file: '$patchName' carries no option '$key'" }
            if ("$($opt.Value)" -ne "$($Options[$patchName][$key])") {
                Fail ("options file: '{0}'.'{1}' = '{2}', expected '{3}'" -f `
                    $patchName, $key, $opt.Value, $Options[$patchName][$key])
            }
        }
    }
    Write-Host "   options file carries every value this run configured ($($Options.Keys.Count) patch option set(s))" -ForegroundColor Green
}

# Output-side check for the renames that matter, host-agnostic (no result-file options needed):
# a string a patch wrote must be findable in the compiled archive. The clone's package id lives
# in AndroidManifest.xml; the app name is a resource reference there -- its literal lands in
# resources.arsc (UTF-8 pool, measured). Byte search over both pool encodings (UTF-16LE and
# UTF-8) via a byte-preserving latin1 roundtrip.
function Assert-ApkEntryString([string] $ApkPath, [string] $Entry, [string] $Expected, [string] $What) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path $ApkPath).Path)
    try {
        # Not $entry: that name collides case-insensitively with the $Entry parameter, and under
        # StrictMode the lookup below hands back the parameter string (the $java-shadowing trap's
        # cousin). A distinct name keeps the ZipArchiveEntry a ZipArchiveEntry.
        $zipEntry = $zip.Entries | Where-Object { $_.FullName -eq $Entry } | Select-Object -First 1
        if (-not $zipEntry) { Fail "no $Entry entry in $ApkPath" }
        $ms = New-Object System.IO.MemoryStream
        $stream = $zipEntry.Open()
        try {
            $stream.CopyTo($ms)
            $bytes = $ms.ToArray()
        } finally {
            $stream.Dispose()
            $ms.Dispose()
        }
        $latin = [System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString($bytes)
        $found = $latin.Contains([System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString([System.Text.Encoding]::Unicode.GetBytes($Expected))) -or
                 $latin.Contains([System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString([System.Text.Encoding]::UTF8.GetBytes($Expected)))
        if (-not $found) {
            Fail "${What}: '$Expected' is not in the patched APK's $Entry -- the rename did not take"
        }
        Write-Host ("   {0}: '{1}' present in the patched {2}" -f $What, $Expected, $Entry) -ForegroundColor Green
    } finally { $zip.Dispose() }
}

function Resolve-Adb {
    if ($script:Adb) {
        if (-not (Test-Path $script:Adb) -and -not (Get-Command $script:Adb -ErrorAction SilentlyContinue)) {
            Fail "adb not found: $script:Adb"
        }
        return $script:Adb
    }
    $cmd = Get-Command adb -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    $candidates = @(
        'C:\adb\platform-tools\adb.exe',
        (Join-Path $HOME 'AppData\Local\Android\Sdk\platform-tools\adb.exe'),
        (Join-Path $env:LOCALAPPDATA 'Android\Sdk\platform-tools\adb.exe')
    )
    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path $candidate)) { return $candidate }
    }
    Fail 'adb not found: put it on PATH or pass -Adb <path>'
}

# --- resolve inputs -------------------------------------------------------------------
$script:Java = $Java
$script:MorpheCli = $MorpheCli
$script:OurBundle = $OurBundle
$script:Adb = $Adb
$script:JavaPath = Resolve-Java
$script:MorpheCliPath = Resolve-MorpheCli
# The bundle is built for patcher 2.x hosts: Desktop 1.19 and earlier load it but fail it at
# patch time (docs/INTERNALS.md). Desktop 1.20.0 is the first release carrying patcher 2.x, so
# the resolved host is probed once, here, where the failure can say what is wrong instead of
# leaving a NoSuchMethodError to be diagnosed from a patch log.
$cliVersionLine = & $script:JavaPath -jar $script:MorpheCliPath --version 2>&1 |
    Where-Object { $_ -match 'Morphe Desktop v(\d+)\.(\d+)' } | Select-Object -First 1
if ($cliVersionLine -match 'Morphe Desktop v(\d+)\.(\d+)') {
    $cliVer = [version]("$($Matches[1]).$($Matches[2])")
    if ($cliVer -lt [version]'1.20') {
        Fail ("resolved CLI '{0}' is Desktop v{1}, but this bundle needs Desktop 1.20+ (patcher 2.x). " +
            "Set -MorpheCli to a current jar." -f $script:MorpheCliPath, $cliVer)
    }
} else {
    Write-Host "   note: could not read the resolved CLI's version (expected 'Morphe Desktop v...'); continuing" -ForegroundColor Yellow
}
$bundle = Resolve-OurBundle
if (-not (Test-Path $Apk)) { Fail "input APK not found: $Apk" }

if ($IdentityProbe -and -not $Diagnostics) {
    Fail ("-IdentityProbe needs -Diagnostics: the probe's output is only readable next to the " +
        "route log, and the patch refuses to install it on its own. It also costs ~14 " +
        "unauthenticated requests per launch, which is what gets an IP refused by YouTube's " +
        "bot gate (docs/SABR-SPOOF-PLAN.md, 2026-10-11).")
}

if ($NoClone -and $OfficialClone) {
    Fail ('-NoClone and -OfficialClone contradict each other: -NoClone renames nothing and ' +
        '-OfficialClone renames with the official bundle.')
}

if (-not $OfficialBundle) {
    $OfficialBundle = Join-Path $PSScriptRoot '..\apk\morphe-official-patches.mpp'
}
if ($OfficialClone -and -not (Test-Path $OfficialBundle)) {
    Fail ("official bundle not found: $OfficialBundle (needed for -OfficialClone; pass " +
        "-OfficialBundle)")
}

if (-not $OutDir) { $OutDir = Join-Path $PSScriptRoot '..\apk' }
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$step1 = Join-Path $OutDir 'ytvr-patched.apk'
$step2 = Join-Path $OutDir 'ytvr-clone.apk'
# Our own patch renames inside pass 1, so the clone's output *is* $step1. Only the official
# escape hatch still needs a second pass, and only that one writes ytvr-final.apk.
$final = if ($OfficialClone) { Join-Path $OutDir 'ytvr-final.apk' } else { $step1 }

# --- 1. our patches -------------------------------------------------------------------
Write-Host "`n[1/3] applying our patches: $bundle" -ForegroundColor Cyan
$patchOptions = @{}
$enableStep1 = @()
$disableStep1 = @()
# Two option-bearing patches in one run is exactly the case `-O` gets wrong, so the Extension options
# are collected here and handed to the patcher through the options file with the App name's.
$extensionOptions = @{}
if ($NoSpoof) { $extensionOptions['enableStreamSpoof'] = $false }
if ($Diagnostics) { $extensionOptions['enableDiagnostics'] = $true }
if ($VerboseLogging) { $extensionOptions['forceVerboseLogging'] = $true }
if ($IdentityProbe) { $extensionOptions['enableIdentityMatrix'] = $true }
if ($NativeFormats) { $extensionOptions['enableNativeFormats'] = $true }
if ($ForceFallback) { $extensionOptions['forceFallback'] = $true }
if ($extensionOptions.Count -gt 0) {
    $patchOptions['Extension'] = $extensionOptions
    $enableStep1 += 'Extension'
}
if ($AppName) {
    $patchOptions['App name'] = @{ appName = $AppName }
    $enableStep1 += 'App name'
}
# The clone. "Install as clone" is default-on, so naming it is only about the option value (the
# requested package id) and about keeping the printed command readable.
if (-not $NoClone -and -not $OfficialClone) {
    $patchOptions['Install as clone'] = @{ packageName = $PackageName }
    $enableStep1 += 'Install as clone'
} else {
    # Never leave both renamers armed: two finalize blocks that each rewrite the manifest's package
    # attribute, with the official one winning, is the trap this script must not walk into.
    $disableStep1 += 'Install as clone'
}
# SponsorBlock is default-on in the bundle now, so the patcher selects it on its own; naming it
# (or any opt-in patch) explicitly keeps a run working against older bundles too.
foreach ($extra in $ExtraPatches) { $enableStep1 += $extra }
# Naming the patches whose options are set is harmless (they are default-enabled anyway) and it
# keeps the printed command readable now that the values live in the options file.
# The bundle must correspond to the sources on disk, and a green `Applied:` list cannot tell you when
# it does not: on 2026-10-13 a review agent had the extension sources moved aside while `buildAndroid`
# ran, so the bundle that got installed did not contain the crash fix the source did.
#
# Timestamps alone are the wrong signal -- a checkout or a rebase rewrites every mtime without changing
# a byte -- so this compares a hash of the sources with the hash this script recorded when it last
# patched, together with the bundle's own hash. Edited sources + an unchanged bundle is the stale case;
# a rebuild changes the bundle's hash and clears it.
function Get-SourcesHash {
    $root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
    $files = Get-ChildItem (Join-Path $root 'patches\src'), (Join-Path $root 'extensions\src') -Recurse -File |
        Sort-Object FullName
    $builder = New-Object System.Text.StringBuilder
    foreach ($file in $files) {
        [void]$builder.Append($file.FullName.Substring($root.Length)).Append(':')
        [void]$builder.Append((Get-FileHash $file.FullName -Algorithm SHA256).Hash)
    }
    $sha = [System.Security.Cryptography.SHA256]::Create()
    $digest = $sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($builder.ToString()))
    return (([System.BitConverter]::ToString($digest) -replace '-', '').Substring(0, 16))
}

$stateDir = Join-Path $PSScriptRoot '..\build\probe\audit'
New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
$stateFile = Join-Path $stateDir 'bundle-sources.sha'
$sourcesHash = Get-SourcesHash
$bundleHash = (Get-FileHash $bundle -Algorithm SHA256).Hash
if (Test-Path $stateFile) {
    $recorded = ((Get-Content $stateFile -Raw).Trim() -split '\s+')
    if ($recorded[0] -ne $sourcesHash -and $recorded[1] -eq $bundleHash) {
        Fail ("the bundle was built from different sources: last patched at source hash {0}, sources are now {1}, and the bundle has not changed. Run .\gradlew.bat buildAndroid first" -f $recorded[0], $sourcesHash)
    }
} else {
    # First run here: no recorded hash, so fall back to timestamps as a note rather than a stop.
    $newestSource = Get-ChildItem (Join-Path $PSScriptRoot '..\patches\src'), (Join-Path $PSScriptRoot '..\extensions\src') -Recurse -File |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($newestSource -and (Get-Item $bundle).LastWriteTime -lt $newestSource.LastWriteTime) {
        Write-Host "   note: the bundle is older than $($newestSource.Name); if the sources were edited since the last build, rebuild" -ForegroundColor Yellow
    }
}
Set-Content -Path $stateFile -Value "$sourcesHash $bundleHash" -Encoding ascii

$result1 = Invoke-Patch -Bundle $bundle -InputApk $Apk -OutputApk $step1 `
    -Enable $enableStep1 -Disable $disableStep1 -PatchOptions $patchOptions
Assert-NoFailedPatches $result1 'our patches'
# -NoClone and -OfficialClone disable the patch, so it cannot be required in those runs; every
# other patch in the list still is.
$required1 = @($RequirePatches | Where-Object { $_ -ne 'Install as clone' -or (-not $NoClone -and -not $OfficialClone) })
Assert-RequiredPatches $result1 $required1 'our patches'

# Option verification, host-agnostic: the result-file assertions below only bite on hosts whose
# result JSON carries options (1.x-shaped); on Desktop 2.x the input file and the patched
# manifest carry the proof instead.
$optionsFile1 = [System.IO.Path]::ChangeExtension($step1, '.options.json')
Assert-OptionsFileValues $optionsFile1 $patchOptions
if (-not $NoClone -and -not $OfficialClone) {
    Assert-ApkEntryString $step1 'AndroidManifest.xml' $PackageName 'clone package id'
}
if ($AppName) {
    Assert-ApkEntryString $step1 'resources.arsc' $AppName 'app name'
}

$spoof = Get-OptionValue $result1 'Extension' 'enableStreamSpoof'
$diagnostics = Get-OptionValue $result1 'Extension' 'enableDiagnostics'
$forceLog = Get-OptionValue $result1 'Extension' 'forceVerboseLogging'
$identity = Get-OptionValue $result1 'Extension' 'enableIdentityMatrix'
$native = Get-OptionValue $result1 'Extension' 'enableNativeFormats'
$name = Get-OptionValue $result1 'App name' 'appName'
Write-Host "   enableStreamSpoof=$spoof (ad-free requires true), enableDiagnostics=$diagnostics, forceVerboseLogging=$forceLog, enableIdentityMatrix=$identity, enableNativeFormats=$native"
Write-Host "   app name = '$name'"
# Result-file option assertions: bite only on hosts whose result JSON carries options (1.x-
# shaped). On Desktop 2.x the two Assert-* calls above carry the verification instead.
if ($NoSpoof -and $null -ne $spoof -and "$spoof" -ne 'false') {
    Fail "enableStreamSpoof did not take false (effective '$spoof'): the streaming spoof would be on"
}
if (-not $NoSpoof -and $null -ne $spoof -and "$spoof" -ne 'true') {
    Fail "enableStreamSpoof should default to true but is '$spoof'"
}
if ($AppName -and $null -ne $name -and "$name" -ne $AppName) {
    Fail "the App name patch did not take '$AppName' (effective '$name')"
}
if ($Diagnostics -and $null -ne $diagnostics -and "$diagnostics" -ne 'true') {
    Fail "enableDiagnostics did not take true (effective '$diagnostics')"
}
if ($VerboseLogging -and $null -ne $forceLog -and "$forceLog" -ne 'true') {
    Fail "forceVerboseLogging did not take true (effective '$forceLog')"
}
if ($IdentityProbe -and $null -ne $identity -and "$identity" -ne 'true') {
    Fail "enableIdentityMatrix did not take true (effective '$identity')"
}
if ($NativeFormats) {
    if ($null -ne $native -and "$native" -ne 'true') {
        Fail "enableNativeFormats did not take true (effective '$native')"
    }
    if ($null -ne $spoof -and "$spoof" -ne 'true') {
        Fail "native-formats mode needs the spoof option ON to install the ad-free infrastructure"
    }
    Write-Host '   NOTE: native-formats mode: the app plays its OWN format list (8K VP9) with the SABR URI blanked.' -ForegroundColor Yellow
}
if ($NoSpoof) {
    Write-Host '   NOTE: the streaming spoof is off, so the pre-roll ad will still play.' -ForegroundColor Yellow
}

# The clone's effective package id, read back from the result file. Two failures are silent and
# both end with the patched app owning the store app's id, which is the outcome this script exists
# to prevent: an option the patcher dropped, and a rename that no-ops because the requested id is
# the id the app already has.
$clonePackage = Get-OptionValue $result1 'Install as clone' 'packageName'
$clonePermissions = Get-OptionValue $result1 'Install as clone' 'updatePermissions'
$cloneProviders = Get-OptionValue $result1 'Install as clone' 'updateProviders'
if (-not $NoClone -and -not $OfficialClone) {
    if ($PackageName -eq "$($result1.packageName)") {
        Fail ("-PackageName '$PackageName' is the app's own id, so the rename is a no-op and the " +
            "output would install *as the store app*. That is what the patch's own Replace option " +
            "asks for; a clone needs a distinct id. Pass one, or -NoClone for a build that is not " +
            "meant to be installed.")
    }
    if ($null -ne $clonePackage -and "$clonePackage" -ne $PackageName) {
        Fail ("the Install as clone patch did not take '$PackageName' (effective '$clonePackage'): " +
            "the APK would install under an id nobody asked for, or under the store app's")
    }
    if ($null -ne $clonePermissions -and $null -ne $cloneProviders -and
        ("$clonePermissions" -ne 'true' -or "$cloneProviders" -ne 'true')) {
        Fail ("Install as clone must rewrite permissions and providers (effective " +
            "updatePermissions=$clonePermissions, updateProviders=$cloneProviders): the stock " +
            "manifest's DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION and its ...tracing / " +
            "...mlkitinitprovider / ...firebaseinitprovider authorities would still name the " +
            "store app")
    }
    Write-Host "   clone package = '$clonePackage' (updatePermissions=$clonePermissions, updateProviders=$cloneProviders)"
} elseif ($OfficialClone) {
    Write-Host '   Install as clone is disabled for this run (-OfficialClone)' -ForegroundColor Yellow
} else {
    Write-Host '   Install as clone is disabled for this run (-NoClone): no rename happens' -ForegroundColor Yellow
}

# --- 2. clone -------------------------------------------------------------------------
if ($OfficialClone) {
    # Escape hatch: rename with the official universal "Clone app" instead, and ONLY it. Pass 2
    # feeds the official bundle our already-patched APK, so the whitelist ($OnlyEnable) marks
    # every other official patch disabled in the options file: package filtering used to be the
    # only guard on 1.x ("anything after the rename applies 0 patches"), but on Desktop 2.x a
    # patch the file marks enabled runs even under --exclusive, and the official bundle carries
    # universal default-on patches that do not belong in this pass (measured: 'Spoof signature'
    # ran and failed -- it wants the original APK's signing certificate, which pass 2's input,
    # our already-signed output, is not). 'Custom branding' stays unused by design: it is
    # filtered out for YouTube VR, and this app's library name comes from its own
    # `youtube_vr_app_name` string.
    Write-Host "`n[2/3] cloning to $PackageName with the official Clone app" -ForegroundColor Cyan
    $result2 = Invoke-Patch -Bundle (Resolve-Path $OfficialBundle).Path -InputApk $step1 `
        -OutputApk $final -Exclusive -Enable @('Clone app') -Disable @('Spoof signature') `
        -OnlyEnable @('Clone app') `
        -PatchOptions @{ 'Clone app' = @{ packageName = $PackageName } }
    Assert-NoFailedPatches $result2 'clone'
    # Host-agnostic verification: Desktop 2.x result files carry no per-patch options, so the
    # old Get-OptionValue readback returned null here and failed a rename that succeeded -- on
    # every host this bundle accepts (the script already refuses Desktop < 1.20). The proof
    # lives in the output APK itself: the official rename rewrites the manifest package, so the
    # requested id must be findable in AndroidManifest.xml (same check pass 1's clone uses).
    Assert-ApkEntryString $final 'AndroidManifest.xml' $PackageName 'official clone package id'
    $optionsFile2 = [System.IO.Path]::ChangeExtension($final, '.options.json')
    Assert-OptionsFileValues $optionsFile2 @{ 'Clone app' = @{ packageName = $PackageName } }
} else {
    Write-Host "`n[2/3] no second pass: our bundle renames in pass 1" -ForegroundColor Cyan
    if ($NoClone) {
        Write-Host '   note: -NoClone: the output keeps the official package id. A differently' -ForegroundColor Yellow
        Write-Host '   signed APK cannot update the store app; installing over it fails unless the' -ForegroundColor Yellow
        Write-Host '   store app is uninstalled first.' -ForegroundColor Yellow
    }
}

# --- 2c. audit the patched APK --------------------------------------------------------
# The fast half of scripts\audit-patched-apk.ps1: does the shipped extension dex carry what the
# sources declare, and is there an injected Object-returning call without its check-cast. The slow
# checks (reachability, the settings XML) stay on demand: run the audit with no -Skip switches.
if (-not $SkipAudit) {
    Write-Host "`n[audit] checking $final against the sources" -ForegroundColor Cyan
    $auditScript = Join-Path $PSScriptRoot 'audit-patched-apk.ps1'
    & pwsh -NoProfile -File $auditScript -Apk (Resolve-Path $final).Path -Root (Resolve-Path (Join-Path $PSScriptRoot '..')).Path -SkipXml -SkipReach -SelfTest
    if ($LASTEXITCODE -ne 0) { Fail 'the audit failed: see the FAIL lines above (the patched APK is still on disk)' }
}

# --- 3. install -----------------------------------------------------------------------
if ($NoInstall) {
    Write-Host "`n[3/3] skipped install; apk is at $final" -ForegroundColor Yellow
    exit 0
}Write-Host "`n[3/3] installing $final" -ForegroundColor Cyan
$adbPath = Resolve-Adb
& $adbPath install -r $final
if ($LASTEXITCODE -ne 0) { Fail 'adb install failed' }
$target = if ($NoClone) { 'com.google.android.apps.youtube.vr.oculus' } else { $PackageName }
& $adbPath shell am force-stop $target | Out-Null
& $adbPath logcat -c | Out-Null

if ($SmokeTest) {
    # The one check that catches what no static audit can: an injected hook the verifier rejects. The
    # app dies in Application.onCreate, so it reads as "the app does not open" rather than a crash.
    # The log buffer was just cleared, so anything in the crash buffer now is this launch.
    Write-Host "`n[smoke] launching $target to see whether it survives" -ForegroundColor Cyan
    $adbTarget = @()
    if ($env:ANDROID_SERIAL) { $adbTarget = @('-s', $env:ANDROID_SERIAL) }
    & $adbPath @adbTarget shell input keyevent KEYCODE_WAKEUP | Out-Null
    & $adbPath @adbTarget shell am start -a android.intent.action.VIEW `
        -d 'https://www.youtube.com/watch?v=aqz-KE-bpKQ' `
        -n "$target/com.google.android.apps.youtube.vr.activities.YouTubeVrActivity" | Out-Null
    Start-Sleep -Seconds 20
    $crash = @(& $adbPath @adbTarget logcat -d -b crash -v brief 2>&1)
    $fatal = @($crash | Where-Object {
            $_ -match 'FATAL EXCEPTION|VerifyError|ClassCastException|NoClassDefFoundError|NoSuchMethodError'
        })
    $alive = (@(& $adbPath @adbTarget shell pidof $target 2>&1) -join '').Trim()
    if ($fatal.Count -gt 0) {
        Write-Host '[smoke] the app crashed:' -ForegroundColor Red
        $fatal | Select-Object -First 4 | ForEach-Object { Write-Host "        $($_.Trim())" -ForegroundColor Red }
        Fail 'the smoke test found a crash: an injected hook the verifier rejected, or an early return the app cannot accept'
    }
    if ($alive) {
        Write-Host "[smoke] PASS: still running (pid $alive) and no crash in the buffer" -ForegroundColor Green
    } else {
        Write-Host '[smoke] INCONCLUSIVE: no process and no crash in the buffer' -ForegroundColor Yellow
        Write-Host '        the headset is probably asleep or showing a Guardian dialog, which makes the' -ForegroundColor DarkGray
        Write-Host '        shell cache the launch instead of running it -- see the measured traps in AGENTS.md' -ForegroundColor DarkGray
    }
}

if (-not $SmokeTest) {
    Write-Host "`nDone. Launch it in the headset from the library (Unknown Sources)." -ForegroundColor Green
}
Write-Host "If the shell shows a stale 'app name not available' panel after many re-installs," -ForegroundColor DarkGray
Write-Host "restart the headset once: adb reboot" -ForegroundColor DarkGray
