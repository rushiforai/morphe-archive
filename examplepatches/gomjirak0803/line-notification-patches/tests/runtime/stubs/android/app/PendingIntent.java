package android.app;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;

public final class PendingIntent implements Parcelable {
    public static final int FLAG_UPDATE_CURRENT = 134217728;
    public static final int FLAG_IMMUTABLE = 67108864;

    private final String kind;
    private final Intent intent;

    private PendingIntent(String kind, Intent intent) {
        this.kind = kind;
        this.intent = intent;
    }

    public static PendingIntent getActivity(Context context, int requestCode, Intent intent, int flags) {
        return new PendingIntent("activity", intent);
    }

    public static PendingIntent getService(Context context, int requestCode, Intent intent, int flags) {
        return new PendingIntent("service", intent);
    }

    public String getKindForTest() { return kind; }
    public Intent getIntentForTest() { return intent; }
    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}
}
