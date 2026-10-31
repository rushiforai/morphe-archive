package cw;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z0 extends kw.m2 {

    /* renamed from: b, reason: collision with root package name */
    public final CardBrandChoiceEligibility f48394b;

    /* renamed from: c, reason: collision with root package name */
    public final w0 f48395c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f48396d;

    public z0(IdentifierSpec identifierSpec, hq.m cardAccountRangeRepositoryFactory, LinkedHashMap linkedHashMap, boolean z11, CardBrandChoiceEligibility cbcEligibility, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter) {
        w0 w0Var = new w0(cardAccountRangeRepositoryFactory, linkedHashMap, z11, cbcEligibility, cardBrandFilter, cardFundingFilter);
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(cbcEligibility, "cbcEligibility");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        super(identifierSpec);
        this.f48394b = cbcEligibility;
        this.f48395c = w0Var;
        this.f48396d = true;
    }

    @Override // kw.k2
    public final void a(boolean z11) {
        this.f48395c.a(z11);
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f48396d;
    }

    @Override // kw.k2
    public final w70.g2 e() {
        ListBuilder listBuilderW = ul.b.w();
        w0 w0Var = this.f48395c;
        kw.q2 q2Var = w0Var.f48351b;
        kw.q2 q2Var2 = w0Var.f48354e;
        e1 e1Var = w0Var.f48352c;
        if (q2Var != null) {
            final int i5 = 0;
            listBuilderW.add(ps.v.u(q2Var.f72582c.j(), new Function1(this) { // from class: cw.x0

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ z0 f48371b;

                {
                    this.f48371b = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    pw.a it = (pw.a) obj;
                    switch (i5) {
                        case 0:
                            Intrinsics.g(it, "it");
                            return new Pair(this.f48371b.f48395c.f48351b.f72581b, it);
                        case 1:
                            Intrinsics.g(it, "it");
                            return new Pair(this.f48371b.f48395c.f48352c.f72501a, it);
                        default:
                            Intrinsics.g(it, "it");
                            return new Pair(this.f48371b.f48395c.f48353d.f72501a, it);
                    }
                }
            }));
        }
        final int i11 = 1;
        listBuilderW.add(ps.v.u(e1Var.f48136c.C, new Function1(this) { // from class: cw.x0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ z0 f48371b;

            {
                this.f48371b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                pw.a it = (pw.a) obj;
                switch (i11) {
                    case 0:
                        Intrinsics.g(it, "it");
                        return new Pair(this.f48371b.f48395c.f48351b.f72581b, it);
                    case 1:
                        Intrinsics.g(it, "it");
                        return new Pair(this.f48371b.f48395c.f48352c.f72501a, it);
                    default:
                        Intrinsics.g(it, "it");
                        return new Pair(this.f48371b.f48395c.f48353d.f72501a, it);
                }
            }
        }));
        final int i12 = 2;
        listBuilderW.add(ps.v.u(w0Var.f48353d.f48246c.f48237q, new Function1(this) { // from class: cw.x0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ z0 f48371b;

            {
                this.f48371b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                pw.a it = (pw.a) obj;
                switch (i12) {
                    case 0:
                        Intrinsics.g(it, "it");
                        return new Pair(this.f48371b.f48395c.f48351b.f72581b, it);
                    case 1:
                        Intrinsics.g(it, "it");
                        return new Pair(this.f48371b.f48395c.f48352c.f72501a, it);
                    default:
                        Intrinsics.g(it, "it");
                        return new Pair(this.f48371b.f48395c.f48353d.f72501a, it);
                }
            }
        }));
        listBuilderW.add(ps.v.u(e1Var.f48136c.f48097t, new cv.n(3)));
        if (this.f48394b instanceof CardBrandChoiceEligibility.Eligible) {
            listBuilderW.add(ps.v.u(e1Var.f48136c.f48095r, new cv.n(4)));
        }
        listBuilderW.add(ps.v.u(q2Var2.f72582c.j(), new cv.n(5)));
        listBuilderW.add(ps.v.u(q2Var2.f72582c.j(), new cv.n(6)));
        ListBuilder listBuilderM = ul.b.m(listBuilderW);
        return new uw.c(listBuilderM.isEmpty() ? ps.v.y(b70.g.I1(EmptyList.f71733a)) : new m0((w70.m[]) b70.g.I1(listBuilderM).toArray(new w70.m[0]), 1), new y0(listBuilderM, 0));
    }

    @Override // kw.k2
    public final w70.g2 f() {
        w0 w0Var = this.f48395c;
        kw.q2 q2Var = w0Var.f48351b;
        IdentifierSpec identifierSpec = q2Var != null ? q2Var.f72581b : null;
        IdentifierSpec identifierSpec2 = w0Var.f48352c.f72501a;
        IdentifierSpec identifierSpec3 = w0Var.f48354e.f72581b;
        IdentifierSpec identifierSpec4 = w0Var.f48353d.f72501a;
        IdentifierSpec.Companion.getClass();
        return ps.v.y(kotlin.collections.c.v0(new IdentifierSpec[]{identifierSpec, identifierSpec2, identifierSpec3, identifierSpec4, IdentifierSpec.f45365f, this.f48394b instanceof CardBrandChoiceEligibility.Eligible ? IdentifierSpec.f45366g : null}));
    }

    @Override // kw.k2
    public final void h(Map rawValuesMap) {
        Intrinsics.g(rawValuesMap, "rawValuesMap");
    }

    @Override // kw.k2
    public final kw.l2 i() {
        return this.f48395c;
    }
}
