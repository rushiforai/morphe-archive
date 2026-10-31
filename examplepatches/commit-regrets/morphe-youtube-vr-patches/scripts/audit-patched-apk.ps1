<#
.SYNOPSIS
    Audits a patched APK (or a .mpp bundle) for the failure modes a green patch run does not catch.
    Each check names the incident it exists for.

.DESCRIPTION
    Checks, in order:

      1. stale bundle      Every extension call injected *into app code* must be described by the
                           patches/src sources on disk. An injection present in the APK but absent from
                           the sources means the APK was built from different sources -- the incident
                           this exists for: the `check-cast` fix was in the source while the .mpp had
                           been built with those files moved aside, so a green run shipped the crash.
      2. reachability      For every app method we injected into: how many app methods call it, and
                           does its name appear in a native library? A hook nothing calls may control
                           nothing -- "Disable DRC audio" installed perfectly and nothing ever read its
                           getter (see INTERNALS.md). A review list, never a failure: lambdas are
                           invoked through call sites and legitimately show 0.
      3. cast lint         Injected blocks that take an object result with no `check-cast`. The
                           VideoQuality fix needed one; without it the app launched and died at the
                           first video with a VerifyError.
      4. settings XML      Decodes resources and fails on an unqualified `@name` reference (the encoder
                           stores it as a raw string, and the hub then crashes on inflation), and
                           prints the hub rows so a summary the extension overwrites is visible.
      5. bundle mode       `-Bundle <mpp>` checks the half that needs no stock APK, so CI can run it:
                           every extension reference inside the bundle's own patch templates must
                           exist in the bundle's extension dex.

    Exit code 1 if any check fails; warnings alone do not fail the run.

.EXAMPLE
    pwsh -NoProfile -File scripts\audit-patched-apk.ps1                        # full audit
    pwsh -NoProfile -File scripts\audit-patched-apk.ps1 -SkipXml -SkipReach     # what the install script runs
    pwsh -NoProfile -File scripts\audit-patched-apk.ps1 -Bundle patches\build\libs\patches-1.24.0.mpp
#>
[CmdletBinding()]
param(
    [string] $Apk = 'apk\ytvr-patched.apk',
    [string] $Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [string] $Bundle = '',
    [string] $Work = '',
    [switch] $SkipReach,
    [switch] $SkipXml,
    # Check that the cast lint itself still fires (on a fixture). Cheap, needs no APK, so CI runs it.
    [switch] $SelfTest
)

$ErrorActionPreference = 'Stop'
# Forward slashes: on Linux a backslash is a filename character, and Join-Path would build a
# directory literally named 'build\probe\audit' (bundle mode runs there in CI).
if (-not $Work) { $Work = Join-Path $Root 'build/probe/audit' }
New-Item -ItemType Directory -Force -Path $Work | Out-Null

$script:failures = 0
$script:warnings = 0
function Write-Line([string] $kind, [string] $text) {
    $colour = switch ($kind) {
        'FAIL' { 'Red' } 'WARN' { 'Yellow' } 'PASS' { 'Green' } 'INFO' { 'DarkGray' } default { 'Gray' }
    }
    Write-Host ("[{0}] {1}" -f $kind, $text) -ForegroundColor $colour
}
function Fail([string] $text) { Write-Line 'FAIL' $text; $script:failures++ }
function Warn([string] $text) { Write-Line 'WARN' $text; $script:warnings++ }
function Pass([string] $text) { Write-Line 'PASS' $text }
function Info([string] $text) { Write-Line 'INFO' $text }

$text = [System.Text.Encoding]::GetEncoding('ISO-8859-1')
$extensionRefPattern = 'Lapp/ytvr/extension/[A-Za-z0-9_$]+;->[A-Za-z0-9_$<>]+'

