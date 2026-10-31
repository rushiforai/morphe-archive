package kw;

import com.stripe.android.core.model.Country;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Set;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.CharRange;

/* loaded from: classes4.dex */
public final class o1 implements b1, j2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f72519a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f72520b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f72521c;

    /* renamed from: d, reason: collision with root package name */
    public final w70.o1 f72522d = ps.v.y(zg.a.U(2132019663, new Object[0], EmptyList.f71733a));

    /* renamed from: e, reason: collision with root package name */
    public final w70.i2 f72523e;

    /* renamed from: f, reason: collision with root package name */
    public final w70.o1 f72524f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.i2 f72525g;

    /* renamed from: h, reason: collision with root package name */
    public final w70.i2 f72526h;

    /* renamed from: i, reason: collision with root package name */
    public final bn.d1 f72527i;

    /* renamed from: j, reason: collision with root package name */
    public final i0 f72528j;

    /* renamed from: k, reason: collision with root package name */
    public final uw.c f72529k;

    /* renamed from: l, reason: collision with root package name */
    public final uw.c f72530l;

    /* renamed from: m, reason: collision with root package name */
    public final uw.c f72531m;
    public final uw.c n;
    public final uw.c o;

    /* renamed from: p, reason: collision with root package name */
    public final uw.c f72532p;

    public o1(String str, String str2, Set set, boolean z11, boolean z12) {
        this.f72519a = str;
        this.f72520b = z11;
        this.f72521c = z12;
        w70.i2 i2VarC = w70.u1.c(str);
        this.f72523e = i2VarC;
        w70.o1 o1Var = new w70.o1(i2VarC);
        this.f72524f = o1Var;
        Boolean bool = Boolean.FALSE;
        w70.i2 i2VarC2 = w70.u1.c(bool);
        this.f72525g = i2VarC2;
        w70.i2 i2VarC3 = w70.u1.c(bool);
        this.f72526h = i2VarC3;
        bn.d1 d1Var = new bn.d1(set, new kotlinx.serialization.protobuf.schema.d(22), new kotlinx.serialization.protobuf.schema.d(25), 10);
        this.f72527i = d1Var;
        i0 i0Var = new i0(d1Var, str2);
        this.f72528j = i0Var;
        final int i5 = 0;
        Function1 function1 = new Function1(this) { // from class: kw.n1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ o1 f72500b;

            {
                this.f72500b = this;
            }

            /* JADX WARN: Type inference failed for: r0v10, types: [java.lang.Object, java.util.Map] */
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                String str3;
                int i11 = i5;
                o1 o1Var2 = this.f72500b;
                Integer num = (Integer) obj;
                switch (i11) {
                    case 0:
                        CharRange charRange = z1.f72740a;
                        return i30.j.A(((Country) ((ArrayList) o1Var2.f72527i.f18175e).get(num != null ? num.intValue() : 0)).f42572a.f42575a);
                    default:
                        CharRange charRange2 = z1.f72740a;
                        String countryCode = ((Country) ((ArrayList) o1Var2.f72527i.f18175e).get(num != null ? num.intValue() : 0)).f42572a.f42575a;
                        Intrinsics.g(countryCode, "countryCode");
                        ?? r02 = z1.f72741b;
                        String upperCase = countryCode.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase, "toUpperCase(...)");
                        v1 v1Var = (v1) r02.get(upperCase);
                        if (v1Var == null || (str3 = v1Var.f72703c) == null) {
                            return null;
                        }
                        int i12 = 0;
                        while (i < str3.length()) {
                            if (str3.charAt(i) == '#') {
                                i12++;
                            }
                            i++;
                        }
                        return Integer.valueOf(i12);
                }
            }
        };
        w70.i2 i2Var = i0Var.f72405g;
        uw.c cVarU = ps.v.u(i2Var, function1);
        this.f72529k = cVarU;
        final int i11 = 1;
        uw.c cVarJ = ps.v.j(o1Var, ps.v.u(i2Var, new Function1(this) { // from class: kw.n1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ o1 f72500b;

            {
                this.f72500b = this;
            }

            /* JADX WARN: Type inference failed for: r0v10, types: [java.lang.Object, java.util.Map] */
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                String str3;
                int i112 = i11;
                o1 o1Var2 = this.f72500b;
                Integer num = (Integer) obj;
                switch (i112) {
                    case 0:
                        CharRange charRange = z1.f72740a;
                        return i30.j.A(((Country) ((ArrayList) o1Var2.f72527i.f18175e).get(num != null ? num.intValue() : 0)).f42572a.f42575a);
                    default:
                        CharRange charRange2 = z1.f72740a;
                        String countryCode = ((Country) ((ArrayList) o1Var2.f72527i.f18175e).get(num != null ? num.intValue() : 0)).f42572a.f42575a;
                        Intrinsics.g(countryCode, "countryCode");
                        ?? r02 = z1.f72741b;
                        String upperCase = countryCode.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase, "toUpperCase(...)");
                        v1 v1Var = (v1) r02.get(upperCase);
                        if (v1Var == null || (str3 = v1Var.f72703c) == null) {
                            return null;
                        }
                        int i12 = 0;
                        while (i < str3.length()) {
                            if (str3.charAt(i) == '#') {
                                i12++;
                            }
                            i++;
                        }
                        return Integer.valueOf(i12);
                }
            }
        }), new hv.z1(this, 3));
        uw.c cVarJ2 = ps.v.j(o1Var, cVarU, new j00.k0(9, (byte) 0));
        uw.c cVarU2 = ps.v.u(cVarJ, new kotlinx.serialization.protobuf.schema.d(26));
        this.f72530l = cVarU2;
        this.f72531m = ps.v.j(cVarJ2, cVarU2, new j00.k0(10, (byte) 0));
        this.n = ps.v.k(cVarJ, i2VarC3, i2VarC2, new com.moloco.sdk.internal.publisher.nativead.ui.i(7));
        this.o = ps.v.u(cVarU, new kotlinx.serialization.protobuf.schema.d(23));
        this.f72532p = ps.v.u(cVarU, new kotlinx.serialization.protobuf.schema.d(24));
    }

    @Override // kw.l2
    public final void a(boolean z11) {
        h6.c1.B(z11, this.f72525g, null);
    }

    @Override // kw.b1
    public final w70.g2 f() {
        throw null;
    }

    @Override // kw.l2
    public final w70.g2 g() {
        return this.n;
    }

    @Override // kw.b1
    public final w70.g2 j() {
        return this.f72531m;
    }

    @Override // kw.j2
    public final void q(boolean z11, k2 k2Var, b2.t modifier, Set set, IdentifierSpec identifierSpec, p1.o oVar, int i5) {
        Intrinsics.g(modifier, "modifier");
        p1.t tVar = (p1.t) oVar;
        tVar.b0(1343378051);
        g90.k.q(z11, this, modifier, null, false, false, null, null, !Intrinsics.b(identifierSpec, k2Var.b()) ? 6 : 7, tVar, (i5 & 14) | ((i5 >> 12) & 112) | (i5 & 896), 248);
        tVar.p(false);
    }

    @Override // kw.b1
    public final void t(String str) {
        String strF = ((z1) this.f72529k.f91586b.invoke()).f(str);
        w70.i2 i2Var = this.f72523e;
        i2Var.getClass();
        i2Var.k(null, strF);
    }

    public final String v() {
        return ((z1) this.f72529k.f91586b.invoke()).a();
    }
}
