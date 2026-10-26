<#
.SYNOPSIS
    The helpers the release and verification scripts share.

.DESCRIPTION
    Dot-source this beside patch-target.ps1 and patch-report.ps1:

        . (Join-Path $PSScriptRoot 'common.ps1')

    Each of these existed in two to four copies that had already drifted apart. The path guard
    was identical in three scripts; the cleanup helper recursed unconditionally in one and only
    on request in another; the version read appeared four times, twice without -LiteralPath; and
    the desktop CLI was looked up by two functions with different search orders, one returning
    $null and one throwing. Copies of a guard drift in the direction of whichever caller was
    edited last, which is the direction nobody checked.
#>

function Resolve-WithinRoot {
    <#
    .SYNOPSIS
        A generated path, proved to be inside the work directory, or a throw.
    .DESCRIPTION
        Every path these scripts hand to the patcher or delete afterwards goes through this, so
        a run identifier that came out wrong cannot reach outside the directory the caller owns.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Root
    )
    $candidate = [System.IO.Path]::GetFullPath($Path)
    $prefix = $Root.TrimEnd('\') + '\'
    if (-not $candidate.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to use a generated path outside the work directory: $candidate"
    }
    return $candidate
}

function Remove-GeneratedPath {
    <#
    .SYNOPSIS
        Delete something this run generated, inside the work directory, warning rather than
        failing when it will not go.
    .DESCRIPTION
        Recursive by default, because every caller is deleting a run directory and the one copy
        that made it optional had its single caller pass -Recurse anyway. Pass -NoRecurse for a
        single file. A failure here is reported and swallowed on purpose: leaving scratch behind
        is not a reason to fail a run that has already produced its answer.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Root,
        [switch]$NoRecurse
    )
    try {
        $safe = Resolve-WithinRoot -Path $Path -Root $Root
        $rootPath = [IO.Path]::GetFullPath($Root).TrimEnd('\')
        # The leaf can be removed as a link. An ancestor link would make even a
        # nonrecursive leaf deletion reach outside this run's directory.
        $parent = [IO.Path]::GetDirectoryName($safe)
        while ($parent.Length -gt $rootPath.Length) {
            try { $attributes = [IO.File]::GetAttributes($parent) }
            catch [IO.FileNotFoundException], [IO.DirectoryNotFoundException] { $attributes = 0 }
            if ($attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Refusing to remove a generated path through a linked ancestor: $parent"
            }
            $parent = [IO.Path]::GetDirectoryName($parent)
        }
        if (-not (Test-Path -LiteralPath $safe)) { return }
        if ($NoRecurse) { Remove-Item -LiteralPath $safe -Force -ErrorAction Stop }
        else { Remove-TreeWithoutFollowingLinks -Path $safe }
    } catch {
        Write-Warning "Could not remove generated path: $($_.Exception.Message)"
    }
}

function Remove-TreeWithoutFollowingLinks {
    <#
    .SYNOPSIS
        Delete a folder this run made, removing every link in it as a link, never what it points at.
    .DESCRIPTION
        Windows PowerShell 5.1's Remove-Item -Recurse follows a junction and empties the folder it
        points at, and a copy that's been tampered with is exactly where one would be. This walks
        the tree itself: a link (a junction, a symbolic link, any reparse point) is deleted on its
        own, a folder is emptied and then deleted. Anything that won't go is warned about and left,
        since the callers are cleaning up after an answer that already stands.
    #>
    param([Parameter(Mandatory = $true)][string]$Path)
    $full = [IO.Path]::GetFullPath($Path)
    # The link's own attributes, never its target's, and a dangling link still answers. Only a
    # path that isn't there is quiet; anything else that stops the read is said.
    try { $attributes = [IO.File]::GetAttributes($full) }
    catch [IO.FileNotFoundException], [IO.DirectoryNotFoundException] { return }
    catch {
        Write-Warning "Could not remove ${full}: $($_.Exception.Message)"
        return
    }
    $link = [bool]($attributes -band [IO.FileAttributes]::ReparsePoint)
    try {
        # A read-only file or folder won't delete. A link's flag is left alone, since setting it
        # could reach whatever it points at.
        $info = if ($attributes -band [IO.FileAttributes]::Directory) { [IO.DirectoryInfo]::new($full) } else { [IO.FileInfo]::new($full) }
        if (-not $link -and ($attributes -band [IO.FileAttributes]::ReadOnly)) {
            $info.Attributes = $attributes -band -bnot [IO.FileAttributes]::ReadOnly
        }
        if ($info -is [IO.DirectoryInfo] -and -not $link) {
            foreach ($child in @($info.GetFileSystemInfos())) { Remove-TreeWithoutFollowingLinks -Path $child.FullName }
        }
        # Not recursive: on a junction or a directory link this removes the link alone.
        $info.Delete()
    } catch {
        Write-Warning "Could not remove ${full}: $($_.Exception.Message)"
    }
}