# Extracts every matching zip entry into $Into and returns how many were written. Output is a single
# integer on purpose: PowerShell returns everything a function prints, and a caller that receives an
# array where it expects a value is a debugging session (that is why the JDK setup below is inline).
function Extract-ApkEntries([string] $Archive, [string] $Pattern, [string] $Into, [switch] $KeepPath) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    New-Item -ItemType Directory -Force -Path $Into | Out-Null
    $zip = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path $Archive).Path)
    try {
        $entries = @($zip.Entries | Where-Object { $_.FullName -match $Pattern })
        foreach ($entry in $entries) {
            # -KeepPath: the bundle's template .class files live under nested app/ paths and can
            # share a basename across packages; flattening (the dex default) would overwrite one
            # with another and silently drop its references from the scan.
            $name = if ($KeepPath) { $entry.FullName } else { Split-Path $entry.FullName -Leaf }
            $target = Join-Path $Into $name
            $targetDir = Split-Path $target -Parent
            if ($targetDir) { New-Item -ItemType Directory -Force -Path $targetDir | Out-Null }
            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $target, $true)
        }
        return $entries.Count
    } finally { $zip.Dispose() }
}

# 0. The patch defaults and the install script's required list must agree. A default-on patch missing
#    from `$RequirePatches` can be skipped silently (that is the failure that check exists for), and this
#    drifted by hand twice on 2026-10-13 -- once when the SSAI patch was removed, once when QUIC became
#    default-on. Source-side, so it runs in both modes.
$declared = @{}
foreach ($file in (Get-ChildItem (Join-Path $Root 'patches\src') -Recurse -Filter '*.kt')) {
    $kt = [System.IO.File]::ReadAllText($file.FullName)
    foreach ($m in [regex]::Matches($kt, '(?s)[A-Za-z]*Patch\((.*?)\n\) \{')) {
        $name = [regex]::Match($m.Groups[1].Value, 'name = "([^"]+)"').Groups[1].Value
        if ($name) { $declared[$name] = ($m.Groups[1].Value -match 'default = true') }
    }
}
$scriptText = [System.IO.File]::ReadAllText((Join-Path $Root 'scripts\patch-and-install.ps1'))
$required = @()
foreach ($m in [regex]::Matches($scriptText, '(?s)\$RequirePatches = @\((.*?)\n    \)')) {
    foreach ($n in [regex]::Matches($m.Groups[1].Value, "'([^']+)'")) { $required += $n.Groups[1].Value }
}
if ($declared.Count -gt 0 -and $required.Count -gt 0) {
    $missing = @($declared.Keys | Where-Object { $declared[$_] -and $_ -notin $required })
    if ($missing.Count -gt 0) {
        Fail ("default-on patch(es) missing from `$RequirePatches, so a silent skip would go unnoticed: " + ($missing -join ', '))
    } else {
        Pass "the install script requires all $(@($declared.Keys | Where-Object { $declared[$_] }).Count) patch(es) that are on by default"
    }
    $extra = @($required | Where-Object { -not $declared.ContainsKey($_) })
    if ($extra.Count -gt 0) { Info "required but not declared default-on (older-bundle safety): $($extra -join ', ')" }
}

