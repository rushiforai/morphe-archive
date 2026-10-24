param([string]$Serial='emulator-5554')
$ErrorActionPreference='Stop'
$adb='C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'
function Read-DateUi {
    & $adb -s $Serial shell uiautomator dump /sdcard/haiagaru-date-test.xml | Out-Null
    [xml]$result=& $adb -s $Serial shell cat /sdcard/haiagaru-date-test.xml
    return $result
}
# The fixture opens in HOME pane on this emulator. Scroll only its bounded form.
& $adb -s $Serial shell input swipe 300 570 300 300 450
& $adb -s $Serial shell input swipe 300 570 300 300 450
$ui=Read-DateUi
$label=$ui.SelectSingleNode('//node[starts-with(@text,"終了日 YYYY-MM-DD")]')
if(!$label){throw 'Ending-date label not visible'}
if($label.bounds -notmatch '\[(\d+),(\d+)\]\[(\d+),(\d+)\]'){throw 'Invalid field bounds'}
$x=[int](([int]$Matches[1]+[int]$Matches[3])/2)
$y=[int](([int]$Matches[2]+[int]$Matches[4])/2)
& $adb -s $Serial shell input tap $x $y
& $adb -s $Serial shell input keyevent KEYCODE_MOVE_END
& $adb -s $Serial shell input keyevent KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL KEYCODE_DEL
& $adb -s $Serial shell input text 2
$ready=$false
for($attempt=0;$attempt -lt 3;$attempt++){
    $ui=Read-DateUi
    if($ui.SelectSingleNode('//node[@class="android.widget.EditText" and @focused="true" and @text="2"]')){$ready=$true;break}
}
if(!$ready){throw 'Ending-date input was not focused'}
& "$PSScriptRoot/TestArchiveDateInput.ps1" -Serial $Serial
