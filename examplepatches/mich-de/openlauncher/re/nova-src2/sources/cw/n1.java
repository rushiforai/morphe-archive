package cw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n1 implements kw.y2 {

    /* renamed from: a, reason: collision with root package name */
    public final bh.k f48223a;

    /* renamed from: b, reason: collision with root package name */
    public final String f48224b;

    /* renamed from: c, reason: collision with root package name */
    public final int f48225c;

    /* renamed from: d, reason: collision with root package name */
    public final uw.c f48226d;

    /* renamed from: e, reason: collision with root package name */
    public final y3.n f48227e;

    /* renamed from: f, reason: collision with root package name */
    public final c2.f f48228f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.i2 f48229g;

    /* renamed from: h, reason: collision with root package name */
    public final w70.o1 f48230h;

    /* renamed from: i, reason: collision with root package name */
    public final uw.c f48231i;

    /* renamed from: j, reason: collision with root package name */
    public final uw.c f48232j;

    /* renamed from: k, reason: collision with root package name */
    public final uw.c f48233k;

    /* renamed from: l, reason: collision with root package name */
    public final w70.i2 f48234l;

    /* renamed from: m, reason: collision with root package name */
    public final w70.i2 f48235m;
    public final uw.c n;
    public final uw.c o;

    /* renamed from: p, reason: collision with root package name */
    public final uw.c f48236p;

    /* renamed from: q, reason: collision with root package name */
    public final uw.c f48237q;

    /* renamed from: r, reason: collision with root package name */
    public final uw.c f48238r;

    /* renamed from: s, reason: collision with root package name */
    public final w70.o1 f48239s;

    public n1(bh.k cvcTextFieldConfig, w70.g2 cardBrandFlow, String str) {
        Intrinsics.g(cvcTextFieldConfig, "cvcTextFieldConfig");
        Intrinsics.g(cardBrandFlow, "cardBrandFlow");
        this.f48223a = cvcTextFieldConfig;
        this.f48224b = str;
        this.f48225c = cvcTextFieldConfig.f17909a;
        this.f48226d = ps.v.u(cardBrandFlow, new cv.n(8));
        this.f48227e = y3.n.f96612a;
        c2.m.f19181a.getClass();
        this.f48228f = c2.l.f19176f;
        w70.i2 i2VarC = w70.u1.c(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f48229g = i2VarC;
        this.f48230h = new w70.o1(i2VarC);
        final int i5 = 0;
        this.f48231i = ps.v.u(i2VarC, new Function1(this) { // from class: cw.m1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n1 f48215b;

            {
                this.f48215b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                String number = (String) obj;
                switch (i5) {
                    case 0:
                        Intrinsics.g(number, "number");
                        this.f48215b.f48223a.getClass();
                        return r3.h0.f85443a;
                    default:
                        Intrinsics.g(number, "it");
                        this.f48215b.f48223a.getClass();
                        return number;
                }
            }
        });
        final int i11 = 1;
        uw.c cVarU = ps.v.u(i2VarC, new Function1(this) { // from class: cw.m1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n1 f48215b;

            {
                this.f48215b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                String number = (String) obj;
                switch (i11) {
                    case 0:
                        Intrinsics.g(number, "number");
                        this.f48215b.f48223a.getClass();
                        return r3.h0.f85443a;
                    default:
                        Intrinsics.g(number, "it");
                        this.f48215b.f48223a.getClass();
                        return number;
                }
            }
        });
        this.f48232j = ps.v.u(i2VarC, new cv.n(9));
        uw.c cVarJ = ps.v.j(cardBrandFlow, i2VarC, new bu.k(this, 13));
        this.f48233k = cVarJ;
        Boolean bool = Boolean.FALSE;
        w70.i2 i2VarC2 = w70.u1.c(bool);
        this.f48234l = i2VarC2;
        w70.i2 i2VarC3 = w70.u1.c(bool);
        this.f48235m = i2VarC3;
        uw.c cVarK = ps.v.k(cVarJ, i2VarC3, i2VarC2, new com.moloco.sdk.internal.publisher.nativead.ui.i(3));
        this.n = cVarK;
        this.o = ps.v.j(cVarK, cVarJ, new b10.o1(15));
        uw.c cVarU2 = ps.v.u(cVarJ, new cv.n(10));
        this.f48236p = cVarU2;
        this.f48237q = ps.v.j(cVarU2, cVarU, new b10.o1(16));
        this.f48238r = ps.v.u(cardBrandFlow, new cv.n(11));
        this.f48239s = ps.v.y(bool);
        t(str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str);
    }

    @Override // kw.l2
    public final void a(boolean z11) {
        h6.c1.B(z11, this.f48234l, null);
    }

    @Override // kw.y2
    public final w70.g2 b() {
        return this.f48239s;
    }

    @Override // kw.y2
    public final w70.g2 c() {
        return this.f48238r;
    }

    @Override // kw.y2
    public final w70.g2 d() {
        return this.f48231i;
    }

    @Override // kw.y2
    public final w70.g2 e() {
        return ps.v.y(null);
    }

    @Override // kw.b1
    public final w70.g2 f() {
        return this.f48236p;
    }

    @Override // kw.l2
    public final w70.g2 g() {
        return this.o;
    }

    @Override // kw.y2
    public final uw.c getContentDescription() {
        return this.f48232j;
    }

    @Override // kw.y2
    public final w70.g2 getLabel() {
        return this.f48226d;
    }

    @Override // kw.y2
    public final y3.n getLayoutDirection() {
        return this.f48227e;
    }

    @Override // kw.y2
    public final int h() {
        return 0;
    }

    @Override // kw.y2
    public final void i(boolean z11) {
        h6.c1.B(z11, this.f48235m, null);
    }

    @Override // kw.b1
    public final w70.g2 j() {
        return this.f48237q;
    }

    @Override // kw.y2
    public final c2.f k() {
        return this.f48228f;
    }

    @Override // kw.y2
    public final String l() {
        return this.f48224b;
    }

    @Override // kw.y2
    public final boolean m() {
        return false;
    }

    @Override // kw.y2
    public final void n(kw.z2 item) {
        Intrinsics.g(item, "item");
    }

    @Override // kw.y2
    public final int o() {
        return this.f48225c;
    }

    @Override // kw.y2
    public final w70.g2 p() {
        return this.f48230h;
    }

    @Override // kw.j2
    public final void q(boolean z11, kw.k2 k2Var, b2.t tVar, Set set, IdentifierSpec identifierSpec, p1.o oVar, int i5) {
        vh.a.c(this, z11, k2Var, tVar, set, identifierSpec, oVar, i5);
    }

    @Override // kw.y2
    public final kw.e3 r(String displayFormatted) {
        Intrinsics.g(displayFormatted, "displayFormatted");
        this.f48223a.getClass();
        StringBuilder sb2 = new StringBuilder();
        int length = displayFormatted.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = displayFormatted.charAt(i5);
            if (Character.isDigit(cCharAt)) {
                sb2.append(cCharAt);
            }
        }
        this.f48229g.j(sb2.toString());
        return null;
    }

    @Override // kw.y2
    public final w70.g2 s() {
        return this.f48233k;
    }

    @Override // kw.b1
    public final void t(String rawValue) {
        Intrinsics.g(rawValue, "rawValue");
        this.f48223a.getClass();
        r(rawValue);
    }

    @Override // kw.y2
    public final w70.g2 u() {
        return this.n;
    }

    public /* synthetic */ n1(bh.k kVar, w70.g2 g2Var, int i5) {
        this((i5 & 1) != 0 ? new bh.k(2) : kVar, g2Var, (String) null);
    }
}
