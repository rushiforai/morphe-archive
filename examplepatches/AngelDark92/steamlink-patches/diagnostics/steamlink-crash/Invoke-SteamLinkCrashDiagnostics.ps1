[CmdletBinding()]
param(
    [ValidateSet('Static', 'Capture', 'SelfTest')]
    [string]$Mode = 'Static',

    [string]$RepoRoot,
    [string]$DecodedDirectory,
    [string]$PatchSmaliDirectory,
    [switch]$FailOnFinding,

    [ValidatePattern('^[A-Za-z0-9._]+$')]
    [string]$Package = 'com.valvesoftware.steamlinkvr',
    [string]$DeviceSerial,
    [string]$AdbPath,
    [datetime]$Since = (Get-Date).AddMinutes(-10),
    [string]$OutputDirectory,
    [string]$PatchedApkPath,
    [string]$PatchReceiptPath
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepoRoot)) {
    $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}

function Write-Utf8 {
    param([string]$Path, [AllowEmptyString()][string]$Text)

    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    [IO.File]::WriteAllText($Path, $Text, (New-Object Text.UTF8Encoding($false)))
}

function Get-StringSha256 {
    param([AllowEmptyString()][string]$Text)

    $sha = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($Text)))).Replace('-', '')
    }
    finally {
        $sha.Dispose()
    }
}

function Protect-DiagnosticText {
    param(
        [AllowEmptyString()][string]$Text,
        [string[]]$KnownSensitive = @()
    )

    $result = $Text
    foreach ($value in $KnownSensitive) {
        if ($value) { $result = $result -replace [regex]::Escape($value), '<redacted>' }
    }
    if ($env:USERPROFILE) {
        $result = $result -replace [regex]::Escape($env:USERPROFILE), '%USERPROFILE%'
    }
    $result = $result -replace '(?i)\b(?:10(?:\.\d{1,3}){3}|192\.168(?:\.\d{1,3}){2}|172\.(?:1[6-9]|2\d|3[01])(?:\.\d{1,3}){2})\b', '<private-ip>'
    $result = $result -replace '(?i)\b(?:[0-9a-f]{2}[:-]){5}[0-9a-f]{2}\b', '<mac>'
    $result = $result -replace '(?i)(["''](?:password|authorization|bearer|token|access[_ -]?token|refresh[_ -]?token|pairing[_ -]?token|api[_ -]?key|secret)["'']\s*:\s*)["''][^"''\r\n]*["'']', '$1"<redacted>"'
    $result = $result -replace '(?i)\b(password|authorization|bearer|token|access[_ -]?token|refresh[_ -]?token|pairing[_ -]?token|api[_ -]?key|secret)\b\s*[:=]\s*\S+', '$1=<redacted>'
    return $result
}

function Protect-DiagnosticObject {
    param([AllowNull()]$InputObject)

    if ($null -eq $InputObject) { return $null }
    if ($InputObject -is [string] -or $InputObject.GetType().IsPrimitive -or $InputObject -is [decimal]) {
        return $InputObject
    }
    if ($InputObject -is [Collections.IDictionary]) {
        $safeDictionary = [ordered]@{}
        foreach ($key in $InputObject.Keys) {
            $name = [string]$key
            $safeDictionary[$name] = if ($name -match '(?i)^(?:password|authorization|bearer|token|access[_ -]?token|refresh[_ -]?token|pairing[_ -]?token|api[_ -]?key|secret)$') {
                '<redacted>'
            } else {
                Protect-DiagnosticObject -InputObject $InputObject[$key]
            }
        }
        return [PSCustomObject]$safeDictionary
    }
    if ($InputObject -is [Collections.IEnumerable]) {
        return @($InputObject | ForEach-Object { Protect-DiagnosticObject -InputObject $_ })
    }

    $safeObject = [ordered]@{}
    foreach ($property in $InputObject.PSObject.Properties) {
        $safeObject[$property.Name] = if ($property.Name -match '(?i)^(?:password|authorization|bearer|token|access[_ -]?token|refresh[_ -]?token|pairing[_ -]?token|api[_ -]?key|secret)$') {
            '<redacted>'
        } else {
            Protect-DiagnosticObject -InputObject $property.Value
        }
    }
    return [PSCustomObject]$safeObject
}

function Get-SmaliDescriptor {
    param([string]$Text)

    $match = [regex]::Match($Text, '(?m)^\.class\b[^\r\n]*\s(?<class>L[^;]+;)\s*$')
    if (-not $match.Success) { throw 'Smali file has no class descriptor.' }
    return $match.Groups['class'].Value
}

