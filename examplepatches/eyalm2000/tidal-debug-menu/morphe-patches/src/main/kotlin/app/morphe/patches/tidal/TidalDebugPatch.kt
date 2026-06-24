package app.morphe.patches.tidal

import app.morphe.patcher.patch.Patch

@Suppress("UNCHECKED_CAST")
val unlockDebugMenuPatch: Patch<*> =
    TidalDebugPatchCompat.unlockDebugMenuPatch() as Patch<*>

@Suppress("UNCHECKED_CAST")
val exportDebugActivityPatch: Patch<*> =
    TidalDebugPatchCompat.exportDebugActivityPatch() as Patch<*>
