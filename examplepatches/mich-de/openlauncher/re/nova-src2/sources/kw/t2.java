package kw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t2 implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public final x2 f72634a;

    /* renamed from: b, reason: collision with root package name */
    public final String f72635b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f72636c;

    /* renamed from: d, reason: collision with root package name */
    public final w70.g2 f72637d;

    /* renamed from: e, reason: collision with root package name */
    public final int f72638e;

    /* renamed from: f, reason: collision with root package name */
    public final int f72639f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.o1 f72640g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f72641h;

    /* renamed from: i, reason: collision with root package name */
    public final w70.i2 f72642i;

    /* renamed from: j, reason: collision with root package name */
    public final y3.n f72643j;

    /* renamed from: k, reason: collision with root package name */
    public final c2.f f72644k;

    /* renamed from: l, reason: collision with root package name */
    public final w70.i2 f72645l;

    /* renamed from: m, reason: collision with root package name */
    public final w70.i2 f72646m;
    public final w70.o1 n;
    public final uw.c o;

    /* renamed from: p, reason: collision with root package name */
    public final w70.i2 f72647p;

    /* renamed from: q, reason: collision with root package name */
    public final w70.o1 f72648q;

    /* renamed from: r, reason: collision with root package name */
    public final w70.g2 f72649r;

    /* renamed from: s, reason: collision with root package name */
    public final w70.i2 f72650s;

    /* renamed from: t, reason: collision with root package name */
    public final w70.i2 f72651t;

    /* renamed from: u, reason: collision with root package name */
    public final uw.c f72652u;

    /* renamed from: v, reason: collision with root package name */
    public final uw.c f72653v;

    /* renamed from: w, reason: collision with root package name */
    public final uw.c f72654w;

    /* renamed from: x, reason: collision with root package name */
    public final uw.c f72655x;

    public /* synthetic */ t2(x2 x2Var, String str, iw.p pVar, int i5) {
        this(x2Var, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? null : pVar);
    }

    @Override // kw.l2
    public final void a(boolean z11) {
        h6.c1.B(z11, this.f72650s, null);
    }

    @Override // kw.y2
    public final w70.g2 b() {
        return this.f72649r;
    }

    @Override // kw.y2
    public final w70.g2 c() {
        return this.f72637d;
    }

    @Override // kw.y2
    public final w70.g2 d() {
        return this.f72640g;
    }

    @Override // kw.y2
    public final w70.g2 e() {
        return this.f72645l;
    }

    @Override // kw.b1
    public final w70.g2 f() {
        return this.f72654w;
    }

    @Override // kw.l2
    public final w70.g2 g() {
        return this.f72653v;
    }

    @Override // kw.y2
    public final uw.c getContentDescription() {
        return this.o;
    }

    @Override // kw.y2
    public final w70.g2 getLabel() {
        return this.f72642i;
    }

    @Override // kw.y2
    public final y3.n getLayoutDirection() {
        return this.f72643j;
    }

    @Override // kw.y2
    public final int h() {
        return this.f72638e;
    }

    @Override // kw.y2
    public final void i(boolean z11) {
        h6.c1.B(z11, this.f72651t, null);
    }

    @Override // kw.b1
    public final w70.g2 j() {
        return this.f72655x;
    }

    @Override // kw.y2
    public final c2.f k() {
        return this.f72644k;
    }

    @Override // kw.y2
    public final String l() {
        return this.f72635b;
    }

    @Override // kw.y2
    public final boolean m() {
        return this.f72641h;
    }

    @Override // kw.y2
    public final void n(z2 item) {
        Intrinsics.g(item, "item");
    }

    @Override // kw.y2
    public final int o() {
        return this.f72639f;
    }

    @Override // kw.y2
    public final w70.g2 p() {
        return this.n;
    }

    @Override // kw.j2
    public final void q(boolean z11, k2 k2Var, b2.t modifier, Set set, IdentifierSpec identifierSpec, p1.o oVar, int i5) {
        Intrinsics.g(modifier, "modifier");
        p1.t tVar = (p1.t) oVar;
        tVar.b0(1225623209);
        int i11 = Intrinsics.b(identifierSpec, k2Var.b()) ? 7 : 6;
        x2 x2Var = this.f72634a;
        int i12 = i5 << 3;
        w3.c(this, z11, i11, modifier, null, 0, 0, null, x2Var.o(), x2Var.n(), tVar, ((i5 >> 15) & 14) | (i12 & 112) | (i12 & 7168), 240);
        tVar.p(false);
    }

    @Override // kw.y2
    public final e3 r(String displayFormatted) {
        Intrinsics.g(displayFormatted, "displayFormatted");
        w70.i2 i2Var = this.f72647p;
        e3 e3Var = (e3) i2Var.getValue();
        x2 x2Var = this.f72634a;
        String strI = x2Var.i(displayFormatted);
        w70.i2 i2Var2 = this.f72646m;
        i2Var2.j(strI);
        e3 e3VarJ = x2Var.j((String) i2Var2.getValue());
        i2Var.getClass();
        i2Var.k(null, e3VarJ);
        if (Intrinsics.b(i2Var.getValue(), e3Var)) {
            return null;
        }
        return (e3) i2Var.getValue();
    }

    @Override // kw.y2
    public final w70.g2 s() {
        return this.f72648q;
    }

    @Override // kw.b1
    public final void t(String rawValue) {
        Intrinsics.g(rawValue, "rawValue");
        r(this.f72634a.a(rawValue));
    }

    @Override // kw.y2
    public final w70.g2 u() {
        return this.f72652u;
    }

    public t2(x2 x2Var, String str, Function1 function1) {
        c2.f fVar;
        this.f72634a = x2Var;
        this.f72635b = str;
        this.f72636c = function1;
        this.f72637d = x2Var.c();
        this.f72638e = x2Var.h();
        this.f72639f = x2Var.m();
        r3.i0 i0VarD = x2Var.d();
        this.f72640g = ps.v.y(i0VarD == null ? r3.h0.f85443a : i0VarD);
        this.f72641h = x2Var.k();
        this.f72642i = w70.u1.c(x2Var.getLabel());
        this.f72643j = x2Var.getLayoutDirection();
        if (x2Var instanceof b0) {
            c2.m.f19181a.getClass();
            fVar = c2.l.f19177g;
        } else if (x2Var instanceof f2) {
            c2.m.f19181a.getClass();
            fVar = c2.l.f19174d;
        } else if (x2Var instanceof p0) {
            c2.m.f19181a.getClass();
            fVar = c2.l.f19173c;
        } else if (x2Var instanceof c1) {
            c2.m.f19181a.getClass();
            fVar = c2.l.f19178h;
        } else {
            fVar = null;
        }
        this.f72644k = fVar;
        this.f72645l = w70.u1.c(x2Var.e());
        w70.i2 i2VarC = w70.u1.c(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f72646m = i2VarC;
        this.n = new w70.o1(i2VarC);
        final int i5 = 0;
        uw.c cVarU = ps.v.u(i2VarC, new Function1(this) { // from class: kw.s2

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ t2 f72612b;

            {
                this.f72612b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                ResolvableString resolvableString;
                switch (i5) {
                    case 0:
                        String it = (String) obj;
                        Intrinsics.g(it, "it");
                        return this.f72612b.f72634a.l(it);
                    case 1:
                        String it2 = (String) obj;
                        Intrinsics.g(it2, "it");
                        Function1 function12 = this.f72612b.f72636c;
                        return (function12 == null || (resolvableString = (ResolvableString) function12.invoke(it2)) == null) ? zg.a.H(it2) : resolvableString;
                    default:
                        e3 it3 = (e3) obj;
                        Intrinsics.g(it3, "it");
                        return Boolean.valueOf(it3.isValid() || (!it3.isValid() && this.f72612b.f72634a.k() && it3.a()));
                }
            }
        });
        final int i11 = 1;
        this.o = ps.v.u(i2VarC, new Function1(this) { // from class: kw.s2

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ t2 f72612b;

            {
                this.f72612b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                ResolvableString resolvableString;
                switch (i11) {
                    case 0:
                        String it = (String) obj;
                        Intrinsics.g(it, "it");
                        return this.f72612b.f72634a.l(it);
                    case 1:
                        String it2 = (String) obj;
                        Intrinsics.g(it2, "it");
                        Function1 function12 = this.f72612b.f72636c;
                        return (function12 == null || (resolvableString = (ResolvableString) function12.invoke(it2)) == null) ? zg.a.H(it2) : resolvableString;
                    default:
                        e3 it3 = (e3) obj;
                        Intrinsics.g(it3, "it");
                        return Boolean.valueOf(it3.isValid() || (!it3.isValid() && this.f72612b.f72634a.k() && it3.a()));
                }
            }
        });
        w70.i2 i2VarC2 = w70.u1.c(x2Var.k() ? k3.f72462a : f3.f72376b);
        this.f72647p = i2VarC2;
        this.f72648q = new w70.o1(i2VarC2);
        this.f72649r = x2Var.b();
        Boolean bool = Boolean.FALSE;
        w70.i2 i2VarC3 = w70.u1.c(bool);
        this.f72650s = i2VarC3;
        w70.i2 i2VarC4 = w70.u1.c(bool);
        this.f72651t = i2VarC4;
        uw.c cVarK = ps.v.k(i2VarC2, i2VarC4, i2VarC3, new com.moloco.sdk.internal.publisher.nativead.ui.i(8));
        this.f72652u = cVarK;
        this.f72653v = ps.v.j(cVarK, i2VarC2, new j00.k0(11, (byte) 0));
        final int i12 = 2;
        uw.c cVarU2 = ps.v.u(i2VarC2, new Function1(this) { // from class: kw.s2

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ t2 f72612b;

            {
                this.f72612b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                ResolvableString resolvableString;
                switch (i12) {
                    case 0:
                        String it = (String) obj;
                        Intrinsics.g(it, "it");
                        return this.f72612b.f72634a.l(it);
                    case 1:
                        String it2 = (String) obj;
                        Intrinsics.g(it2, "it");
                        Function1 function12 = this.f72612b.f72636c;
                        return (function12 == null || (resolvableString = (ResolvableString) function12.invoke(it2)) == null) ? zg.a.H(it2) : resolvableString;
                    default:
                        e3 it3 = (e3) obj;
                        Intrinsics.g(it3, "it");
                        return Boolean.valueOf(it3.isValid() || (!it3.isValid() && this.f72612b.f72634a.k() && it3.a()));
                }
            }
        });
        this.f72654w = cVarU2;
        this.f72655x = ps.v.j(cVarU2, cVarU, new j00.k0(12, (byte) 0));
        if (str != null) {
            t(str);
        }
    }
}
