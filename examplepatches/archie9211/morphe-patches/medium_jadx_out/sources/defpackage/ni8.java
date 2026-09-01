package defpackage;

import android.app.PendingIntent;
import android.os.Bundle;
import androidx.core.graphics.drawable.IconCompat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ni8 {
    public final Bundle a;
    public IconCompat b;
    public final boolean c;
    public final int d;
    public final CharSequence e;
    public final PendingIntent f;

    public ni8(int i, CharSequence charSequence, PendingIntent pendingIntent) {
        IconCompat iconCompatB = i == 0 ? null : IconCompat.b(i);
        Bundle bundle = new Bundle();
        this.c = true;
        this.b = iconCompatB;
        if (iconCompatB != null && iconCompatB.d() == 2) {
            this.d = iconCompatB.c();
        }
        this.e = ti8.b(charSequence);
        this.f = pendingIntent;
        this.a = bundle;
        this.c = true;
    }
}
