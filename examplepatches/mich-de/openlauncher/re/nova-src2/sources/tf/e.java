package tf;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;
import fe.k0;
import gf.x0;
import java.util.Locale;
import xk.b3;
import xk.g0;
import xk.l2;
import xk.v0;

/* loaded from: classes3.dex */
public final class e extends m implements Comparable {

    /* renamed from: e, reason: collision with root package name */
    public final int f89068e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f89069f;

    /* renamed from: g, reason: collision with root package name */
    public final String f89070g;

    /* renamed from: h, reason: collision with root package name */
    public final h f89071h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f89072i;

    /* renamed from: j, reason: collision with root package name */
    public final int f89073j;

    /* renamed from: k, reason: collision with root package name */
    public final int f89074k;

    /* renamed from: l, reason: collision with root package name */
    public final int f89075l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f89076m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f89077p;

    /* renamed from: q, reason: collision with root package name */
    public final int f89078q;

    /* renamed from: r, reason: collision with root package name */
    public final int f89079r;

    /* renamed from: s, reason: collision with root package name */
    public final int f89080s;

    /* renamed from: t, reason: collision with root package name */
    public final int f89081t;

    /* renamed from: u, reason: collision with root package name */
    public final boolean f89082u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f89083v;

    public e(int i5, x0 x0Var, int i11, h hVar, int i12, boolean z11, d dVar) {
        v0 v0Var;
        int i13;
        int iF;
        String[] strArrSplit;
        int iF2;
        super(i5, x0Var, i11);
        this.f89071h = hVar;
        this.f89070g = o.J(this.f89099d.f54874c);
        int i14 = 0;
        this.f89072i = o.H(i12, false);
        int i15 = 0;
        while (true) {
            v0 v0Var2 = hVar.n;
            v0Var = hVar.f89168r;
            int size = v0Var2.size();
            i13 = LayoutNode.NotPlacedPlaceOrder;
            if (i15 >= size) {
                iF = 0;
                i15 = Integer.MAX_VALUE;
                break;
            } else {
                iF = o.F(this.f89099d, (String) hVar.n.get(i15), false);
                if (iF > 0) {
                    break;
                } else {
                    i15++;
                }
            }
        }
        this.f89074k = i15;
        this.f89073j = iF;
        int i16 = this.f89099d.f54876e;
        int i17 = hVar.o;
        this.f89075l = (i16 == 0 || i16 != i17) ? Integer.bitCount(i16 & i17) : Integer.MAX_VALUE;
        k0 k0Var = this.f89099d;
        int i18 = k0Var.f54876e;
        this.f89076m = i18 == 0 || (i18 & 1) != 0;
        this.f89077p = (k0Var.f54875d & 1) != 0;
        int i19 = k0Var.f54894y;
        this.f89078q = i19;
        this.f89079r = k0Var.f54895z;
        int i21 = k0Var.f54879h;
        this.f89080s = i21;
        this.f89069f = (i21 == -1 || i21 <= hVar.f89167q) && (i19 == -1 || i19 <= hVar.f89166p) && dVar.apply(k0Var);
        Configuration configuration = Resources.getSystem().getConfiguration();
        int i22 = wf.v.f94376a;
        if (i22 >= 24) {
            strArrSplit = configuration.getLocales().toLanguageTags().split(",", -1);
        } else {
            Locale locale = configuration.locale;
            strArrSplit = new String[]{i22 >= 21 ? locale.toLanguageTag() : locale.toString()};
        }
        for (int i23 = 0; i23 < strArrSplit.length; i23++) {
            strArrSplit[i23] = wf.v.z(strArrSplit[i23]);
        }
        int i24 = 0;
        while (true) {
            if (i24 >= strArrSplit.length) {
                iF2 = 0;
                i24 = Integer.MAX_VALUE;
                break;
            } else {
                iF2 = o.F(this.f89099d, strArrSplit[i24], false);
                if (iF2 > 0) {
                    break;
                } else {
                    i24++;
                }
            }
        }
        this.n = i24;
        this.o = iF2;
        int i25 = 0;
        while (true) {
            if (i25 >= v0Var.size()) {
                break;
            }
            String str = this.f89099d.f54883l;
            if (str != null && str.equals(v0Var.get(i25))) {
                i13 = i25;
                break;
            }
            i25++;
        }
        this.f89081t = i13;
        this.f89082u = (i12 & 384) == 128;
        this.f89083v = (i12 & 64) == 64;
        boolean z12 = this.f89069f;
        h hVar2 = this.f89071h;
        if (o.H(i12, hVar2.K) && (z12 || hVar2.E)) {
            i14 = (!o.H(i12, false) || !z12 || this.f89099d.f54879h == -1 || hVar2.f89174x || hVar2.f89173w || (!hVar2.M && z11)) ? 1 : 2;
        }
        this.f89068e = i14;
    }

