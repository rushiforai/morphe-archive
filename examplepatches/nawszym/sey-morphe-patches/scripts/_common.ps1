# Shared helpers for the Sey Morphe patches build scripts.

$script:RepoRoot = Split-Path -Parent $PSScriptRoot

function Get-AndroidSdkRoot {
    $candidates = @(
        $env:ANDROID_SDK_ROOT,
        $env:ANDROID_HOME,
        (Join-Path $env:LOCALAPPDATA 'Android\Sdk')
    ) | Where-Object { $_ -and (Test-Path $_) }

    if (-not $candidates) {
        throw "Android SDK not found. Set ANDROID_HOME or ANDROID_SDK_ROOT."
    }
    return ($candidates | Select-Object -First 1)
}

function Get-AndroidJar {
    param([string]$SdkRoot = (Get-AndroidSdkRoot))

    $jar = Get-ChildItem (Join-Path $SdkRoot 'platforms') -Directory -ErrorAction SilentlyContinue |
        Sort-Object Name -Descending |
        ForEach-Object { Join-Path $_.FullName 'android.jar' } |
        Where-Object { Test-Path $_ } |
        Select-Object -First 1

    if (-not $jar) {
        throw "No android.jar found under $SdkRoot\platforms."
    }
    return $jar
}

function Get-BuildToolsDir {
    param([string]$SdkRoot = (Get-AndroidSdkRoot))

    $dir = Get-ChildItem (Join-Path $SdkRoot 'build-tools') -Directory -ErrorAction SilentlyContinue |
        Sort-Object Name -Descending |
        Select-Object -First 1

    if (-not $dir) {
        throw "No build-tools found under $SdkRoot\build-tools."
    }
    return $dir.FullName
}

function Get-KotlinStdlib {
    $candidates = @(
        "$env:ProgramFiles\Android\Android Studio\plugins\Kotlin\kotlinc\lib\kotlin-stdlib.jar"
    ) | Where-Object { Test-Path $_ }

    if ($candidates) {
        return ($candidates | Select-Object -First 1)
    }

    $cached = Get-ChildItem "$env:USERPROFILE\.gradle\caches\modules-2\files-2.1\org.jetbrains.kotlin\kotlin-stdlib" `
        -Recurse -Filter 'kotlin-stdlib-*.jar' -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notmatch 'sources' } |
        Sort-Object FullName -Descending |
        Select-Object -First 1

    if (-not $cached) {
        throw "kotlin-stdlib.jar not found. Install Android Studio or a Kotlin distribution."
    }
    return $cached.FullName
}

function Get-Kotlinc {
    $candidates = @(
        "$env:ProgramFiles\Android\Android Studio\plugins\Kotlin\kotlinc\bin\kotlinc.bat"
    ) | Where-Object { Test-Path $_ }

    if ($candidates) {
        return ($candidates | Select-Object -First 1)
    }

    $command = Get-Command kotlinc -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }
    throw "kotlinc not found. Install Android Studio (it ships a Kotlin compiler)."
}

function Get-ToolJava {
    $java = Get-ChildItem (Join-Path $script:RepoRoot 'tools\jdk21') `
        -Recurse -Filter 'java.exe' -ErrorAction SilentlyContinue |
        Select-Object -First 1

    if ($java) {
        return $java.FullName
    }

    $command = Get-Command java -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }
    throw "Java not found. Put a JDK 21 in tools\jdk21 or add java to PATH."
}
