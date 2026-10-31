package gf;

import fe.x1;
import fe.y1;
import fe.z1;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class d extends k {

    /* renamed from: c, reason: collision with root package name */
    public final long f57466c;

    /* renamed from: d, reason: collision with root package name */
    public final long f57467d;

    /* renamed from: e, reason: collision with root package name */
    public final long f57468e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f57469f;

    public d(z1 z1Var, long j11, long j12) throws IOException {
        super(z1Var);
        boolean z11 = false;
        z11 = false;
        z11 = false;
        final int i5 = 1;
        if (z1Var.h() != 1) {
            final int i11 = z11 ? 1 : 0;
            throw new IOException(i11) { // from class: com.google.android.exoplayer2.source.ClippingMediaSource$IllegalClippingException
                {
                    super("Illegal clipping: ".concat(i11 != 0 ? i11 != 1 ? i11 != 2 ? "unknown" : "start exceeds end" : "not seekable to start" : "invalid period count"));
                }
            };
        }
        y1 y1VarM = z1Var.m(0, new y1(), 0L);
        long jMax = Math.max(0L, j11);
        if (!y1VarM.f55108k && jMax != 0 && !y1VarM.f55104g) {
            throw new IOException(i5) { // from class: com.google.android.exoplayer2.source.ClippingMediaSource$IllegalClippingException
                {
                    super("Illegal clipping: ".concat(i5 != 0 ? i5 != 1 ? i5 != 2 ? "unknown" : "start exceeds end" : "not seekable to start" : "invalid period count"));
                }
            };
        }
        long jMax2 = j12 == Long.MIN_VALUE ? y1VarM.f55110m : Math.max(0L, j12);
        long j13 = y1VarM.f55110m;
        if (j13 != -9223372036854775807L) {
            jMax2 = jMax2 > j13 ? j13 : jMax2;
            if (jMax > jMax2) {
                final int i12 = 2;
                throw new IOException(i12) { // from class: com.google.android.exoplayer2.source.ClippingMediaSource$IllegalClippingException
                    {
                        super("Illegal clipping: ".concat(i12 != 0 ? i12 != 1 ? i12 != 2 ? "unknown" : "start exceeds end" : "not seekable to start" : "invalid period count"));
                    }
                };
            }
        }
        this.f57466c = jMax;
        this.f57467d = jMax2;
        this.f57468e = jMax2 == -9223372036854775807L ? -9223372036854775807L : jMax2 - jMax;
        if (y1VarM.f55105h && (jMax2 == -9223372036854775807L || (j13 != -9223372036854775807L && jMax2 == j13))) {
            z11 = true;
        }
        this.f57469f = z11;
    }

    @Override // gf.k, fe.z1
    public final x1 f(int i5, x1 x1Var, boolean z11) {
        this.f57534b.f(0, x1Var, z11);
        long j11 = x1Var.f55079e - this.f57466c;
        long j12 = this.f57468e;
        x1Var.h(x1Var.f55075a, x1Var.f55076b, 0, j12 != -9223372036854775807L ? j12 - j11 : -9223372036854775807L, j11, hf.b.f59845f, false);
        return x1Var;
    }

    @Override // gf.k, fe.z1
    public final y1 m(int i5, y1 y1Var, long j11) {
        this.f57534b.m(0, y1Var, 0L);
        long j12 = y1Var.f55111p;
        long j13 = this.f57466c;
        y1Var.f55111p = j12 + j13;
        y1Var.f55110m = this.f57468e;
        y1Var.f55105h = this.f57469f;
        long j14 = y1Var.f55109l;
        if (j14 != -9223372036854775807L) {
            long jMax = Math.max(j14, j13);
            y1Var.f55109l = jMax;
            long j15 = this.f57467d;
            if (j15 != -9223372036854775807L) {
                jMax = Math.min(jMax, j15);
            }
            y1Var.f55109l = jMax - j13;
        }
        long jF = wf.v.F(j13);
        long j16 = y1Var.f55101d;
        if (j16 != -9223372036854775807L) {
            y1Var.f55101d = j16 + jF;
        }
        long j17 = y1Var.f55102e;
        if (j17 != -9223372036854775807L) {
            y1Var.f55102e = j17 + jF;
        }
        return y1Var;
    }
}
