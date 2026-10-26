# ADB per-app locale diagnostic. Original signed Taobao 10.66.30 required.
# Does not modify the APK, log in, uninstall, wipe data, or upload reports.
param([string]$Locale="en-US",[switch]$Reset,[string]$ReportDir="")
$ErrorActionPreference="Stop"
$pkg="com.taobao.taobao"
$expected="3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd"
if(-not $ReportDir){$ReportDir=Join-Path $PWD ("TaobaoLingo-"+(Get-Date -Format "yyyyMMdd-HHmmss"))}
New-Item -ItemType Directory -Path $ReportDir -Force | Out-Null
$report=New-Object System.Collections.Generic.List[string]
function Note([string]$s){$report.Add($s);Write-Host $s}
try{
  $which=Get-Command adb -ErrorAction SilentlyContinue
  if($which){$adb=$which.Source}
  else {
    if($env:OS -ne "Windows_NT"){throw "adb not found on PATH"}
    $dir=Join-Path $env:LOCALAPPDATA "TaobaoLingo"
    $adb=Join-Path $dir "platform-tools\adb.exe"
    if(-not (Test-Path $adb)){
      New-Item -ItemType Directory -Path $dir -Force | Out-Null
      $archive=Join-Path $dir "platform-tools.zip"
      Invoke-WebRequest "https://dl.google.com/android/repository/platform-tools-latest-windows.zip" -OutFile $archive
      Expand-Archive $archive -DestinationPath $dir -Force
      Remove-Item $archive
    }
  }
  $devices=@(& $adb devices | Where-Object {$_ -match "^\S+\s+device\s*$"})
  if($devices.Count -ne 1){throw "Authorize one USB-debugging Android phone and retry"}
  $api=(& $adb shell getprop ro.build.version.sdk | Out-String).Trim()
  Note "Android API: $api"
  if([int]$api -lt 33){throw "Android 13+ required"}
  $paths=@(& $adb shell pm path $pkg | Where-Object {$_ -match "^package:.*base\.apk\s*$"})
  if(-not $paths){throw "Taobao not installed"}
  $base=$paths[0].Substring(8).Trim()
  $sum=(& $adb shell sha256sum $base 2>&1 | Out-String)
  $hash=if($sum -match "([a-fA-F0-9]{64})"){$Matches[1].ToLowerInvariant()}else{"unknown"}
  Note "Installed APK hash: $hash"
  if($hash -ne $expected){throw "The installed APK is not the original signed 10.66.30 build. This probe intentionally will not mix re-signed APK behavior with Android's built-in locale feature."}
  Note "Locale before: $((& $adb shell cmd locale get-app-locales $pkg 2>&1 | Out-String).Trim())"
  if($Reset){$result=(& $adb shell "cmd locale set-app-locales $pkg --locales ''" 2>&1 | Out-String)}
  else {$result=(& $adb shell cmd locale set-app-locales $pkg --locales $Locale 2>&1 | Out-String)}
  if($LASTEXITCODE -ne 0 -or $result -match "(?i)exception|permission denial|unknown command"){throw "Android locale command failed: $result"}
  Note "Locale after: $((& $adb shell cmd locale get-app-locales $pkg 2>&1 | Out-String).Trim())"
  & $adb shell am force-stop $pkg | Out-Null
  & $adb shell monkey -p $pkg -c android.intent.category.LAUNCHER 1 2>&1 | Out-File (Join-Path $ReportDir "launch.txt")
  Start-Sleep -Seconds 18
  & $adb shell screencap -p /sdcard/Download/taobao_home.png | Out-Null
  & $adb pull /sdcard/Download/taobao_home.png (Join-Path $ReportDir "home.png") 2>&1 | Out-Null
  & $adb shell uiautomator dump /sdcard/Download/taobao_home.xml 2>&1 | Out-Null
  & $adb pull /sdcard/Download/taobao_home.xml (Join-Path $ReportDir "home.xml") 2>&1 | Out-Null
  $size=(& $adb shell wm size | Out-String)
  if($size -match "(\d+)x(\d+)"){
    & $adb shell input tap ([int]([double]$Matches[1]*.9)) ([int]([double]$Matches[2]*.945)) | Out-Null
    Start-Sleep -Seconds 10
    & $adb shell screencap -p /sdcard/Download/taobao_account.png | Out-Null
    & $adb pull /sdcard/Download/taobao_account.png (Join-Path $ReportDir "account.png") 2>&1 | Out-Null
  }
  & $adb logcat -d -t 4000 -v threadtime 2>&1 | Out-File (Join-Path $ReportDir "logcat_PRIVATE.txt")
  Note "Captured screenshots, UI XML, and logcat locally."
}
catch{Note ("ERROR: "+$_.Exception.Message)}
finally{
  $report | Out-File (Join-Path $ReportDir "summary.txt")
  "Before sharing, redact screenshots and logcat_PRIVATE.txt: they may contain personal data. Nothing is uploaded." | Out-File (Join-Path $ReportDir "PRIVACY.txt")
  Write-Host "Report: $ReportDir"
}
