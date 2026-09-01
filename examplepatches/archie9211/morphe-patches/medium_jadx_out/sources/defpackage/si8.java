package defpackage;

import android.app.Notification;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class si8 extends b2 {
    public CharSequence c;

    @Override // defpackage.b2
    public final void i0(n0c n0cVar) {
        new Notification.BigTextStyle((Notification.Builder) n0cVar.c).setBigContentTitle(null).bigText(this.c);
    }

    @Override // defpackage.b2
    public final String n0() {
        return "androidx.core.app.NotificationCompat$BigTextStyle";
    }
}