function Get-SmaliMethods {
    param([string]$Text)

    return @([regex]::Matches($Text, '(?m)^\.method\b[^\r\n]*\s(?<name>[^\s(]+)(?<descriptor>\([^)]*\)\S+)\s*$') |
        ForEach-Object { $_.Groups['name'].Value + $_.Groups['descriptor'].Value })
}

function Get-SmaliSuperclass {
    param([string]$Text)

    $match = [regex]::Match($Text, '(?m)^\.super\s+(?<class>L[^;]+;)\s*$')
    return $(if ($match.Success) { $match.Groups['class'].Value } else { $null })
}

function Get-SmaliInvokes {
    param([string]$Text, [string]$Path, [string]$CallerClass)

    $items = New-Object System.Collections.Generic.List[object]
    $pattern = '(?m)^\s*invoke-(?<kind>\S+)\s+\{[^}]*\},\s+(?<class>L[^;]+;)->(?<name>[^\s(]+)(?<descriptor>\([^)]*\)\S+)\s*$'
    foreach ($match in [regex]::Matches($Text, $pattern)) {
        $line = 1 + ([regex]::Matches($Text.Substring(0, $match.Index), "`n").Count)
        $items.Add([PSCustomObject][ordered]@{
            callerClass = $CallerClass
            path = $Path
            line = $line
            invokeKind = $match.Groups['kind'].Value
            targetClass = $match.Groups['class'].Value
            targetMethod = $match.Groups['name'].Value + $match.Groups['descriptor'].Value
        })
    }
    return $items.ToArray()
}

function Count-BytePattern {
    param([byte[]]$Bytes, [byte[]]$Pattern)

    if ($Pattern.Count -eq 0 -or $Pattern.Count -gt $Bytes.Count) { return 0 }
    $count = 0
    for ($offset = 0; $offset -le $Bytes.Count - $Pattern.Count; $offset++) {
        $matched = $true
        for ($index = 0; $index -lt $Pattern.Count; $index++) {
            if ($Bytes[$offset + $index] -ne $Pattern[$index]) { $matched = $false; break }
        }
        if ($matched) { $count++ }
    }
    return $count
}

