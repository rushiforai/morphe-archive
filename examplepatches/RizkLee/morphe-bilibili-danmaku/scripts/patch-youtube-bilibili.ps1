# Requires PowerShell 7, JDK 21, Android SDK build-tools, and a clean YouTube APK.
param(
    [Parameter(Mandatory = $true)]
    [string] $ApkPath,
    [string] $OutputPath,
    [string] $KeystorePath,
    [switch] $OnlyDanmaku
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repo = Split-Path -Parent $PSScriptRoot
$patches = Join-Path $repo 'patches/build/libs/patches-2.0.3.mpp'
$desktop = Join-Path $repo 'build/desktop-tools/morphe-desktop-2.0.0-dev.5-all.jar'
$sdk = 'D:\Android\AndroidSDK\build-tools\36.1.0'
$aapt = Join-Path $sdk 'aapt.exe'
$apksigner = Join-Path $sdk 'lib/apksigner.jar'
$preferredJava = 'D:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot\bin\java.exe'

if (-not (Test-Path -LiteralPath $ApkPath -PathType Leaf)) {
    throw "找不到原版 APK：$ApkPath"
}
foreach ($file in @($patches, $desktop, $aapt, $apksigner)) {
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
        throw "缺少打补丁依赖：$file"
    }
}

$java = if (Test-Path -LiteralPath $preferredJava -PathType Leaf) {
    $preferredJava
} else {
    $command = Get-Command java -ErrorAction SilentlyContinue
    if ($null -eq $command) { throw '缺少 JDK 21 (java.exe)' }
    $command.Source
}

$source = (Resolve-Path -LiteralPath $ApkPath).Path

# Morphe marks already patched APKs with this resource. Fail before spending
# time on dex processing; Manager's AI-channel-filter error masks this cause.
Add-Type -AssemblyName 'System.IO.Compression'
$archive = [System.IO.Compression.ZipFile]::OpenRead($source)
try {
    $alreadyPatched = @($archive.Entries | Where-Object {
        $_.FullName -ieq 'MORPHE_BRANDING.TXT' -or
        $_.FullName -ilike '*/MORPHE_BRANDING.TXT'
    }).Count -gt 0
    if ($alreadyPatched) {
        throw '输入 APK 已被 Morphe 修补过（包含 MORPHE_BRANDING.TXT）。必须换用未经修改的 Google 原版 APK。'
    }
} finally {
    $archive.Dispose()
}

$badging = & $aapt dump badging $source
if ($LASTEXITCODE -ne 0) { throw 'aapt 无法读取 APK，可能不是完整的单文件 APK。' }
$packageLine = @($badging | Where-Object { $_ -match '^package:' } | Select-Object -First 1)
if ($packageLine.Count -eq 0 -or $packageLine[0] -notmatch "name='([^']+)'.*?\s+versionName='([^']+)'") {
    throw '无法识别 APK 的包名和版本。'
}
$packageName = $Matches[1]
$version = $Matches[2]
if ($packageName -ne 'com.google.android.youtube' -or $version -ne '21.30.216') {
    throw "需要 com.google.android.youtube 21.30.216，实际为 $packageName $version。"
}

& $java -jar $apksigner verify --print-certs $source
if ($LASTEXITCODE -ne 0) { throw 'APK 的原始签名无效。请下载 Google 签名的原版单文件 APK。' }

$sha256 = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash.ToLowerInvariant()
Write-Host "输入 APK 通过检查：$packageName $version；SHA-256: $sha256"
if ($sha256 -eq '3775a15129dcc4e5b80fc17b7e0841b7fdd1ca89a6e72baa798806f666c74d02') {
    Write-Host '文件哈希与 APKMirror 的 21.30.216 单文件 APK 一致。'
} else {
    Write-Warning '哈希与 APKMirror 的 universal/nodpi 单文件版本不同；请确认输入来源可信。'
}

