package dev.materialtidal.extension.tidal.settings;

/**
 * Click handler adapter for the MaterialTidal Settings row in TIDAL's main Settings screen.
 * At patch time, {@code PatchSettingsPatch} wires this class to implement TIDAL's
 * {@code Function0} interface ({@code Lzm7;}).
 */
@SuppressWarnings("unused")
public final class PatchSettingsClickAdapter {

    public Object invoke() {
        PatchSettingsBridge.openPatchSettingsSheet();
        return PatchSettingsBridge.nativeCreateEmptyMaybe();
    }
}
