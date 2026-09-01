package defpackage;

import android.app.Notification;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Build;
import androidx.core.graphics.drawable.IconCompat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ri8 extends b2 {
    public IconCompat c;
    public IconCompat d;
    public boolean e;

    @Override // defpackage.b2
    public final void i0(n0c n0cVar) {
        Bitmap bitmapA;
        Notification.Builder builder = (Notification.Builder) n0cVar.c;
        Context context = (Context) n0cVar.b;
        Notification.BigPictureStyle bigContentTitle = new Notification.BigPictureStyle(builder).setBigContentTitle(null);
        IconCompat iconCompat = this.c;
        if (iconCompat != null) {
            if (Build.VERSION.SDK_INT >= 31) {
                qi8.a(bigContentTitle, gsa.q0(iconCompat, context));
            } else if (iconCompat.d() == 1) {
                IconCompat iconCompat2 = this.c;
                int i = iconCompat2.a;
                if (i == -1) {
                    Object obj = iconCompat2.b;
                    bitmapA = obj instanceof Bitmap ? (Bitmap) obj : null;
                } else if (i == 1) {
                    bitmapA = (Bitmap) iconCompat2.b;
                } else {
                    if (i != 5) {
                        ik4.o("called getBitmap() on ", iconCompat2);
                        return;
                    }
                    bitmapA = IconCompat.a((Bitmap) iconCompat2.b, true);
                }
                bigContentTitle = bigContentTitle.bigPicture(bitmapA);
            }
        }
        if (this.e) {
            IconCompat iconCompat3 = this.d;
            if (iconCompat3 == null) {
                bigContentTitle.bigLargeIcon((Bitmap) null);
            } else {
                bigContentTitle.bigLargeIcon(gsa.q0(iconCompat3, context));
            }
        }
        if (Build.VERSION.SDK_INT >= 31) {
            qi8.c(bigContentTitle, false);
            qi8.b(bigContentTitle, null);
        }
    }

    @Override // defpackage.b2
    public final String n0() {
        return "androidx.core.app.NotificationCompat$BigPictureStyle";
    }
}
