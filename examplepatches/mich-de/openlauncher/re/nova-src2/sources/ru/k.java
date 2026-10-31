package ru;

import b.u4;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k extends w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86367a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86368b;

    public k(EventReporter$Mode mode, int i5) {
        this.f86367a = i5;
        switch (i5) {
            case 3:
                Intrinsics.g(mode, "mode");
                this.f86368b = b6.b.i(mode, "sheet_savedpm_show");
                break;
            case 4:
                Intrinsics.g(mode, "mode");
                this.f86368b = b6.b.i(mode, "manage_savedpm_show");
                break;
            case 5:
                Intrinsics.g(mode, "mode");
                this.f86368b = b6.b.i(mode, "sheet_newpm_show");
                break;
            default:
                Intrinsics.g(mode, "mode");
                this.f86368b = b6.b.i(mode, "cannot_return_from_link_and_lpms");
                break;
        }
    }

    @Override // fr.a
    public final String c() {
        switch (this.f86367a) {
        }
        return this.f86368b;
    }

    public k(EventReporter$Mode mode, PaymentSelection paymentSelection) {
        this.f86367a = 2;
        Intrinsics.g(mode, "mode");
        this.f86368b = b6.b.i(mode, "paymentoption_" + b6.b.f(paymentSelection) + "_select");
    }

    public k(String type) {
        this.f86367a = 0;
        Intrinsics.g(type, "type");
        String lowerCase = u4.i("(?<=.)(?=\\p{Upper})", type, "_").toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        this.f86368b = "autofill_".concat(lowerCase);
    }
}
