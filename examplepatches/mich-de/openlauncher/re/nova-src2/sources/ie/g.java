package ie;

import android.text.TextUtils;
import b.c0;
import fe.k0;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final String f61585a;

    /* renamed from: b, reason: collision with root package name */
    public final k0 f61586b;

    /* renamed from: c, reason: collision with root package name */
    public final k0 f61587c;

    /* renamed from: d, reason: collision with root package name */
    public final int f61588d;

    /* renamed from: e, reason: collision with root package name */
    public final int f61589e;

    public g(String str, k0 k0Var, k0 k0Var2, int i5, int i11) {
        wf.a.e(i5 == 0 || i11 == 0);
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException();
        }
        this.f61585a = str;
        k0Var.getClass();
        this.f61586b = k0Var;
        k0Var2.getClass();
        this.f61587c = k0Var2;
        this.f61588d = i5;
        this.f61589e = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && g.class == obj.getClass()) {
            g gVar = (g) obj;
            if (this.f61588d == gVar.f61588d && this.f61589e == gVar.f61589e && this.f61585a.equals(gVar.f61585a) && this.f61586b.equals(gVar.f61586b) && this.f61587c.equals(gVar.f61587c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f61587c.hashCode() + ((this.f61586b.hashCode() + c0.e((((527 + this.f61588d) * 31) + this.f61589e) * 31, 31, this.f61585a)) * 31);
    }
}
