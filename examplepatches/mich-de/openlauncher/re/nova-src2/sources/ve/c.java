package ve;

import com.google.android.exoplayer2.ParserException;
import fe.j0;
import fe.k0;
import ke.k;
import ke.l;
import ke.v;

/* loaded from: classes3.dex */
public final class c implements b {

    /* renamed from: a, reason: collision with root package name */
    public final l f92604a;

    /* renamed from: b, reason: collision with root package name */
    public final v f92605b;

    /* renamed from: c, reason: collision with root package name */
    public final ma0.c f92606c;

    /* renamed from: d, reason: collision with root package name */
    public final k0 f92607d;

    /* renamed from: e, reason: collision with root package name */
    public final int f92608e;

    /* renamed from: f, reason: collision with root package name */
    public long f92609f;

    /* renamed from: g, reason: collision with root package name */
    public int f92610g;

    /* renamed from: h, reason: collision with root package name */
    public long f92611h;

    public c(l lVar, v vVar, ma0.c cVar, String str, int i5) throws ParserException {
        this.f92604a = lVar;
        this.f92605b = vVar;
        this.f92606c = cVar;
        int i11 = cVar.f76181a;
        int i12 = cVar.f76182b;
        int i13 = (cVar.f76184d * i11) / 8;
        int i14 = cVar.f76183c;
        if (i14 != i13) {
            throw ParserException.a("Expected block size: " + i13 + "; got: " + i14, null);
        }
        int i15 = i12 * i13;
        int i16 = i15 * 8;
        int iMax = Math.max(i13, i15 / 10);
        this.f92608e = iMax;
        j0 j0Var = new j0();
        j0Var.f54856k = str;
        j0Var.f54851f = i16;
        j0Var.f54852g = i16;
        j0Var.f54857l = iMax;
        j0Var.f54867x = i11;
        j0Var.f54868y = i12;
        j0Var.f54869z = i5;
        this.f92607d = new k0(j0Var);
    }

    @Override // ve.b
    public final void a(int i5, long j11) {
        this.f92604a.j(new f(this.f92606c, 1, i5, j11));
        this.f92605b.a(this.f92607d);
    }

    @Override // ve.b
    public final void b(long j11) {
        this.f92609f = j11;
        this.f92610g = 0;
        this.f92611h = 0L;
    }

    @Override // ve.b
    public final boolean c(k kVar, long j11) {
        int i5;
        int i11;
        long j12 = j11;
        while (j12 > 0 && (i5 = this.f92610g) < (i11 = this.f92608e)) {
            int iC = this.f92605b.c(kVar, (int) Math.min(i11 - i5, j12), true);
            if (iC == -1) {
                j12 = 0;
            } else {
                this.f92610g += iC;
                j12 -= iC;
            }
        }
        int i12 = this.f92606c.f76183c;
        int i13 = this.f92610g / i12;
        if (i13 > 0) {
            long jD = this.f92609f + wf.v.D(this.f92611h, 1000000L, r1.f76182b);
            int i14 = i13 * i12;
            int i15 = this.f92610g - i14;
            this.f92605b.b(jD, 1, i14, i15, null);
            this.f92611h += i13;
            this.f92610g = i15;
        }
        return j12 <= 0;
    }
}
