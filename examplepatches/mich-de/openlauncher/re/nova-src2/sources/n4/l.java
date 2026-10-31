package n4;

import android.app.PendingIntent;
import android.os.Bundle;
import androidx.core.graphics.drawable.IconCompat;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final Bundle f77818a;

    /* renamed from: b, reason: collision with root package name */
    public IconCompat f77819b;

    /* renamed from: c, reason: collision with root package name */
    public final s0[] f77820c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f77821d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f77822e;

    /* renamed from: f, reason: collision with root package name */
    public final int f77823f;

    /* renamed from: g, reason: collision with root package name */
    public final CharSequence f77824g;

    /* renamed from: h, reason: collision with root package name */
    public final PendingIntent f77825h;

    public l(IconCompat iconCompat, CharSequence charSequence, PendingIntent pendingIntent, Bundle bundle, s0[] s0VarArr, s0[] s0VarArr2) {
        this.f77822e = true;
        this.f77819b = iconCompat;
        if (iconCompat != null) {
            int i5 = iconCompat.f14225a;
            if ((i5 == -1 ? ps.f0.s(iconCompat.f14226b) : i5) == 2) {
                this.f77823f = iconCompat.d();
            }
        }
        this.f77824g = r.c(charSequence);
        this.f77825h = pendingIntent;
        this.f77818a = bundle;
        this.f77820c = s0VarArr;
        this.f77821d = true;
        this.f77822e = true;
    }

    public final IconCompat a() {
        int i5;
        if (this.f77819b == null && (i5 = this.f77823f) != 0) {
            this.f77819b = IconCompat.c(i5, null, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        return this.f77819b;
    }
}
