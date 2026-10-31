package ru;

import com.stripe.android.model.StripeIntent;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l extends w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86369a = 3;

    /* renamed from: b, reason: collision with root package name */
    public final Object f86370b;

    public l(String code, String str) {
        Intrinsics.g(code, "code");
        this.f86370b = MapsKt.j0(new Pair("selected_lpm", code), new Pair("link_context", str));
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map d() {
        return this.f86370b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map e() {
        return this.f86370b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map f() {
        return this.f86370b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map g() {
        return this.f86370b;
    }

    @Override // fr.a
    public final String c() {
        switch (this.f86369a) {
            case 0:
                return "stripe_android.bankaccountcollector.finished";
            case 1:
                return "mc_cbc_selected";
            case 2:
                return "mc_cardscan_api_check_failed";
            default:
                return "mc_carousel_payment_method_tapped";
        }
    }

    @Override // ru.w
    public final Map getParams() {
        switch (this.f86369a) {
            case 0:
                return d();
            case 1:
                return e();
            case 2:
                return f();
            default:
                return g();
        }
    }

    public l(Throwable th2) {
        this.f86370b = MapsKt.j0(new Pair("implementation", "google_pay"), new Pair("error_message", th2 != null ? th2.getClass().getSimpleName() : null));
    }

    public l(o oVar, ft.b selectedBrand) {
        Intrinsics.g(selectedBrand, "selectedBrand");
        this.f86370b = MapsKt.j0(new Pair("cbc_event_source", oVar.f86376a), new Pair("selected_card_brand", selectedBrand.f55897a));
    }

    public l(zu.p event) {
        Intrinsics.g(event, "event");
        StripeIntent stripeIntent = event.f98656c;
        this.f86370b = MapsKt.j0(new Pair("intent_id", stripeIntent != null ? stripeIntent.getF43533a() : null), new Pair("link_account_session_id", event.f98655b), new Pair("fc_sdk_result", event.f98654a));
    }
}
