package defpackage;

import android.app.Notification;
import android.os.Build;
import android.support.v4.media.session.MediaSessionCompat$Token;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ui8 extends b2 {
    public int[] c;
    public MediaSessionCompat$Token d;

    @Override // defpackage.b2
    public final void i0(n0c n0cVar) {
        int i = Build.VERSION.SDK_INT;
        Notification.Builder builder = (Notification.Builder) n0cVar.c;
        if (i >= 34) {
            oi8.d(builder, oi8.b(pi8.a(oi8.a(), null, 0, null, Boolean.FALSE), this.c, this.d));
        } else {
            oi8.d(builder, oi8.b(oi8.a(), this.c, this.d));
        }
    }
}