# The cast lint, as a function so it can be pointed at a fixture as well as at the real sources. It
# returns one finding per injected block that hands an *object* result to a typed sink with no
# check-cast -- the shape of the `saj` VerifyError (`saj.j` is a `j$.util.Optional`), which launches
# fine and dies at the first video because the verifier rejects the class when it is first used.
function Get-CastLintFindings([string] $SourcesRoot) {
    $findings = @()
    foreach ($file in (Get-ChildItem $SourcesRoot -Recurse -Filter '*.kt')) {
        $fileText = [System.IO.File]::ReadAllText($file.FullName)
        foreach ($block in [regex]::Matches($fileText, '(?s)"""(.*?)"""')) {
            $body = $block.Groups[1].Value
            if ($body -notmatch 'move-result-object') { continue }
            $lines = $body -split "`n"
            for ($i = 0; $i -lt $lines.Count; $i++) {
                $moved = [regex]::Match($lines[$i], '^\s*move-result-object\s+(v\d+|p\d+)')
                if (-not $moved.Success) { continue }
                $register = $moved.Groups[1].Value
                $call = if ($i -gt 0) { $lines[$i - 1].Trim() } else { '' }
                if ($call -notmatch '\)Ljava/lang/Object;') { continue }
                for ($j = $i + 1; $j -lt $lines.Count; $j++) {
                    $next = $lines[$j]
                    if ($next -match "check-cast\s+$register,") { break }
                    if ($next -notmatch "\b$register\b") { continue }
                    # `iput-object vA, vB, Lclass;->field:Type` carries the instance register first, so
                    # the field is the *third* operand; `sput-object vA, Lfield:Type` has only the value.
                    # Getting this wrong is silent -- the lint simply never fires -- which is how it was
                    # broken twice before `-SelfTest` existed.
                    $sink = [regex]::Match($next, '^\s*iput-object\s+' + $register + ',\s*[vp]\d+,\s*\S+?:(\S+);')
                    if (-not $sink.Success) {
                        $sink = [regex]::Match($next, '^\s*sput-object\s+' + $register + ',\s*\S+?:(\S+);')
                    }
                    if ($sink.Success) {
                        $type = $sink.Groups[1].Value
                        if ($type -ne 'Ljava/lang/Object;') {
                            $line = ($fileText.Substring(0, $block.Index + ($lines[0..$i] -join "`n").Length + 1) -split "`n").Count
                            $findings += "$($file.Name):$line the object result of $($call -replace '^invoke-[a-z/]+\s+', '') is stored into a $type without a check-cast -- the verifier rejects the class at first use"
                        }
                        break
                    }
                    if ($next -match '^\s*(return|goto|if-)') { break }
                }
            }
        }
    }
    return $findings
}

# A lint that cannot fire is worse than no lint, and this one was silently broken twice while it was
# being written. `-SelfTest` points it at the pre-fix shape and fails if it does not fire; `build.yml`
# runs this, since it needs no APK.
if ($SelfTest) {
    $fixture = Join-Path $Work 'selftest\patches\src'
    New-Item -ItemType Directory -Force -Path $fixture | Out-Null
    Set-Content -Path (Join-Path $fixture 'Fixture.kt') -Encoding utf8 -Value @'
private val fixture = """
                invoke-static {v2, v3}, Lapp/ytvr/extension/VideoQuality;->fixInitialResolution(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v6
                iput-object v6, v0, Lsaj;->j:Lj$/util/Optional;
"""
'@
    $hits = @(Get-CastLintFindings $fixture)
    if ($hits.Count -ge 1) {
        Pass "the cast lint fires on the pre-fix fixture (an object result stored into Lj\$/util/Optional with no check-cast)"
    } else {
        Fail 'the cast lint does NOT fire on the pre-fix fixture: the lint is broken and would miss the VerifyError it exists for'
    }
}

