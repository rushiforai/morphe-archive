package n2;

import i2.c0;
import i2.f;
import i2.t;
import kotlin.jvm.internal.Intrinsics;
import w20.e;
import y3.k;
import y3.m;

/* loaded from: classes2.dex */
public final class a extends c {

    /* renamed from: e, reason: collision with root package name */
    public final c0 f77699e;

    /* renamed from: f, reason: collision with root package name */
    public final long f77700f;

    /* renamed from: g, reason: collision with root package name */
    public int f77701g;

    /* renamed from: h, reason: collision with root package name */
    public final long f77702h;

    /* renamed from: i, reason: collision with root package name */
    public float f77703i;

    /* renamed from: j, reason: collision with root package name */
    public t f77704j;

    /* JADX WARN: Illegal instructions before constructor call */
    public a(c0 c0Var) {
        f fVar = (f) c0Var;
        this(c0Var, (fVar.f61109a.getWidth() << 32) | (fVar.f61109a.getHeight() & 4294967295L));
    }

    @Override // n2.c
    public final void b(float f11) {
        this.f77703i = f11;
    }

    @Override // n2.c
    public final void c(t tVar) {
        this.f77704j = tVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f77699e, aVar.f77699e) && k.b(0L, 0L) && m.a(this.f77700f, aVar.f77700f) && this.f77701g == aVar.f77701g;
    }

    @Override // n2.c
    public final long f() {
        return e.t(this.f77702h);
    }

    @Override // n2.c
    public final void h(k2.f fVar) {
        int iRound = Math.round(Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32)));
        int iRound2 = Math.round(Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() & 4294967295L)));
        k2.f.L(fVar, this.f77699e, this.f77700f, (iRound << 32) | (iRound2 & 4294967295L), this.f77703i, this.f77704j, this.f77701g, 328);
    }

    public final int hashCode() {
        return Integer.hashCode(this.f77701g) + b.c0.d(b.c0.d(this.f77699e.hashCode() * 31, 31, 0L), 31, this.f77700f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BitmapPainter(image=");
        sb2.append(this.f77699e);
        sb2.append(", srcOffset=");
        sb2.append((Object) k.e(0L));
        sb2.append(", srcSize=");
        sb2.append((Object) m.b(this.f77700f));
        sb2.append(", filterQuality=");
        int i5 = this.f77701g;
        sb2.append((Object) (i5 == 0 ? "None" : i5 == 1 ? "Low" : i5 == 2 ? "Medium" : i5 == 3 ? "High" : "Unknown"));
        sb2.append(')');
        return sb2.toString();
    }

    public a(c0 c0Var, long j11) {
        int i5;
        int i11;
        this.f77699e = c0Var;
        this.f77700f = j11;
        this.f77701g = 1;
        if (((int) 0) >= 0 && ((int) 0) >= 0 && (i5 = (int) (j11 >> 32)) >= 0 && (i11 = (int) (4294967295L & j11)) >= 0) {
            f fVar = (f) c0Var;
            if (i5 <= fVar.f61109a.getWidth() && i11 <= fVar.f61109a.getHeight()) {
                this.f77702h = j11;
                this.f77703i = 1.0f;
                return;
            }
        }
        throw new IllegalArgumentException("Failed requirement.");
    }
}
