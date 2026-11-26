package nl.johninnl.soundcloud;

import com.soundcloud.android.features.bottomsheet.track.TrackMenuItem;

/**
 * "Таймер сна" entry of the track bottom sheet menu. At runtime the superclass is the app's
 * own TrackMenuItem (public abstract class, public constructor), so the sheet renders this
 * item from the base fields like any other one:
 *   a = title string id, b = icon drawable id, c = enabled.
 *
 * The constructor call is identical to what TrackMenuItem$Info does in the app:
 *   <init>(IIZLjava/lang/Integer;Ljava/lang/Integer;I)V with default-argument mask 0x7c.
 * The class lives in the extension namespace on purpose (not in the app's package).
 */
public final class SleepTimerMenuItem extends TrackMenuItem {
    public SleepTimerMenuItem() {
        super(SleepTimerIds.titleId(), SleepTimerIds.iconId(), true, null, null, 0x7c);
    }
}