# Compiles tools/dexaudit/DexAudit.java against the patcher's own dexlib2 and remembers the
# java command and classpath on the script. Prints nothing: a function's output is its return
# value, and javac's chatter would be joined onto that. Defined before bundle mode: a script
# does not see a function until execution reaches it. Cross-platform: bundle mode runs in CI
# (ubuntu), where USERPROFILE is unset, javac has no .exe, the Gradle cache sits under HOME,
# and the classpath separator is ':' -- measured as "Cannot bind argument to parameter 'Path'
# because it is null" on the first CI run that reached here.
function Initialize-DexAudit {
    if ($script:AuditJava -and $script:AuditClasspath) { return }
    $isWin = $PSVersionTable.Platform -ne 'Unix'
    # Forward slashes inside Join-Path children work on both; literal backslashes are only a
    # Windows path separator and would become filename characters on Linux.
    $javac = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME "bin/$(if ($isWin) { 'javac.exe' } else { 'javac' })" } else { '' }
    # Not $java: that name shadows the JDK path for every later call in this script.
    $javaExe = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME "bin/$(if ($isWin) { 'java.exe' } else { 'java' })" } else { '' }
    if (-not (Test-Path $javac)) { $javac = (Get-Command javac -ErrorAction SilentlyContinue).Source }
    if (-not (Test-Path $javaExe)) { $javaExe = (Get-Command java -ErrorAction SilentlyContinue).Source }
    if (-not $javac -or -not $javaExe) { throw 'no JDK found: set JAVA_HOME (javac builds tools/dexaudit)' }

    $homeDir = if ($env:USERPROFILE) { $env:USERPROFILE } else { $env:HOME }
    if (-not $homeDir) { throw 'no home directory: set USERPROFILE (Windows) or HOME (Linux)' }
    $cache = Join-Path $homeDir '.gradle/caches/modules-2/files-2.1'
    $jars = @()
    # One jar per artifact: a patcher bump leaves the previous version in modules-2, and
    # putting every cached copy on the classpath lets Get-ChildItem order pick the winner.
    # The newest file is the one Gradle fetched last.
    foreach ($group in @('com.github.MorpheApp.smali/smali-dexlib2', 'com.github.MorpheApp.smali/smali-util', 'com.google.guava/guava')) {
        $dir = Join-Path $cache $group
        if (Test-Path $dir) {
            $jar = Get-ChildItem -Path $dir -Recurse -Filter '*.jar' |
                Where-Object { $_.Name -notmatch 'sources|javadoc' } |
                Sort-Object LastWriteTime, FullName -Descending |
                Select-Object -First 1
            if ($jar) { $jars += $jar.FullName }
        }
    }
    if ($jars.Count -eq 0) { throw 'dexlib2/guava not in the Gradle cache: run a build once so Gradle fetches them' }
    $classpathSep = if ($isWin) { ';' } else { ':' }
    $classpath = ($jars -join $classpathSep)

    $out = Join-Path $Work 'dexaudit'
    New-Item -ItemType Directory -Force -Path $out | Out-Null
    $toolSource = Join-Path $Root 'tools/dexaudit/DexAudit.java'
    $toolClass = Join-Path $out 'DexAudit.class'
    if (-not (Test-Path $toolClass) -or (Get-Item $toolSource).LastWriteTime -gt (Get-Item $toolClass).LastWriteTime) {
        & $javac -cp $classpath -d $out $toolSource | Out-Null
        if ($LASTEXITCODE -ne 0) { throw 'tools/dexaudit/DexAudit.java did not compile' }
    }
    $script:AuditJava = $javaExe
    $script:AuditClasspath = "$out$classpathSep$classpath"
}

