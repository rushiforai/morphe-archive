package bg;

import c0.a0;
import c0.f0;
import c0.l2;
import ja0.h;
import java.util.ArrayList;
import r3.s;
import t0.b2;
import x7.n;

/* loaded from: classes.dex */
public final class e implements l2, s {

    /* renamed from: a, reason: collision with root package name */
    public final int f17882a;

    /* renamed from: b, reason: collision with root package name */
    public int f17883b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f17884c;

    public e(int i5, int i11, String str, ArrayList arrayList, d dVar) {
        this.f17882a = i5;
        this.f17883b = i11;
        this.f17884c = dVar;
    }

    @Override // c0.j2
    public c0.s k(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((n) this.f17884c).k(j11, sVar, sVar2, sVar3);
    }

    @Override // c0.l2
    public int l() {
        return this.f17883b;
    }

    @Override // r3.s
    public int m(int i5) {
        int iM = ((s) this.f17884c).m(i5);
        if (i5 >= 0 && i5 <= this.f17883b) {
            b2.c(iM, this.f17882a, i5);
        }
        return iM;
    }

    @Override // c0.l2
    public int n() {
        return this.f17882a;
    }

    @Override // r3.s
    public int o(int i5) {
        int iO = ((s) this.f17884c).o(i5);
        if (i5 >= 0 && i5 <= this.f17882a) {
            b2.b(iO, this.f17883b, i5);
        }
        return iO;
    }

    @Override // c0.j2
    public c0.s p(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((n) this.f17884c).p(j11, sVar, sVar2, sVar3);
    }

    public e(s sVar, int i5, int i11) {
        this.f17884c = sVar;
        this.f17882a = i5;
        this.f17883b = i11;
    }

    public e() {
        this.f17884c = new e[256];
        this.f17882a = 0;
        this.f17883b = 0;
    }

    public e(int i5, int i11) {
        this.f17884c = null;
        this.f17882a = i5;
        int i12 = i11 & 7;
        this.f17883b = i12 == 0 ? 8 : i12;
    }

    public e(h hVar, int i5) {
        this.f17884c = hVar;
        this.f17882a = i5;
    }

    public e(int i5, int i11, a0 a0Var) {
        this.f17882a = i5;
        this.f17883b = i11;
        this.f17884c = new n(new f0(i5, i11, a0Var));
    }
}