function Invoke-StaticAudit {
    if (-not $DecodedDirectory) {
        $script:DecodedDirectory = Join-Path $RepoRoot 'decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712'
    }
    if (-not $PatchSmaliDirectory) {
        $script:PatchSmaliDirectory = Join-Path $RepoRoot 'patches\src\main\resources\steamlink\androidxr\smali'
    }
    if (-not (Test-Path -LiteralPath $DecodedDirectory -PathType Container)) {
        throw "Decoded 5001712 directory not found: $DecodedDirectory"
    }
    if (-not (Test-Path -LiteralPath $PatchSmaliDirectory -PathType Container)) {
        throw "Patch smali directory not found: $PatchSmaliDirectory"
    }

    $apktoolYaml = Join-Path $DecodedDirectory 'apktool.yml'
    $yaml = if (Test-Path -LiteralPath $apktoolYaml) { Get-Content -LiteralPath $apktoolYaml -Raw } else { '' }
    if ($yaml -notmatch "versionCode:\s*'?5001712'?" -or $yaml -notmatch "versionName:\s*'?2\.0\.20'?") {
        throw 'Decoded directory is not exact Steam Link 2.0.20/5001712.'
    }

    $definitions = @{}
    $baseFiles = @(Get-ChildItem -LiteralPath $DecodedDirectory -Directory -Filter 'smali*' |
        ForEach-Object { Get-ChildItem -LiteralPath $_.FullName -Recurse -File -Filter '*.smali' })
    foreach ($file in $baseFiles) {
        $text = Get-Content -LiteralPath $file.FullName -Raw
        $class = Get-SmaliDescriptor -Text $text
        $definitions[$class] = @(Get-SmaliMethods -Text $text)
    }

    $assembledHelperFiles = @(
        'GxrSdlBridge.smali',
        'GalaxyXRPermissionActivity.smali',
        'GxrOverlayBridge.smali',
        'GxrResolutionProbe.smali'
    )
    $patchFiles = @(Get-ChildItem -LiteralPath $PatchSmaliDirectory -Recurse -File -Filter '*.smali' |
        Where-Object { $_.Name -in $assembledHelperFiles })
    $invokes = New-Object System.Collections.Generic.List[object]
    $gxrBridgeText = ''
    foreach ($file in $patchFiles) {
        $text = Get-Content -LiteralPath $file.FullName -Raw
        if ($file.Name -eq 'GxrSdlBridge.smali') { $gxrBridgeText = $text }
        $class = Get-SmaliDescriptor -Text $text
        $definitions[$class] = @(Get-SmaliMethods -Text $text)
        foreach ($invoke in Get-SmaliInvokes -Text $text -Path $file.FullName -CallerClass $class) {
            $invokes.Add($invoke)
        }
    }

    $projectPrefixes = @('Lorg/libsdl/app/', 'Lcom/valvesoftware/steamlink/')
    $activityInheritedMethods = @(
        'checkSelfPermission(Ljava/lang/String;)I',
        'finish()V',
        'getPackageManager()Landroid/content/pm/PackageManager;',
        'getPackageName()Ljava/lang/String;',
        'getSystemService(Ljava/lang/String;)Ljava/lang/Object;',
        'requestPermissions([Ljava/lang/String;I)V',
        'startActivity(Landroid/content/Intent;)V',
        'startActivityForResult(Landroid/content/Intent;I)V'
    )
    $rawUnresolved = @($invokes | Where-Object {
        $target = $_.targetClass
        $knownActivityCall = $target -eq 'Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;' -and
            $_.invokeKind -eq 'virtual' -and
            $_.targetMethod -in $activityInheritedMethods
        @($projectPrefixes | Where-Object { $target.StartsWith($_) }).Count -gt 0 -and
        -not $knownActivityCall -and
        (-not $definitions.ContainsKey($target) -or $_.targetMethod -notin @($definitions[$target]))
    } | Sort-Object targetClass, targetMethod, path, line)

    # GxrSdlBridge contains both SDL generations so 2.0.22 remains byte-for-byte compatible.
    # The exact 5001712 Kotlin hook enters wrappers that select only the older descriptors below.
    $guardedModernTargets = @(
        'isControllerManagerReady()Z',
        'nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V',
        'onNativePadDown(III)Z',
        'onNativePadUp(III)Z'
    )
    $directInputPath = Join-Path $RepoRoot 'patches\src\main\kotlin\app\template\patches\steamlink\androidxr\DirectInputFixPatch.kt'
    $directInputText = if (Test-Path -LiteralPath $directInputPath) { Get-Content -LiteralPath $directInputPath -Raw } else { '' }
    $has5001712SdlGuard =
        $gxrBridgeText -match '\.method public static routeXrPointerAsMouse5001712\(' -and
        $gxrBridgeText -match '\.method public static routeXrPointerAsMouseGeneric5001712\(' -and
        $gxrBridgeText -match 'nativeAddJoystick\(ILjava/lang/String;Ljava/lang/String;IIIIIIZ\)V' -and
        $gxrBridgeText -match 'onNativePadDown\(II\)Z' -and
        $gxrBridgeText -match 'onNativePadUp\(II\)Z' -and
        $directInputText -match 'versionName == "2\.0\.20"\s*&&\s*packageMetadata\.versionCode == "5001712"' -and
        $directInputText -match '"routeXrPointerAsMouse5001712"' -and
        $directInputText -match '"routeXrPointerAsMouseGeneric5001712"'
    $guardedUnresolved = @($rawUnresolved | Where-Object {
        $has5001712SdlGuard -and
        $_.callerClass -eq 'Lorg/libsdl/app/GxrSdlBridge;' -and
        $_.targetMethod -in $guardedModernTargets
    })
    $unresolved = @($rawUnresolved | Where-Object {
        -not ($has5001712SdlGuard -and
            $_.callerClass -eq 'Lorg/libsdl/app/GxrSdlBridge;' -and
            $_.targetMethod -in $guardedModernTargets)
    })

    $unique = @($unresolved | Group-Object targetClass, targetMethod | ForEach-Object {
        $first = $_.Group[0]
        [PSCustomObject][ordered]@{
            targetClass = $first.targetClass
            targetMethod = $first.targetMethod
            callSiteCount = $_.Count
            callSites = @($_.Group | ForEach-Object { "$(Split-Path -Leaf $_.path):$($_.line)" })
        }
    })

    $loaderPath = Join-Path $DecodedDirectory 'lib\arm64-v8a\libopenxr_loader.so'
    $astResourceName = 'libgxr_ast_5001712.so'
    $astPath = Join-Path $RepoRoot "patches\src\main\resources\steamlink\androidxr\$astResourceName"
    $astManifestPath = Join-Path $RepoRoot 'patches\src\main\resources\steamlink\androidxr\XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json'
    $v10 = [byte[]](0, 0, 0, 0, 0, 0, 1, 0)
    $v11 = [byte[]](0, 0, 0, 0, 1, 0, 1, 0)
    $openXrRisk = $null
    if ((Test-Path -LiteralPath $loaderPath) -and (Test-Path -LiteralPath $astPath)) {
        $loader = [IO.File]::ReadAllBytes($loaderPath)
        $ast = [IO.File]::ReadAllBytes($astPath)
        $manifest = if (Test-Path -LiteralPath $astManifestPath) { Get-Content -LiteralPath $astManifestPath -Raw } else { '' }
        $openXrRisk = [PSCustomObject][ordered]@{
            status = 'warning-not-runtime-proof'
            astResource = $astResourceName
            loaderRawPacked10PatternCount = Count-BytePattern -Bytes $loader -Pattern $v10
            loaderRawPacked11PatternCount = Count-BytePattern -Bytes $loader -Pattern $v11
            astRawPacked11PatternCount = Count-BytePattern -Bytes $ast -Pattern $v11
            manifestDeclares11 = [bool]($manifest -match '"api_version"\s*:\s*"1\.1"')
            limitation = 'Raw byte-pattern counts do not establish loader API support or negotiated runtime behavior.'
            hypothesis = 'The pattern mismatch suggests checking high-resolution API-layer negotiation in current runtime logs.'
        }
    }

    $report = [PSCustomObject][ordered]@{
        schemaVersion = 1
        kind = 'steamlink-5001712-static-runtime-link-audit'
        versionName = '2.0.20'
        versionCode = 5001712
        status = $(if ($unique.Count -eq 0) { 'compatible' } else { 'incompatible' })
        scannedPatchSmaliFiles = $patchFiles.Count
        unresolvedCallSites = $unresolved.Count
        uniqueUnresolvedMethods = $unique.Count
        unresolved = $unique
        guarded5001712ModernCallSites = $guardedUnresolved.Count
        openxrApiRisk = $openXrRisk
    }

    $json = $report | ConvertTo-Json -Depth 8
    if ($OutputDirectory) {
        New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
        Write-Utf8 -Path (Join-Path $OutputDirectory 'static-runtime-link-audit.json') -Text $json
    }
    $json
    if ($FailOnFinding -and $unique.Count -gt 0) { exit 2 }
}

