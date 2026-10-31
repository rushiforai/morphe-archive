package os;

import com.google.android.gms.internal.measurement.k2;
import kotlin.jvm.internal.Intrinsics;
import m3.p0;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final p0 f80767a;

    /* renamed from: b, reason: collision with root package name */
    public final p0 f80768b;

    /* renamed from: c, reason: collision with root package name */
    public final p0 f80769c;

    /* renamed from: d, reason: collision with root package name */
    public final p0 f80770d;

    /* renamed from: e, reason: collision with root package name */
    public final p0 f80771e;

    /* renamed from: f, reason: collision with root package name */
    public final p0 f80772f;

    /* renamed from: g, reason: collision with root package name */
    public final p0 f80773g;

    public e(p0 p0Var, p0 p0Var2, p0 p0Var3, p0 p0Var4, p0 p0Var5, p0 p0Var6, p0 p0Var7) {
        this.f80767a = p0Var;
        this.f80768b = p0Var2;
        this.f80769c = p0Var3;
        this.f80770d = p0Var4;
        this.f80771e = p0Var5;
        this.f80772f = p0Var6;
        this.f80773g = p0Var7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f80767a, eVar.f80767a) && Intrinsics.b(this.f80768b, eVar.f80768b) && Intrinsics.b(this.f80769c, eVar.f80769c) && Intrinsics.b(this.f80770d, eVar.f80770d) && Intrinsics.b(this.f80771e, eVar.f80771e) && Intrinsics.b(this.f80772f, eVar.f80772f) && Intrinsics.b(this.f80773g, eVar.f80773g);
    }

    public final int hashCode() {
        return this.f80773g.hashCode() + k2.g(k2.g(k2.g(k2.g(k2.g(this.f80767a.hashCode() * 31, 31, this.f80768b), 31, this.f80769c), 31, this.f80770d), 31, this.f80771e), 31, this.f80772f);
    }

    public final String toString() {
        return "LinkTypography(title=" + this.f80767a + ", body=" + this.f80768b + ", bodyEmphasized=" + this.f80769c + ", detail=" + this.f80770d + ", detailEmphasized=" + this.f80771e + ", caption=" + this.f80772f + ", captionEmphasized=" + this.f80773g + ")";
    }
}
