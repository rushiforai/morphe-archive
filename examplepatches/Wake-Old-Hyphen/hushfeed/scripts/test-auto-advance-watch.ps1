[CmdletBinding()]
param([string]$Root=(Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference='Stop'
$script:passed=0
function Assert-Watch([bool]$Condition,[string]$Message){if(-not $Condition){throw $Message};$script:passed++}
$base=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$work=Join-Path $base ('hushfeed-watch-test-'+[guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try{
 $evidencePath=Join-Path $Root 'audit/evidence.ps1';$runnerPath=Join-Path $Root 'audit/run-audit.ps1'
 $syntax=[Management.Automation.Language.Parser]::ParseFile($evidencePath,[ref]$null,[ref]$null)
 foreach($name in @('Get-AuditProbePreconditionProblem','Get-AuditCatalogProblems')){$fn=$syntax.Find({param($n)$n -is [Management.Automation.Language.FunctionDefinitionAst] -and $n.Name -ceq $name},$true);if(-not $fn){throw ('Missing affected function '+$name)};. ([scriptblock]::Create($fn.Extent.Text))}
 $syntax=[Management.Automation.Language.Parser]::ParseFile($runnerPath,[ref]$null,[ref]$null)
 foreach($name in @('Invoke-Check','Test-Pattern')){$fn=$syntax.Find({param($n)$n -is [Management.Automation.Language.FunctionDefinitionAst] -and $n.Name -ceq $name},$true);. ([scriptblock]::Create($fn.Extent.Text))}
 function Write-Marker{[pscustomobject]@{id='watch_fixture';since='fixture'}}
 function Restart-TikTok{}
 function Start-Sleep{param($Milliseconds)}
 function Save-Shot([string]$Name){'watch-fixture.png'}
 function Save-Evidence([string]$Name,[string]$Text){$leaf=[guid]::NewGuid().ToString('N')+'.txt';[IO.File]::WriteAllText((Join-Path $work $leaf),$Text);return $leaf}
 function Invoke-AuditProbe{return $script:watchReply}
 $deviceUp=$true
 $entry=[pscustomobject]@{name='Automatic video advance';kind='runtime';category='Playback';settings=@()}
 foreach($case in @(
  @{text='ok startwatch done conclusive=false advanceObserved=false';status='inconclusive'},
  @{text='ok startwatch done conclusive=true advanceObserved=false';status='fail'},
  @{text='ok startwatch done conclusive=true advanceObserved=true';status='pass'}
 )){
  $script:watchReply=$case.text
  $step=[pscustomobject]@{probe='startwatch';expect='\badvanceObserved=true\b';preconditionExpect='\bconclusive=true\b'}
  $check=[pscustomobject]@{id='watch';auto=$true;steps=@($step)};$restarted=$false
  $result=Invoke-Check $entry $check @{} ([ref]$restarted)
  Assert-Watch ($result.status -ceq $case.status) ('Wrong native observation verdict: '+$result.status)
  Assert-Watch (([IO.File]::ReadAllText((Join-Path $work $result.evidence[0]))) -ceq $case.text) 'Native observation evidence was lost.'
 }
 $catalog=Get-Content -LiteralPath (Join-Path $Root 'audit/catalog.json') -Raw|ConvertFrom-Json
 $stopEntry=@($catalog|Where-Object name -CEQ 'Stop video looping')[0]
 foreach($case in @(
  @{id='video-stops-at-end';text='ok startwatch done conclusive=true initialCurrentUnchanged=true loopObserved=false stoppedAtEndObserved=true stoppedAtEndHeuristic=true advanceObserved=false';status='pass'},
  @{id='video-stops-at-end';text='ok startwatch done conclusive=true initialCurrentUnchanged=true loopObserved=true stoppedAtEndObserved=false advanceObserved=false';status='fail'},
  @{id='video-stops-at-end';text='ok startwatch done conclusive=false initialCurrentUnchanged=true loopObserved=false stoppedAtEndObserved=false advanceObserved=false';status='inconclusive'},
  @{id='video-loops-when-off';text='ok startwatch done conclusive=true initialCurrentUnchanged=true loopObserved=true stoppedAtEndObserved=false advanceObserved=false';status='pass'},
  @{id='video-loops-when-off';text='ok startwatch done conclusive=true initialCurrentUnchanged=true loopObserved=false stoppedAtEndObserved=true advanceObserved=false';status='fail'},
  @{id='video-loops-when-off';text='ok startwatch done conclusive=false initialCurrentUnchanged=false loopObserved=false stoppedAtEndObserved=false advanceObserved=false';status='inconclusive'}
 )){
  $script:watchReply=$case.text;$definition=@($stopEntry.checks|Where-Object id -CEQ $case.id)[0]
  $watchStep=@($definition.steps|Where-Object probe -CEQ 'startwatch')[0]
  $runtimeCheck=[pscustomobject]@{id=$definition.id;auto=$definition.auto;steps=@($watchStep)};$restarted=$false
  $result=Invoke-Check $stopEntry $runtimeCheck @{} ([ref]$restarted)
  Assert-Watch ($result.status -ceq $case.status) ('Wrong stopped-loop observation verdict: '+$result.status)
 }
 $allWatchSteps=@($catalog|ForEach-Object{$_.checks}|ForEach-Object{$_.steps}|Where-Object probe -CEQ 'startwatch')
 Assert-Watch ($allWatchSteps.Count -eq 4) 'An existing startwatch consumer was missed.'
 foreach($step in $allWatchSteps){Assert-Watch ($step.preconditionExpect -ceq '\bconclusive=true\b' -and -not $step.extras.holder -and -not $step.extras.getter -and $step.expect -notmatch 'current@|restart@') 'Legacy watcher consumer remains.'}
 Assert-Watch (@($catalog|Where-Object name -CEQ 'Limit background traffic')[0].notes.Contains('not rendered first-frame latency')) 'Traffic notes still claim a first-frame measurement.'
 foreach($bad in @('',42,'[')){
  $invalid=[pscustomobject]@{name='Watch';checks=@([pscustomobject]@{id='watch';steps=@([pscustomobject]@{probe='startwatch';preconditionExpect=$bad})})}
  Assert-Watch (@(Get-AuditCatalogProblems @($invalid)).Count -gt 0) 'Invalid probe precondition accepted.'
 }
 $badKind=[pscustomobject]@{name='Watch';checks=@([pscustomobject]@{id='watch';steps=@([pscustomobject]@{wait=100;preconditionExpect='ready'})})}
 Assert-Watch (@(Get-AuditCatalogProblems @($badKind)).Count -gt 0) 'Non-probe observation precondition accepted.'
 $source=Join-Path $Root 'tools/verification-probe/src/app/hushfeed/verification'
 $native=[IO.File]::ReadAllText((Join-Path $source 'AutoAdvanceWatch.java'))
 Assert-Watch ($native -notmatch '"LJIILL"|"getPlayerManager"|\.performClick\(|\.dispatchTouchEvent\(') 'Watcher warms a manager or dispatches input.'
 $probe=[IO.File]::ReadAllText((Join-Path $source 'Probe.java'))
 $body=[regex]::Match($probe,'(?s)case "startwatch":.*?(?=case "holdslide":)').Value
 Assert-Watch ($body -notmatch 'identityHashCode|video [0-9]|LJIILL' -and $body.Contains('AutoAdvanceWatch.start(loader, intent)')) 'Ordinal/global-player watcher remains in the dispatcher.'
 $java='C:/Program Files/Android/Android Studio/jbr/bin/java.exe';$javac=Join-Path (Split-Path -Parent $java) 'javac.exe'
 if(-not (Test-Path -LiteralPath $javac)){throw 'The verified host JDK is required for the watcher contracts.'}
 & $javac -J-Xmx128m -J-XX:ActiveProcessorCount=2 --release 11 -d $work (Join-Path $source 'AutoAdvanceWatchState.java') (Join-Path $Root 'tools/verification-probe/tests/AutoAdvanceWatchStateTest.java')
 if($LASTEXITCODE -ne 0){throw 'Native watcher contract compilation failed.'}
 & $java -Xmx128m -XX:ActiveProcessorCount=2 -classpath $work app.hushfeed.verification.AutoAdvanceWatchStateTest
 if($LASTEXITCODE -ne 0){throw 'Native watcher source/owner contracts failed.'}
 $platforms=Join-Path $env:LOCALAPPDATA 'Android/Sdk/platforms'
 $platform=@(Get-ChildItem -LiteralPath $platforms -Directory|Where-Object{Test-Path -LiteralPath (Join-Path $_.FullName 'android.jar')}|Sort-Object {[int]($_.Name -replace '\D','')} -Descending)[0]
 if(-not $platform){throw 'The verified Android SDK is required for native watcher type checking.'}
 $tagStub=Join-Path $work 'Probe.java'
 [IO.File]::WriteAllText($tagStub,'package app.hushfeed.verification; final class Probe { static final String TAG="HushfeedProbe"; }')
 & $javac -J-Xmx128m -J-XX:ActiveProcessorCount=2 --release 11 -classpath (Join-Path $platform.FullName 'android.jar') -d $work $tagStub (Join-Path $source 'AutoAdvanceWatchState.java') (Join-Path $source 'AutoAdvanceWatch.java')
 if($LASTEXITCODE -ne 0){throw 'Native watcher Android type check failed.'}
 Assert-Watch $true 'Native watcher compiled against the actual Android SDK.'
 Write-Host ('[audit] '+$script:passed+' watcher dispatch/precondition contracts passed')
}finally{
 $absolute=[IO.Path]::GetFullPath($work)
 if(-not $absolute.StartsWith($base.TrimEnd('\','/')+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase) -or [IO.Path]::GetFileName($absolute) -cnotmatch '^hushfeed-watch-test-[a-f0-9]{32}$'){throw 'Watcher test cleanup path rejected.'}
 Remove-Item -LiteralPath $absolute -Recurse -Force
}
