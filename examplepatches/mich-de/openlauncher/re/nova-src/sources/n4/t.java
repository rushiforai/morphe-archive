package n4;

import android.app.Notification;
import android.graphics.drawable.Icon;
import android.os.Parcelable;

/* loaded from: classes2.dex */
public abstract class t {
    public static Parcelable a(Icon icon) {
        return icon;
    }

    public static void b(Notification.Builder builder, Icon icon) {
        builder.setLargeIcon(icon);
    }
}