function Resolve-DiagnosticAdbPath {
    param([string]$RequestedPath, [string]$RepositoryRoot)

    if (-not [string]::IsNullOrWhiteSpace($RequestedPath)) {
        $explicitCommand = Get-Command $RequestedPath -ErrorAction SilentlyContinue
        if ($null -ne $explicitCommand -and $explicitCommand.CommandType -eq 'Application') {
            return $explicitCommand.Source
        }
        try {
            $explicitFullPath = [IO.Path]::GetFullPath($RequestedPath)
            if (Test-Path -LiteralPath $explicitFullPath -PathType Leaf) {
                return $explicitFullPath
            }
        }
        catch { }
        throw "Requested adb executable was not found: $RequestedPath"
    }

    $candidates = New-Object System.Collections.Generic.List[string]
    $candidates.Add((Join-Path $RepositoryRoot '..\GalaxyXR-APK\install\platform-tools\adb.exe'))
    foreach ($sdkRoot in @($env:ANDROID_SDK_ROOT, $env:ANDROID_HOME)) {
        if (-not [string]::IsNullOrWhiteSpace($sdkRoot)) {
            $candidates.Add((Join-Path $sdkRoot 'platform-tools\adb.exe'))
        }
    }
    foreach ($commandName in @('adb.exe', 'adb')) {
        $command = Get-Command $commandName -ErrorAction SilentlyContinue
        if ($null -ne $command -and $command.CommandType -eq 'Application') {
            $candidates.Add($command.Source)
        }
    }
    foreach ($candidate in $candidates) {
        try {
            $fullPath = [IO.Path]::GetFullPath($candidate)
            if (Test-Path -LiteralPath $fullPath -PathType Leaf) { return $fullPath }
        }
        catch { }
    }
    throw (
        'ADB was not found. Pass -AdbPath with the full adb.exe path, or place Android ' +
        'Platform Tools in the sibling GalaxyXR-APK\install\platform-tools directory.'
    )
}

function Invoke-NativeProcessCaptured {
    param([string]$FilePath, [string[]]$Arguments = @())

    $previousErrorActionPreference = $ErrorActionPreference
    try {
        # Windows PowerShell promotes redirected native stderr to ErrorRecord objects.
        # Keep those records in the captured output without making benign stderr fatal.
        $ErrorActionPreference = 'Continue'
        $output = & $FilePath @Arguments 2>&1 | Out-String
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }
    return [PSCustomObject]@{ output = $output; exitCode = $exitCode }
}

