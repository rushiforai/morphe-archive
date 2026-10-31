package ads_mobile_sdk;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import b.c9;
import b.k9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class wf1 {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f11268a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f11269b;

    /* renamed from: c, reason: collision with root package name */
    public final double f11270c;

    /* renamed from: d, reason: collision with root package name */
    public final int f11271d;

    /* renamed from: e, reason: collision with root package name */
    public final int f11272e;

    public wf1(Drawable drawable, Uri uri, double d5, int i5, int i11) {
        this.f11268a = drawable;
        this.f11269b = uri;
        this.f11270c = d5;
        this.f11271d = i5;
        this.f11272e = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wf1)) {
            return false;
        }
        wf1 wf1Var = (wf1) obj;
        return Intrinsics.b(this.f11268a, wf1Var.f11268a) && Intrinsics.b(this.f11269b, wf1Var.f11269b) && Double.compare(this.f11270c, wf1Var.f11270c) == 0 && this.f11271d == wf1Var.f11271d && this.f11272e == wf1Var.f11272e;
    }

    public final int hashCode() {
        Drawable drawable = this.f11268a;
        int iHashCode = drawable == null ? 0 : drawable.hashCode();
        return Integer.hashCode(this.f11272e) + k9.b(this.f11271d, c9.c(this.f11270c, (this.f11269b.hashCode() + (iHashCode * 31)) * 31, 31));
    }

    public final String toString() {
        return "InternalNativeAdImage(drawable=" + this.f11268a + ", uri=" + this.f11269b + ", scale=" + this.f11270c + ", width=" + this.f11271d + ", height=" + this.f11272e + ")";
    }
}