    @Override // tf.m
    public final int a() {
        return this.f89068e;
    }

    @Override // tf.m
    public final boolean b(m mVar) {
        int i5;
        String str;
        int i11;
        e eVar = (e) mVar;
        k0 k0Var = eVar.f89099d;
        h hVar = this.f89071h;
        boolean z11 = hVar.H;
        k0 k0Var2 = this.f89099d;
        if (!z11 && ((i11 = k0Var2.f54894y) == -1 || i11 != k0Var.f54894y)) {
            return false;
        }
        if (!hVar.F && ((str = k0Var2.f54883l) == null || !TextUtils.equals(str, k0Var.f54883l))) {
            return false;
        }
        if (!hVar.G && ((i5 = k0Var2.f54895z) == -1 || i5 != k0Var.f54895z)) {
            return false;
        }
        if (hVar.I) {
            return true;
        }
        return this.f89082u == eVar.f89082u && this.f89083v == eVar.f89083v;
    }

    @Override // java.lang.Comparable
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final int compareTo(e eVar) {
        boolean z11 = this.f89072i;
        boolean z12 = this.f89069f;
        l2 l2VarB = (z12 && z11) ? o.n : o.n.b();
        boolean z13 = eVar.f89072i;
        int i5 = eVar.f89080s;
        g0 g0VarD = g0.f95916a.d(z11, z13);
        Integer numValueOf = Integer.valueOf(this.f89074k);
        Integer numValueOf2 = Integer.valueOf(eVar.f89074k);
        b3 b3Var = b3.f95872a;
        g0 g0VarB = g0VarD.b(numValueOf, numValueOf2, b3Var).a(this.f89073j, eVar.f89073j).a(this.f89075l, eVar.f89075l).d(this.f89077p, eVar.f89077p).d(this.f89076m, eVar.f89076m).b(Integer.valueOf(this.n), Integer.valueOf(eVar.n), b3Var).a(this.o, eVar.o).d(z12, eVar.f89069f).b(Integer.valueOf(this.f89081t), Integer.valueOf(eVar.f89081t), b3Var);
        int i11 = this.f89080s;
        g0 g0VarB2 = g0VarB.b(Integer.valueOf(i11), Integer.valueOf(i5), this.f89071h.f89173w ? o.n.b() : o.o).d(this.f89082u, eVar.f89082u).d(this.f89083v, eVar.f89083v).b(Integer.valueOf(this.f89078q), Integer.valueOf(eVar.f89078q), l2VarB).b(Integer.valueOf(this.f89079r), Integer.valueOf(eVar.f89079r), l2VarB);
        Integer numValueOf3 = Integer.valueOf(i11);
        Integer numValueOf4 = Integer.valueOf(i5);
        if (!wf.v.a(this.f89070g, eVar.f89070g)) {
            l2VarB = o.o;
        }
        return g0VarB2.b(numValueOf3, numValueOf4, l2VarB).f();
    }
}