# ---------------------------------------------------------------------------------------------
# 5. Bundle mode: the half CI can run, since it needs no stock APK.
# ---------------------------------------------------------------------------------------------
if ($Bundle) {
    Write-Line 'INFO' "bundle mode: $Bundle"
    $tmp = Join-Path $Work 'bundle'
    if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }
    Extract-ApkEntries $Bundle '\.dex$' $tmp | Out-Null
    # Patcher 2.x bundles ship the patch templates as .class files instead of a template dex.
    # The templates embed their injected smali as plain string constants, so the same
    # Lclass;->member reference pattern reads out of the class files' constant pools -- measured
    # on patches-1.28.0 (38 refs across 5 template classes) where a dex-only scan found 0 and
    # passed vacuously. Both shapes are scanned so an older-format bundle keeps working.
    Extract-ApkEntries $Bundle '\.class$' $tmp -KeepPath | Out-Null
    $extensionDex = Get-ChildItem $tmp -Filter '*.dex' | Where-Object { $_.Name -match 'extension' } | Select-Object -First 1
    if (-not $extensionDex) {
        Fail 'the bundle has no *extension*.dex: what the patches inject cannot exist'
        exit 1
    }
    $references = New-Object System.Collections.Generic.HashSet[string]
    foreach ($template in (Get-ChildItem $tmp -Recurse -File |
            Where-Object { $_.Extension -in '.dex', '.class' -and $_.Name -ne $extensionDex.Name })) {
        foreach ($m in [regex]::Matches($text.GetString([System.IO.File]::ReadAllBytes($template.FullName)), $extensionRefPattern)) {
            [void]$references.Add($m.Value)
        }
    }
    # Exact inventory, not a byte substring. The extension dex stores `log` and `logGateToggle`
    # as separate string-pool entries, and `Contains("log")` is true for both -- a template that
    # named a missing `log` passed whenever a longer member existed. `extmembers` prints
    # `Lclass;->name`, the same shape the template scan captured.
    Initialize-DexAudit
    $extMembers = New-Object System.Collections.Generic.HashSet[string]
    foreach ($line in (& $script:AuditJava -cp $script:AuditClasspath DexAudit extmembers - $extensionDex.FullName)) {
        if ($line) { [void]$extMembers.Add($line.Trim()) }
    }
    if ($extMembers.Count -eq 0) {
        Fail 'the extension dex declared no Lapp/ytvr/extension members'
    }
    $missing = @()
    foreach ($reference in $references) {
        if (-not $extMembers.Contains($reference)) { $missing += $reference }
    }
    if ($missing.Count -gt 0) {
        Fail ("patch templates call $($missing.Count) extension member(s) the extension dex does not have: " + (($missing | Select-Object -First 5) -join ', '))
    } else {
        Pass "all $($references.Count) extension reference(s) in the patch templates exist in the extension dex"
    }
    # A shorter name must not ride along on a longer one. Mutate one real reference in place
    # (bindRow -> bindRoX is the same trick) and require the check to reject it.
    if ($SelfTest -and $references.Count -gt 0) {
        $sample = @($references)[0]
        $tail = if ($sample.EndsWith('X')) { 'Q' } else { 'X' }
        $mutated = $sample.Substring(0, $sample.Length - 1) + $tail
        if ($extMembers.Contains($mutated)) {
            Fail "bundle member check accepted mutated reference '$mutated'"
        } else {
            Pass "a same-length mutation of a template reference is rejected"
        }
    }
    exit $(if ($failures -gt 0) { 1 } else { 0 })
}

# ---------------------------------------------------------------------------------------------
# APK mode. JDK + dexlib2 first: the reader uses the patcher's own dexlib2 (from the Gradle cache),
# so the audit and the patcher agree on what a dex contains.
# ---------------------------------------------------------------------------------------------
Initialize-DexAudit
$java = $script:AuditJava
$toolClasspath = $script:AuditClasspath

$dexes = Join-Path $Work 'dex'
$libs = Join-Path $Work 'lib'
if (Test-Path $dexes) { Remove-Item $dexes -Recurse -Force }
$dexCount = Extract-ApkEntries $Apk '^classes\d*\.dex$' $dexes
if ($dexCount -eq 0) { Fail "$Apk has no classes*.dex"; exit 1 }
Extract-ApkEntries $Apk '^lib/arm64-v8a/.*\.so$' $libs | Out-Null
$dexFiles = @(Get-ChildItem $dexes -Filter '*.dex' | ForEach-Object { $_.FullName })
Info "auditing $Apk ($dexCount dex file(s))"

# Every extension call injected into app code, keyed by the app method it was injected into: this is
# the inventory a human reconciles with the patch list, and the input to the reachability check.
$sites = [ordered]@{}
foreach ($line in (& $java -cp $toolClasspath DexAudit inventory @dexFiles)) {
    $parts = $line -split '\|'
    $sites[$parts[0]] = $parts[2]
}

