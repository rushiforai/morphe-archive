package com.waze.gw;

/**
 * Portrait-first manifest entry for HudActivity. Keeping this as a tiny subclass lets Android
 * establish the correct surface orientation before HudActivity.onCreate() builds any UI.
 */
public final class PortraitHudActivity extends HudActivity {
}
