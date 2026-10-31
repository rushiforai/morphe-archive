package cw;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a1 implements kw.l2 {

    /* renamed from: a, reason: collision with root package name */
    public final q f48057a;

    /* renamed from: b, reason: collision with root package name */
    public final z0 f48058b;

    /* renamed from: c, reason: collision with root package name */
    public final uw.c f48059c;

    public a1(hq.m cardAccountRangeRepositoryFactory, LinkedHashMap linkedHashMap, boolean z11, CardBrandChoiceEligibility cbcEligibility, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, q qVar) {
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(cbcEligibility, "cbcEligibility");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        this.f48057a = qVar;
        IdentifierSpec.Companion.getClass();
        z0 z0Var = new z0(kw.z0.a("card_detail"), cardAccountRangeRepositoryFactory, linkedHashMap, z11, cbcEligibility, cardBrandFilter, cardFundingFilter);
        this.f48058b = z0Var;
        this.f48059c = z0Var.f48395c.f48358i;
    }

    @Override // kw.l2
    public final void a(boolean z11) {
        this.f48058b.a(z11);
    }

    @Override // kw.l2
    public final w70.g2 g() {
        return this.f48059c;
    }
}
