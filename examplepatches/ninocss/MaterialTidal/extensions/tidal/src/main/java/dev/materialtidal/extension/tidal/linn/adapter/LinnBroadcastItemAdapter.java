package dev.materialtidal.extension.tidal.linn.adapter;

/**
 * Broadcast device item model for discovered Linn OpenHome speakers.
 * <p>
 * At patch time, {@code LinnDsmPlaybackPatch} sets its superclass to TIDAL's {@code Ly92;}
 * and rewrites the {@code Object.<init>()} call to {@code Ly92.<init>(String, String, int)}.
 */
@SuppressWarnings("unused")
public final class LinnBroadcastItemAdapter {

    public final String deviceItemId;
    public final String deviceUdn;
    public final String subtitleText;

    public LinnBroadcastItemAdapter(
            String id,
            String name,
            int subtitleResId,
            String deviceUdn,
            String subtitleText
    ) {
        this.deviceItemId = id;
        this.deviceUdn = deviceUdn;
        this.subtitleText = subtitleText;
    }

    /**
     * Enables remote volume control in {@code MusicService} ({@code Ly92;->a()Z}).
     */
    public boolean a() {
        return true;
    }
}
