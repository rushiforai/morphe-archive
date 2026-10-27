[CmdletBinding()]
param([string] $Bundle, [string] $Serial)
& "$PSScriptRoot/verification/RunAndroidProbe.ps1" -Source "$PSScriptRoot/verification/UiFullscreenWindowProbe.java" -SupportSource @("$PSScriptRoot/verification/ProbeWindow.java", "$PSScriptRoot/verification/UiFullscreenStateProbe.java", "$PSScriptRoot/verification/UiWindowBarsProbe.java") -Bundle $Bundle -Serial $Serial
