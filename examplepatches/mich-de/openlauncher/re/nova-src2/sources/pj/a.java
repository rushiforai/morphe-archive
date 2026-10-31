package pj;

import android.content.Context;
import android.graphics.Color;
import com.google.android.gms.internal.consent_sdk.k0;
import ps.e0;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: f, reason: collision with root package name */
    public static final int f82600f = (int) Math.round(5.1000000000000005d);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82601a;

    /* renamed from: b, reason: collision with root package name */
    public final int f82602b;

    /* renamed from: c, reason: collision with root package name */
    public final int f82603c;

    /* renamed from: d, reason: collision with root package name */
    public final int f82604d;

    /* renamed from: e, reason: collision with root package name */
    public final float f82605e;

    public a(Context context) {
        boolean zV = e0.v(false, context, 2130969145);
        int iN = k0.n(context, 2130969144, 0);
        int iN2 = k0.n(context, 2130969143, 0);
        int iN3 = k0.n(context, 2130968977, 0);
        float f11 = context.getResources().getDisplayMetrics().density;
        this.f82601a = zV;
        this.f82602b = iN;
        this.f82603c = iN2;
        this.f82604d = iN3;
        this.f82605e = f11;
    }

    public final int a(float f11, int i5) {
        int i11;
        if (!this.f82601a || r4.a.n(i5, 255) != this.f82604d) {
            return i5;
        }
        float fMin = (this.f82605e <= 0.0f || f11 <= 0.0f) ? 0.0f : Math.min(((((float) Math.log1p(f11 / r1)) * 4.5f) + 2.0f) / 100.0f, 1.0f);
        int iAlpha = Color.alpha(i5);
        int iV = k0.v(fMin, r4.a.n(i5, 255), this.f82602b);
        if (fMin > 0.0f && (i11 = this.f82603c) != 0) {
            iV = r4.a.j(r4.a.n(i11, f82600f), iV);
        }
        return r4.a.n(iV, iAlpha);
    }
}
