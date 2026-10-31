package x7;

import b.c0;
import b.u4;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f95155a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95156b;

    /* renamed from: c, reason: collision with root package name */
    public final o7.g f95157c;

    /* renamed from: d, reason: collision with root package name */
    public final long f95158d;

    /* renamed from: e, reason: collision with root package name */
    public final long f95159e;

    /* renamed from: f, reason: collision with root package name */
    public final long f95160f;

    /* renamed from: g, reason: collision with root package name */
    public final o7.f f95161g;

    /* renamed from: h, reason: collision with root package name */
    public final int f95162h;

    /* renamed from: i, reason: collision with root package name */
    public final int f95163i;

    /* renamed from: j, reason: collision with root package name */
    public final long f95164j;

    /* renamed from: k, reason: collision with root package name */
    public final long f95165k;

    /* renamed from: l, reason: collision with root package name */
    public final int f95166l;

    /* renamed from: m, reason: collision with root package name */
    public final int f95167m;
    public final long n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f95168p;

    /* renamed from: q, reason: collision with root package name */
    public final ArrayList f95169q;

    public p(String id2, int i5, o7.g gVar, long j11, long j12, long j13, o7.f fVar, int i11, int i12, long j14, long j15, int i13, int i14, long j16, int i15, ArrayList arrayList, ArrayList arrayList2) {
        Intrinsics.g(id2, "id");
        fq.c.o(i5, "state");
        fq.c.o(i12, "backoffPolicy");
        this.f95155a = id2;
        this.f95156b = i5;
        this.f95157c = gVar;
        this.f95158d = j11;
        this.f95159e = j12;
        this.f95160f = j13;
        this.f95161g = fVar;
        this.f95162h = i11;
        this.f95163i = i12;
        this.f95164j = j14;
        this.f95165k = j15;
        this.f95166l = i13;
        this.f95167m = i14;
        this.n = j16;
        this.o = i15;
        this.f95168p = arrayList;
        this.f95169q = arrayList2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f95155a, pVar.f95155a) && this.f95156b == pVar.f95156b && this.f95157c.equals(pVar.f95157c) && this.f95158d == pVar.f95158d && this.f95159e == pVar.f95159e && this.f95160f == pVar.f95160f && this.f95161g.equals(pVar.f95161g) && this.f95162h == pVar.f95162h && this.f95163i == pVar.f95163i && this.f95164j == pVar.f95164j && this.f95165k == pVar.f95165k && this.f95166l == pVar.f95166l && this.f95167m == pVar.f95167m && this.n == pVar.n && this.o == pVar.o && this.f95168p.equals(pVar.f95168p) && this.f95169q.equals(pVar.f95169q);
    }

    public final int hashCode() {
        return this.f95169q.hashCode() + ((this.f95168p.hashCode() + u4.a(this.o, c0.d(u4.a(this.f95167m, u4.a(this.f95166l, c0.d(c0.d((c0.F(this.f95163i) + u4.a(this.f95162h, (this.f95161g.hashCode() + c0.d(c0.d(c0.d((this.f95157c.hashCode() + ((c0.F(this.f95156b) + (this.f95155a.hashCode() * 31)) * 31)) * 31, 31, this.f95158d), 31, this.f95159e), 31, this.f95160f)) * 31, 31)) * 31, 31, this.f95164j), 31, this.f95165k), 31), 31), 31, this.n), 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WorkInfoPojo(id=");
        sb2.append(this.f95155a);
        sb2.append(", state=");
        sb2.append(fq.c.A(this.f95156b));
        sb2.append(", output=");
        sb2.append(this.f95157c);
        sb2.append(", initialDelay=");
        sb2.append(this.f95158d);
        sb2.append(", intervalDuration=");
        sb2.append(this.f95159e);
        sb2.append(", flexDuration=");
        sb2.append(this.f95160f);
        sb2.append(", constraints=");
        sb2.append(this.f95161g);
        sb2.append(", runAttemptCount=");
        sb2.append(this.f95162h);
        sb2.append(", backoffPolicy=");
        int i5 = this.f95163i;
        sb2.append(i5 != 1 ? i5 != 2 ? AbstractJsonLexerKt.NULL : "LINEAR" : "EXPONENTIAL");
        sb2.append(", backoffDelayDuration=");
        sb2.append(this.f95164j);
        sb2.append(", lastEnqueueTime=");
        sb2.append(this.f95165k);
        sb2.append(", periodCount=");
        sb2.append(this.f95166l);
        sb2.append(", generation=");
        sb2.append(this.f95167m);
        sb2.append(", nextScheduleTimeOverride=");
        sb2.append(this.n);
        sb2.append(", stopReason=");
        sb2.append(this.o);
        sb2.append(", tags=");
        sb2.append(this.f95168p);
        sb2.append(", progress=");
        sb2.append(this.f95169q);
        sb2.append(')');
        return sb2.toString();
    }
}
