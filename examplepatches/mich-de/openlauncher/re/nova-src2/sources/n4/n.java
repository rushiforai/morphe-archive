package n4;

import android.app.Notification;
import android.graphics.drawable.Icon;

/* loaded from: classes2.dex */
public abstract class n {
    public static void a(Notification.BigPictureStyle bigPictureStyle, Icon icon) {
        bigPictureStyle.bigPicture(icon);
    }

    public static void b(Notification.BigPictureStyle bigPictureStyle, CharSequence charSequence) {
        bigPictureStyle.setContentDescription(charSequence);
    }

    public static void c(Notification.BigPictureStyle bigPictureStyle, boolean z11) {
        bigPictureStyle.showBigPictureWhenCollapsed(z11);
    }
}
