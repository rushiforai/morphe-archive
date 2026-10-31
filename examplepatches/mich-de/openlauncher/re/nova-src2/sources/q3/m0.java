package q3;

import b.u4;
import com.google.android.gms.internal.measurement.k2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f83578a;

    /* renamed from: b, reason: collision with root package name */
    public final b0 f83579b;

    /* renamed from: c, reason: collision with root package name */
    public final int f83580c;

    /* renamed from: d, reason: collision with root package name */
    public final int f83581d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f83582e;

    public m0(p pVar, b0 b0Var, int i5, int i11, Object obj) {
        this.f83578a = pVar;
        this.f83579b = b0Var;
        this.f83580c = i5;
        this.f83581d = i11;
        this.f83582e = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return Intrinsics.b(this.f83578a, m0Var.f83578a) && Intrinsics.b(this.f83579b, m0Var.f83579b) && this.f83580c == m0Var.f83580c && this.f83581d == m0Var.f83581d && Intrinsics.b(this.f83582e, m0Var.f83582e);
    }

    public final int hashCode() {
        p pVar = this.f83578a;
        int iA = u4.a(this.f83581d, u4.a(this.f83580c, (((pVar == null ? 0 : pVar.hashCode()) * 31) + this.f83579b.f83539a) * 31, 31), 31);
        Object obj = this.f83582e;
        return iA + (obj != null ? obj.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TypefaceRequest(fontFamily=");
        sb2.append(this.f83578a);
        sb2.append(", fontWeight=");
        sb2.append(this.f83579b);
        sb2.append(", fontStyle=");
        sb2.append((Object) v.a(this.f83580c));
        sb2.append(", fontSynthesis=");
        int i5 = this.f83581d;
        sb2.append((Object) (i5 == 0 ? "None" : i5 == 1 ? "Weight" : i5 == 2 ? "Style" : i5 == 65535 ? "All" : "Invalid"));
        sb2.append(", resourceLoaderCacheKey=");
        return k2.j(sb2, this.f83582e, ')');
    }
}
