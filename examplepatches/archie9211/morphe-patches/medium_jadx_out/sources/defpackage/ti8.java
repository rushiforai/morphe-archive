package defpackage;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.os.Build;
import android.os.Bundle;
import androidx.core.graphics.drawable.IconCompat;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ti8 {
    public final Context a;
    public CharSequence e;
    public CharSequence f;
    public PendingIntent g;
    public IconCompat h;
    public int i;
    public int j;
    public b2 l;
    public Bundle n;
    public String q;
    public final boolean r;
    public final Notification s;
    public final ArrayList t;
    public final ArrayList b = new ArrayList();
    public final ArrayList c = new ArrayList();
    public final ArrayList d = new ArrayList();
    public boolean k = true;
    public boolean m = false;
    public int o = 0;
    public int p = 0;

    public ti8(Context context, String str) {
        Notification notification = new Notification();
        this.s = notification;
        this.a = context;
        this.q = str;
        notification.when = System.currentTimeMillis();
        notification.audioStreamType = -1;
        this.j = 0;
        this.t = new ArrayList();
        this.r = true;
    }

    public static CharSequence b(CharSequence charSequence) {
        return (charSequence != null && charSequence.length() > 5120) ? charSequence.subSequence(0, FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE) : charSequence;
    }

    public final Notification a() {
        Notification notificationBuild;
        Bundle bundle;
        String strN0;
        n0c n0cVar = new n0c(this);
        ti8 ti8Var = (ti8) n0cVar.d;
        b2 b2Var = ti8Var.l;
        if (b2Var != null) {
            b2Var.i0(n0cVar);
        }
        Notification.Builder builder = (Notification.Builder) n0cVar.c;
        int i = Build.VERSION.SDK_INT;
        if (i < 26 && i < 24) {
            builder.setExtras((Bundle) n0cVar.e);
            notificationBuild = builder.build();
        } else {
            notificationBuild = builder.build();
        }
        if (b2Var != null) {
            ti8Var.l.getClass();
        }
        if (b2Var != null && (bundle = notificationBuild.extras) != null && (strN0 = b2Var.n0()) != null) {
            bundle.putString("androidx.core.app.extra.COMPAT_TEMPLATE", strN0);
        }
        return notificationBuild;
    }

    public final void c(boolean z) {
        Notification notification = this.s;
        if (z) {
            notification.flags |= 16;
        } else {
            notification.flags &= -17;
        }
    }

    public final void d(Bitmap bitmap) {
        IconCompat iconCompat;
        if (bitmap == null) {
            iconCompat = null;
        } else {
            if (Build.VERSION.SDK_INT < 27) {
                Resources resources = this.a.getResources();
                int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.compat_notification_large_icon_max_width);
                int dimensionPixelSize2 = resources.getDimensionPixelSize(R.dimen.compat_notification_large_icon_max_height);
                if (bitmap.getWidth() > dimensionPixelSize || bitmap.getHeight() > dimensionPixelSize2) {
                    double dMin = Math.min(((double) dimensionPixelSize) / ((double) Math.max(1, bitmap.getWidth())), ((double) dimensionPixelSize2) / ((double) Math.max(1, bitmap.getHeight())));
                    bitmap = Bitmap.createScaledBitmap(bitmap, (int) Math.ceil(((double) bitmap.getWidth()) * dMin), (int) Math.ceil(((double) bitmap.getHeight()) * dMin), true);
                }
            }
            PorterDuff.Mode mode = IconCompat.k;
            bitmap.getClass();
            IconCompat iconCompat2 = new IconCompat(1);
            iconCompat2.b = bitmap;
            iconCompat = iconCompat2;
        }
        this.h = iconCompat;
    }

    public final void e(b2 b2Var) {
        if (this.l != b2Var) {
            this.l = b2Var;
            if (((ti8) b2Var.b) != this) {
                b2Var.b = this;
                e(b2Var);
            }
        }
    }
}
