package dev.materialtidal.extension.tidal.linn.adapter;

import dev.materialtidal.extension.tidal.linn.LinnVolumeController;

/**
 * Patch-time adapter implementing {@code Llwj;} ({@code BroadcastVolumeControl}).
 */
@SuppressWarnings("unused")
public final class LinnVolumeControlAdapter {

    private final LinnVolumeController controller;

    public LinnVolumeControlAdapter(LinnVolumeController controller) {
        this.controller = controller;
    }

    public Object getMaxVolumeSubjectImpl() {
        return controller.getMaxVolumeSubject();
    }

    public Object getUpdateVolumeSubjectImpl() {
        return controller.getUpdateVolumeSubject();
    }

    public void startListening() {
        controller.startListening();
    }

    public void stopListening() {
        controller.stopListening();
    }

    public void updateVolume(int volume) {
        controller.onSliderVolumeChanged(volume);
    }
}
