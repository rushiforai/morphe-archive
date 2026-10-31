package d1;

import androidx.compose.ui.node.LayoutNode;
import com.google.android.gms.internal.measurement.k2;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m3.k0;
import m3.l0;
import m3.p;
import m3.p0;
import p10.c0;
import q3.o;
import t0.t0;
import y3.n;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public m3.g f48744a;

    /* renamed from: b, reason: collision with root package name */
    public o f48745b;

    /* renamed from: c, reason: collision with root package name */
    public int f48746c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f48747d;

    /* renamed from: e, reason: collision with root package name */
    public int f48748e;

    /* renamed from: f, reason: collision with root package name */
    public int f48749f;

    /* renamed from: g, reason: collision with root package name */
    public List f48750g;

    /* renamed from: h, reason: collision with root package name */
    public b f48751h;

    /* renamed from: j, reason: collision with root package name */
    public y3.c f48753j;

    /* renamed from: k, reason: collision with root package name */
    public p0 f48754k;

    /* renamed from: l, reason: collision with root package name */
    public qp.i f48755l;

    /* renamed from: m, reason: collision with root package name */
    public n f48756m;
    public l0 n;

    /* renamed from: q, reason: collision with root package name */
    public long f48758q;

    /* renamed from: i, reason: collision with root package name */
    public long f48752i = a.f48732a;
    public int o = -1;

    /* renamed from: p, reason: collision with root package name */
    public int f48757p = -1;

    public d(m3.g gVar, p0 p0Var, o oVar, int i5, boolean z11, int i11, int i12, List list) {
        this.f48744a = gVar;
        this.f48745b = oVar;
        this.f48746c = i5;
        this.f48747d = z11;
        this.f48748e = i11;
        this.f48749f = i12;
        this.f48750g = list;
        this.f48754k = p0Var;
    }

    public final int a(int i5, n nVar) {
        int i11 = this.o;
        int i12 = this.f48757p;
        if (i5 == i11 && i11 != -1) {
            return i12;
        }
        long jA = y3.b.a(0, i5, 0, LayoutNode.NotPlacedPlaceOrder);
        if (this.f48749f > 1) {
            b bVar = this.f48751h;
            p0 p0Var = this.f48754k;
            y3.c cVar = this.f48753j;
            Intrinsics.d(cVar);
            b bVarB = c0.B(bVar, nVar, p0Var, cVar, this.f48745b);
            this.f48751h = bVarB;
            jA = bVarB.a(this.f48749f, jA);
        }
        int iP = t0.p(b(jA, nVar).f75951e);
        int i13 = y3.a.i(jA);
        if (iP < i13) {
            iP = i13;
        }
        this.o = i5;
        this.f48757p = iP;
        return iP;
    }

    public final p b(long j11, n nVar) {
        qp.i iVarE = e(nVar);
        long jC = ul.b.C(j11, this.f48747d, this.f48746c, iVarE.b());
        boolean z11 = this.f48747d;
        int i5 = this.f48746c;
        int i11 = this.f48748e;
        return new p(iVarE, jC, ((z11 || !(i5 == 2 || i5 == 4 || i5 == 5)) && i11 >= 1) ? i11 : 1, i5);
    }

    public final boolean c(long j11, n nVar) {
        this.f48758q = (this.f48758q << 2) | 3;
        if (this.f48749f > 1) {
            b bVar = this.f48751h;
            p0 p0Var = this.f48754k;
            y3.c cVar = this.f48753j;
            Intrinsics.d(cVar);
            b bVarB = c0.B(bVar, nVar, p0Var, cVar, this.f48745b);
            this.f48751h = bVarB;
            j11 = bVarB.a(this.f48749f, j11);
        }
        l0 l0Var = this.n;
        if (l0Var != null) {
            p pVar = l0Var.f75928b;
            k0 k0Var = l0Var.f75927a;
            if (!pVar.f75947a.a()) {
                n nVar2 = k0Var.f75921h;
                long j12 = k0Var.f75923j;
                if (nVar == nVar2 && (y3.a.b(j11, j12) || (y3.a.h(j11) == y3.a.h(j12) && y3.a.j(j11) == y3.a.j(j12) && y3.a.g(j11) >= pVar.f75951e && !pVar.f75949c))) {
                    l0 l0Var2 = this.n;
                    Intrinsics.d(l0Var2);
                    if (y3.a.b(j11, l0Var2.f75927a.f75923j)) {
                        return false;
                    }
                    l0 l0Var3 = this.n;
                    Intrinsics.d(l0Var3);
                    this.n = f(nVar, j11, l0Var3.f75928b);
                    return true;
                }
            }
        }
        this.n = f(nVar, j11, b(j11, nVar));
        return true;
    }

    public final void d(y3.c cVar) {
        long jA;
        y3.c cVar2 = this.f48753j;
        if (cVar != null) {
            int i5 = a.f48733b;
            jA = a.a(cVar.getDensity(), cVar.getFontScale());
        } else {
            jA = a.f48732a;
        }
        if (cVar2 == null) {
            this.f48753j = cVar;
            this.f48752i = jA;
        } else if (cVar == null || this.f48752i != jA) {
            this.f48753j = cVar;
            this.f48752i = jA;
            this.f48758q = (this.f48758q << 2) | 1;
            this.f48755l = null;
            this.n = null;
            this.f48757p = -1;
            this.o = -1;
        }
    }

    public final qp.i e(n nVar) {
        qp.i iVar = this.f48755l;
        if (iVar == null || nVar != this.f48756m || iVar.a()) {
            this.f48756m = nVar;
            m3.g gVar = this.f48744a;
            p0 p0VarN = fg.a.N(this.f48754k, nVar);
            y3.c cVar = this.f48753j;
            Intrinsics.d(cVar);
            o oVar = this.f48745b;
            List list = this.f48750g;
            if (list == null) {
                list = EmptyList.f71733a;
            }
            iVar = new qp.i(gVar, p0VarN, list, cVar, oVar);
        }
        this.f48755l = iVar;
        return iVar;
    }

    public final l0 f(n nVar, long j11, p pVar) {
        float fMin = Math.min(pVar.f75947a.b(), pVar.f75950d);
        m3.g gVar = this.f48744a;
        p0 p0Var = this.f48754k;
        List list = this.f48750g;
        if (list == null) {
            list = EmptyList.f71733a;
        }
        int i5 = this.f48748e;
        boolean z11 = this.f48747d;
        int i11 = this.f48746c;
        y3.c cVar = this.f48753j;
        Intrinsics.d(cVar);
        return new l0(new k0(gVar, p0Var, list, i5, z11, i11, cVar, nVar, this.f48745b, j11), pVar, y3.b.d(j11, (t0.p(fMin) << 32) | (t0.p(pVar.f75951e) & 4294967295L)));
    }

    public final String toString() {
        k0 k0Var;
        StringBuilder sb2 = new StringBuilder("MultiParagraphLayoutCache(textLayoutResult=");
        l0 l0Var = this.n;
        Object aVar = AbstractJsonLexerKt.NULL;
        sb2.append(l0Var != null ? "<TextLayoutResult>" : AbstractJsonLexerKt.NULL);
        sb2.append(", lastDensity=");
        sb2.append((Object) a.b(this.f48752i));
        sb2.append(", history=");
        sb2.append(this.f48758q);
        sb2.append(", constraints=");
        l0 l0Var2 = this.n;
        if (l0Var2 != null && (k0Var = l0Var2.f75927a) != null) {
            aVar = new y3.a(k0Var.f75923j);
        }
        return k2.j(sb2, aVar, ')');
    }
}
