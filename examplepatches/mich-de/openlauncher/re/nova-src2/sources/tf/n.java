package tf;

import androidx.compose.ui.node.LayoutNode;
import fe.k0;
import gf.x0;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import xk.b3;
import xk.g0;
import xk.v0;

/* loaded from: classes3.dex */
public final class n extends m {

    /* renamed from: e, reason: collision with root package name */
    public final boolean f89100e;

    /* renamed from: f, reason: collision with root package name */
    public final h f89101f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f89102g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f89103h;

    /* renamed from: i, reason: collision with root package name */
    public final int f89104i;

    /* renamed from: j, reason: collision with root package name */
    public final int f89105j;

    /* renamed from: k, reason: collision with root package name */
    public final int f89106k;

    /* renamed from: l, reason: collision with root package name */
    public final int f89107l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f89108m;
    public final boolean n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f89109p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f89110q;

    /* renamed from: r, reason: collision with root package name */
    public final int f89111r;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:115:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0100  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public n(int i5, x0 x0Var, int i11, h hVar, int i12, int i13, boolean z11) {
        boolean z12;
        boolean z13;
        int i14;
        int i15;
        k0 k0Var;
        int i16;
        int i17;
        int i18;
        k0 k0Var2;
        int i19;
        int i21;
        int i22;
        super(i5, x0Var, i11);
        this.f89101f = hVar;
        boolean z14 = hVar.C;
        v0 v0Var = hVar.f89164l;
        int i23 = z14 ? 24 : 16;
        int i24 = 0;
        this.n = hVar.B && (i13 & i23) != 0;
        if (!z11 || (((i19 = (k0Var2 = this.f89099d).f54886q) != -1 && i19 > hVar.f89153a) || ((i21 = k0Var2.f54887r) != -1 && i21 > hVar.f89154b))) {
            z12 = false;
        } else {
            float f11 = k0Var2.f54888s;
            if ((f11 == -1.0f || f11 <= hVar.f89155c) && ((i22 = k0Var2.f54879h) == -1 || i22 <= hVar.f89156d)) {
                z12 = true;
            }
        }
        this.f89100e = z12;
        if (!z11 || (((i16 = (k0Var = this.f89099d).f54886q) != -1 && i16 < hVar.f89157e) || ((i17 = k0Var.f54887r) != -1 && i17 < hVar.f89158f))) {
            z13 = false;
        } else {
            float f12 = k0Var.f54888s;
            if ((f12 == -1.0f || f12 >= hVar.f89159g) && ((i18 = k0Var.f54879h) == -1 || i18 >= hVar.f89160h)) {
                z13 = true;
            }
        }
        this.f89102g = z13;
        this.f89103h = o.H(i12, false);
        k0 k0Var3 = this.f89099d;
        this.f89104i = k0Var3.f54879h;
        int i25 = k0Var3.f54886q;
        this.f89105j = (i25 == -1 || (i15 = k0Var3.f54887r) == -1) ? -1 : i25 * i15;
        int i26 = k0Var3.f54876e;
        int i27 = hVar.f89165m;
        int i28 = LayoutNode.NotPlacedPlaceOrder;
        this.f89107l = (i26 == 0 || i26 != i27) ? Integer.bitCount(i26 & i27) : Integer.MAX_VALUE;
        int i29 = this.f89099d.f54876e;
        this.f89108m = i29 == 0 || (i29 & 1) != 0;
        int i31 = 0;
        while (true) {
            if (i31 < v0Var.size()) {
                String str = this.f89099d.f54883l;
                if (str != null && str.equals(v0Var.get(i31))) {
                    i28 = i31;
                    break;
                }
                i31++;
            } else {
                break;
            }
        }
        this.f89106k = i28;
        this.f89109p = (i12 & 384) == 128;
        this.f89110q = (i12 & 64) == 64;
        k0 k0Var4 = this.f89099d;
        String str2 = k0Var4.f54883l;
        if (str2 != null) {
            i14 = 4;
            switch (str2) {
                case "video/dolby-vision":
                    i14 = 5;
                    break;
                case "video/hevc":
                    i14 = 3;
                    break;
                case "video/avc":
                    i14 = 1;
                    break;
                case "video/x-vnd.on2.vp9":
                    i14 = 2;
                    break;
            }
        } else {
            i14 = 0;
        }
        this.f89111r = i14;
        boolean z15 = this.f89100e;
        h hVar2 = this.f89101f;
        if ((k0Var4.f54876e & ReaderJsonLexerKt.BATCH_SIZE) == 0 && o.H(i12, hVar2.K) && (z15 || hVar2.A)) {
            i24 = (!o.H(i12, false) || !this.f89102g || !z15 || k0Var4.f54879h == -1 || hVar2.f89174x || hVar2.f89173w || (i23 & i12) == 0) ? 1 : 2;
        }
        this.o = i24;
    }

    public static int c(n nVar, n nVar2) {
        g0 g0VarB = g0.f95916a.d(nVar.f89103h, nVar2.f89103h).a(nVar.f89107l, nVar2.f89107l).d(nVar.f89108m, nVar2.f89108m).d(nVar.f89100e, nVar2.f89100e).d(nVar.f89102g, nVar2.f89102g).b(Integer.valueOf(nVar.f89106k), Integer.valueOf(nVar2.f89106k), b3.f95872a);
        boolean z11 = nVar.f89109p;
        g0 g0VarD = g0VarB.d(z11, nVar2.f89109p);
        boolean z12 = nVar.f89110q;
        g0 g0VarD2 = g0VarD.d(z12, nVar2.f89110q);
        if (z11 && z12) {
            g0VarD2 = g0VarD2.a(nVar.f89111r, nVar2.f89111r);
        }
        return g0VarD2.f();
    }

    @Override // tf.m
    public final int a() {
        return this.o;
    }

    @Override // tf.m
    public final boolean b(m mVar) {
        n nVar = (n) mVar;
        if (!this.n && !wf.v.a(this.f89099d.f54883l, nVar.f89099d.f54883l)) {
            return false;
        }
        if (this.f89101f.D) {
            return true;
        }
        return this.f89109p == nVar.f89109p && this.f89110q == nVar.f89110q;
    }
}
