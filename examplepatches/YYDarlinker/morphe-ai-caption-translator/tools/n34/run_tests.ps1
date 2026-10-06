param([string]$Label='full-final',[string[]]$Tests=@(),[string]$ExtraSource='')
$ErrorActionPreference='Stop'
$taskRepo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$taskPython=Join-Path $env:USERPROFILE '.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
$taskOutput=Join-Path $taskRepo ".verification/n34/$Label"
$env:PYTHONUTF8='1'
$env:N30_EVIDENCE_DIR=$taskOutput
$env:CAPTION_UI_PREVIEW_OUTPUT=$taskOutput
$env:N25_PREVIEW_OUTPUT=$taskOutput
$taskArguments=@((Join-Path $taskRepo 'tools/n28c/run_scheduler_tests.py'),'--output',$taskOutput,'--limit','600')
foreach($test in $Tests){$taskArguments+=@('--tests',$test)}
if($ExtraSource){$taskArguments+=@('--extra-source',$ExtraSource)}
& $taskPython @taskArguments
exit $LASTEXITCODE
