package kw;

import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* loaded from: classes4.dex */
public final class e2 implements e3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72359a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f72360b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ x2 f72361c;

    public /* synthetic */ e2(x2 x2Var, String str, int i5) {
        this.f72359a = i5;
        this.f72361c = x2Var;
        this.f72360b = str;
    }

    @Override // kw.e3
    public final boolean a() {
        switch (this.f72359a) {
        }
        return r70.k.U0(this.f72360b);
    }

    @Override // kw.e3
    public final boolean b(boolean z11, boolean z12) {
        switch (this.f72359a) {
            case 0:
                if (g() == null || (z11 && !z12)) {
                }
                break;
            default:
                if (g() == null || !z12) {
                }
                break;
        }
        return false;
    }

    @Override // kw.e3
    public final boolean c() {
        switch (this.f72359a) {
            case 0:
                if (this.f72360b.length() >= ((f2) this.f72361c).f72371e.f33239b) {
                }
                break;
        }
        return false;
    }

    @Override // kw.e3
    public final w0 g() {
        u0 u0Var;
        switch (this.f72359a) {
            case 0:
                f2 f2Var = (f2) this.f72361c;
                com.google.android.gms.internal.measurement.y0 y0Var = f2Var.f72371e;
                String str = f2Var.f72369c;
                String str2 = this.f72360b;
                if (!r70.k.U0(str2) && !isValid() && Intrinsics.b(str, "US")) {
                    u0Var = str2.length() < y0Var.f33238a ? new u0(2132019692, null) : new u0(2132019693, null);
                } else if (!r70.k.U0(str2) && !isValid()) {
                    u0Var = str2.length() < y0Var.f33238a ? new u0(2132019684, null) : new u0(2132019685, null);
                } else {
                    if (str2.length() <= 0 || isValid()) {
                        return null;
                    }
                    u0Var = Intrinsics.b(str, "US") ? new u0(2132019693, null) : new u0(2132019685, null);
                }
                return u0Var;
            default:
                if (isValid()) {
                    return null;
                }
                return new u0(2132019730, null);
        }
    }

    @Override // kw.e3
    public final boolean isValid() {
        switch (this.f72359a) {
            case 0:
                f2 f2Var = (f2) this.f72361c;
                com.google.android.gms.internal.measurement.y0 y0Var = f2Var.f72371e;
                boolean z11 = f2Var.f72370d;
                String str = this.f72360b;
                boolean z12 = z11 && str.length() == 0;
                if (y0Var instanceof c2) {
                    if (!z12 && r70.k.U0(str)) {
                        return false;
                    }
                } else if (!z12) {
                    int i5 = y0Var.f33238a;
                    int i11 = y0Var.f33239b;
                    int length = str.length();
                    if (i5 > length || length > i11 || r70.k.U0(str) || !((Regex) y0Var.f33240c).f(str)) {
                        return false;
                    }
                }
                return true;
            default:
                boolean z13 = ((r2) this.f72361c).f72595e;
                String str2 = this.f72360b;
                return (z13 && str2.length() == 0) || !r70.k.U0(str2);
        }
    }
}
