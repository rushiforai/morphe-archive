package fe;

import android.util.Pair;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class p1 extends z1 {

    /* renamed from: b, reason: collision with root package name */
    public final int f54954b;

    /* renamed from: c, reason: collision with root package name */
    public final gf.v0 f54955c;

    /* renamed from: d, reason: collision with root package name */
    public final int f54956d;

    /* renamed from: e, reason: collision with root package name */
    public final int f54957e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f54958f;

    /* renamed from: g, reason: collision with root package name */
    public final int[] f54959g;

    /* renamed from: h, reason: collision with root package name */
    public final z1[] f54960h;

    /* renamed from: i, reason: collision with root package name */
    public final Object[] f54961i;

    /* renamed from: j, reason: collision with root package name */
    public final HashMap f54962j;

    public p1(ArrayList arrayList, gf.v0 v0Var) {
        this.f54955c = v0Var;
        this.f54954b = v0Var.f57646b.length;
        int size = arrayList.size();
        this.f54958f = new int[size];
        this.f54959g = new int[size];
        this.f54960h = new z1[size];
        this.f54961i = new Object[size];
        this.f54962j = new HashMap();
        Iterator it = arrayList.iterator();
        int iO = 0;
        int iH = 0;
        int i5 = 0;
        while (it.hasNext()) {
            a1 a1Var = (a1) it.next();
            this.f54960h[i5] = a1Var.b();
            this.f54959g[i5] = iO;
            this.f54958f[i5] = iH;
            iO += this.f54960h[i5].o();
            iH += this.f54960h[i5].h();
            this.f54961i[i5] = a1Var.a();
            this.f54962j.put(this.f54961i[i5], Integer.valueOf(i5));
            i5++;
        }
        this.f54956d = iO;
        this.f54957e = iH;
    }

    @Override // fe.z1
    public final int a(boolean z11) {
        if (this.f54954b != 0) {
            int iQ = 0;
            if (z11) {
                int[] iArr = this.f54955c.f57646b;
                iQ = iArr.length > 0 ? iArr[0] : -1;
            }
            do {
                z1[] z1VarArr = this.f54960h;
                if (!z1VarArr[iQ].p()) {
                    return z1VarArr[iQ].a(z11) + this.f54959g[iQ];
                }
                iQ = q(iQ, z11);
            } while (iQ != -1);
        }
        return -1;
    }

    @Override // fe.z1
    public final int b(Object obj) {
        int iB;
        if (obj instanceof Pair) {
            Pair pair = (Pair) obj;
            Object obj2 = pair.first;
            Object obj3 = pair.second;
            Integer num = (Integer) this.f54962j.get(obj2);
            int iIntValue = num == null ? -1 : num.intValue();
            if (iIntValue != -1 && (iB = this.f54960h[iIntValue].b(obj3)) != -1) {
                return this.f54958f[iIntValue] + iB;
            }
        }
        return -1;
    }

    @Override // fe.z1
    public final int c(boolean z11) {
        int iR;
        int i5 = this.f54954b;
        if (i5 != 0) {
            if (z11) {
                int[] iArr = this.f54955c.f57646b;
                iR = iArr.length > 0 ? iArr[iArr.length - 1] : -1;
            } else {
                iR = i5 - 1;
            }
            do {
                z1[] z1VarArr = this.f54960h;
                if (!z1VarArr[iR].p()) {
                    return z1VarArr[iR].c(z11) + this.f54959g[iR];
                }
                iR = r(iR, z11);
            } while (iR != -1);
        }
        return -1;
    }

    @Override // fe.z1
    public final int e(int i5, int i11, boolean z11) {
        int[] iArr = this.f54959g;
        int iD = wf.v.d(iArr, i5 + 1, false, false);
        int i12 = iArr[iD];
        z1[] z1VarArr = this.f54960h;
        int iE = z1VarArr[iD].e(i5 - i12, i11 != 2 ? i11 : 0, z11);
        if (iE != -1) {
            return i12 + iE;
        }
        int iQ = q(iD, z11);
        while (iQ != -1 && z1VarArr[iQ].p()) {
            iQ = q(iQ, z11);
        }
        if (iQ != -1) {
            return z1VarArr[iQ].a(z11) + iArr[iQ];
        }
        if (i11 == 2) {
            return a(z11);
        }
        return -1;
    }

    @Override // fe.z1
    public final x1 f(int i5, x1 x1Var, boolean z11) {
        int[] iArr = this.f54958f;
        int iD = wf.v.d(iArr, i5 + 1, false, false);
        int i11 = this.f54959g[iD];
        this.f54960h[iD].f(i5 - iArr[iD], x1Var, z11);
        x1Var.f55077c += i11;
        if (z11) {
            Object obj = this.f54961i[iD];
            Object obj2 = x1Var.f55076b;
            obj2.getClass();
            x1Var.f55076b = Pair.create(obj, obj2);
        }
        return x1Var;
    }

    @Override // fe.z1
    public final x1 g(Object obj, x1 x1Var) {
        Pair pair = (Pair) obj;
        Object obj2 = pair.first;
        Object obj3 = pair.second;
        Integer num = (Integer) this.f54962j.get(obj2);
        int iIntValue = num == null ? -1 : num.intValue();
        int i5 = this.f54959g[iIntValue];
        this.f54960h[iIntValue].g(obj3, x1Var);
        x1Var.f55077c += i5;
        x1Var.f55076b = obj;
        return x1Var;
    }

    @Override // fe.z1
    public final int h() {
        return this.f54957e;
    }

    @Override // fe.z1
    public final int k(int i5, int i11, boolean z11) {
        int[] iArr = this.f54959g;
        int iD = wf.v.d(iArr, i5 + 1, false, false);
        int i12 = iArr[iD];
        z1[] z1VarArr = this.f54960h;
        int iK = z1VarArr[iD].k(i5 - i12, i11 != 2 ? i11 : 0, z11);
        if (iK != -1) {
            return i12 + iK;
        }
        int iR = r(iD, z11);
        while (iR != -1 && z1VarArr[iR].p()) {
            iR = r(iR, z11);
        }
        if (iR != -1) {
            return z1VarArr[iR].c(z11) + iArr[iR];
        }
        if (i11 == 2) {
            return c(z11);
        }
        return -1;
    }

    @Override // fe.z1
    public final Object l(int i5) {
        int[] iArr = this.f54958f;
        int iD = wf.v.d(iArr, i5 + 1, false, false);
        return Pair.create(this.f54961i[iD], this.f54960h[iD].l(i5 - iArr[iD]));
    }

    @Override // fe.z1
    public final y1 m(int i5, y1 y1Var, long j11) {
        int[] iArr = this.f54959g;
        int iD = wf.v.d(iArr, i5 + 1, false, false);
        int i11 = iArr[iD];
        int i12 = this.f54958f[iD];
        this.f54960h[iD].m(i5 - i11, y1Var, j11);
        Object objCreate = this.f54961i[iD];
        if (!y1.f55095q.equals(y1Var.f55098a)) {
            objCreate = Pair.create(objCreate, y1Var.f55098a);
        }
        y1Var.f55098a = objCreate;
        y1Var.n += i12;
        y1Var.o += i12;
        return y1Var;
    }

    @Override // fe.z1
    public final int o() {
        return this.f54956d;
    }

    public final int q(int i5, boolean z11) {
        if (!z11) {
            if (i5 < this.f54954b - 1) {
                return i5 + 1;
            }
            return -1;
        }
        gf.v0 v0Var = this.f54955c;
        int i11 = v0Var.f57647c[i5] + 1;
        int[] iArr = v0Var.f57646b;
        if (i11 < iArr.length) {
            return iArr[i11];
        }
        return -1;
    }

    public final int r(int i5, boolean z11) {
        if (!z11) {
            if (i5 > 0) {
                return i5 - 1;
            }
            return -1;
        }
        gf.v0 v0Var = this.f54955c;
        int i11 = v0Var.f57647c[i5] - 1;
        if (i11 >= 0) {
            return v0Var.f57646b[i11];
        }
        return -1;
    }
}
