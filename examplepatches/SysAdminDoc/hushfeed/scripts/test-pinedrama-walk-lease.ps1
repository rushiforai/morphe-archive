[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $Root 'tools/verification-probe/pinedrama-core.ps1')
$script:assertions = 0
function Assert-PineLease([bool]$Condition, [string]$Message) { $script:assertions++; if (-not $Condition) { throw $Message } }
function Assert-PineLeaseThrows([scriptblock]$Action, [string]$Message) {
    $rejected = $false
    try { & $Action } catch { $rejected = $true }
    Assert-PineLease $rejected $Message
}
function Get-PineLeaseRecordHash($OwnedLease) {
    return Get-AuditHash ((Read-DeviceLeaseRecord $OwnedLease) | ConvertTo-Json -Depth 8 -Compress)
}
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\','/')
$directory = Join-Path $tempRoot ('hushfeed-pine-walk-lease-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($directory)
$caller = $null
try {
    $owned = New-PineDramaWalkLease -Serial fixture-pine -LeaseDir $directory -ChatIdentity host-contract
    $ownedPath = $owned.Lease.Path
    Assert-PineLease ($owned.OwnedByWalk -and (Test-DeviceLease $owned.Lease)) 'Standalone acquisition failed.'
    $driverFailed = $false
    try { throw 'Synthetic driver error.' } catch { $driverFailed = $true }
    finally { Remove-PineDramaWalkLease -Context $owned }
    Assert-PineLease ($driverFailed -and -not (Test-Path -LiteralPath $ownedPath) -and $null -eq $owned.Lease.Stream) 'Standalone driver failure did not release its own lease.'

    $caller = New-DeviceLease -LeaseDir $directory -Serial fixture-pine -Project hushfeed -ChatIdentity controller-contract -Purpose host-only -LeaseMinutes 1
    $before = Read-DeviceLeaseRecord $caller
    $borrowed = New-PineDramaWalkLease -Serial fixture-pine -Lease $caller
    $after = Read-DeviceLeaseRecord $caller
    Assert-PineLease (-not $borrowed.OwnedByWalk -and [object]::ReferenceEquals($borrowed.Lease,$caller)) 'The controller lease was replaced.'
    Assert-PineLease ([DateTimeOffset]::Parse($after.expiresUtc) -gt [DateTimeOffset]::Parse($before.expiresUtc)) 'The live controller lease was not renewed.'
    Remove-PineDramaWalkLease -Context $borrowed
    Assert-PineLease ((Test-Path -LiteralPath $caller.Path) -and (Test-DeviceLease $caller)) 'Successful cleanup released the controller lease.'
    $driverFailed = $false
    try { throw 'Synthetic driver error.' } catch { $driverFailed = $true }
    finally { Remove-PineDramaWalkLease -Context $borrowed }
    Assert-PineLease ($driverFailed -and (Test-DeviceLease $caller)) 'Driver failure released the controller lease.'

    $recordHash = Get-PineLeaseRecordHash $caller
    Assert-PineLeaseThrows { New-PineDramaWalkLease -Serial fixture-pine -LeaseDir $directory -ChatIdentity controller-contract | Out-Null } 'An active lease was acquired a second time.'
    Remove-PineDramaWalkLease -Context $null
    Assert-PineLease ((Get-PineLeaseRecordHash $caller) -ceq $recordHash -and (Test-DeviceLease $caller)) 'Failed acquisition altered or released the active owner.'
    Assert-PineLeaseThrows { New-PineDramaWalkLease -Serial other-fixture -Lease $caller | Out-Null } 'A controller lease for another serial was accepted.'
    Assert-PineLease ((Get-PineLeaseRecordHash $caller) -ceq $recordHash) 'Wrong-serial validation renewed the caller lease.'

    $foreign = [pscustomobject]@{ Path = $caller.Path; Serial = $caller.Serial; OwnershipToken = '0' * 32; Stream = $caller.Stream }
    Assert-PineLeaseThrows { New-PineDramaWalkLease -Serial fixture-pine -Lease $foreign | Out-Null } 'A foreign ownership token was accepted.'
    Assert-PineLease ((Test-DeviceLease $caller) -and (Get-PineLeaseRecordHash $caller) -ceq $recordHash) 'Foreign-token rejection changed the genuine owner.'
    Assert-PineLeaseThrows { New-PineDramaWalkLease -Serial fixture-pine -Lease ([pscustomobject]@{}) | Out-Null } 'A malformed controller object was accepted.'

    $expired = Read-DeviceLeaseRecord $caller
    $liveExpiry = $expired.expiresUtc
    $expired.expiresUtc = [DateTime]::UtcNow.AddMinutes(-1).ToString('o')
    Write-DeviceLeaseRecord -Lease $caller -Record $expired
    $expiredHash = Get-PineLeaseRecordHash $caller
    Assert-PineLeaseThrows { New-PineDramaWalkLease -Serial fixture-pine -Lease $caller | Out-Null } 'An expired caller lease was resurrected.'
    Assert-PineLease ((Get-PineLeaseRecordHash $caller) -ceq $expiredHash -and $null -ne $caller.Stream) 'Expired-lease rejection wrote or closed the caller lease.'
    # This host-only fixture owns the stream and has sent no device commands. Restore it for cleanup.
    $expired.expiresUtc = $liveExpiry
    Write-DeviceLeaseRecord -Lease $caller -Record $expired

    $ast = [Management.Automation.Language.Parser]::ParseFile((Join-Path $Root 'scripts/walk-pinedrama.ps1'),[ref]$null,[ref]$null)
    $leaseParameter = @($ast.ParamBlock.Parameters | Where-Object { $_.Name.VariablePath.UserPath -ceq 'Lease' })
    Assert-PineLease ($leaseParameter.Count -eq 1) 'Driver has no in-process lease parameter.'
    $cleanup = @($ast.FindAll({ param($node)
        $node -is [Management.Automation.Language.TryStatementAst] -and $null -ne $node.Finally -and
        @($node.Finally.FindAll({ param($command) $command -is [Management.Automation.Language.CommandAst] -and $command.GetCommandName() -ceq 'Remove-PineDramaWalkLease' },$true)).Count -eq 1
    },$true))
    Assert-PineLease ($cleanup.Count -ge 1) 'Driver errors bypass ownership-aware cleanup.'
    $directRelease = @($ast.FindAll({ param($node) $node -is [Management.Automation.Language.CommandAst] -and $node.GetCommandName() -ceq 'Remove-DeviceLease' },$true))
    Assert-PineLease ($directRelease.Count -eq 0) 'Driver can directly release the controller lease.'
    Write-Output "PineDrama walk lease contracts passed ($script:assertions assertions). Real host lease files, no device actions."
} finally {
    if ($caller) { Remove-DeviceLease -Lease $caller -WarnOnFailure }
    $absolute = [IO.Path]::GetFullPath($directory)
    if (-not $absolute.StartsWith($tempRoot + [IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase) -or
            [IO.Path]::GetFileName($absolute) -cnotmatch '^hushfeed-pine-walk-lease-[a-f0-9]{32}$') { throw 'Owned PineDrama lease fixture cleanup guard failed.' }
    Remove-Item -LiteralPath $absolute -Recurse -Force
}
