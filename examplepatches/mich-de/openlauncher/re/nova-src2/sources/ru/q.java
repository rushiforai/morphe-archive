package ru;

import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import kotlin.collections.builders.ListBuilder;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q extends w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86379a = 2;

    /* renamed from: b, reason: collision with root package name */
    public final Serializable f86380b;

    public q(EventReporter$Mode mode) {
        Intrinsics.g(mode, "mode");
        this.f86380b = mode;
    }

    @Override // fr.a
    public final String c() {
        switch (this.f86379a) {
            case 0:
                return "mc_initial_displayed_payment_methods";
            case 1:
                return "mc_update_card";
            default:
                return b6.b.i((EventReporter$Mode) this.f86380b, "init");
        }
    }

    @Override // ru.w
    public Map getParams() {
        switch (this.f86379a) {
            case 0:
                return (MapBuilder) this.f86380b;
            case 1:
                return (MapBuilder) this.f86380b;
            default:
                return super.getParams();
        }
    }

    public q(ft.b bVar) {
        MapBuilder mapBuilder = new MapBuilder();
        if (bVar != null) {
            mapBuilder.put("selected_card_brand", bVar.f55897a);
        }
        this.f86380b = mapBuilder.b();
    }

    public q(ListBuilder visiblePaymentMethods, List hiddenPaymentMethods, boolean z11) {
        Intrinsics.g(visiblePaymentMethods, "visiblePaymentMethods");
        Intrinsics.g(hiddenPaymentMethods, "hiddenPaymentMethods");
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("visible_payment_methods", b70.g.f1(visiblePaymentMethods, ",", null, null, 0, null, 62));
        mapBuilder.put("hidden_payment_methods", b70.g.f1(hiddenPaymentMethods, ",", null, null, 0, null, 62));
        mapBuilder.put("payment_method_layout", z11 ? "vertical" : "horizontal");
        this.f86380b = mapBuilder.b();
    }
}
