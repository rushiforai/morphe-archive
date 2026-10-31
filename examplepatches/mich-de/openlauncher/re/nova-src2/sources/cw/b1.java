package cw;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b1 implements kw.x0 {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f48077a;

    /* renamed from: b, reason: collision with root package name */
    public final a1 f48078b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f48079c;

    public b1(hq.m cardAccountRangeRepositoryFactory, LinkedHashMap linkedHashMap, q qVar, boolean z11, CardBrandChoiceEligibility cbcEligibility, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, IdentifierSpec identifierSpec) {
        a1 a1Var = new a1(cardAccountRangeRepositoryFactory, linkedHashMap, z11, cbcEligibility, cardBrandFilter, cardFundingFilter, qVar);
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(cbcEligibility, "cbcEligibility");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        this.f48077a = identifierSpec;
        this.f48078b = a1Var;
        this.f48079c = true;
    }

    @Override // kw.x0
    public final void a(boolean z11) {
        this.f48078b.a(z11);
    }

    @Override // kw.x0
    public final IdentifierSpec b() {
        return this.f48077a;
    }

    @Override // kw.x0
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.x0
    public final boolean d() {
        return this.f48079c;
    }

    @Override // kw.x0
    public final w70.g2 e() {
        return this.f48078b.f48058b.e();
    }

    @Override // kw.x0
    public final w70.g2 f() {
        return this.f48078b.f48058b.f();
    }
}
