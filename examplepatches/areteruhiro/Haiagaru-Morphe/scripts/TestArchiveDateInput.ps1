param([string]$Serial='emulator-5554')
$ErrorActionPreference='Stop'
$adb='C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'
# Fixture must already have the ending-date field focused with initial text "2".
$baseline=$null
foreach($character in @('0','2','6','-','1','0','-','2','3')){
    & $adb -s $Serial shell input text $character
    & $adb -s $Serial shell uiautomator dump /sdcard/haiagaru-date-typing.xml | Out-Null
    [xml]$ui=& $adb -s $Serial shell cat /sdcard/haiagaru-date-typing.xml
    $field=$ui.SelectSingleNode('//node[@class="android.widget.EditText" and @focused="true"]')
    if(!$field){throw 'Focused date input disappeared'}
    if(!$baseline){$baseline=$field.bounds}
    if($field.bounds -ne $baseline){throw "Input shifted: $baseline -> $($field.bounds) text=$($field.text)"}
    "PASS text=$($field.text) bounds=$($field.bounds)"
}
if($field.text -ne '2026-10-23'){throw "Unexpected date text: $($field.text)"}
'ARCHIVE_DATE_TYPING_COMPLETE 9 incremental keystrokes; stable bounds'
