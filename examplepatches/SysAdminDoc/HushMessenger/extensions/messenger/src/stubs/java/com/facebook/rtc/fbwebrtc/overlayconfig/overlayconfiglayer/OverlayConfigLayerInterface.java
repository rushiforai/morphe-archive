package com.facebook.rtc.fbwebrtc.overlayconfig.overlayconfiglayer;

public interface OverlayConfigLayerInterface {
    int getLayerSource();

    int[] getUpdatedValues();

    int[] getValues();

    void logExposure(int id);
}
