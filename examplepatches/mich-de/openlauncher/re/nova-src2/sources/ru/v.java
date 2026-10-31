package ru;

import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.Map;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import vt.f0;

/* loaded from: classes4.dex */
public final class v extends w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86384a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final String f86385b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f86386c;

    public v(EventReporter$Mode mode, u uVar, Duration duration, PaymentSelection paymentSelection, f0 f0Var, String str) {
        String strI;
        Intrinsics.g(mode, "mode");
        if (mode == EventReporter$Mode.f44779d) {
            strI = b6.b.i(mode, "payment_".concat(uVar.j()));
        } else {
            strI = b6.b.i(mode, "payment_" + b6.b.f(paymentSelection) + "_" + uVar.j());
        }
        this.f86385b = strI;
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("duration", duration != null ? Float.valueOf((float) Duration.p(duration.f72041a, DurationUnit.f72046e)) : null);
        if (f0Var != null) {
            mapBuilder.put("deferred_intent_confirmation_type", f0Var.f93047a);
        }
        if (str != null) {
            mapBuilder.put("intent_id", str);
        }
        if (uVar instanceof s) {
            j jVar = ((s) uVar).f86382a;
            mapBuilder.put("error_message", jVar.a());
            String strB = jVar.b();
            if (strB != null) {
                mapBuilder.put("error_code", strB);
            }
        }
        mapBuilder.put("selected_lpm", x.a(paymentSelection));
        String strB2 = x.b(paymentSelection);
        if (strB2 != null) {
            mapBuilder.put("link_context", strB2);
        }
        Boolean boolA = iv.h.a(paymentSelection);
        if (boolA != null) {
            mapBuilder.put("set_as_default", boolA);
        }
        this.f86386c = mapBuilder.b();
    }

    @Override // fr.a
    public final String c() {
        switch (this.f86384a) {
        }
        return this.f86385b;
    }

    @Override // ru.w
    public final Map getParams() {
        switch (this.f86384a) {
            case 0:
                return (MapBuilder) this.f86386c;
            default:
                return this.f86386c;
        }
    }

    public v(EventReporter$Mode mode, String code) {
        Intrinsics.g(mode, "mode");
        Intrinsics.g(code, "code");
        this.f86385b = b6.b.i(mode, "paymentoption_removed");
        this.f86386c = a80.m.n("selected_lpm", code);
    }
}
