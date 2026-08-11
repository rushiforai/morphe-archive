[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidatePattern('^[a-z0-9]+(?:-[a-z0-9]+)*$')][string]$Id,
    [Parameter(Mandatory)][ValidatePattern('^[a-z][a-z0-9]*$')][string]$Category,
    [Parameter(Mandatory)][string]$Name
)

. "$PSScriptRoot\Common.ps1"
$repo = Get-RepoRoot
$packageId = ($Id -split '-' | ForEach-Object { $_ }) -join ''
$patcher = Join-Path $repo "patches\src\main\kotlin\io\github\liongalahad\nuviotv\patches\$Category\$packageId"
$extension = Join-Path $repo "extensions\extension\src\main\java\io\github\liongalahad\nuviotv\extension\$Category\$packageId"
$testing = Join-Path $repo "testing\patches\$Id"
$local = Join-Path $repo "local\patches\$Id"
foreach ($path in @($patcher, $extension, $testing, $local)) {
    if (Test-Path $path) { throw "Refusing to overwrite existing compartment: $path" }
    New-Item -ItemType Directory -Force $path | Out-Null
}

@"
package io.github.liongalahad.nuviotv.patches.$Category.$packageId

import app.morphe.patcher.patch.bytecodePatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

@Suppress("unused")
val ${packageId}Patch = bytecodePatch(name = "$Name", description = "TODO", default = false) {
    compatibleWith(NUVIO_COMPATIBILITY)
    extendWith("extensions/nuviotv.mpe")
    execute { error("TODO: implement exact structural fingerprints before enabling this patch") }
}
"@ | Set-Content -Encoding UTF8 (Join-Path $patcher 'Patch.kt')

@"
package io.github.liongalahad.nuviotv.extension.$Category.$packageId;

/** Runtime code for $Name. */
public final class Extension {
    private Extension() {}
}
"@ | Set-Content -Encoding UTF8 (Join-Path $extension 'Extension.java')

@"
{
  "`$schema": "../patch.schema.json",
  "id": "$Id",
  "name": "$Name",
  "category": "$Category",
  "target": {"application":"NuvioTV","package":"com.nuvio.tv","versions":["0.8.3-beta"],"launchComponent":"com.nuvio.tv/.MainActivity"},
  "assets": {
    "universal": {"url":"TODO","sha256":"TODO"},
    "x86_64": {"url":"TODO","sha256":"TODO"},
    "arm64-v8a": {"url":"TODO","sha256":"TODO"},
    "armeabi-v7a": {"url":"TODO","sha256":"TODO"}
  },
  "dependencies": [],
  "fingerprints": ["TODO"],
  "acceptance": ["TODO"]
}
"@ | Set-Content -Encoding UTF8 (Join-Path $testing 'patch.json')

@"
# $Name

Patch ID: `$Id`. Describe user-visible behavior, scope, defaults, storage, and exclusions here.
"@ | Set-Content -Encoding UTF8 (Join-Path $testing 'README.md')

@"
# Test plan

- [ ] Unit tests cover OFF/default, expected behavior, malformed inputs, and immutability.
- [ ] Every fingerprint matches exactly once on each declared asset.
- [ ] Exclusive patch application succeeds and post-patch inspection passes.
- [ ] Phone Manager test passes when applicable.
- [ ] TV AVD navigation, persistence, playback, screenshot, and log checks pass.
- [ ] Real Android TV report is committed before stable release.
"@ | Set-Content -Encoding UTF8 (Join-Path $testing 'TEST_PLAN.md')

@"
# Porting notes

Record source behavior, structural fingerprint rationale, target-version evidence, deliberate omissions, and future-version changes here.
"@ | Set-Content -Encoding UTF8 (Join-Path $testing 'PORTING_NOTES.md')

[pscustomobject]@{ Id = $Id; Patcher = $patcher; Extension = $extension; Tests = $testing; Local = $local }
