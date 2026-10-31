package o0;

import g0.d1;
import java.util.List;

/* loaded from: classes.dex */
public final class a implements n0.n {

    /* renamed from: a, reason: collision with root package name */
    public final z f78706a;

    public a(z zVar) {
        this.f78706a = zVar;
    }

    @Override // n0.n
    public final int a() {
        return this.f78706a.g().f78786l;
    }

    @Override // n0.n
    public final int b() {
        int i5;
        z zVar = this.f78706a;
        int size = 0;
        if (zVar.g().f78787m.isEmpty()) {
            return 0;
        }
        p pVarG = zVar.g();
        p pVar = r.f78794a;
        int i11 = (int) (pVarG.f78793u == d1.f56493a ? pVarG.n & 4294967295L : pVarG.n >> 32);
        p pVarG2 = zVar.g();
        List list = pVarG2.f78787m;
        if (!list.isEmpty()) {
            int size2 = list.size();
            int i12 = 0;
            while (size < size2) {
                s sVar = (s) list.get(size);
                i12 += (int) (pVarG2.f78793u == d1.f56493a ? sVar.f78811s & 4294967295L : sVar.f78811s >> 32);
                size++;
            }
            size = (i12 / list.size()) + pVarG2.f78791s;
        }
        if (size != 0 && (i5 = i11 / size) >= 1) {
            return i5;
        }
        return 1;
    }

    @Override // n0.n
    public final boolean c() {
        return !this.f78706a.g().f78787m.isEmpty();
    }

    @Override // n0.n
    public final int d() {
        return this.f78706a.f78835c.f78816c.m();
    }

    @Override // n0.n
    public final int e() {
        return ((s) b70.g.h1(this.f78706a.g().f78787m)).f78795a;
    }
}