function Open-HeldFile {
    <#
    .SYNOPSIS
        Open a file, or a folder with -Directory, so nothing can change or move it while it's held,
        and prove what's open is the path's own file and not one a link there led to.
    .DESCRIPTION
        A file comes back as a FileStream opened for reading and shared only with readers: Windows
        refuses to write, replace, rename or delete it while that's open. A folder comes back as a
        handle that lets others read and write inside it but not rename or delete it, so every path
        under it keeps meaning the same place. Both are compared with the path opened as itself
        (FILE_FLAG_OPEN_REPARSE_POINT), by volume and file index, so a link at the path, or one
        swapped in before the open, throws instead of handing back what it pointed at. A hard link
        is the same file, so it passes, and holding it holds that file. The caller disposes what
        comes back.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [switch]$Directory
    )
    if (-not ('Hushfacebook.HeldFile' -as [type])) {
        Add-Type -TypeDefinition @'
using System;
using System.ComponentModel;
using System.IO;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;

namespace Hushfacebook {
    public static class HeldFile {
        [StructLayout(LayoutKind.Sequential)]
        private struct Info {
            public uint Attributes;
            public uint CreatedLow, CreatedHigh, AccessedLow, AccessedHigh, WrittenLow, WrittenHigh;
            public uint VolumeSerial, SizeHigh, SizeLow, Links, IndexHigh, IndexLow;
        }

        [DllImport("kernel32.dll", SetLastError = true)]
        private static extern bool GetFileInformationByHandle(SafeFileHandle file, out Info info);

        [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
        private static extern SafeFileHandle CreateFileW(string name, uint access, uint share, IntPtr security,
            uint disposition, uint flags, IntPtr template);

        private const uint ListDirectory = 0x1, ReadAttributes = 0x80;
        private const uint ShareRead = 1, ShareWrite = 2, ShareDelete = 4;
        private const uint OpenExisting = 3;
        private const uint OpenReparsePoint = 0x00200000, BackupSemantics = 0x02000000;

        private static SafeFileHandle Open(string path, uint access, uint share, uint flags) {
            SafeFileHandle file = CreateFileW(path, access, share, IntPtr.Zero, OpenExisting, flags, IntPtr.Zero);
            if (file.IsInvalid) throw new IOException("Couldn't open " + path, new Win32Exception(Marshal.GetLastWin32Error()));
            return file;
        }

        private static string Id(SafeFileHandle file) {
            Info info;
            if (!GetFileInformationByHandle(file, out info)) throw new Win32Exception(Marshal.GetLastWin32Error());
            return info.VolumeSerial.ToString("x8") + ":" + info.IndexHigh.ToString("x8") + info.IndexLow.ToString("x8");
        }

        public static IDisposable Open(string path, bool directory) {
            IDisposable held;
            SafeFileHandle handle;
            if (directory) {
                // List access takes part in sharing, so leaving out delete sharing stops a rename.
                handle = Open(path, ListDirectory, ShareRead | ShareWrite, BackupSemantics);
                held = handle;
            } else {
                FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
                handle = stream.SafeFileHandle;
                held = stream;
            }
            try {
                // Attribute access alone takes no part in sharing, so this can't be refused by the hold.
                using (SafeFileHandle own = Open(path, ReadAttributes, ShareRead | ShareWrite | ShareDelete,
                        OpenReparsePoint | BackupSemantics)) {
                    if (Id(handle) != Id(own)) throw new IOException(path + " is a link, so what it led to wasn't held");
                }
                return held;
            } catch {
                held.Dispose();
                throw;
            }
        }
    }
}
'@
    }
    return [Hushfacebook.HeldFile]::Open([IO.Path]::GetFullPath($Path), [bool]$Directory)
}

function Get-BundleVersion {
    <#
    .SYNOPSIS
        The version in gradle.properties, which every generated name follows.
    .DESCRIPTION
        -LiteralPath, which two of the four copies of this read were missing: a repository path
        holding a bracket is read as a wildcard otherwise, and the read silently finds nothing.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)

    $path = Join-Path $Root 'gradle.properties'
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "There is no gradle.properties at $path, so the bundle version is unknown."
    }
    $line = @(Get-Content -LiteralPath $path | Where-Object { $_ -match '^\s*version\s*=' }) |
        Select-Object -First 1
    if (-not $line) { throw "gradle.properties names no version: $path" }
    $version = ($line -replace '^\s*version\s*=\s*', '').Trim()
    if (-not $version) { throw "gradle.properties has an empty version: $path" }
    return $version
}

function Get-ReleaseBundlePath {
    <#
    .SYNOPSIS
        Where :patches:buildAndroid leaves the bundle a release publishes.
    .DESCRIPTION
        patches/build/release, never patches/build/libs. The Morphe plugin's buildAndroid adds the
        DEX payload to the jar task's own output in place, so any later task that reruns
        :patches:jar (:patches:test does) wrote the plain jar back over the finished bundle under
        the same name. v0.43.0 shipped that jar, and on 2026-09-21 it happened again between the
        build and the index push. buildAndroid now ends by copying the finished bundle here, where
        no other task writes, with bundle.sha256 beside it.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [string]$Version)

    if (-not $Version) { $Version = Get-BundleVersion -Root $Root }
    return Join-Path $Root "patches/build/release/patches-$Version.mpp"
}

