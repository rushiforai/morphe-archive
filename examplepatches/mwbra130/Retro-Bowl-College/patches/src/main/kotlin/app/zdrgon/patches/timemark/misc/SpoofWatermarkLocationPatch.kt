package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.timemark.shared.Constants.COMPATIBILITY_TIMEMARK

/**
 * Timemark — Spoof watermark location.
 *
 * Modeled on hxreborn's BeReal "Custom location" patch
 * (github.com/hxreborn/morphe-patches): no coordinates are baked
 * in at patch time. Instead the user picks the location at
 * runtime, on an OpenStreetMap pin-drop picker in the patch
 * settings (Timemark's settings tab gains a real "Timemark
 * patches" row — see TimemarkSettingsPatch), the choice is saved
 * in the app's SharedPreferences, and this hook applies it to
 * every new GPS fix. Changing the location never needs a
 * re-patch; turning the custom location off (or clearing it in
 * the picker) restores real GPS behavior exactly.
 *
 * The hook sits at Timemark's single location funnel,
 * GlobalLocationService.refreshPlace — the only subclass entry
 * of the location engine, through which every fix flows before
 * it is resolved into the watermark's LocationInfoData (server
 * place list + Geocoder). The fix object (Lry/c;) carries the
 * position in two public double fields, a = latitude and
 * b = longitude. refreshPlace's own prologue copies the fix
 * from its parameter register (v33) into v4; the hook is
 * inserted immediately after that copy and hands v4 to the
 * extension's SpoofLocation.applyToFix, which overwrites a/b
 * from the saved coordinates when a custom location is set, and
 * does nothing otherwise. Because the overwrite happens at the
 * funnel, the server place lookup, the geocoder, the geo-cache
 * keys and the composed watermark text all follow the picked
 * location — there is no separate text funnel to spoof.
 *
 * (An earlier design wrote patch-option coordinates straight
 * into v33; that is impossible in dex — iput-wide is format 22c
 * with 4-bit register fields — and was replaced by this runtime
 * design, which is also what Matsen asked for: pick on a map,
 * not typed numbers.)
 *
 * Default: on. With no location picked (the state right after
 * patching) the hook is a no-op and photos keep the real GPS
 * location; the patch only changes anything once the user picks
 * a location in the settings, so the default cannot silently
 * mislabel photos.
 */
@Suppress("unused")
val spoofWatermarkLocationPatch = bytecodePatch(
    name = "Spoof watermark location",
    description = "Stamps photos with a location you pick on an OpenStreetMap pin-drop map (Timemark settings → Timemark patches) instead of your real GPS location. Off or unpicked means real GPS; change it any time without re-patching.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TIMEMARK)

    dependsOn(timemarkSettingsPatch)

    execute {
        // Insert right after the stock prologue copy that lands
        // the fix in v4 (index 1), i.e. at index 2 — before the
        // null-check and any use of the fix.
        RefreshPlaceFingerprint.method.addInstructions(
            2,
            """
                invoke-static { v4 }, Lapp/template/extension/timemark/SpoofLocation;->applyToFix(Ljava/lang/Object;)V
            """.trimIndent()
        )
    }
}