function Resolve-DiagnosticDeviceSerial {
    param([string]$RequestedSerial)

    if ($RequestedSerial -match '^<[^>]+>$') {
        throw "Do not pass the placeholder $RequestedSerial. Omit -DeviceSerial to auto-select 1 authorized headset, or pass its real serial."
    }
    $deviceListResult = Invoke-NativeProcessCaptured -FilePath $AdbPath -Arguments @('devices', '-l')
    if ($deviceListResult.exitCode -ne 0) {
        throw "adb devices -l failed ($($deviceListResult.exitCode)); device-list output was omitted for privacy."
    }
    $output = $deviceListResult.output
    $devices = @($output -split '\r?\n' | ForEach-Object {
        if ($_ -match '^(?<serial>\S+)\s+(?<state>device|unauthorized|offline)(?:\s+.*)?$') {
            [PSCustomObject]@{ serial = $Matches['serial']; state = $Matches['state'] }
        }
    })
    $authorized = @($devices | Where-Object state -eq 'device')
    if (-not [string]::IsNullOrWhiteSpace($RequestedSerial)) {
        $matching = @($authorized | Where-Object serial -CEQ $RequestedSerial)
        if ($matching.Count -ne 1) {
            throw 'The requested serial is not exactly 1 authorized ADB device.'
        }
        return $matching[0].serial
    }
    if ($authorized.Count -ne 1) {
        $unauthorizedCount = @($devices | Where-Object state -eq 'unauthorized').Count
        throw "Exactly 1 authorized headset is required; found $($authorized.Count) authorized and $unauthorizedCount unauthorized."
    }
    return $authorized[0].serial
}

function Invoke-Adb {
    param([string[]]$Arguments)

    $nativeArguments = @('-s', $DeviceSerial) + @($Arguments)
    $result = Invoke-NativeProcessCaptured -FilePath $AdbPath -Arguments $nativeArguments
    if ($result.exitCode -ne 0) {
        $safeOutput = Protect-DiagnosticText -Text $result.output -KnownSensitive @($DeviceSerial)
        throw "adb failed ($($result.exitCode)): $($Arguments -join ' ')`n$safeOutput"
    }
    return $result.output
}

function Select-PackageLogcat {
    param([AllowEmptyString()][string]$Text, [string]$PackageName)

    $lines = @($Text -split '\r?\n')
    $packagePattern = '(?<![A-Za-z0-9._])' + [regex]::Escape($PackageName) + '(?![A-Za-z0-9._])'
    # `logcat -v epoch` is: timestamp PID TID level tag. Do not consume PID as an
    # optional field; doing so promotes unrelated system TIDs into package PIDs.
    $headerPattern = '^\s*\d+\.\d+\s+(?<pid>\d+)\s+(?<tid>\d+)\s+[VDIWEF]\s+'
    $processIds = New-Object 'System.Collections.Generic.HashSet[string]'

    foreach ($line in $lines) {
        foreach ($pattern in @(
            ('(?i)\bProcess:\s*' + [regex]::Escape($PackageName) + '\s*,\s*PID:\s*(?<pid>\d+)\b'),
            ('(?i)\bStart proc\s+(?<pid>\d+):' + [regex]::Escape($PackageName) + '(?:[:/\s]|$)'),
            ('(?i)\bpid:\s*(?<pid>\d+)\b[^\r\n]*>>>\s*' + [regex]::Escape($PackageName) + '\s*<<<'),
            ('\b(?<pid>\d+):' + [regex]::Escape($PackageName) + '(?:[:/\s]|$)')
        )) {
            $match = [regex]::Match($line, $pattern)
            if ($match.Success) { [void]$processIds.Add($match.Groups['pid'].Value) }
        }
    }

    $selected = @($lines | Where-Object {
        if ($_ -match $packagePattern) { return $true }
        $header = [regex]::Match($_, $headerPattern)
        return $header.Success -and $processIds.Contains($header.Groups['pid'].Value)
    })
    return [PSCustomObject][ordered]@{
        processIds = @($processIds | Sort-Object)
        text = $selected -join "`r`n"
    }
}

