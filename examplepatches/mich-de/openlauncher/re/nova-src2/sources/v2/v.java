package v2;

import b.c9;
import b.u4;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final long f92006a;

    /* renamed from: b, reason: collision with root package name */
    public final long f92007b;

    /* renamed from: c, reason: collision with root package name */
    public final long f92008c;

    /* renamed from: d, reason: collision with root package name */
    public final long f92009d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f92010e;

    /* renamed from: f, reason: collision with root package name */
    public final float f92011f;

    /* renamed from: g, reason: collision with root package name */
    public final int f92012g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f92013h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f92014i;

    /* renamed from: j, reason: collision with root package name */
    public final long f92015j;

    /* renamed from: k, reason: collision with root package name */
    public final long f92016k;

    public v(long j11, long j12, long j13, long j14, boolean z11, float f11, int i5, boolean z12, ArrayList arrayList, long j15, long j16) {
        this.f92006a = j11;
        this.f92007b = j12;
        this.f92008c = j13;
        this.f92009d = j14;
        this.f92010e = z11;
        this.f92011f = f11;
        this.f92012g = i5;
        this.f92013h = z12;
        this.f92014i = arrayList;
        this.f92015j = j15;
        this.f92016k = j16;
    }

    public final boolean a() {
        return this.f92010e;
    }

    public final List b() {
        return this.f92014i;
    }

    public final long c() {
        return this.f92006a;
    }

    public final long d() {
        return this.f92016k;
    }

    public final long e() {
        return this.f92009d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return g0.g(this.f92006a, vVar.f92006a) && this.f92007b == vVar.f92007b && h2.b.b(this.f92008c, vVar.f92008c) && h2.b.b(this.f92009d, vVar.f92009d) && this.f92010e == vVar.f92010e && Float.compare(this.f92011f, vVar.f92011f) == 0 && this.f92012g == vVar.f92012g && this.f92013h == vVar.f92013h && this.f92014i.equals(vVar.f92014i) && h2.b.b(this.f92015j, vVar.f92015j) && h2.b.b(this.f92016k, vVar.f92016k);
    }

    public final long f() {
        return this.f92008c;
    }

    public final float g() {
        return this.f92011f;
    }

    public final long h() {
        return this.f92015j;
    }

    public final int hashCode() {
        return Long.hashCode(this.f92016k) + b.c0.d((this.f92014i.hashCode() + c9.f(u4.a(this.f92012g, a80.m.d(this.f92011f, c9.f(b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f92006a) * 31, 31, this.f92007b), 31, this.f92008c), 31, this.f92009d), 31, this.f92010e), 31), 31), 31, this.f92013h)) * 31, 31, this.f92015j);
    }

    public final int i() {
        return this.f92012g;
    }

    public final long j() {
        return this.f92007b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PointerInputEventData(id=");
        sb2.append((Object) ("PointerId(value=" + this.f92006a + ')'));
        sb2.append(", uptime=");
        sb2.append(this.f92007b);
        sb2.append(", positionOnScreen=");
        sb2.append((Object) h2.b.i(this.f92008c));
        sb2.append(", position=");
        sb2.append((Object) h2.b.i(this.f92009d));
        sb2.append(", down=");
        sb2.append(this.f92010e);
        sb2.append(", pressure=");
        sb2.append(this.f92011f);
        sb2.append(", type=");
        int i5 = this.f92012g;
        sb2.append((Object) (i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? "Unknown" : "Eraser" : "Stylus" : "Mouse" : "Touch"));
        sb2.append(", activeHover=");
        sb2.append(this.f92013h);
        sb2.append(", historical=");
        sb2.append(this.f92014i);
        sb2.append(", scrollDelta=");
        sb2.append((Object) h2.b.i(this.f92015j));
        sb2.append(", originalEventPosition=");
        sb2.append((Object) h2.b.i(this.f92016k));
        sb2.append(')');
        return sb2.toString();
    }
}
