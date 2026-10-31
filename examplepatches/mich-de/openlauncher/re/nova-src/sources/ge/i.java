package ge;

import android.media.metrics.MediaMetricsManager;
import android.media.metrics.NetworkEvent;
import android.media.metrics.PlaybackErrorEvent;
import android.media.metrics.TrackChangeEvent;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class i {
    public static /* bridge */ /* synthetic */ MediaMetricsManager b(Object obj) {
        return (MediaMetricsManager) obj;
    }

    public static /* synthetic */ NetworkEvent.Builder c() {
        return new NetworkEvent.Builder();
    }

    public static /* synthetic */ PlaybackErrorEvent.Builder g() {
        return new PlaybackErrorEvent.Builder();
    }

    public static /* synthetic */ TrackChangeEvent.Builder k(int i5) {
        return new TrackChangeEvent.Builder(i5);
    }
}