function Get-SourcesNewerThanBundle {
    <#
    .SYNOPSIS
        The source files written after the bundle was built, newest first.
    .DESCRIPTION
        Only :patches:buildAndroid writes the release bundle, and :patches:test rebuilds
        build/libs without it, so a device build made after a patch change and a test run
        patched with the previous hooks (2026-09-23, Swipe-left controls). Counted: the sources of
        the patches module and its submodules (patches/src/main, patches/<submodule>/src/main,
        the compile-only stubs among them, whose constants can be inlined into patch code), the
        sources of every extension module (extensions/<module>/src/main and
        extensions/<module>/<submodule>/src/main), the Gradle files that shape them, the R8
        rules (*.pro at extensions/ and in each module, extensions/proguard-rules.pro being the
        one every extension's R8 step reads), and NOTICE, which :extensions:facebook compiles
        into the payload for its Licenses row. Build output is never under src/main, so it is not
        walked. build-release-receipt.ps1 refuses a bundle this finds anything newer than.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$Bundle
    )

    $built = (Get-Item -LiteralPath $Bundle).LastWriteTimeUtc
    $sourceRoots = @()
    $gradleFiles = @('gradle.properties', 'settings.gradle.kts', 'build.gradle.kts', 'gradle/libs.versions.toml',
        'gradle/tooling-scopes.txt', 'NOTICE') |
        ForEach-Object { Join-Path $Root $_ }
    $ruleDirs = @()
    $patches = Join-Path $Root 'patches'
    $moduleDirs = @()
    if (Test-Path -LiteralPath $patches -PathType Container) {
        $moduleDirs += @(Get-Item -LiteralPath $patches) + @(Get-ChildItem -LiteralPath $patches -Directory |
            Where-Object { $_.Name -notin @('src', 'build') })
    }
    $extensions = Join-Path $Root 'extensions'
    if (Test-Path -LiteralPath $extensions -PathType Container) {
        $ruleDirs += $extensions
        foreach ($module in Get-ChildItem -LiteralPath $extensions -Directory) {
            $moduleDirs += @($module) + @(Get-ChildItem -LiteralPath $module.FullName -Directory |
                Where-Object { $_.Name -notin @('src', 'build') })
        }
    }
    foreach ($dir in $moduleDirs) {
        $sourceRoots += Join-Path $dir.FullName 'src/main'
        $gradleFiles += Join-Path $dir.FullName 'build.gradle.kts'
        $ruleDirs += $dir.FullName
    }
    foreach ($dir in $ruleDirs) {
        $gradleFiles += @(Get-ChildItem -LiteralPath $dir -File -Filter '*.pro' -ErrorAction SilentlyContinue |
            ForEach-Object FullName)
    }
    $newer = New-Object System.Collections.Generic.List[System.IO.FileInfo]
    foreach ($sourceRoot in $sourceRoots) {
        if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) { continue }
        foreach ($file in Get-ChildItem -LiteralPath $sourceRoot -File -Recurse) {
            if ($file.LastWriteTimeUtc -gt $built) { $newer.Add($file) }
        }
    }
    foreach ($path in $gradleFiles) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
        $file = Get-Item -LiteralPath $path
        if ($file.LastWriteTimeUtc -gt $built) { $newer.Add($file) }
    }
    return @($newer | Sort-Object LastWriteTimeUtc -Descending)
}

