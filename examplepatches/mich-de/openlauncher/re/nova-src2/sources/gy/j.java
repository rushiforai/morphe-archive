package gy;

import kotlin.ULong;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final long f58370a;

    /* renamed from: b, reason: collision with root package name */
    public final long f58371b;

    /* renamed from: c, reason: collision with root package name */
    public final long f58372c;

    /* renamed from: d, reason: collision with root package name */
    public final long f58373d;

    /* renamed from: e, reason: collision with root package name */
    public final long f58374e;

    /* renamed from: f, reason: collision with root package name */
    public final long f58375f;

    /* renamed from: g, reason: collision with root package name */
    public final long f58376g;

    /* renamed from: h, reason: collision with root package name */
    public final long f58377h;

    /* renamed from: i, reason: collision with root package name */
    public final long f58378i;

    /* renamed from: j, reason: collision with root package name */
    public final long f58379j;

    public j(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21) {
        this.f58370a = j11;
        this.f58371b = j12;
        this.f58372c = j13;
        this.f58373d = j14;
        this.f58374e = j15;
        this.f58375f = j16;
        this.f58376g = j17;
        this.f58377h = j18;
        this.f58378i = j19;
        this.f58379j = j21;
    }

    public final p1.e1 a(boolean z11, boolean z12, p1.o oVar) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(-1678199227);
        p1.e1 e1VarM = androidx.compose.runtime.d.m(new i2.s(z11 ? z12 ? this.f58376g : this.f58377h : z12 ? this.f58378i : this.f58379j), tVar);
        tVar.p(false);
        return e1VarM;
    }

    public final p1.e1 b(boolean z11, boolean z12, p1.o oVar) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(393284787);
        p1.e1 e1VarM = androidx.compose.runtime.d.m(new i2.s(z11 ? z12 ? this.f58372c : this.f58373d : z12 ? this.f58374e : this.f58375f), tVar);
        tVar.p(false);
        return e1VarM;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || j.class != obj.getClass()) {
            return false;
        }
        j jVar = (j) obj;
        long j11 = jVar.f58370a;
        int i5 = i2.s.n;
        return ULong.a(this.f58370a, j11) && ULong.a(this.f58371b, jVar.f58371b) && ULong.a(this.f58372c, jVar.f58372c) && ULong.a(this.f58373d, jVar.f58373d) && ULong.a(this.f58374e, jVar.f58374e) && ULong.a(this.f58375f, jVar.f58375f) && ULong.a(this.f58376g, jVar.f58376g) && ULong.a(this.f58377h, jVar.f58377h) && ULong.a(this.f58378i, jVar.f58378i) && ULong.a(this.f58379j, jVar.f58379j);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f58379j) + b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f58370a) * 31, 31, this.f58371b), 31, this.f58372c), 31, this.f58373d), 31, this.f58374e), 31, this.f58375f), 31, this.f58376g), 31, this.f58377h), 31, this.f58378i);
    }
}
