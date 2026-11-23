package dev.materialtidal.extension.tidal.linn.adapter;

import dev.materialtidal.extension.tidal.linn.LinnVolumeController;

/**
 * Hardware volume button handler for remote Linn OpenHome volume control.
 * <p>
 * At patch time, {@code LinnDsmPlaybackPatch} sets its superclass to
 * {@code Landroidx/media/VolumeProviderCompat;} and rewrites {@code Object.<init>()} to
 * {@code VolumeProviderCompat.<init>(int, int, int)}.
 */
@SuppressWarnings("unused")
public final class LinnVolumeProviderAdapter {

    private final LinnVolumeController controller;

    public LinnVolumeProviderAdapter(
            int volumeControl,
            int maxVolume,
            int currentVolume,
            LinnVolumeController controller
    ) {
        this.controller = controller;
    }

    public void onSetVolumeTo(int volume) {
        controller.onHardwareSetVolumeTo(volume);
    }

    public void onAdjustVolume(int direction) {
        controller.onHardwareAdjustVolume(direction);
    }
}
