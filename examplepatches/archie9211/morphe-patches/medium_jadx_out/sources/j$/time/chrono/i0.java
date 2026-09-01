package j$.time.chrono;

import com.drew.metadata.exif.makernotes.SanyoMakernoteDirectory;
import j$.time.LocalDate;
import j$.time.LocalTime;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class i0 extends d {
    private static final long serialVersionUID = -8722293800195731463L;
    public final transient LocalDate a;

    public i0(LocalDate localDate) {
        Objects.requireNonNull(localDate, "isoDate");
        this.a = localDate;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new e0((byte) 8, this);
    }

    @Override // j$.time.chrono.d
    public final b C(long j) {
        return H(this.a.P(j));
    }

    @Override // j$.time.chrono.d
    public final b D(long j) {
        return H(this.a.Q(j));
    }

    @Override // j$.time.chrono.d
    public final b E(long j) {
        return H(this.a.S(j));
    }

    public final int F() {
        return this.a.getYear() + SanyoMakernoteDirectory.TAG_SCENE_SELECT;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x004d  */
    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    /* JADX INFO: renamed from: G, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final j$.time.chrono.i0 b(long r8, j$.time.temporal.n r10) {
        /*
            r7 = this;
            boolean r0 = r10 instanceof j$.time.temporal.a
            if (r0 == 0) goto La3
            r0 = r10
            j$.time.temporal.a r0 = (j$.time.temporal.a) r0
            long r1 = r7.s(r0)
            int r1 = (r1 > r8 ? 1 : (r1 == r8 ? 0 : -1))
            if (r1 != 0) goto L10
            return r7
        L10:
            int[] r1 = j$.time.chrono.h0.a
            int r2 = r0.ordinal()
            r2 = r1[r2]
            r3 = 7
            r4 = 6
            r5 = 4
            if (r2 == r5) goto L4d
            r6 = 5
            if (r2 == r6) goto L25
            if (r2 == r4) goto L4d
            if (r2 == r3) goto L4d
            goto L63
        L25:
            j$.time.chrono.g0 r10 = j$.time.chrono.g0.c
            j$.time.temporal.r r10 = r10.G(r0)
            r10.b(r8, r0)
            int r10 = r7.F()
            long r0 = (long) r10
            r2 = 12
            long r0 = r0 * r2
            j$.time.LocalDate r10 = r7.a
            int r10 = r10.getMonthValue()
            long r2 = (long) r10
            long r0 = r0 + r2
            r2 = 1
            long r0 = r0 - r2
            long r8 = r8 - r0
            j$.time.LocalDate r10 = r7.a
            j$.time.LocalDate r8 = r10.Q(r8)
            j$.time.chrono.i0 r7 = r7.H(r8)
            return r7
        L4d:
            j$.time.chrono.g0 r2 = j$.time.chrono.g0.c
            j$.time.temporal.r r2 = r2.G(r0)
            int r2 = r2.a(r8, r0)
            int r0 = r0.ordinal()
            r0 = r1[r0]
            if (r0 == r5) goto L8c
            if (r0 == r4) goto L7f
            if (r0 == r3) goto L6e
        L63:
            j$.time.LocalDate r0 = r7.a
            j$.time.LocalDate r8 = r0.b(r8, r10)
            j$.time.chrono.i0 r7 = r7.H(r8)
            return r7
        L6e:
            j$.time.LocalDate r8 = r7.a
            int r9 = r7.F()
            int r9 = (-542) - r9
            j$.time.LocalDate r8 = r8.W(r9)
            j$.time.chrono.i0 r7 = r7.H(r8)
            return r7
        L7f:
            j$.time.LocalDate r8 = r7.a
            int r2 = r2 + (-543)
            j$.time.LocalDate r8 = r8.W(r2)
            j$.time.chrono.i0 r7 = r7.H(r8)
            return r7
        L8c:
            j$.time.LocalDate r8 = r7.a
            int r9 = r7.F()
            r10 = 1
            if (r9 < r10) goto L96
            goto L98
        L96:
            int r2 = 1 - r2
        L98:
            int r2 = r2 + (-543)
            j$.time.LocalDate r8 = r8.W(r2)
            j$.time.chrono.i0 r7 = r7.H(r8)
            return r7
        La3:
            j$.time.chrono.b r7 = super.b(r8, r10)
            j$.time.chrono.i0 r7 = (j$.time.chrono.i0) r7
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.time.chrono.i0.b(long, j$.time.temporal.n):j$.time.chrono.i0");
    }

    public final i0 H(LocalDate localDate) {
        return localDate.equals(this.a) ? this : new i0(localDate);
    }

    @Override // j$.time.chrono.b
    public final a a() {
        return g0.c;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b, j$.time.temporal.Temporal
    public final b c(long j, j$.time.temporal.p pVar) {
        return (i0) super.c(j, pVar);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i0) {
            return this.a.equals(((i0) obj).a);
        }
        return false;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final int hashCode() {
        g0.c.getClass();
        return this.a.hashCode() ^ 146118545;
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (i0) super.p(localDate);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.i(this);
        }
        if (!j$.time.a.t(this, nVar)) {
            throw new j$.time.temporal.q(j$.time.d.a("Unsupported field: ", nVar));
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        int i = h0.a[aVar.ordinal()];
        if (i == 1 || i == 2 || i == 3) {
            return this.a.j(nVar);
        }
        if (i != 4) {
            return g0.c.G(aVar);
        }
        j$.time.temporal.r rVar = j$.time.temporal.a.YEAR.b;
        return j$.time.temporal.r.f(1L, F() <= 0 ? (-(rVar.a + 543)) + 1 : rVar.d + 543);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    /* JADX INFO: renamed from: n */
    public final b q(long j, j$.time.temporal.p pVar) {
        return (i0) super.q(j, pVar);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final b p(j$.time.temporal.l lVar) {
        return (i0) super.p(lVar);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    public final Temporal q(long j, ChronoUnit chronoUnit) {
        return (i0) super.q(j, chronoUnit);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        int i = h0.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i == 4) {
            int iF = F();
            if (iF < 1) {
                iF = 1 - iF;
            }
            return iF;
        }
        if (i == 5) {
            return ((((long) F()) * 12) + ((long) this.a.getMonthValue())) - 1;
        }
        if (i == 6) {
            return F();
        }
        if (i != 7) {
            return this.a.s(nVar);
        }
        return F() < 1 ? 0 : 1;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final long t() {
        return this.a.t();
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final e u(LocalTime localTime) {
        return new g(this, localTime);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final m v() {
        return F() >= 1 ? j0.BE : j0.BEFORE_BE;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final b x(TemporalAmount temporalAmount) {
        return (i0) super.x(temporalAmount);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    public final Temporal c(long j, j$.time.temporal.p pVar) {
        return (i0) super.c(j, pVar);
    }
}