function Get-CrashClassification {
    param([AllowEmptyString()][string]$Text)

    $rules = @(
        @{ Kind = 'java-abi'; Confidence = 'high'; Pattern = '(?i)NoSuchMethodError|VerifyError|NoClassDefFoundError|ClassNotFoundException' },
        @{ Kind = 'loader'; Confidence = 'high'; Pattern = '(?i)UnsatisfiedLinkError|dlopen failed|cannot locate symbol|xrNegotiateLoaderApiLayerInterface' },
        @{ Kind = 'native'; Confidence = 'high'; Pattern = '(?i)Fatal signal|Abort message|backtrace:|SIGSEGV|SIGABRT' },
        @{ Kind = 'anr'; Confidence = 'high'; Pattern = '(?i)ANR in|REASON_ANR' },
        @{ Kind = 'low-memory-or-system-kill'; Confidence = 'medium'; Pattern = '(?i)lmkd|low memory|REASON_LOW_MEMORY' },
        @{ Kind = 'clean-or-user-stop'; Confidence = 'medium'; Pattern = '(?i)REASON_USER_REQUESTED|user requested|force-stop' }
    )
    foreach ($rule in $rules) {
        $matches = @([regex]::Matches($Text, $rule.Pattern) | Select-Object -First 8 | ForEach-Object { $_.Value })
        if ($matches.Count -gt 0) {
            return [PSCustomObject][ordered]@{ kind = $rule.Kind; confidence = $rule.Confidence; evidence = $matches }
        }
    }
    return [PSCustomObject][ordered]@{ kind = 'unknown'; confidence = 'low'; evidence = @() }
}

