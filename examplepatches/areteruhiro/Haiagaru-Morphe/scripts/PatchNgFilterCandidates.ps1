param([Parameter(Mandatory=$true)][ValidateSet('191','226','242')][string]$Version,
      [ValidatePattern('^[a-z0-9-]+$')][string]$Candidate='ng-filter-final')
$ErrorActionPreference='Stop'
$options=if($Version -eq '191'){'build/settings-history191-options.json'}else{"build/resume-crash-fix$Version-options.json"}
$source=switch($Version){
 '191' {'C:/Users/narum/Downloads/chamate/chmate191/chmate-0-8-10-191-dev.apk'}
 '226' {'C:/Users/narum/Downloads/chamate/chmate226/ChMate_0.8.10.226+dev_APKPure.apk'}
 '242' {'C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk'}
}
& C:/Users/narum/jdk-21.0.9+10/bin/java.exe -jar C:/Users/narum/morphe-chmate-local/tools/morphe-cli-1.16.0-all.jar patch -p "build/$Candidate.mpp" --options-file $options --keystore C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore -o "build/$Candidate$Version.apk" $source *> "build/$Candidate$Version-patch.log"
if($LASTEXITCODE -ne 0){throw "Patching $Version failed"}
