package com.stripe.android.networking;

import androidx.annotation.Keep;
import br.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import i70.a;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0006J\u000f\u0010\u0004\u001a\u00020\u0003H\u0017¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"com/stripe/android/networking/PaymentAnalyticsRequestFactory$ThreeDS2UiType", b.f42142b, "Lcom/stripe/android/networking/PaymentAnalyticsRequestFactory$ThreeDS2UiType;", b.f42142b, "toString", "()Ljava/lang/String;", "br/c", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentAnalyticsRequestFactory$ThreeDS2UiType {

    /* renamed from: c, reason: collision with root package name */
    public static final c f44098c;

    /* renamed from: d, reason: collision with root package name */
    public static final PaymentAnalyticsRequestFactory$ThreeDS2UiType f44099d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ PaymentAnalyticsRequestFactory$ThreeDS2UiType[] f44100e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ a f44101f;

    /* renamed from: a, reason: collision with root package name */
    public final String f44102a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44103b;

    static {
        PaymentAnalyticsRequestFactory$ThreeDS2UiType paymentAnalyticsRequestFactory$ThreeDS2UiType = new PaymentAnalyticsRequestFactory$ThreeDS2UiType("None", 0, null, "none");
        f44099d = paymentAnalyticsRequestFactory$ThreeDS2UiType;
        PaymentAnalyticsRequestFactory$ThreeDS2UiType[] paymentAnalyticsRequestFactory$ThreeDS2UiTypeArr = {paymentAnalyticsRequestFactory$ThreeDS2UiType, new PaymentAnalyticsRequestFactory$ThreeDS2UiType("Text", 1, "01", "text"), new PaymentAnalyticsRequestFactory$ThreeDS2UiType("SingleSelect", 2, "02", "single_select"), new PaymentAnalyticsRequestFactory$ThreeDS2UiType("MultiSelect", 3, "03", "multi_select"), new PaymentAnalyticsRequestFactory$ThreeDS2UiType("Oob", 4, "04", "oob"), new PaymentAnalyticsRequestFactory$ThreeDS2UiType("Html", 5, "05", "html")};
        f44100e = paymentAnalyticsRequestFactory$ThreeDS2UiTypeArr;
        f44101f = EnumEntriesKt.a(paymentAnalyticsRequestFactory$ThreeDS2UiTypeArr);
        f44098c = new c();
    }

    public PaymentAnalyticsRequestFactory$ThreeDS2UiType(String str, int i5, String str2, String str3) {
        this.f44102a = str2;
        this.f44103b = str3;
    }

    public static PaymentAnalyticsRequestFactory$ThreeDS2UiType valueOf(String str) {
        return (PaymentAnalyticsRequestFactory$ThreeDS2UiType) Enum.valueOf(PaymentAnalyticsRequestFactory$ThreeDS2UiType.class, str);
    }

    public static PaymentAnalyticsRequestFactory$ThreeDS2UiType[] values() {
        return (PaymentAnalyticsRequestFactory$ThreeDS2UiType[]) f44100e.clone();
    }

    @Override // java.lang.Enum
    @Keep
    @NotNull
    public String toString() {
        return this.f44103b;
    }
}