$outDir = Join-Path $repo 'build/outputs'
New-Item -ItemType Directory -Path $outDir -Force | Out-Null
if (-not $OutputPath) {
    $OutputPath = Join-Path $outDir 'youtube-morphe-bilibili-21.30.216.apk'
}
$target = [System.IO.Path]::GetFullPath($OutputPath)
if ($target -ieq [System.IO.Path]::GetFullPath($source)) {
    throw '输出 APK 路径不能与输入 APK 相同。'
}
New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null

if (-not $KeystorePath) {
    # Gradle clean may delete build/. Keep the update-signing key in a
    # Git-ignored file at the repository root instead.
    $KeystorePath = Join-Path $repo 'morphe-bilibili.keystore'
}
$key = [System.IO.Path]::GetFullPath($KeystorePath)
$passwordFile = "$key.password.dpapi"

# Make a personal signing key on first use. Protect its random password with
# Windows DPAPI; no password is written to a plaintext file or to this script.
if (-not (Test-Path -LiteralPath $key -PathType Leaf)) {
    if (Test-Path -LiteralPath $passwordFile) {
        throw "检测到密钥密码记录但密钥文件不存在，请先恢复原密钥库：$key"
    }
    $keytool = Join-Path (Split-Path -Parent $java) 'keytool.exe'
    if (-not (Test-Path -LiteralPath $keytool -PathType Leaf)) { throw '缺少 JDK keytool.exe' }
    $random = [byte[]]::new(36)
    [System.Security.Cryptography.RandomNumberGenerator]::Fill($random)
    $keyPassword = [Convert]::ToBase64String($random)
    & $keytool -genkeypair -keystore $key -alias Morphe -keyalg RSA -keysize 3072 `
        -storetype PKCS12 -validity 36500 -dname 'CN=YouTube Morphe Personal Patch, O=Local, C=US' `
        -storepass $keyPassword -keypass $keyPassword -noprompt | Out-Null
    if ($LASTEXITCODE -ne 0) { throw '生成个人 APK 签名密钥失败' }
    ConvertTo-SecureString $keyPassword -AsPlainText -Force |
        ConvertFrom-SecureString | Set-Content -LiteralPath $passwordFile -NoNewline
    Write-Host "已生成个人签名密钥：$key（密码已由 Windows DPAPI 保护）"
}
if (-not (Test-Path -LiteralPath $passwordFile -PathType Leaf)) {
    throw "缺少此密钥的 DPAPI 密码文件：$passwordFile。请恢复原记录，不要覆盖原密钥。"
}
$securePassword = (Get-Content -LiteralPath $passwordFile -Raw) | ConvertTo-SecureString
$passwordPointer = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
try { $keyPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer) }
finally { [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($passwordPointer) }

$report = Join-Path $outDir 'patching-result.json'
$argsList = @(
    '-jar', $desktop, 'patch',
    "--patches=$patches",
    '--enable=Bilibili danmaku',
    "--out=$target",
    "--result-file=$report",
    "--keystore=$key"
    "--keystore-entry-password=$keyPassword"
    "--keystore-password=$keyPassword"
)
if ($OnlyDanmaku) { $argsList += '--exclusive' }
$argsList += $source

Write-Host "开始修补；补丁源：$patches"
Write-Host "输出：$target"
& $java @argsList
$keyPassword = $null
$argsList = $null
if ($LASTEXITCODE -ne 0) { throw "Morphe Desktop 修补失败（退出码 $LASTEXITCODE）；查看 $report。" }
if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
    throw '修补程序退出成功，但找不到预期的输出 APK。'
}
& $java -jar $apksigner verify --print-certs $target
if ($LASTEXITCODE -ne 0) { throw '输出 APK 签名验证失败。' }
Write-Host "已生成并验证 APK：$target"
Write-Warning "请保管好签名密钥 $key；电脑签名与手机 Morphe Manager 的现有签名不同，可能无法覆盖安装原来的 YouTube Morphe。"
