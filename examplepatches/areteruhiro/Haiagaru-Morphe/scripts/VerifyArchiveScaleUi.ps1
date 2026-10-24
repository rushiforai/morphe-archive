$ErrorActionPreference='Stop'
function Read-TextHeight([string]$Path,[string]$Label){
    [xml]$document=Get-Content -LiteralPath $Path -Raw
    $node=$document.SelectNodes('//node') | Where-Object {$_.text -eq $Label} | Select-Object -First 1
    if(!$node){throw "Missing text '$Label' in $Path"}
    $coords=[regex]::Matches($node.bounds,'\d+') | ForEach-Object {[int]$_.Value}
    return $coords[3]-$coords[1]
}
$smallControl=Read-TextHeight 'build/archive-scale70.xml' '検索'
$largeControl=Read-TextHeight 'build/archive-scale150.xml' '検索'
$smallResult=Read-TextHeight 'build/archive-scale70.xml' 'SCALE-TEST-01'
$largeResult=Read-TextHeight 'build/archive-scale150.xml' 'SCALE-TEST-01'
$mixedControl=Read-TextHeight 'build/archive-scale-mixed.xml' '検索'
$mixedResult=Read-TextHeight 'build/archive-scale-mixed.xml' 'SCALE-TEST-01'
if($largeControl -lt $smallControl*1.8 -or $largeResult -lt $smallResult*1.8){throw '70/150 percent did not change actual rendered text bounds'}
if([math]::Abs($mixedControl-$smallControl) -gt 1 -or [math]::Abs($mixedResult-$largeResult) -gt 1){throw 'Control and result font scales are not independent'}
"PASS actual Compose text heights: controls $smallControl -> $largeControl px; results $smallResult -> $largeResult px"
"PASS independent 70/150 setting: controls $mixedControl px, results $mixedResult px"
