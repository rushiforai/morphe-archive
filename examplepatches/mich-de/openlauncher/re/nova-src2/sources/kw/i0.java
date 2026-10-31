package kw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.List;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i0 implements b1, l2, j2 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f72399a;

    /* renamed from: b, reason: collision with root package name */
    public final List f72400b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f72401c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f72402d;

    /* renamed from: e, reason: collision with root package name */
    public final w70.i2 f72403e;

    /* renamed from: f, reason: collision with root package name */
    public final w70.i2 f72404f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.i2 f72405g;

    /* renamed from: h, reason: collision with root package name */
    public final w70.i2 f72406h;

    /* renamed from: i, reason: collision with root package name */
    public final uw.c f72407i;

    /* renamed from: j, reason: collision with root package name */
    public final uw.c f72408j;

    /* renamed from: k, reason: collision with root package name */
    public final uw.c f72409k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f72410l;

    public i0(g0 g0Var, String str) {
        this.f72399a = g0Var;
        this.f72400b = g0Var.C();
        this.f72401c = g0Var.z();
        f0 f0VarN = g0Var.n();
        Integer num = 0;
        if ((f0VarN instanceof e0) && !((e0) f0VarN).f72356a) {
            num = null;
        }
        this.f72402d = num;
        w70.i2 i2VarC = w70.u1.c(Boolean.FALSE);
        this.f72403e = i2VarC;
        w70.i2 i2VarC2 = w70.u1.c(num);
        this.f72404f = i2VarC2;
        this.f72405g = i2VarC2;
        this.f72406h = w70.u1.c(g0Var.getLabel());
        final int i5 = 0;
        ps.v.u(i2VarC2, new Function1(this) { // from class: kw.h0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ i0 f72387b;

            {
                this.f72387b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                Integer num2 = (Integer) obj;
                switch (i5) {
                    case 0:
                        if (num2 != null) {
                            String str2 = (String) this.f72387b.f72400b.get(num2.intValue());
                            if (str2 != null) {
                                return str2;
                            }
                        }
                        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    default:
                        if (num2 != null) {
                            return (String) b70.g.Z0(num2.intValue(), this.f72387b.f72399a.q());
                        }
                        return null;
                }
            }
        });
        final int i11 = 1;
        uw.c cVarU = ps.v.u(i2VarC2, new Function1(this) { // from class: kw.h0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ i0 f72387b;

            {
                this.f72387b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                Integer num2 = (Integer) obj;
                switch (i11) {
                    case 0:
                        if (num2 != null) {
                            String str2 = (String) this.f72387b.f72400b.get(num2.intValue());
                            if (str2 != null) {
                                return str2;
                            }
                        }
                        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    default:
                        if (num2 != null) {
                            return (String) b70.g.Z0(num2.intValue(), this.f72387b.f72399a.q());
                        }
                        return null;
                }
            }
        });
        this.f72407i = cVarU;
        this.f72408j = ps.v.j(i2VarC, i2VarC2, new j00.k0(7, (byte) 0));
        this.f72409k = ps.v.j(ps.v.u(i2VarC2, new kotlinx.serialization.protobuf.schema.d(18)), cVarU, new j00.k0(8, (byte) 0));
        this.f72410l = g0Var.n() instanceof d0;
        if (str != null) {
            t(str);
        }
    }

    @Override // kw.l2
    public final void a(boolean z11) {
        h6.c1.B(z11, this.f72403e, null);
    }

    @Override // kw.b1
    public final w70.g2 f() {
        throw null;
    }

    @Override // kw.l2
    public final w70.g2 g() {
        return this.f72408j;
    }

    @Override // kw.b1
    public final w70.g2 j() {
        return this.f72409k;
    }

    @Override // kw.j2
    public final void q(boolean z11, k2 k2Var, b2.t modifier, Set set, IdentifierSpec identifierSpec, p1.o oVar, int i5) {
        Intrinsics.g(modifier, "modifier");
        p1.t tVar = (p1.t) oVar;
        tVar.b0(-1878756385);
        n0.a(this, z11, modifier, false, tVar, ((i5 >> 15) & 14) | ((i5 << 3) & 112) | (i5 & 896));
        tVar.p(false);
    }

    @Override // kw.b1
    public final void t(String rawValue) {
        Intrinsics.g(rawValue, "rawValue");
        int iIndexOf = this.f72400b.indexOf(this.f72399a.a(rawValue));
        Integer numValueOf = Integer.valueOf(iIndexOf);
        if (iIndexOf == -1) {
            numValueOf = null;
        }
        if (numValueOf == null) {
            numValueOf = this.f72402d;
        }
        v(numValueOf);
    }

    public final void v(Integer num) {
        w70.i2 i2Var = this.f72404f;
        if (num == null) {
            i2Var.j(this.f72402d);
            return;
        }
        int iIntValue = num.intValue();
        if (iIntValue < this.f72400b.size()) {
            Integer numValueOf = Integer.valueOf(iIntValue);
            i2Var.getClass();
            i2Var.k(null, numValueOf);
        }
    }
}
