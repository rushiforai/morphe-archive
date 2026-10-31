package v2;

import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;

/* loaded from: classes2.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final long f91990a;

    /* renamed from: b, reason: collision with root package name */
    public final long f91991b;

    /* renamed from: c, reason: collision with root package name */
    public final long f91992c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f91993d;

    /* renamed from: e, reason: collision with root package name */
    public final float f91994e;

    /* renamed from: f, reason: collision with root package name */
    public final long f91995f;

    /* renamed from: g, reason: collision with root package name */
    public final long f91996g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f91997h;

    /* renamed from: i, reason: collision with root package name */
    public final int f91998i;

    /* renamed from: j, reason: collision with root package name */
    public final long f91999j;

    /* renamed from: k, reason: collision with root package name */
    public final List f92000k;

    /* renamed from: l, reason: collision with root package name */
    public final long f92001l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f92002m;
    public boolean n;
    public t o;

    public /* synthetic */ t(long j11, long j12, long j13, float f11, long j14, long j15, boolean z11, boolean z12, int i5) {
        this(j11, j12, j13, false, f11, j14, j15, z11, z12, i5, 0L);
    }

    public static t b(t tVar, long j11, long j12, ArrayList arrayList) {
        t tVar2 = tVar;
        t tVar3 = new t(tVar2.f91990a, tVar2.f91991b, j11, tVar2.f91993d, tVar2.f91994e, tVar2.f91995f, j12, tVar2.f91997h, tVar2.f91998i, arrayList, tVar2.f91999j, tVar2.f92001l);
        t tVar4 = tVar2.o;
        if (tVar4 == null) {
            tVar4 = tVar2;
        }
        tVar3.o = tVar4;
        t tVar5 = tVar2.o;
        if (tVar5 != null) {
            tVar2 = tVar5;
        }
        tVar3.o = tVar2;
        return tVar3;
    }

    public final void a() {
        t tVar = this.o;
        if (tVar == null) {
            this.f92002m = true;
            this.n = true;
        } else if (tVar != null) {
            tVar.a();
        }
    }

    public final List c() {
        List list = this.f92000k;
        return list == null ? EmptyList.f71733a : list;
    }

    public final long d() {
        return this.f91990a;
    }

    public final long e() {
        return this.f91992c;
    }

    public final boolean f() {
        return this.f91993d;
    }

    public final float g() {
        return this.f91994e;
    }

    public final long h() {
        return this.f91996g;
    }

    public final boolean i() {
        return this.f91997h;
    }

    public final int j() {
        return this.f91998i;
    }

    public final long k() {
        return this.f91991b;
    }

    public final boolean l() {
        t tVar = this.o;
        return tVar != null ? tVar.l() : this.f92002m || this.n;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PointerInputChange(id=");
        sb2.append((Object) ("PointerId(value=" + this.f91990a + ')'));
        sb2.append(", uptimeMillis=");
        sb2.append(this.f91991b);
        sb2.append(", position=");
        sb2.append((Object) h2.b.i(this.f91992c));
        sb2.append(", pressed=");
        sb2.append(this.f91993d);
        sb2.append(", pressure=");
        sb2.append(this.f91994e);
        sb2.append(", previousUptimeMillis=");
        sb2.append(this.f91995f);
        sb2.append(", previousPosition=");
        sb2.append((Object) h2.b.i(this.f91996g));
        sb2.append(", previousPressed=");
        sb2.append(this.f91997h);
        sb2.append(", isConsumed=");
        sb2.append(l());
        sb2.append(", type=");
        int i5 = this.f91998i;
        sb2.append((Object) (i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? "Unknown" : "Eraser" : "Stylus" : "Mouse" : "Touch"));
        sb2.append(", historical=");
        sb2.append(c());
        sb2.append(",scrollDelta=");
        sb2.append((Object) h2.b.i(this.f91999j));
        sb2.append(')');
        return sb2.toString();
    }

    public t(long j11, long j12, long j13, boolean z11, float f11, long j14, long j15, boolean z12, boolean z13, int i5, long j16) {
        this.f91990a = j11;
        this.f91991b = j12;
        this.f91992c = j13;
        this.f91993d = z11;
        this.f91994e = f11;
        this.f91995f = j14;
        this.f91996g = j15;
        this.f91997h = z12;
        this.f91998i = i5;
        this.f91999j = j16;
        this.f92001l = 0L;
        this.f92002m = z13;
        this.n = z13;
    }

    public t(long j11, long j12, long j13, boolean z11, float f11, long j14, long j15, boolean z12, int i5, List list, long j16, long j17) {
        this(j11, j12, j13, z11, f11, j14, j15, z12, false, i5, j16);
        this.f92000k = list;
        this.f92001l = j17;
    }
}