function Get-ProducerInputSha256 {
    <#
    .SYNOPSIS
        The digest patches/build.gradle.kts stamps into a bundle as Hushfacebook-Input-SHA256,
        worked out from the producer inputs as they are now.
    .DESCRIPTION
        The same files in the same order, hashed the same way, so a deleted, renamed or changed
        input moves it whatever the file times say: patches/src/main, patches/stub/src/main and
        gradle whole; under extensions every src/main tree, Gradle file and *.pro; the Gradle files
        of the patches modules; and the root's build.gradle.kts, settings.gradle.kts,
        gradle.properties, gradlew, gradlew.bat and NOTICE. Nothing in a build folder counts, nor
        what Ant's default excludes leave out. Each file goes in as the UTF-8 length of its path
        (4 bytes, big-endian), the path from the root with '/', its length (8 bytes) and its bytes,
        in ordinal path order, after the line "hushfacebook-source-inputs-1". Keep it in step with
        identityInputTrees in patches/build.gradle.kts.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)

    $Root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Root)
    $ignoredNames = @('.gitattributes', '.gitignore', '.gitmodules', '.hgignore', '.hgsub', '.hgsubstate',
        '.hgtags', '.bzrignore', '.cvsignore', 'vssver.scc', '.DS_Store')
    $ignoredDirs = @('.git', '.hg', '.bzr', '.svn', 'CVS', 'SCCS')
    function Test-AntIgnored([string]$Name) {
        return $Name -cin $ignoredNames -or $Name -cin $ignoredDirs -or $Name -cmatch '\A%.*%\z' -or
            $Name -cmatch '\A\._' -or $Name -cmatch '\A#.*#\z' -or $Name -cmatch '\A\.#' -or $Name.EndsWith('~')
    }
    $paths = New-Object 'System.Collections.Generic.SortedSet[string]' ([StringComparer]::Ordinal)
    # [relative tree, which of its files count, whether build folders are left out]
    $trees = @(
        @('patches/src/main', { param($parts) $true }, $false),
        @('patches/stub/src/main', { param($parts) $true }, $false),
        @('extensions', {
            param($parts)
            $name = $parts[$parts.Count - 1]
            if ($name -ceq 'build.gradle.kts' -or $name.EndsWith('.pro')) { return $true }
            for ($i = 0; $i -le $parts.Count - 3; $i++) {
                if ($parts[$i] -ceq 'src' -and $parts[$i + 1] -ceq 'main') { return $true }
            }
            return $false
        }, $true),
        @('patches', { param($parts) $parts[$parts.Count - 1] -ceq 'build.gradle.kts' }, $true),
        @('gradle', { param($parts) $true }, $false)
    )
    foreach ($tree in $trees) {
        $base = Join-Path $Root $tree[0]
        if (-not (Test-Path -LiteralPath $base -PathType Container)) { continue }
        $pending = New-Object System.Collections.Generic.Stack[string]
        $pending.Push($base)
        while ($pending.Count -gt 0) {
            $dir = $pending.Pop()
            foreach ($sub in [System.IO.Directory]::GetDirectories($dir)) {
                $name = [System.IO.Path]::GetFileName($sub)
                if (Test-AntIgnored $name) { continue }
                if ($tree[2] -and $name -ceq 'build') { continue }
                $pending.Push($sub)
            }
            foreach ($file in [System.IO.Directory]::GetFiles($dir)) {
                $name = [System.IO.Path]::GetFileName($file)
                if ((Test-AntIgnored $name) -or ($tree[2] -and $name -ceq 'build')) { continue }
                $relative = $file.Substring($base.Length).TrimStart('\', '/').Replace('\', '/')
                if (& $tree[1] ($relative -split '/')) { [void]$paths.Add("$($tree[0])/$relative") }
            }
        }
    }
    foreach ($name in @('build.gradle.kts', 'settings.gradle.kts', 'gradle.properties', 'gradlew', 'gradlew.bat', 'NOTICE')) {
        if (Test-Path -LiteralPath (Join-Path $Root $name) -PathType Leaf) { [void]$paths.Add($name) }
    }

    $hash = [System.Security.Cryptography.IncrementalHash]::CreateHash([System.Security.Cryptography.HashAlgorithmName]::SHA256)
    try {
        $header = [System.Text.Encoding]::ASCII.GetBytes("hushfacebook-source-inputs-1`n")
        $hash.AppendData($header)
        $buffer = New-Object byte[] 65536
        foreach ($path in $paths) {
            $name = [System.Text.Encoding]::UTF8.GetBytes($path)
            $length = [BitConverter]::GetBytes([int]$name.Length)
            if ([BitConverter]::IsLittleEndian) { [Array]::Reverse($length) }
            $hash.AppendData($length)
            $hash.AppendData($name)
            $stream = [System.IO.File]::OpenRead((Join-Path $Root $path))
            try {
                $size = [BitConverter]::GetBytes([long]$stream.Length)
                if ([BitConverter]::IsLittleEndian) { [Array]::Reverse($size) }
                $hash.AppendData($size)
                while (($read = $stream.Read($buffer, 0, $buffer.Length)) -gt 0) { $hash.AppendData($buffer, 0, $read) }
            } finally { $stream.Dispose() }
        }
        return ([BitConverter]::ToString($hash.GetHashAndReset()) -replace '-', '').ToLowerInvariant()
    } finally { $hash.Dispose() }
}

