package sg;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f87419a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87420b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f87421c;

    public d0(String str, boolean z11) {
        w.e(str);
        this.f87419a = str;
        w.e("com.google.android.gms");
        this.f87420b = "com.google.android.gms";
        this.f87421c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return false;
        }
        d0 d0Var = (d0) obj;
        return w.k(this.f87419a, d0Var.f87419a) && w.k(this.f87420b, d0Var.f87420b) && w.k(null, null) && this.f87421c == d0Var.f87421c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f87419a, this.f87420b, null, 4225, Boolean.valueOf(this.f87421c)});
    }

    public final String toString() {
        String str = this.f87419a;
        if (str != null) {
            return str;
        }
        w.h(null);
        throw null;
    }
}