function Invoke-Capture {
    $script:AdbPath = Resolve-DiagnosticAdbPath -RequestedPath $AdbPath -RepositoryRoot $RepoRoot
    $script:DeviceSerial = Resolve-DiagnosticDeviceSerial -RequestedSerial $DeviceSerial

    $state = (Invoke-Adb -Arguments @('get-state')).Trim()
    if ($state -ne 'device') { throw "ADB target is not ready: $state" }

    $hostUtc = [DateTime]::UtcNow
    $deviceEpoch = (Invoke-Adb -Arguments @('shell', 'date', '+%s')).Trim()
    $packageDump = Invoke-Adb -Arguments @('shell', 'dumpsys', 'package', $Package)
    if ($packageDump -match '(?im)^Unable to find package:') {
        throw "Package is not installed: $Package"
    }
    $versionName = [regex]::Match($packageDump, '(?m)^\s*versionName=(?<value>\S+)').Groups['value'].Value
    $versionCodeMatch = [regex]::Match($packageDump, '(?m)^\s*versionCode=(?<value>\d+)')
    if (-not $versionCodeMatch.Success -or $versionName -ne '2.0.20' -or [int64]$versionCodeMatch.Groups['value'].Value -ne 5001712) {
        throw "Installed package is not exact Steam Link 2.0.20/5001712: $versionName/$($versionCodeMatch.Groups['value'].Value)"
    }

    if (-not $OutputDirectory) {
        $script:OutputDirectory = Join-Path ([IO.Path]::GetTempPath()) ('SteamLinkCrash-' + $hostUtc.ToString('yyyyMMdd-HHmmssZ'))
    }
    if (Test-Path -LiteralPath $OutputDirectory) {
        throw "Output directory must not already exist: $OutputDirectory"
    }
    New-Item -ItemType Directory -Path $OutputDirectory | Out-Null

    $serialHash = Get-StringSha256 -Text $DeviceSerial
    $packagePathsText = Invoke-Adb -Arguments @('shell', 'pm', 'path', $Package)
    $packagePaths = @($packagePathsText -split '\r?\n' | Where-Object { $_ -match '^package:' } | ForEach-Object { $_.Substring(8).Trim() })
    $installedFiles = @($packagePaths | ForEach-Object {
        $hashText = Invoke-Adb -Arguments @('shell', 'sha256sum', $_)
        [PSCustomObject][ordered]@{ devicePath = $_; sha256 = ($hashText -split '\s+')[0].ToUpperInvariant() }
    })

    $sinceEpoch = [DateTimeOffset]$Since
    $sinceEpochText = $sinceEpoch.ToUnixTimeSeconds().ToString([Globalization.CultureInfo]::InvariantCulture) + '.000'
    $allLogcat = Invoke-Adb -Arguments @(
        'logcat', '-d', '-v', 'epoch', '-T', $sinceEpochText,
        '-b', 'crash', '-b', 'main', '-b', 'system'
    )
    $packageLogcat = Select-PackageLogcat -Text $allLogcat -PackageName $Package
    $targetedLogcat = $packageLogcat.text
    $exitInfo = Invoke-Adb -Arguments @('shell', 'dumpsys', 'activity', 'exit-info', $Package)

    $receipt = $null
    if ($PatchReceiptPath) {
        if (-not (Test-Path -LiteralPath $PatchReceiptPath -PathType Leaf)) { throw "Patch receipt not found: $PatchReceiptPath" }
        $receipt = Get-Content -LiteralPath $PatchReceiptPath -Raw | ConvertFrom-Json
        $receiptFields = @($receipt.PSObject.Properties.Name)
        if ('versionName' -in $receiptFields -and [string]$receipt.versionName -ne '2.0.20') {
            throw "Patch receipt versionName is not 2.0.20: $($receipt.versionName)"
        }
        if ('versionCode' -in $receiptFields -and [int64]$receipt.versionCode -ne 5001712) {
            throw "Patch receipt versionCode is not 5001712: $($receipt.versionCode)"
        }
        if ('packageName' -in $receiptFields -and [string]$receipt.packageName -ne $Package) {
            throw "Patch receipt packageName does not match $Package`: $($receipt.packageName)"
        }
    }
    $localApk = $null
    if ($PatchedApkPath) {
        if (-not (Test-Path -LiteralPath $PatchedApkPath -PathType Leaf)) { throw "Patched APK not found: $PatchedApkPath" }
        $localApk = [PSCustomObject][ordered]@{
            path = Split-Path -Leaf $PatchedApkPath
            size = (Get-Item -LiteralPath $PatchedApkPath).Length
            sha256 = (Get-FileHash -LiteralPath $PatchedApkPath -Algorithm SHA256).Hash
        }
    }

    $knownSensitive = @($DeviceSerial)
    $logcatClassification = Get-CrashClassification -Text $targetedLogcat
    $exitInfoClassification = Get-CrashClassification -Text $exitInfo
    $classification = [PSCustomObject][ordered]@{
        selected = $(if ($logcatClassification.kind -ne 'unknown') { 'exact-package-logcat' } else { 'package-exit-info' })
        result = $(if ($logcatClassification.kind -ne 'unknown') { $logcatClassification } else { $exitInfoClassification })
        exactPackageLogcat = $logcatClassification
        packageExitInfo = $exitInfoClassification
        exitInfoLimitation = 'Package-scoped exit history can include events older than the requested logcat boundary.'
    }
    $provenance = [PSCustomObject][ordered]@{
        schemaVersion = 1
        hostUtc = $hostUtc.ToString('o')
        deviceEpoch = $deviceEpoch
        deviceIdHash = $serialHash
        packageName = $Package
        versionName = $versionName
        versionCode = 5001712
        logcatProcessIds = $packageLogcat.processIds
        installedFiles = $installedFiles
        localApk = $localApk
        patchSelectionKnown = [bool]($null -ne $receipt)
        patchReceipt = $receipt
    }

    $createdFiles = @(
        Join-Path $OutputDirectory '00-scope.txt'
        Join-Path $OutputDirectory '01-provenance.json'
        Join-Path $OutputDirectory '10-logcat-targeted.txt'
        Join-Path $OutputDirectory '11-exit-info.txt'
        Join-Path $OutputDirectory '20-classification.json'
    )
    Write-Utf8 -Path $createdFiles[0] -Text "Read-only post-reproduction capture. No launch, force-stop, install, grant, log clear, bugreport, screenshot, network dump, DropBox query, or tombstone pull was performed.`r`n"
    $safeProvenance = Protect-DiagnosticObject -InputObject $provenance
    Write-Utf8 -Path $createdFiles[1] -Text (Protect-DiagnosticText -Text ($safeProvenance | ConvertTo-Json -Depth 10) -KnownSensitive $knownSensitive)
    Write-Utf8 -Path $createdFiles[2] -Text (Protect-DiagnosticText -Text $targetedLogcat -KnownSensitive $knownSensitive)
    Write-Utf8 -Path $createdFiles[3] -Text (Protect-DiagnosticText -Text $exitInfo -KnownSensitive $knownSensitive)
    Write-Utf8 -Path $createdFiles[4] -Text ($classification | ConvertTo-Json -Depth 5)

    $secretPatterns = @(
        '(?i)["''](?:password|authorization|bearer|token|access[_ -]?token|refresh[_ -]?token|pairing[_ -]?token|api[_ -]?key|secret)["'']\s*:\s*["''](?!<redacted>)[^"''\r\n]+["'']',
        '(?i)\b(?:password|authorization|bearer|token|access[_ -]?token|refresh[_ -]?token|pairing[_ -]?token|api[_ -]?key|secret)\b\s*[:=]\s*(?!<redacted>)\S+'
    )
    $leaks = @($createdFiles | Select-String -Pattern $secretPatterns)
    if ($leaks.Count -gt 0) { throw 'Secret scan failed; capture was not archived.' }

    $archive = "$OutputDirectory.zip"
    if (Test-Path -LiteralPath $archive) { throw "Archive must not already exist: $archive" }
    Compress-Archive -LiteralPath $createdFiles -DestinationPath $archive
    [PSCustomObject][ordered]@{ outputDirectory = $OutputDirectory; archive = $archive; classification = $classification } |
        ConvertTo-Json -Depth 6
}

