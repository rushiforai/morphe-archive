package dev.materialtidal.extension.tidal.crossfade;

/**
 * Settings item adapter injected into TIDAL's Audio & Playback settings screen.
 * At patch time, {@code CrossfadePlaybackPatch} adds TIDAL's {@code SettingsItem} interface
 * ({@code Lcom/aspiro/wamp/settings/a;}) with forwarding methods {@code a()} and {@code b()}.
 */
@SuppressWarnings("unused")
public final class CrossfadeSettingsItemAdapter {

    private final CrossfadeSettingsClickAdapter clickHandler = new CrossfadeSettingsClickAdapter();
    private volatile Object viewState;

    public CrossfadeSettingsItemAdapter() {
        refreshImpl();
    }

    public Object getViewStateImpl() {
        Object current = this.viewState;
        if (current == null) {
            refreshImpl();
            current = this.viewState;
        }
        return current;
    }

    public void refreshImpl() {
        int seconds = CrossfadeTidalBridge.readDurationSeconds();
        String title = CrossfadeEngine.getSettingsRowTitle();
        String subtitle = CrossfadeEngine.getSettingsRowSubtitle();
        String trailing = CrossfadeEngine.getDurationBadgeText(seconds);
        this.viewState = CrossfadeTidalBridge.nativeCreateSettingsRowViewState(
                title,
                subtitle,
                trailing,
                clickHandler
        );
    }
}