# 1. The shipped extension dex, against the extension sources on disk.
#    A member the sources define but the dex lacks is the incident this exists for: a .mpp built while
#    those sources were moved aside still reported a green patch run, and shipped a crash fix that was
#    not in it. (Comparing *references* instead does not work -- the sources compose them from
#    EXTENSION_CLASS constants, so the literal text never appears there.)
# Patcher 2.x hosts merge the extension dex into the app's own dexes instead of appending one,
# so no single file is "the extension dex" any more (measured on a Desktop 2.x run: injected
# sites in classes6, extension classes in classes7). Membership is therefore checked against
# DexAudit's exact inventory of the Lapp/ytvr/extension/* classes dexlib2 finds across ALL dexes
# -- not a bare-name text scan, which app dexes satisfy for generic names (log, init, fetch,
# enabled, summary occur in the app itself), and not a single-dex scan, which the merge voids.
$extMembers = New-Object System.Collections.Generic.HashSet[string]
foreach ($line in (& $java -cp $toolClasspath DexAudit extmembers - @dexFiles)) {
    [void]$extMembers.Add($line)
}
if ($extMembers.Count -eq 0) {
    Fail 'no extension members in the APK: the Extension patch did not run, or it was built without one'
} else {
    $declaredClasses = New-Object System.Collections.Generic.HashSet[string]
    $declaredMembers = New-Object System.Collections.Generic.HashSet[string]
    foreach ($file in (Get-ChildItem (Join-Path $Root 'extensions\src') -Filter '*.java')) {
        # Not $java: that is the JDK's java.exe, and shadowing it makes the tool invocation below try
        # to execute this source text as a command.
        $javaText = [System.IO.File]::ReadAllText($file.FullName)
        foreach ($m in [regex]::Matches($javaText, '(?m)^\s*(?:public\s+|final\s+|abstract\s+|static\s+)*(?:class|interface)\s+([A-Za-z0-9_]+)')) {
            [void]$declaredClasses.Add($m.Groups[1].Value)
        }
        foreach ($m in [regex]::Matches($javaText, 'public\s+static\s+[A-Za-z0-9_<>,\.\[\]\s]*?([A-Za-z0-9_]+)\s*\(')) {
            [void]$declaredMembers.Add($m.Groups[1].Value)
        }
    }
    # Exact matching, in two directions: every declared class must exist as an extension class
    # with that simple name -- top-level (Lapp/ytvr/extension/<Name>;) or nested
    # (Lapp/ytvr/extension/<Outer>$<Name>;, which is how dex writes inner classes; the first
    # inventory run caught SettingSwitch/Callback exactly this way) -- and every declared static
    # method name must be a member OF SOME extension class (class-attributed, so app-side
    # occurrences of the same name count for nothing).
    $missing = @()
    foreach ($cls in $declaredClasses) {
        $asTopLevel = (@($extMembers | Where-Object { $_ -like "Lapp/ytvr/extension/$cls;->*" })).Count -gt 0
        $asNested = (@($extMembers | Where-Object { $_ -like "Lapp/ytvr/extension/*`$$cls;->*" })).Count -gt 0
        if (-not ($asTopLevel -or $asNested)) {
            $missing += $cls
        }
    }
    foreach ($mem in $declaredMembers) {
        if (-not (@($extMembers | Where-Object { $_ -like "*->$mem" })).Count) {
            $missing += $mem
        }
    }
    if ($missing.Count -gt 0) {
        Fail ("the APK's extension inventory lacks $($missing.Count) member(s) the extension sources define -- this APK is not from this tree: " + (($missing | Select-Object -First 8) -join ', '))
    } else {
        Pass "the APK's extension classes carry all $($declaredClasses.Count) class(es) and $($declaredMembers.Count) static method(s) the extension sources declare (exact inventory: $($extMembers.Count) members)"
    }
}

# The inventory is also the input to the reachability check below.
Info "injected into $($sites.Count) app method(s):"
foreach ($site in @($sites.Keys)) {
    Write-Host ("        {0}  <-  {1}" -f $site, $sites[$site])
}

