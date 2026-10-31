package ke;

import io.sentry.e3;

/* loaded from: classes3.dex */
public class n implements s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71408a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71409b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f71410c;

    public /* synthetic */ n(Object obj, long j11, int i5) {
        this.f71408a = i5;
        this.f71410c = obj;
        this.f71409b = j11;
    }

    @Override // ke.s
    public final r d(long j11) {
        switch (this.f71408a) {
            case 0:
                o oVar = (o) this.f71410c;
                wf.a.j(oVar.f71421k);
                e3 e3Var = oVar.f71421k;
                long[] jArr = (long[]) e3Var.f67208b;
                long[] jArr2 = (long[]) e3Var.f67209c;
                int iE = wf.v.e(jArr, wf.v.i((oVar.f71415e * j11) / 1000000, 0L, oVar.f71420j - 1), false);
                long j12 = iE == -1 ? 0L : jArr[iE];
                long j13 = iE != -1 ? jArr2[iE] : 0L;
                int i5 = oVar.f71415e;
                long j14 = (j12 * 1000000) / i5;
                long j15 = this.f71409b;
                t tVar = new t(j14, j13 + j15);
                if (j14 == j11 || iE == jArr.length - 1) {
                    return new r(tVar, tVar);
                }
                int i11 = iE + 1;
                return new r(tVar, new t((jArr[i11] * 1000000) / i5, j15 + jArr2[i11]));
            case 1:
                return (r) this.f71410c;
            default:
                me.b bVar = (me.b) this.f71410c;
                r rVarB = bVar.f76235g[0].b(j11);
                int i12 = 1;
                while (true) {
                    me.e[] eVarArr = bVar.f76235g;
                    if (i12 >= eVarArr.length) {
                        return rVarB;
                    }
                    r rVarB2 = eVarArr[i12].b(j11);
                    if (rVarB2.f71430a.f71434b < rVarB.f71430a.f71434b) {
                        rVarB = rVarB2;
                    }
                    i12++;
                }
        }
    }

    @Override // ke.s
    public final boolean f() {
        switch (this.f71408a) {
            case 0:
                return true;
            case 1:
                return false;
            default:
                return true;
        }
    }

    @Override // ke.s
    public final long i() {
        switch (this.f71408a) {
        }
        return this.f71409b;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public n(long j11) {
        this(j11, 0L);
        this.f71408a = 1;
    }

    public n(long j11, long j12) {
        this.f71408a = 1;
        this.f71409b = j11;
        t tVar = j12 == 0 ? t.f71432c : new t(0L, j12);
        this.f71410c = new r(tVar, tVar);
    }
}
