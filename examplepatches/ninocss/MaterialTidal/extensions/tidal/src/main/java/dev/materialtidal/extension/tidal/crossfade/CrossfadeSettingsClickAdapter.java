package dev.materialtidal.extension.tidal.crossfade;

/**
 * Click handler adapter for our Settings item.
 * At patch time, {@code CrossfadePlaybackPatch} wires this class to implement TIDAL's
 * {@code Function0} interface ({@code Lzm7;}).
 */
@SuppressWarnings("unused")
public final class CrossfadeSettingsClickAdapter {

    public Object invoke() {
        CrossfadeTidalBridge.openBottomSheetFromSettings();
        return CrossfadeTidalBridge.nativeCreateEmptyMaybe();
    }
}
