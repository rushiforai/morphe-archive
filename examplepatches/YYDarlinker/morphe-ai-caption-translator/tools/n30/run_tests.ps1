param([string]$Label='full-final',[string[]]$Tests=@())
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$python=Join-Path $env:USERPROFILE '.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
$out=Join-Path $repo ".verification/n30/$Label"
$env:N30_EVIDENCE_DIR=$out
$env:CAPTION_UI_PREVIEW_OUTPUT=$out
$env:N25_PREVIEW_OUTPUT=$out
$args=@((Join-Path $repo 'tools/n28c/run_scheduler_tests.py'),'--output',$out,'--limit','600')
foreach($test in $Tests){$args+=@('--tests',$test)}
& $python @args
if($LASTEXITCODE -ne 0){throw "N30 tests failed: $Label"}
