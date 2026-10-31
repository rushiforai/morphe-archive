param([string]$Source='smali',[string]$Version='d92701d947')
$ErrorActionPreference='Stop'
$scope=$PSScriptRoot
$env:JAVA_HOME='C:\Program Files\Microsoft\jdk-17.0.20.101-hotspot'
$env:GRADLE_USER_HOME="$scope\BuildCache\Gradle 8"
$env:GRADLE_RO_DEP_CACHE=(Join-Path $env:USERPROFILE '.gradle\caches')
$env:TMP="$scope\BuildCache\Temp";$env:TEMP=$env:TMP
$env:JAVA_TOOL_OPTIONS='-XX:-UsePerfData'
$gradle89 = if ($env:GRADLE_8_9_HOME) { Join-Path $env:GRADLE_8_9_HOME 'bin/gradle.bat' } else { Get-ChildItem -Path "$env:USERPROFILE/.gradle/wrapper/dists/gradle-8.9-bin/*/gradle-8.9/bin/gradle.bat" -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName }
if (-not $gradle89 -or -not (Test-Path -LiteralPath $gradle89)) { throw 'Install Gradle 8.9 or set GRADLE_8_9_HOME before building pinned Smali.' }
& $gradle89 `
    -p "$scope\BuildSources\$Source" --no-daemon --console=plain --max-workers=4 `
    "-Duser.home=$scope\BuildCache\Home" "-Djava.io.tmpdir=$env:TMP" `
    "-Dmaven.repo.local=$scope\BuildCache\Maven" `
    "-DbdsmaliVersion=$Version" `
    -I "$scope\BuildSources\smali-local.init.gradle" `
    :smali:publishToMavenLocal :dexlib2:publishToMavenLocal :util:publishToMavenLocal `
    -x javadoc
exit $LASTEXITCODE