# 2. Reachability of every hooked method: a hook whose target nothing calls may control nothing (the DRC
#    lesson -- installed perfectly, read by nothing). Four things explain a hook with no dex caller, and
#    the audit answers all four before it complains:
#      * a native library names the method (a JNI upcall has no dex caller);
#      * it overrides a supertype declaration, so the framework calls it (`onBackPressed`);
#      * a call site or method handle references it (a lambda goes through `invoke-custom`);
#      * it is listed in tools/dexaudit/known-callerless.txt with a reason.
#    Anything still unexplained is printed, and the fix is either the hook or one allowlist line. The
#    allowlist is checked in the other direction too, so an entry that stops being a hook is reported
#    rather than quietly explaining nothing.
if (-not $SkipReach) {
    Info 'reachability: a hook nothing calls may control nothing (the DRC lesson)'
    $libText = ''
    foreach ($so in @(Get-ChildItem $libs -Filter '*.so' -ErrorAction SilentlyContinue)) {
        $libText += $text.GetString([System.IO.File]::ReadAllBytes($so.FullName))
    }
    $allowed = @{}
    $allowPath = Join-Path $Root 'tools\dexaudit\known-callerless.txt'
    if (Test-Path $allowPath) {
        foreach ($line in (Get-Content $allowPath)) {
            if (-not $line.Trim() -or $line.Trim().StartsWith('//')) { continue }
            # `//` starts the reason; `#` is part of the site (`Lowner;#method`), which is why the
            # comment marker is not `#` here.
            $site, $reason = $line -split '//', 2
            if ($site.Trim()) { $allowed[$site.Trim()] = "$($reason)".Trim() }
        }
    }
    $unexplained = 0
    foreach ($site in @($sites.Keys)) {
        $owner, $method = $site -split '#'
        # The inventory's owner keeps its trailing `;` (it is a dex type), and `owner;->name` with the
        # `;` left on is `Lsaj;;->name` -- a needle that matches nothing, which made every hook look
        # caller-less until this was measured.
        $needle = "$($owner.TrimEnd(';'));->$method("
        # Order matters: the precise explanations come first, and the native-string test last, because a
        # one- or two-character name (`a`, `b`, `h`) is a substring of every .so ever built -- letting it
        # explain a hook would hide exactly the cases this check exists to surface.
        $callers = @(& $java -cp $toolClasspath DexAudit callers "$needle" @dexFiles | Where-Object { $_ -notlike "$site|*" })
        if ($callers.Count -gt 0) { Info "$site -- callers=$($callers.Count)"; continue }
        $override = @(& $java -cp $toolClasspath DexAudit inherited $site @dexFiles)
        if ($override.Count -gt 0) { Info "$site -- overrides $($override[0] -replace '^inherited ', ''), so the framework calls it"; continue }
        $handles = @(& $java -cp $toolClasspath DexAudit callers "$($owner.TrimEnd(';'));->$method" @dexFiles)
        if ($handles.Count -gt 0) { Info "$site -- reached through a call site or method handle"; continue }
        if ($allowed.ContainsKey($site)) { Info "$site -- known caller-less: $($allowed[$site])"; continue }
        if ($method.Length -ge 5 -and $libText.Contains($method)) {
            Info "$site -- no dex caller, but a native library names '$method'"; continue
        }
        if ($method.Length -lt 5) {
            Info "$site -- no dex caller; '$method' is too short for the native-string test to mean anything"; continue
        }
        $unexplained++
        Warn "$site -- unexplained: no dex caller, no supertype declaration in the dex, no call site, and no native library names it. Fix the hook, or add one `// reason` line for it to tools/dexaudit/known-callerless.txt"
    }
    foreach ($entry in @($allowed.Keys)) {
        if (-not $sites.Contains($entry)) {
            Warn "tools/dexaudit/known-callerless.txt names $entry, which this APK does not hook: drop that line so the next real case is visible"
        }
    }
    if ($unexplained -eq 0) { Pass "all $(@($sites.Keys).Count) hooked method(s) are reachable or explained" }
}

# 3. The cast lint (see Get-CastLintFindings above).
foreach ($finding in @(Get-CastLintFindings (Join-Path $Root 'patches\src'))) {
    Warn $finding
}

