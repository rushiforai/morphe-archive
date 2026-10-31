package hy;

import b.u4;
import java.util.List;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final long f60972a;

    /* renamed from: b, reason: collision with root package name */
    public final List f60973b;

    /* renamed from: c, reason: collision with root package name */
    public final long f60974c;

    /* renamed from: d, reason: collision with root package name */
    public final long f60975d;

    /* renamed from: e, reason: collision with root package name */
    public final long f60976e;

    public h(long j11, List list, long j12, long j13, long j14) {
        this.f60972a = j11;
        this.f60973b = list;
        this.f60974c = j12;
        this.f60975d = j13;
        this.f60976e = j14;
    }

    public final e1 a(p1.o oVar) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(505518710);
        e1 e1VarM = androidx.compose.runtime.d.m(new i2.s(this.f60972a), tVar);
        tVar.p(false);
        return e1VarM;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || h.class != obj.getClass()) {
            return false;
        }
        h hVar = (h) obj;
        long j11 = hVar.f60975d;
        int i5 = i2.s.n;
        return ULong.a(this.f60975d, j11) && ULong.a(this.f60976e, hVar.f60976e) && Intrinsics.b(this.f60973b, hVar.f60973b) && ULong.a(this.f60974c, hVar.f60974c);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f60974c) + u4.c(b.c0.d(Long.hashCode(this.f60975d) * 31, 31, this.f60976e), 31, this.f60973b);
    }
}
