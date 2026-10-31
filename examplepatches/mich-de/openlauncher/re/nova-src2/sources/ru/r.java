package ru;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.ArrayList;
import java.util.Map;
import kotlin.collections.builders.MapBuilder;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;

/* loaded from: classes4.dex */
public final class r extends w {

    /* renamed from: a, reason: collision with root package name */
    public final MapBuilder f86381a;

    public r(PaymentSelection paymentSelection, ArrayList arrayList, Duration duration) {
        String str;
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("duration", duration != null ? Float.valueOf((float) Duration.p(duration.f72041a, DurationUnit.f72046e)) : null);
        if (paymentSelection instanceof PaymentSelection.GooglePay) {
            str = "google_pay";
        } else if (paymentSelection instanceof PaymentSelection.Link) {
            str = "link";
        } else if (paymentSelection instanceof PaymentSelection.Saved) {
            PaymentMethod.Type type = ((PaymentSelection.Saved) paymentSelection).f44846a.f43573e;
            if (type == null || (str = type.f43655a) == null) {
                str = "saved";
            }
        } else {
            str = "none";
        }
        mapBuilder.put("selected_lpm", str);
        mapBuilder.put("ordered_lpms", b70.g.f1(arrayList, ",", null, null, 0, null, 62));
        this.f86381a = mapBuilder.b();
    }

    @Override // fr.a
    public final String c() {
        return "mc_load_succeeded";
    }

    @Override // ru.w
    public final Map getParams() {
        return this.f86381a;
    }
}