function Resolve-DesktopCli {
    <#
    .SYNOPSIS
        The Morphe desktop CLI jar, or $null, or a throw when the caller cannot do without it.
    .DESCRIPTION
        One search order for both callers: -Explicit, HUSHFACEBOOK_DESKTOP_JAR, HUSHFACEBOOK_WORKDIR,
        then the repository's own build/morphe-tools. Newest by write time rather than by name,
        because the jar ships under its version and sorting those as text puts 1.9.0 above
        1.15.0. -Required turns "nothing found" into a throw naming what to set, which is what
        the second copy of this did and the first did not.
    #>
    param([string]$Explicit, [string]$Root, [switch]$Required)

    # Made absolute through PowerShell's location, the one Test-Path looked in. [IO.Path]::GetFullPath
    # reads the process directory, which Set-Location doesn't move: a relative -DesktopJar that
    # Test-Path found came back as a jar somewhere else, and DexDiff compiled without dexlib2.
    $found = $null
    if ($Explicit -and (Test-Path -LiteralPath $Explicit -PathType Leaf)) {
        $found = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Explicit)
    } elseif ($Explicit) {
        # Named and not there: say so rather than quietly searching somewhere else.
        throw "No Morphe desktop CLI at the path given: $Explicit"
    } elseif ($env:HUSHFACEBOOK_DESKTOP_JAR -and
            (Test-Path -LiteralPath $env:HUSHFACEBOOK_DESKTOP_JAR -PathType Leaf)) {
        $found = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($env:HUSHFACEBOOK_DESKTOP_JAR)
    } else {
        $directories = @($env:HUSHFACEBOOK_WORKDIR)
        if ($Root) { $directories += (Join-Path $Root 'build/morphe-tools') }
        foreach ($directory in $directories) {
            if (-not $directory -or -not (Test-Path -LiteralPath $directory -PathType Container)) { continue }
            $candidate = @(Get-ChildItem -LiteralPath $directory -Filter 'morphe-desktop*.jar' -File `
                -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending |
                Select-Object -First 1)
            if ($candidate.Count -eq 1) { $found = $candidate[0].FullName; break }
        }
    }

    if (-not $found -and $Required) {
        throw ('No Morphe desktop CLI. Pass -DesktopJar, or set HUSHFACEBOOK_DESKTOP_JAR or ' +
            'HUSHFACEBOOK_WORKDIR, or put the jar in build/morphe-tools.')
    }
    return $found
}

function Get-DesktopPatcherVersion {
    <#
    .SYNOPSIS
        The morphe-patcher version a desktop CLI jar bundles, or $null when the jar doesn't say.
    .DESCRIPTION
        Read from the app/morphe/patcher/version.properties the patcher packs into the fat jar. The
        CLI's --version names only its own release (1.18.1 bundles patcher 1.15.1, 1.19.0 bundles
        2.0.0), and the jar carries no Maven metadata for the patcher. A file that isn't a zip throws.
    #>
    param([Parameter(Mandatory = $true)][string]$Jar)

    # ZipFile reads a relative path against the process directory, not PowerShell's location.
    $Jar = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Jar)
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    try {
        $archive = [System.IO.Compression.ZipFile]::OpenRead($Jar)
    } catch {
        throw "The Morphe desktop CLI at $Jar is not a readable jar: $($_.Exception.Message)"
    }
    try {
        $entry = $archive.GetEntry('app/morphe/patcher/version.properties')
        if (-not $entry) { return $null }
        $reader = New-Object System.IO.StreamReader($entry.Open())
        try { $text = $reader.ReadToEnd() } finally { $reader.Dispose() }
    } finally { $archive.Dispose() }
    $match = [regex]::Match($text, '(?m)^[ \t]*version[ \t]*[=:][ \t]*(\S+?)[ \t]*\r?$')
    if ($match.Success) { return $match.Groups[1].Value }
    return $null
}

function Assert-DesktopPatcherVersion {
    <#
    .SYNOPSIS
        Throws unless the desktop CLI jar bundles a patcher of -Expected's major version, and
        returns the version it bundles.
    .DESCRIPTION
        A bundle built for one morphe-patcher major fails on the other only once the CLI loads it:
        the 0.17.0 push ran its whole 17-minute gate with a 1.18.1 jar on the 2.0 pin and died at the
        end on NoSuchMethodError: Compatibility.<init>. So the callers ask before anything heavy runs.
        The message names HUSHFACEBOOK_DESKTOP_JAR's User value when it names another jar, since a
        shell opened before that value moved is how the old jar got there.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Jar,
        [Parameter(Mandatory = $true)][string]$Expected,
        [Parameter(Mandatory = $true)][string]$ExpectedFrom
    )

    $bundled = Get-DesktopPatcherVersion -Jar $Jar
    if (-not $bundled) {
        throw ("The Morphe desktop CLI at $Jar has no app/morphe/patcher/version.properties, so the patcher " +
            "it bundles is unknown. $ExpectedFrom needs morphe-patcher $Expected.")
    }
    if (($bundled -split '\.')[0] -eq ($Expected -split '\.')[0]) { return $bundled }
    # The hint only when this process's HUSHFACEBOOK_DESKTOP_JAR is where the jar came from.
    $Jar = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Jar)
    $userJar = [Environment]::GetEnvironmentVariable('HUSHFACEBOOK_DESKTOP_JAR', [EnvironmentVariableTarget]::User)
    $processJar = $env:HUSHFACEBOOK_DESKTOP_JAR
    if ($processJar) { $processJar = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($processJar) }
    $hint = ''
    if ($userJar -and $processJar -and $processJar -eq $Jar -and
            $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($userJar) -ne $Jar) {
        $hint = " HUSHFACEBOOK_DESKTOP_JAR's User value is $userJar, so a shell opened before it moved still names the old jar."
    }
    throw ("The Morphe desktop CLI at $Jar bundles morphe-patcher $bundled, but $ExpectedFrom needs " +
        "$Expected, and a bundle built for one major version fails on the other.$hint")
}

function Select-FixtureBuild {
    <#
    .SYNOPSIS
        The .apk and .apkm files in -Folder whose names hold -Version, with the one .apkm picked
        when there are several.
    .DESCRIPTION
        A version can name its split bundle beside a single APK made from it, such as the
        -minapi28.apk the emulator installs, and the bundle is the fixture the tests read. With more
        than one bundle, or several APKs and no bundle, every match comes back, for the caller to
        refuse with its own message.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Folder,
        [Parameter(Mandatory = $true)][string]$Version
    )

    $matching = @(Get-ChildItem -LiteralPath $Folder -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -in '.apk', '.apkm' -and $_.Name.Contains($Version) })
    $bundles = @($matching | Where-Object { $_.Extension -eq '.apkm' })
    if ($matching.Count -gt 1 -and $bundles.Count -eq 1) { return $bundles }
    return $matching
}

function Get-BaseApk {
    <#
    .SYNOPSIS
        The APK whose manifest and resource table describe an app: the file itself, or the base
        APK a split bundle carries, copied out to -Destination.
    .DESCRIPTION
        Facebook ships as a split bundle (.apkm), not as one APK, and aapt2 and the resource check
        read an APK. The base APK holds the manifest and the app's own resource table; the splits
        hold densities, languages and feature modules. An .apks or .apkm names it base.apk, an
        .xapk names it after the package, so the largest APK is the fallback.

        Both paths are resolved against PowerShell's location before .NET sees them, and the
        answer is a full path. .NET reads a relative path against the process's own directory,
        which a hook, a scheduled task or a session that moved with Set-Location leaves somewhere
        else: `-Apk fixtures\facebook.apkm` then named a file that wasn't there.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Destination
    )

    $Apk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Apk)
    $Destination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
    if ([System.IO.Path]::GetExtension($Apk).ToLowerInvariant() -eq '.apk') { return $Apk }
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($Apk)
    try {
        $entry = $zip.Entries | Where-Object { $_.FullName -eq 'base.apk' } | Select-Object -First 1
        if (-not $entry) {
            $entry = $zip.Entries | Where-Object { $_.FullName -like '*.apk' } |
                Sort-Object Length -Descending | Select-Object -First 1
        }
        if (-not $entry) { throw "$(Split-Path -Leaf $Apk) holds no APK." }
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Destination) | Out-Null
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $Destination, $true)
    } finally {
        $zip.Dispose()
    }
    return $Destination
}

function Get-MergedApk {
    <#
    .SYNOPSIS
        The one APK the desktop CLI patches: a split bundle merged the way the CLI merges it,
        written to -Destination, or the APK itself when it isn't a bundle.
    .DESCRIPTION
        morphe-desktop merges an .apkm, .apks or .xapk into <name>-merged.apk beside its output,
        patches that, and since 1.17.0 deletes it on the way out. The patched APK's resource table
        and manifest were rebuilt from that merge, so the checks compared them with base.apk
        instead, which lacks every resource the splits carry: on 580 the patched table held 7,588
        resources base.apk doesn't, and none of them was compared. So the scripts merge first,
        with the CLI's own merger and the arguments it passes (MergeSplits.java), and hand the CLI
        the merged APK, which it patches as it is. There is nothing else to fall back to, so a
        merge that fails or writes no APK throws. The extensions are the CLI's own list
        (BundleFormats); anything else goes to the CLI as it is.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Java,
        [Parameter(Mandatory = $true)][string]$DesktopJar
    )

    $Apk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Apk)
    $Destination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
    if ([System.IO.Path]::GetExtension($Apk).TrimStart('.').ToLowerInvariant() -notin @('apkm', 'apks', 'xapk')) {
        return $Apk
    }
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Destination) | Out-Null
    if (Test-Path -LiteralPath $Destination) { Remove-Item -LiteralPath $Destination -Force }
    # Continue for the call alone: Windows PowerShell 5.1 turns a JDK warning on stderr into a
    # terminating error under Stop. The exit code and the file are what decide.
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-Xmx6g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'MergeSplits.java') $Apk $Destination 2>&1 |
            ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    # What the merger said, without the stack frames under an exception.
    $said = @($output | Where-Object { $_ -notmatch '^\s+at ' } | Select-Object -Last 3) -join ' '
    if ($exitCode -ne 0) {
        throw "Could not merge $(Split-Path -Leaf $Apk) into one APK (exit $exitCode): $said"
    }
    if (-not (Test-Path -LiteralPath $Destination -PathType Leaf) -or (Get-Item -LiteralPath $Destination).Length -eq 0) {
        throw ("The merge of $(Split-Path -Leaf $Apk) wrote no APK at $Destination, and base.apk is not what " +
            'the CLI patches, so there is nothing to hold the patched APK to.')
    }
    return $Destination
}

function Invoke-HeavyJob {
    <#
    .SYNOPSIS
        Runs a heavy job, a desktop CLI patch run and the checks on its output, inside a slot of
        the machine's build queue, or straight away on a machine without one.
    .DESCRIPTION
        A machine that shares its cores between several builds names its queue script in
        BUILD_QUEUE_SCRIPT, which defines Invoke-InBuildQueue: it waits for a free slot, runs the
        block at low priority on that slot's own cores, and gives the slot back. Gradle reached it
        through HUSHFACEBOOK_BUILD_WRAPPER, but the CLI runs started whenever they were asked for,
        beside two builds, and the queue's status never showed them. With the variable unset the
        block runs here and now. Inside a slot already (the queue sets BUILD_QUEUE_TICKET for its
        process and the processes it starts) the block runs at once instead of queueing behind
        itself. BUILD_QUEUE_PRIORITY=release puts a release's jobs ahead of everyday ones.

        Either way the block's output goes to the host, and what comes back is its exit code, in
        $LASTEXITCODE, since that's all the queue hands back. A block that has to keep what a tool
        printed puts it in a hashtable the caller made. The block reads the caller's variables,
        but Label, Priority and ScriptBlock are the queue's own names while it runs.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Label,
        [Parameter(Mandatory = $true)][scriptblock]$ScriptBlock
    )

    $queueScript = $env:BUILD_QUEUE_SCRIPT
    if ($queueScript -and -not (Test-Path -LiteralPath $queueScript -PathType Leaf)) {
        Write-Warning "BUILD_QUEUE_SCRIPT names $queueScript, which is not there, so $Label runs outside the queue."
        $queueScript = $null
    }
    $global:LASTEXITCODE = 0
    if (-not $queueScript) {
        & $ScriptBlock | Out-Host
        return
    }
    $queueLabel = "hushfacebook $Label"
    $job = $ScriptBlock
    # Dot-sourced in this function's scope, so the script's own parameters (Label, Priority, Run,
    # Status) land here and not on the caller's variables of those names.
    . $queueScript
    $code = Invoke-InBuildQueue -Label $queueLabel -ScriptBlock $job
    $global:LASTEXITCODE = [int]$code
}

function Set-GitHubPackagesCredential {
    <#
    .SYNOPSIS
        Fills GITHUB_ACTOR and GITHUB_TOKEN from the gh CLI when either is missing, or throws.
    .DESCRIPTION
        The Morphe settings plugin resolves from GitHub Packages, which needs a reader token. A
        hook runs with git's environment, not the shell's, and a release script can start from a
        shell that never set them, so they're usually absent and the build fails while applying
        the plugin, long before a test runs. The pre-push gate and the release preflight both ask
        here, so both say the same thing when neither the variables nor a signed-in gh are there.
    #>
    if ($env:GITHUB_ACTOR -and $env:GITHUB_TOKEN) { return }
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
        throw ('Set GITHUB_ACTOR and GITHUB_TOKEN, or install the gh CLI: the patches ' +
            'plugin resolves from GitHub Packages and cannot be applied without them.')
    }
    $login = (& gh api user --jq .login 2>$null)
    $token = (& gh auth token 2>$null)
    if ([string]::IsNullOrWhiteSpace($login) -or [string]::IsNullOrWhiteSpace($token)) {
        throw 'gh is not signed in, so the patches plugin cannot be resolved. Run gh auth login.'
    }
    $env:GITHUB_ACTOR = $login
    $env:GITHUB_TOKEN = $token
}

function Assert-UrlReachable {
    <#
    .SYNOPSIS
        A HEAD request that has to answer 200, or a throw naming the address and what it said.
    .DESCRIPTION
        validate-release-facts.ps1 fetches the indexed bundle and the Morphe add-source page
        with this on every run. It lives here so the contract tests can call it on its own:
        through the release check, an address has to pass the shape, scheme and host checks
        before it is fetched, and the one case that meant to try a dead link tripped the shape
        check first and never reached the fetch.
    #>
    param(
        [Uri]$Uri,
        [string]$Description,
        [string]$FailureHint
    )
    # -SkipHttpErrorCheck is PowerShell 7 only, and the pre-push hook runs whichever shell it
    # found, so a 404 has to be read out of the thrown response instead. That is the answer this
    # check exists for: the index once named a tag that did not exist yet.
    $status = 0
    try {
        # -UseBasicParsing because Windows PowerShell otherwise hands the reply to the IE
        # parser, which throws a null reference on a HEAD with no body. PowerShell 7 accepts
        # the switch and ignores it.
        $response = Invoke-WebRequest -Uri $Uri -Method Head -MaximumRedirection 5 `
            -TimeoutSec 60 -UseBasicParsing
        $status = [int]$response.StatusCode
    } catch {
        $failed = $_.Exception.Response
        if ($failed -and $failed.StatusCode) {
            $status = [int]$failed.StatusCode
        } else {
            throw ("Could not reach the ${Description} ${Uri}: $($_.Exception.Message). " +
                'If the network is down, push with HUSHFACEBOOK_SKIP_PRE_PUSH=1 and run this again later.')
        }
    }
    if ($status -ne 200) {
        throw ("The ${Description} ${Uri} answered HTTP ${status}. " + $FailureHint)
    }
    Write-Host ("[release] ${Description} answers 200: " + $Uri)
}

function Use-Utf8ConsoleOutput {
    <#
    .SYNOPSIS
        Runs a script block with PowerShell reading native commands' output as UTF-8, and puts the
        caller's encoding back afterwards.
    .DESCRIPTION
        git writes UTF-8, and PowerShell decodes a native command's output with
        [Console]::OutputEncoding, which is code page 437 for a hook's pwsh when the push starts in
        Git Bash. Setting it calls SetConsoleOutputCP, and in a process with no console (a detached
        start, a service) Windows PowerShell 5.1 turns that into "The handle is invalid." before git
        ever runs. pwsh 7 keeps the value without a console. So when the setter finds no console,
        the encoding goes into Console's own field instead, which the property hands back and 5.1
        decodes with (checked on 5.1.26100 on 2026-09-30, with the console on code page 437).
    #>
    param([Parameter(Mandatory = $true)][scriptblock]$Script)

    $utf8OutputEncoding = New-Object System.Text.UTF8Encoding($false)
    $utf8OutputBefore = [Console]::OutputEncoding
    $utf8OutputField = $null
    try {
        [Console]::OutputEncoding = $utf8OutputEncoding
    } catch {
        if ($_.Exception.InnerException -isnot [System.IO.IOException]) { throw }
        $utf8OutputField = [Console].GetField('_outputEncoding', [System.Reflection.BindingFlags]'NonPublic, Static')
        if (-not $utf8OutputField) { throw }
        $utf8OutputField.SetValue($null, $utf8OutputEncoding)
    }
    try {
        & $Script
    } finally {
        if ($utf8OutputField) {
            $utf8OutputField.SetValue($null, $utf8OutputBefore)
        } else {
            [Console]::OutputEncoding = $utf8OutputBefore
        }
    }
}

function Find-MachineNames {
    <#
    .SYNOPSIS
        The lines of tracked files that name the maintainer's machine or a phone.
    .DESCRIPTION
        The working-notes folder .gitignore keeps out, the backup folders on the maintainer's
        machine that share its name, and an adb serial, a Samsung one being R5C and eight more
        letters or digits. Four fixture tests once fell back to one of those folders, which
        skipped quietly on every other machine and published this one's layout, and five scripts
        carried the test phone's serial. .gitignore is the one file allowed to name what it keeps
        out. Both patterns are built from parts, so the file holding them can't match itself.

        git grep reads bytes, so text in UTF-16 has patterns of its own: every letter followed by a
        NUL for little-endian, the way Windows PowerShell's > writes a file, or preceded by one for
        big-endian. They go through git grep's Perl regexes, which read \x00. A git built without
        them can't search, which throws like any search that doesn't run.

        With -Commit the files are read out of those commits, which is what a push publishes, and
        no worktree is needed: git grep reads them all in one pass and puts the commit in front of
        each hit, <commit>:<path>:<line>:<text>. Without it, the tracked files as they stand in the
        working tree. GIT_* variables are cleared for the search, so it reads the repository -Root
        names, and a search that doesn't run throws rather than reading as a clean tree. Every hit
        comes back as git grep prints it; none at all comes back as nothing, so callers wrap it in @().
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [string[]]$Commit,
        # A hundred commits to a git grep keeps its command line inside what Windows allows. The
        # contract tests pass a smaller one, to reach every batch with a handful of commits.
        [int]$BatchSize = 100
    )

    $commits = @($Commit | Where-Object { $_ })
    $batches = New-Object System.Collections.Generic.List[object]
    if ($commits.Count -eq 0) { $batches.Add(@()) }
    for ($i = 0; $i -lt $commits.Count; $i += $BatchSize) {
        $batches.Add(@($commits | Select-Object -Skip $i -First $BatchSize))
    }
    $hits = New-Object System.Collections.Generic.List[string]
    $saved = @{}
    foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
        $saved[$variable.Name] = $variable.Value
        Remove-Item -LiteralPath ('Env:\' + $variable.Name)
    }
    # Windows PowerShell 5.1 turns a native command's stderr into a terminating error under Stop,
    # even redirected, and git grep says why it could not search on stderr.
    $wideLe = { param([string[]]$Parts) ($Parts | ForEach-Object { "$_\x00" }) -join '' }
    $wideBe = { param([string[]]$Parts) ($Parts | ForEach-Object { "\x00$_" }) -join '' }
    $notes = @('c', 'l', 'a', 'u', 'd', 'e')
    $serial = @('R', '5', 'C')
    $scans = @(
        @{ Name = 'the notes folder'; Flags = @('-i', '-P')
            Pattern = @(($notes -join ''), (& $wideLe $notes), (& $wideBe $notes)) -join '|' }
        @{ Name = 'a phone serial'; Flags = @('-P')
            Pattern = @((($serial -join '') + '[A-Z0-9]{8}'), ((& $wideLe $serial) + '(?:[A-Z0-9]\x00){8}'),
                ((& $wideBe $serial) + '(?:\x00[A-Z0-9]){8}')) -join '|' }
    )
    # git's output is read as UTF-8 (Use-Utf8ConsoleOutput), so a hit is reported as the file has it.
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        foreach ($scan in $scans) {
            foreach ($batch in $batches) {
                $arguments = @('-C', $Root, 'grep', '-n', '-a') + $scan.Flags + @('-e', $scan.Pattern) + @($batch) +
                    @('--', '.', ':!.gitignore')
                $found = @(Use-Utf8ConsoleOutput { & git @arguments 2>$null })
                # 1 is git grep's "no match". Anything above it means the search did not run.
                if ($LASTEXITCODE -gt 1) {
                    $what = if ($batch.Count -gt 0) { "commit $($batch -join ', ')" } else { 'the tracked files' }
                    throw "git grep could not search $what in $Root for $($scan.Name)."
                }
                foreach ($line in $found) { $hits.Add([string]$line) }
            }
        }
    } finally {
        $ErrorActionPreference = $preference
        foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
    }
    $global:LASTEXITCODE = 0
    return $hits.ToArray()
}
