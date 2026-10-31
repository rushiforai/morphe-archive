package tf;

import androidx.compose.ui.node.LayoutNode;
import gf.x0;
import java.util.Comparator;
import xk.b3;
import xk.g0;
import xk.i2;
import xk.v0;

/* loaded from: classes3.dex */
public final class k extends m implements Comparable {

    /* renamed from: e, reason: collision with root package name */
    public final int f89087e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f89088f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f89089g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f89090h;

    /* renamed from: i, reason: collision with root package name */
    public final int f89091i;

    /* renamed from: j, reason: collision with root package name */
    public final int f89092j;

    /* renamed from: k, reason: collision with root package name */
    public final int f89093k;

    /* renamed from: l, reason: collision with root package name */
    public final int f89094l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f89095m;

    public k(int i5, x0 x0Var, int i11, h hVar, int i12, String str) {
        int iBitCount;
        int iF;
        super(i5, x0Var, i11);
        int i13 = 0;
        this.f89088f = o.H(i12, false);
        int i14 = this.f89099d.f54875d;
        int i15 = hVar.f89171u;
        v0 v0Var = hVar.f89169s;
        int i16 = i14 & (~i15);
        this.f89089g = (i16 & 1) != 0;
        this.f89090h = (i16 & 2) != 0;
        v0 v0VarS = v0Var.isEmpty() ? v0.s(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : v0Var;
        int i17 = 0;
        while (true) {
            int size = v0VarS.size();
            iBitCount = LayoutNode.NotPlacedPlaceOrder;
            if (i17 >= size) {
                iF = 0;
                i17 = Integer.MAX_VALUE;
                break;
            } else {
                iF = o.F(this.f89099d, (String) v0VarS.get(i17), hVar.f89172v);
                if (iF > 0) {
                    break;
                } else {
                    i17++;
                }
            }
        }
        this.f89091i = i17;
        this.f89092j = iF;
        int i18 = this.f89099d.f54876e;
        int i19 = hVar.f89170t;
        iBitCount = (i18 == 0 || i18 != i19) ? Integer.bitCount(i18 & i19) : iBitCount;
        this.f89093k = iBitCount;
        this.f89095m = (this.f89099d.f54876e & 1088) != 0;
        int iF2 = o.F(this.f89099d, str, o.J(str) == null);
        this.f89094l = iF2;
        boolean z11 = iF > 0 || (v0Var.isEmpty() && iBitCount > 0) || this.f89089g || (this.f89090h && iF2 > 0);
        if (o.H(i12, hVar.K) && z11) {
            i13 = 1;
        }
        this.f89087e = i13;
    }

    @Override // tf.m
    public final int a() {
        return this.f89087e;
    }

    @Override // tf.m
    public final /* bridge */ /* synthetic */ boolean b(m mVar) {
        return false;
    }

    @Override // java.lang.Comparable
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final int compareTo(k kVar) {
        g0 g0VarD = g0.f95916a.d(this.f89088f, kVar.f89088f);
        Integer numValueOf = Integer.valueOf(this.f89091i);
        Integer numValueOf2 = Integer.valueOf(kVar.f89091i);
        Comparator comparator = i2.f95937b;
        b3 b3Var = b3.f95872a;
        g0 g0VarB = g0VarD.b(numValueOf, numValueOf2, b3Var);
        int i5 = kVar.f89092j;
        int i11 = this.f89092j;
        g0 g0VarA = g0VarB.a(i11, i5);
        int i12 = kVar.f89093k;
        int i13 = this.f89093k;
        g0 g0VarD2 = g0VarA.a(i13, i12).d(this.f89089g, kVar.f89089g);
        Boolean boolValueOf = Boolean.valueOf(this.f89090h);
        Boolean boolValueOf2 = Boolean.valueOf(kVar.f89090h);
        if (i11 != 0) {
            comparator = b3Var;
        }
        g0 g0VarA2 = g0VarD2.b(boolValueOf, boolValueOf2, comparator).a(this.f89094l, kVar.f89094l);
        if (i13 == 0) {
            g0VarA2 = g0VarA2.e(this.f89095m, kVar.f89095m);
        }
        return g0VarA2.f();
    }
}
