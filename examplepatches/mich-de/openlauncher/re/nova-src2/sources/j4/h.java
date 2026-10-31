package j4;

import android.view.ViewGroup;
import java.util.Arrays;
import java.util.HashMap;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public int f68970a;

    /* renamed from: b, reason: collision with root package name */
    public final k f68971b;

    /* renamed from: c, reason: collision with root package name */
    public final j f68972c;

    /* renamed from: d, reason: collision with root package name */
    public final i f68973d;

    /* renamed from: e, reason: collision with root package name */
    public final l f68974e;

    /* renamed from: f, reason: collision with root package name */
    public HashMap f68975f;

    public h() {
        k kVar = new k();
        kVar.f69026a = 0;
        kVar.f69027b = 0;
        kVar.f69028c = 1.0f;
        kVar.f69029d = Float.NaN;
        this.f68971b = kVar;
        j jVar = new j();
        jVar.f69017a = -1;
        jVar.f69018b = 0;
        jVar.f69019c = -1;
        jVar.f69020d = Float.NaN;
        jVar.f69021e = Float.NaN;
        jVar.f69022f = Float.NaN;
        jVar.f69023g = -1;
        jVar.f69024h = null;
        jVar.f69025i = -1;
        this.f68972c = jVar;
        i iVar = new i();
        iVar.f68977a = false;
        iVar.f68983d = -1;
        iVar.f68985e = -1;
        iVar.f68987f = -1.0f;
        iVar.f68989g = true;
        iVar.f68991h = -1;
        iVar.f68993i = -1;
        iVar.f68995j = -1;
        iVar.f68997k = -1;
        iVar.f68999l = -1;
        iVar.f69001m = -1;
        iVar.n = -1;
        iVar.o = -1;
        iVar.f69005p = -1;
        iVar.f69006q = -1;
        iVar.f69007r = -1;
        iVar.f69008s = -1;
        iVar.f69009t = -1;
        iVar.f69010u = -1;
        iVar.f69011v = -1;
        iVar.f69012w = 0.5f;
        iVar.f69013x = 0.5f;
        iVar.f69014y = null;
        iVar.f69015z = -1;
        iVar.A = 0;
        iVar.B = 0.0f;
        iVar.C = -1;
        iVar.D = -1;
        iVar.E = -1;
        iVar.F = 0;
        iVar.G = 0;
        iVar.H = 0;
        iVar.I = 0;
        iVar.J = 0;
        iVar.K = 0;
        iVar.L = 0;
        iVar.M = Integer.MIN_VALUE;
        iVar.N = Integer.MIN_VALUE;
        iVar.O = Integer.MIN_VALUE;
        iVar.P = Integer.MIN_VALUE;
        iVar.Q = Integer.MIN_VALUE;
        iVar.R = Integer.MIN_VALUE;
        iVar.S = Integer.MIN_VALUE;
        iVar.T = -1.0f;
        iVar.U = -1.0f;
        iVar.V = 0;
        iVar.W = 0;
        iVar.X = 0;
        iVar.Y = 0;
        iVar.Z = 0;
        iVar.f68978a0 = 0;
        iVar.f68980b0 = 0;
        iVar.f68982c0 = 0;
        iVar.f68984d0 = 1.0f;
        iVar.f68986e0 = 1.0f;
        iVar.f68988f0 = -1;
        iVar.f68990g0 = 0;
        iVar.f68992h0 = -1;
        iVar.f69000l0 = false;
        iVar.f69002m0 = false;
        iVar.f69003n0 = true;
        iVar.f69004o0 = 0;
        this.f68973d = iVar;
        l lVar = new l();
        lVar.f69030a = 0.0f;
        lVar.f69031b = 0.0f;
        lVar.f69032c = 0.0f;
        lVar.f69033d = 1.0f;
        lVar.f69034e = 1.0f;
        lVar.f69035f = Float.NaN;
        lVar.f69036g = Float.NaN;
        lVar.f69037h = -1;
        lVar.f69038i = 0.0f;
        lVar.f69039j = 0.0f;
        lVar.f69040k = 0.0f;
        lVar.f69041l = false;
        lVar.f69042m = 0.0f;
        this.f68974e = lVar;
        this.f68975f = new HashMap();
    }

    public final void a(e eVar) {
        i iVar = this.f68973d;
        eVar.f68921e = iVar.f68991h;
        eVar.f68923f = iVar.f68993i;
        eVar.f68925g = iVar.f68995j;
        eVar.f68927h = iVar.f68997k;
        eVar.f68929i = iVar.f68999l;
        eVar.f68931j = iVar.f69001m;
        eVar.f68933k = iVar.n;
        eVar.f68935l = iVar.o;
        eVar.f68937m = iVar.f69005p;
        eVar.n = iVar.f69006q;
        eVar.o = iVar.f69007r;
        eVar.f68945s = iVar.f69008s;
        eVar.f68946t = iVar.f69009t;
        eVar.f68947u = iVar.f69010u;
        eVar.f68948v = iVar.f69011v;
        ((ViewGroup.MarginLayoutParams) eVar).leftMargin = iVar.F;
        ((ViewGroup.MarginLayoutParams) eVar).rightMargin = iVar.G;
        ((ViewGroup.MarginLayoutParams) eVar).topMargin = iVar.H;
        ((ViewGroup.MarginLayoutParams) eVar).bottomMargin = iVar.I;
        eVar.A = iVar.R;
        eVar.B = iVar.Q;
        eVar.f68950x = iVar.N;
        eVar.f68952z = iVar.P;
        eVar.E = iVar.f69012w;
        eVar.F = iVar.f69013x;
        eVar.f68941p = iVar.f69015z;
        eVar.f68943q = iVar.A;
        eVar.f68944r = iVar.B;
        eVar.G = iVar.f69014y;
        eVar.T = iVar.C;
        eVar.U = iVar.D;
        eVar.I = iVar.T;
        eVar.H = iVar.U;
        eVar.K = iVar.W;
        eVar.J = iVar.V;
        eVar.W = iVar.f69000l0;
        eVar.X = iVar.f69002m0;
        eVar.L = iVar.X;
        eVar.M = iVar.Y;
        eVar.P = iVar.Z;
        eVar.Q = iVar.f68978a0;
        eVar.N = iVar.f68980b0;
        eVar.O = iVar.f68982c0;
        eVar.R = iVar.f68984d0;
        eVar.S = iVar.f68986e0;
        eVar.V = iVar.E;
        eVar.f68917c = iVar.f68987f;
        eVar.f68913a = iVar.f68983d;
        eVar.f68915b = iVar.f68985e;
        ((ViewGroup.MarginLayoutParams) eVar).width = iVar.f68979b;
        ((ViewGroup.MarginLayoutParams) eVar).height = iVar.f68981c;
        String str = iVar.f68998k0;
        if (str != null) {
            eVar.Y = str;
        }
        eVar.Z = iVar.f69004o0;
        eVar.setMarginStart(iVar.K);
        eVar.setMarginEnd(iVar.J);
        eVar.a();
    }

    public final Object clone() {
        h hVar = new h();
        i iVar = hVar.f68973d;
        iVar.getClass();
        i iVar2 = this.f68973d;
        iVar.f68977a = iVar2.f68977a;
        iVar.f68979b = iVar2.f68979b;
        iVar.f68981c = iVar2.f68981c;
        iVar.f68983d = iVar2.f68983d;
        iVar.f68985e = iVar2.f68985e;
        iVar.f68987f = iVar2.f68987f;
        iVar.f68989g = iVar2.f68989g;
        iVar.f68991h = iVar2.f68991h;
        iVar.f68993i = iVar2.f68993i;
        iVar.f68995j = iVar2.f68995j;
        iVar.f68997k = iVar2.f68997k;
        iVar.f68999l = iVar2.f68999l;
        iVar.f69001m = iVar2.f69001m;
        iVar.n = iVar2.n;
        iVar.o = iVar2.o;
        iVar.f69005p = iVar2.f69005p;
        iVar.f69006q = iVar2.f69006q;
        iVar.f69007r = iVar2.f69007r;
        iVar.f69008s = iVar2.f69008s;
        iVar.f69009t = iVar2.f69009t;
        iVar.f69010u = iVar2.f69010u;
        iVar.f69011v = iVar2.f69011v;
        iVar.f69012w = iVar2.f69012w;
        iVar.f69013x = iVar2.f69013x;
        iVar.f69014y = iVar2.f69014y;
        iVar.f69015z = iVar2.f69015z;
        iVar.A = iVar2.A;
        iVar.B = iVar2.B;
        iVar.C = iVar2.C;
        iVar.D = iVar2.D;
        iVar.E = iVar2.E;
        iVar.F = iVar2.F;
        iVar.G = iVar2.G;
        iVar.H = iVar2.H;
        iVar.I = iVar2.I;
        iVar.J = iVar2.J;
        iVar.K = iVar2.K;
        iVar.L = iVar2.L;
        iVar.M = iVar2.M;
        iVar.N = iVar2.N;
        iVar.O = iVar2.O;
        iVar.P = iVar2.P;
        iVar.Q = iVar2.Q;
        iVar.R = iVar2.R;
        iVar.S = iVar2.S;
        iVar.T = iVar2.T;
        iVar.U = iVar2.U;
        iVar.V = iVar2.V;
        iVar.W = iVar2.W;
        iVar.X = iVar2.X;
        iVar.Y = iVar2.Y;
        iVar.Z = iVar2.Z;
        iVar.f68978a0 = iVar2.f68978a0;
        iVar.f68980b0 = iVar2.f68980b0;
        iVar.f68982c0 = iVar2.f68982c0;
        iVar.f68984d0 = iVar2.f68984d0;
        iVar.f68986e0 = iVar2.f68986e0;
        iVar.f68988f0 = iVar2.f68988f0;
        iVar.f68990g0 = iVar2.f68990g0;
        iVar.f68992h0 = iVar2.f68992h0;
        iVar.f68998k0 = iVar2.f68998k0;
        int[] iArr = iVar2.f68994i0;
        if (iArr == null || iVar2.f68996j0 != null) {
            iVar.f68994i0 = null;
        } else {
            iVar.f68994i0 = Arrays.copyOf(iArr, iArr.length);
        }
        iVar.f68996j0 = iVar2.f68996j0;
        iVar.f69000l0 = iVar2.f69000l0;
        iVar.f69002m0 = iVar2.f69002m0;
        iVar.f69003n0 = iVar2.f69003n0;
        iVar.f69004o0 = iVar2.f69004o0;
        j jVar = hVar.f68972c;
        jVar.getClass();
        j jVar2 = this.f68972c;
        jVar2.getClass();
        jVar.f69017a = jVar2.f69017a;
        jVar.f69019c = jVar2.f69019c;
        jVar.f69021e = jVar2.f69021e;
        jVar.f69020d = jVar2.f69020d;
        k kVar = this.f68971b;
        int i5 = kVar.f69026a;
        k kVar2 = hVar.f68971b;
        kVar2.f69026a = i5;
        kVar2.f69028c = kVar.f69028c;
        kVar2.f69029d = kVar.f69029d;
        kVar2.f69027b = kVar.f69027b;
        l lVar = hVar.f68974e;
        lVar.getClass();
        l lVar2 = this.f68974e;
        lVar2.getClass();
        lVar.f69030a = lVar2.f69030a;
        lVar.f69031b = lVar2.f69031b;
        lVar.f69032c = lVar2.f69032c;
        lVar.f69033d = lVar2.f69033d;
        lVar.f69034e = lVar2.f69034e;
        lVar.f69035f = lVar2.f69035f;
        lVar.f69036g = lVar2.f69036g;
        lVar.f69037h = lVar2.f69037h;
        lVar.f69038i = lVar2.f69038i;
        lVar.f69039j = lVar2.f69039j;
        lVar.f69040k = lVar2.f69040k;
        lVar.f69041l = lVar2.f69041l;
        lVar.f69042m = lVar2.f69042m;
        hVar.f68970a = this.f68970a;
        return hVar;
    }
}
