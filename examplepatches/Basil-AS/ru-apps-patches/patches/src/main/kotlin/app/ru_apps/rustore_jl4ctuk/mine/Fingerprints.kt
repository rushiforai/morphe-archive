// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/mine/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.mine

import app.morphe.patcher.Fingerprint

/**
 * Matches the `MineDestination` content lambda constructor whose boolean
 * selects between `MineV2Screen` and the classic `MineScreen`.
 * RuStore 1.111.0.3 (live decompile, 2026-10) removed this fork entirely -
 * `MineDestination` is now just a bare navigation-route marker with a
 * no-arg constructor, so this fingerprint legitimately matches nothing on
 * current builds. See DisableMineRedesignPatch's null-handling.
 */
object MineDestinationClassicFlagFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, classDef ->
        classDef.sourceFile == "MineDestination.kt" &&
            method.implementation != null
    },
)
