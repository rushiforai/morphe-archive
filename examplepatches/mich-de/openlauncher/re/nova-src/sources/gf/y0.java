package gf;

import xk.r2;

/* loaded from: classes3.dex */
public final class y0 implements fe.e {

    /* renamed from: d, reason: collision with root package name */
    public static final y0 f57665d = new y0(new x0[0]);

    /* renamed from: a, reason: collision with root package name */
    public final int f57666a;

    /* renamed from: b, reason: collision with root package name */
    public final r2 f57667b;

    /* renamed from: c, reason: collision with root package name */
    public int f57668c;

    public y0(x0... x0VarArr) {
        r2 r2VarP = xk.v0.p(x0VarArr);
        this.f57667b = r2VarP;
        this.f57666a = x0VarArr.length;
        int i5 = 0;
        while (i5 < r2VarP.f96009d) {
            int i11 = i5 + 1;
            for (int i12 = i11; i12 < r2VarP.f96009d; i12++) {
                if (((x0) r2VarP.get(i5)).equals(r2VarP.get(i12))) {
                    wf.a.p("TrackGroupArray", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new IllegalArgumentException("Multiple identical TrackGroups added to one TrackGroupArray."));
                }
            }
            i5 = i11;
        }
    }

    public final x0 a(int i5) {
        return (x0) this.f57667b.get(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || y0.class != obj.getClass()) {
            return false;
        }
        y0 y0Var = (y0) obj;
        return this.f57666a == y0Var.f57666a && this.f57667b.equals(y0Var.f57667b);
    }

    public final int hashCode() {
        if (this.f57668c == 0) {
            this.f57668c = this.f57667b.hashCode();
        }
        return this.f57668c;
    }
}