# 4. The settings XML.
if (-not $SkipXml) {
    $jadx = (Get-Command jadx -ErrorAction SilentlyContinue).Source
    if (-not $jadx) {
        # The README's tooling table says "on PATH"; in practice it is usually unpacked under tools\.
        foreach ($candidate in @(
                (Join-Path $env:USERPROFILE 'tools\jadx\bin\jadx.bat'),
                (Join-Path $env:USERPROFILE 'tools\jadx\bin\jadx'))) {
            if (Test-Path $candidate) { $jadx = $candidate; break }
        }
    }
    if (-not $jadx) {
        Info 'jadx is not on PATH: skipped the settings-XML check'
    } else {
        $res = Join-Path $Work 'res'
        if (Test-Path $res) { Remove-Item $res -Recurse -Force }
        & $jadx --no-src -d $res $Apk *> (Join-Path $Work 'jadx.log')
        $xmls = @(Get-ChildItem (Join-Path $res 'resources\res\xml') -Filter '*.xml' -ErrorAction SilentlyContinue)
        $unqualified = @()
        foreach ($xml in $xmls) {
            foreach ($m in [regex]::Matches([System.IO.File]::ReadAllText($xml.FullName), 'android:[a-zA-Z]+="(@[^"/<>]*)"')) {
                # `@null` and `@empty` are legitimate values, not unresolved references; flagging them
                # would make the one real case harder to see.
                if ($m.Groups[1].Value -in @('@null', '@empty', '@undefined')) { continue }
                $unqualified += "$($xml.Name):$($m.Groups[1].Value)"
            }
        }
        if ($unqualified.Count -gt 0) {
            Fail ("unqualified resource reference(s) in the settings XML, which inflate to resource id 0: " + (($unqualified | Select-Object -Unique | Select-Object -First 5) -join ', '))
        } else {
            Pass "no unqualified '@' reference in $($xmls.Count) decoded settings XML file(s)"
        }
        $hub = $xmls | Where-Object { $_.Name -match 'settings_prefs|panel2' } | Select-Object -First 1
        if ($hub) {
            Info "hub rows in $($hub.Name) (a summary here that the extension overwrites is invisible advice):"
            $title = ''
            foreach ($line in (Get-Content $hub.FullName)) {
                if ($line -match 'android:title="([^"]*)"') { $title = $Matches[1] }
                if ($line -match 'android:key="([^"]*)"') { Write-Host ("        {0,-30} {1}" -f $title, $Matches[1]) }
                if ($line -match 'android:summary="([^"]*)"') { Write-Host ("        {0,-30} summary: {1}" -f '', $Matches[1]) }
            }
            # A row whose XML summary the extension replaces shows something other than what the file
            # says. The quality row is deliberate (it displays the current value); a switch row's advice
            # is not, and on 2026-10-13 the QUIC row's "turn off if playback stalls ..." was being
            # overwritten at render time. This report makes that visible without a device run.
            $rowsFile = Join-Path $Root 'extensions\src\CategoryRows.java'
            if (Test-Path $rowsFile) {
                $rowsText = [System.IO.File]::ReadAllText($rowsFile)
                $writesSummary = @{}
                foreach ($fn in [regex]::Matches($rowsText, '(?s)private static void (decorate\w+)\((.*?)(?=private static void|\z)')) {
                    $writesSummary[$fn.Groups[1].Value] = ($fn.Groups[2].Value -match 'showSummary\(')
                }
                foreach ($m in [regex]::Matches($rowsText, 'else if \((\w+)_TITLE\.equals\(label\)\) \{\s*(\w+)\(')) {
                    $decorator = $m.Groups[2].Value
                    if ($writesSummary[$decorator]) {
                        Info "row '$($m.Groups[1].Value)' is decorated by $decorator, which writes its summary: the XML android:summary is not what the viewer reads"
                    }
                }
            }
        }
    }
}

if ($failures -gt 0) {
    Write-Line 'FAIL' "$failures check(s) failed, $warnings warning(s)"
    exit 1
}
Write-Line 'PASS' "audit clean ($warnings warning(s) to review)"
exit 0
