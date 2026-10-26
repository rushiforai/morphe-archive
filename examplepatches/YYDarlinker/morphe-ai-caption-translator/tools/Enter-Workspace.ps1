# Compatibility alias for the one process-scoped development environment.
[CmdletBinding()]
param()
. (Join-Path $PSScriptRoot 'workspace/Enter-Dev.ps1')