function Invoke-SelfTest {
    $script:checks = 0
    function Assert-True([bool]$Condition, [string]$Message) {
        if (-not $Condition) { throw "SelfTest failed: $Message" }
        $script:checks++
    }

    Assert-True ((Get-CrashClassification 'java.lang.NoSuchMethodError').kind -eq 'java-abi') 'Java ABI classification'
    Assert-True ((Get-CrashClassification 'dlopen failed: libgxr_ast.so').kind -eq 'loader') 'loader classification'
    Assert-True ((Get-CrashClassification 'Fatal signal 11 (SIGSEGV)').kind -eq 'native') 'native classification'
    Assert-True ((Get-CrashClassification 'ANR in com.valvesoftware.steamlinkvr').kind -eq 'anr') 'ANR classification'
    $redacted = Protect-DiagnosticText -Text "serial-123 192.168.1.2 aa:bb:cc:dd:ee:ff token=abc" -KnownSensitive @('serial-123')
    Assert-True ($redacted -notmatch 'serial-123|192\.168\.1\.2|aa:bb:cc:dd:ee:ff|token=abc') 'redaction'
    $adbErrorRedacted = Protect-DiagnosticText -Text "adb.exe: device 'serial-123' not found" -KnownSensitive @('serial-123')
    Assert-True ($adbErrorRedacted -match 'device.+<redacted>.+not found' -and $adbErrorRedacted -notmatch 'serial-123') 'ADB error serial redaction'
    $jsonRedacted = Protect-DiagnosticObject -InputObject ('{"token":12345,"secret":["abc"],"nested":{"password":"xyz"}}' | ConvertFrom-Json)
    $jsonRedactedText = $jsonRedacted | ConvertTo-Json -Depth 5
    Assert-True ($jsonRedactedText -notmatch '12345|"abc"|"xyz"') 'recursive JSON redaction'
    $mixedLogcat = "1720000000.000 123 123 E AndroidRuntime: Process: com.valvesoftware.steamlinkvr.gxr, PID: 123`r`n1720000000.001 123 123 E AndroidRuntime: java.lang.NoSuchMethodError`r`n1720000000.002 999 999 E AndroidRuntime: Fatal signal 11 in unrelated`r`n1720000000.003 456 456 E AndroidRuntime: Process: com.valvesoftware.steamlinkvr.other, PID: 456`r`n1720000000.004 777 123 E SystemService: package com.valvesoftware.steamlinkvr.gxr mentioned by another process"
    $selectedLogcat = Select-PackageLogcat -Text $mixedLogcat -PackageName 'com.valvesoftware.steamlinkvr.gxr'
    Assert-True ($selectedLogcat.text -match 'NoSuchMethodError' -and $selectedLogcat.text -notmatch 'unrelated|steamlinkvr\.other') 'exact-package logcat selection'
    Assert-True ((Count-BytePattern -Bytes ([byte[]](1, 2, 1, 2, 1)) -Pattern ([byte[]](1, 2))) -eq 2) 'byte pattern count'
    $hostExecutable = (Get-Process -Id $PID).Path
    $stderrCapture = Invoke-NativeProcessCaptured -FilePath $hostExecutable -Arguments @(
        '-NoProfile', '-NonInteractive', '-Command', '[Console]::Error.WriteLine(12345); exit 0'
    )
    Assert-True ($stderrCapture.exitCode -eq 0 -and $stderrCapture.output -match '12345') 'nonfatal native stderr capture'
    $failedNativeCapture = Invoke-NativeProcessCaptured -FilePath $hostExecutable -Arguments @(
        '-NoProfile', '-NonInteractive', '-Command', 'exit 17'
    )
    Assert-True ($failedNativeCapture.exitCode -eq 17) 'native exit-code capture'
    $bundledAdb = Join-Path $RepoRoot '..\GalaxyXR-APK\install\platform-tools\adb.exe'
    if (Test-Path -LiteralPath $bundledAdb -PathType Leaf) {
        Assert-True (
            (Resolve-DiagnosticAdbPath -RequestedPath $null -RepositoryRoot $RepoRoot) -eq
                [IO.Path]::GetFullPath($bundledAdb)
        ) 'bundled ADB discovery'
    }
    "PASS SelfTest checks=$checks"
}

switch ($Mode) {
    'Static' { Invoke-StaticAudit }
    'Capture' { Invoke-Capture }
    'SelfTest' { Invoke-SelfTest }
}
