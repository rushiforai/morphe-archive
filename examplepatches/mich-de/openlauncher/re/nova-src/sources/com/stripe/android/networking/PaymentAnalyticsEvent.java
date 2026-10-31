package com.stripe.android.networking;

import androidx.annotation.Keep;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fr.a;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002J\u000f\u0010\u0004\u001a\u00020\u0003H\u0017¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/networking/PaymentAnalyticsEvent;", "Lfr/a;", b.f42142b, b.f42142b, "toString", "()Ljava/lang/String;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentAnalyticsEvent implements a {
    public static final PaymentAnalyticsEvent A;
    public static final PaymentAnalyticsEvent B;
    public static final PaymentAnalyticsEvent C;
    public static final PaymentAnalyticsEvent D;
    public static final PaymentAnalyticsEvent E;
    public static final PaymentAnalyticsEvent F;
    public static final PaymentAnalyticsEvent G;
    public static final PaymentAnalyticsEvent H;
    public static final PaymentAnalyticsEvent I;
    public static final PaymentAnalyticsEvent J;
    public static final PaymentAnalyticsEvent K;
    public static final PaymentAnalyticsEvent L;
    public static final PaymentAnalyticsEvent M;
    public static final PaymentAnalyticsEvent N;
    public static final PaymentAnalyticsEvent O;
    public static final PaymentAnalyticsEvent P;
    public static final PaymentAnalyticsEvent Q;
    public static final PaymentAnalyticsEvent R;
    public static final PaymentAnalyticsEvent S;
    public static final PaymentAnalyticsEvent T;
    public static final PaymentAnalyticsEvent U;
    public static final /* synthetic */ PaymentAnalyticsEvent[] V;

    /* renamed from: b, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44074b;

    /* renamed from: c, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44075c;

    /* renamed from: d, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44076d;

    /* renamed from: e, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44077e;

    /* renamed from: f, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44078f;

    /* renamed from: g, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44079g;

    /* renamed from: h, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44080h;

    /* renamed from: i, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44081i;

    /* renamed from: j, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44082j;

    /* renamed from: k, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44083k;

    /* renamed from: l, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44084l;

    /* renamed from: m, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44085m;
    public static final PaymentAnalyticsEvent n;
    public static final PaymentAnalyticsEvent o;

    /* renamed from: p, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44086p;

    /* renamed from: q, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44087q;

    /* renamed from: r, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44088r;

    /* renamed from: s, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44089s;

    /* renamed from: t, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44090t;

    /* renamed from: u, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44091u;

    /* renamed from: v, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44092v;

    /* renamed from: w, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44093w;

    /* renamed from: x, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44094x;

    /* renamed from: y, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44095y;

    /* renamed from: z, reason: collision with root package name */
    public static final PaymentAnalyticsEvent f44096z;

    /* renamed from: a, reason: collision with root package name */
    public final String f44097a;

    static {
        PaymentAnalyticsEvent paymentAnalyticsEvent = new PaymentAnalyticsEvent("TokenCreate", 0, "token_creation");
        PaymentAnalyticsEvent paymentAnalyticsEvent2 = new PaymentAnalyticsEvent("ConfirmationTokenCreate", 1, "confirmation_token_creation");
        f44074b = paymentAnalyticsEvent2;
        PaymentAnalyticsEvent paymentAnalyticsEvent3 = new PaymentAnalyticsEvent("PaymentMethodCreate", 2, "payment_method_creation");
        f44075c = paymentAnalyticsEvent3;
        PaymentAnalyticsEvent paymentAnalyticsEvent4 = new PaymentAnalyticsEvent("PaymentMethodUpdate", 3, "payment_method_update");
        f44076d = paymentAnalyticsEvent4;
        PaymentAnalyticsEvent paymentAnalyticsEvent5 = new PaymentAnalyticsEvent("CustomerRetrieve", 4, "retrieve_customer");
        f44077e = paymentAnalyticsEvent5;
        PaymentAnalyticsEvent paymentAnalyticsEvent6 = new PaymentAnalyticsEvent("CustomerRetrievePaymentMethods", 5, "retrieve_payment_methods");
        f44078f = paymentAnalyticsEvent6;
        PaymentAnalyticsEvent paymentAnalyticsEvent7 = new PaymentAnalyticsEvent("CustomerAttachPaymentMethod", 6, "attach_payment_method");
        PaymentAnalyticsEvent paymentAnalyticsEvent8 = new PaymentAnalyticsEvent("CustomerDetachPaymentMethod", 7, "detach_payment_method");
        f44079g = paymentAnalyticsEvent8;
        PaymentAnalyticsEvent paymentAnalyticsEvent9 = new PaymentAnalyticsEvent("CustomerDeleteSource", 8, "delete_source");
        PaymentAnalyticsEvent paymentAnalyticsEvent10 = new PaymentAnalyticsEvent("CustomerSetShippingInfo", 9, "set_shipping_info");
        PaymentAnalyticsEvent paymentAnalyticsEvent11 = new PaymentAnalyticsEvent("CustomerAddSource", 10, "add_source");
        PaymentAnalyticsEvent paymentAnalyticsEvent12 = new PaymentAnalyticsEvent("CustomerSetDefaultSource", 11, "default_source");
        PaymentAnalyticsEvent paymentAnalyticsEvent13 = new PaymentAnalyticsEvent("IssuingRetrievePin", 12, "issuing_retrieve_pin");
        PaymentAnalyticsEvent paymentAnalyticsEvent14 = new PaymentAnalyticsEvent("IssuingUpdatePin", 13, "issuing_update_pin");
        PaymentAnalyticsEvent paymentAnalyticsEvent15 = new PaymentAnalyticsEvent("SourceCreate", 14, "source_creation");
        PaymentAnalyticsEvent paymentAnalyticsEvent16 = new PaymentAnalyticsEvent("SourceRetrieve", 15, "retrieve_source");
        PaymentAnalyticsEvent paymentAnalyticsEvent17 = new PaymentAnalyticsEvent("PaymentIntentConfirm", 16, "payment_intent_confirmation");
        f44080h = paymentAnalyticsEvent17;
        PaymentAnalyticsEvent paymentAnalyticsEvent18 = new PaymentAnalyticsEvent("PaymentIntentRetrieve", 17, "payment_intent_retrieval");
        f44081i = paymentAnalyticsEvent18;
        PaymentAnalyticsEvent paymentAnalyticsEvent19 = new PaymentAnalyticsEvent("PaymentIntentRetrieveOrdered", 18, "payment_intent_retrieval_ordered");
        PaymentAnalyticsEvent paymentAnalyticsEvent20 = new PaymentAnalyticsEvent("PaymentIntentCancelSource", 19, "payment_intent_cancel_source");
        f44082j = paymentAnalyticsEvent20;
        PaymentAnalyticsEvent paymentAnalyticsEvent21 = new PaymentAnalyticsEvent("PaymentIntentRefresh", 20, "payment_intent_refresh");
        f44083k = paymentAnalyticsEvent21;
        PaymentAnalyticsEvent paymentAnalyticsEvent22 = new PaymentAnalyticsEvent("SetupIntentConfirm", 21, "setup_intent_confirmation");
        f44084l = paymentAnalyticsEvent22;
        PaymentAnalyticsEvent paymentAnalyticsEvent23 = new PaymentAnalyticsEvent("SetupIntentRetrieve", 22, "setup_intent_retrieval");
        f44085m = paymentAnalyticsEvent23;
        PaymentAnalyticsEvent paymentAnalyticsEvent24 = new PaymentAnalyticsEvent("SetupIntentRetrieveOrdered", 23, "setup_intent_retrieval_ordered");
        PaymentAnalyticsEvent paymentAnalyticsEvent25 = new PaymentAnalyticsEvent("SetupIntentCancelSource", 24, "setup_intent_cancel_source");
        n = paymentAnalyticsEvent25;
        PaymentAnalyticsEvent paymentAnalyticsEvent26 = new PaymentAnalyticsEvent("SetupIntentRefresh", 25, "setup_intent_refresh");
        o = paymentAnalyticsEvent26;
        PaymentAnalyticsEvent paymentAnalyticsEvent27 = new PaymentAnalyticsEvent("PaymentLauncherConfirmStarted", 26, "paymenthandler.confirm.started");
        f44086p = paymentAnalyticsEvent27;
        PaymentAnalyticsEvent paymentAnalyticsEvent28 = new PaymentAnalyticsEvent("PaymentLauncherConfirmFinished", 27, "paymenthandler.confirm.finished");
        f44087q = paymentAnalyticsEvent28;
        PaymentAnalyticsEvent paymentAnalyticsEvent29 = new PaymentAnalyticsEvent("PaymentLauncherNextActionStarted", 28, "paymenthandler.handle_next_action.started");
        f44088r = paymentAnalyticsEvent29;
        PaymentAnalyticsEvent paymentAnalyticsEvent30 = new PaymentAnalyticsEvent("PaymentLauncherNextActionFinished", 29, "paymenthandler.handle_next_action.finished");
        f44089s = paymentAnalyticsEvent30;
        PaymentAnalyticsEvent paymentAnalyticsEvent31 = new PaymentAnalyticsEvent("FileCreate", 30, "create_file");
        PaymentAnalyticsEvent paymentAnalyticsEvent32 = new PaymentAnalyticsEvent("Auth3ds1Sdk", 31, "3ds1_sdk");
        PaymentAnalyticsEvent paymentAnalyticsEvent33 = new PaymentAnalyticsEvent("Auth3ds1ChallengeStart", 32, "3ds1_challenge_start");
        f44090t = paymentAnalyticsEvent33;
        PaymentAnalyticsEvent paymentAnalyticsEvent34 = new PaymentAnalyticsEvent("Auth3ds1ChallengeError", 33, "3ds1_challenge_error");
        f44091u = paymentAnalyticsEvent34;
        PaymentAnalyticsEvent paymentAnalyticsEvent35 = new PaymentAnalyticsEvent("Auth3ds1ChallengeComplete", 34, "3ds1_challenge_complete");
        f44092v = paymentAnalyticsEvent35;
        PaymentAnalyticsEvent paymentAnalyticsEvent36 = new PaymentAnalyticsEvent("AuthWithWebView", 35, "auth_with_webview");
        f44093w = paymentAnalyticsEvent36;
        PaymentAnalyticsEvent paymentAnalyticsEvent37 = new PaymentAnalyticsEvent("AuthWithCustomTabs", 36, "auth_with_customtabs");
        f44094x = paymentAnalyticsEvent37;
        PaymentAnalyticsEvent paymentAnalyticsEvent38 = new PaymentAnalyticsEvent("AuthWithDefaultBrowser", 37, "auth_with_defaultbrowser");
        f44095y = paymentAnalyticsEvent38;
        PaymentAnalyticsEvent paymentAnalyticsEvent39 = new PaymentAnalyticsEvent("ConfirmReturnUrlNull", 38, "confirm_returnurl_null");
        f44096z = paymentAnalyticsEvent39;
        PaymentAnalyticsEvent paymentAnalyticsEvent40 = new PaymentAnalyticsEvent("ConfirmReturnUrlDefault", 39, "confirm_returnurl_default");
        A = paymentAnalyticsEvent40;
        PaymentAnalyticsEvent paymentAnalyticsEvent41 = new PaymentAnalyticsEvent("ConfirmReturnUrlCustom", 40, "confirm_returnurl_custom");
        B = paymentAnalyticsEvent41;
        PaymentAnalyticsEvent paymentAnalyticsEvent42 = new PaymentAnalyticsEvent("FpxBankStatusesRetrieve", 41, "retrieve_fpx_bank_statuses");
        PaymentAnalyticsEvent paymentAnalyticsEvent43 = new PaymentAnalyticsEvent("StripeUrlRetrieve", 42, "retrieve_stripe_url");
        PaymentAnalyticsEvent paymentAnalyticsEvent44 = new PaymentAnalyticsEvent("Auth3ds2RequestParamsFailed", 43, "3ds2_authentication_request_params_failed");
        C = paymentAnalyticsEvent44;
        PaymentAnalyticsEvent paymentAnalyticsEvent45 = new PaymentAnalyticsEvent("Auth3ds2Fingerprint", 44, "3ds2_fingerprint");
        D = paymentAnalyticsEvent45;
        PaymentAnalyticsEvent paymentAnalyticsEvent46 = new PaymentAnalyticsEvent("Auth3ds2Start", 45, "3ds2_authenticate");
        E = paymentAnalyticsEvent46;
        PaymentAnalyticsEvent paymentAnalyticsEvent47 = new PaymentAnalyticsEvent("Auth3ds2Frictionless", 46, "3ds2_frictionless_flow");
        F = paymentAnalyticsEvent47;
        PaymentAnalyticsEvent paymentAnalyticsEvent48 = new PaymentAnalyticsEvent("Auth3ds2ChallengePresented", 47, "3ds2_challenge_flow_presented");
        G = paymentAnalyticsEvent48;
        PaymentAnalyticsEvent paymentAnalyticsEvent49 = new PaymentAnalyticsEvent("Auth3ds2ChallengeCanceled", 48, "3ds2_challenge_flow_canceled");
        H = paymentAnalyticsEvent49;
        PaymentAnalyticsEvent paymentAnalyticsEvent50 = new PaymentAnalyticsEvent("Auth3ds2ChallengeCompleted", 49, "3ds2_challenge_flow_completed");
        I = paymentAnalyticsEvent50;
        PaymentAnalyticsEvent paymentAnalyticsEvent51 = new PaymentAnalyticsEvent("Auth3ds2ChallengeErrored", 50, "3ds2_challenge_flow_errored");
        J = paymentAnalyticsEvent51;
        PaymentAnalyticsEvent paymentAnalyticsEvent52 = new PaymentAnalyticsEvent("Auth3ds2ChallengeTimedOut", 51, "3ds2_challenge_flow_timed_out");
        K = paymentAnalyticsEvent52;
        PaymentAnalyticsEvent paymentAnalyticsEvent53 = new PaymentAnalyticsEvent("Auth3ds2Fallback", 52, "3ds2_fallback");
        L = paymentAnalyticsEvent53;
        PaymentAnalyticsEvent paymentAnalyticsEvent54 = new PaymentAnalyticsEvent("AuthRedirect", 53, "url_redirect_next_action");
        M = paymentAnalyticsEvent54;
        PaymentAnalyticsEvent paymentAnalyticsEvent55 = new PaymentAnalyticsEvent("AuthError", 54, "auth_error");
        PaymentAnalyticsEvent paymentAnalyticsEvent56 = new PaymentAnalyticsEvent("AuthSourceStart", 55, "auth_source_start");
        PaymentAnalyticsEvent paymentAnalyticsEvent57 = new PaymentAnalyticsEvent("AuthSourceRedirect", 56, "auth_source_redirect");
        PaymentAnalyticsEvent paymentAnalyticsEvent58 = new PaymentAnalyticsEvent("AuthSourceResult", 57, "auth_source_result");
        PaymentAnalyticsEvent paymentAnalyticsEvent59 = new PaymentAnalyticsEvent("RadarSessionCreate", 58, "radar_session_create");
        N = paymentAnalyticsEvent59;
        PaymentAnalyticsEvent paymentAnalyticsEvent60 = new PaymentAnalyticsEvent("GooglePayLauncherInit", 59, "googlepaylauncher_init");
        PaymentAnalyticsEvent paymentAnalyticsEvent61 = new PaymentAnalyticsEvent("GooglePayPaymentMethodLauncherInit", 60, "googlepaypaymentmethodlauncher_init");
        O = paymentAnalyticsEvent61;
        PaymentAnalyticsEvent paymentAnalyticsEvent62 = new PaymentAnalyticsEvent("CardMetadataPublishableKeyAvailable", 61, "card_metadata_pk_available");
        P = paymentAnalyticsEvent62;
        PaymentAnalyticsEvent paymentAnalyticsEvent63 = new PaymentAnalyticsEvent("CardMetadataPublishableKeyUnavailable", 62, "card_metadata_pk_unavailable");
        Q = paymentAnalyticsEvent63;
        PaymentAnalyticsEvent paymentAnalyticsEvent64 = new PaymentAnalyticsEvent("CardMetadataLoadedTooSlow", 63, "card_metadata_loaded_too_slow");
        R = paymentAnalyticsEvent64;
        PaymentAnalyticsEvent paymentAnalyticsEvent65 = new PaymentAnalyticsEvent("CardMetadataLoadFailure", 64, "card_metadata_load_failure");
        S = paymentAnalyticsEvent65;
        PaymentAnalyticsEvent paymentAnalyticsEvent66 = new PaymentAnalyticsEvent("CardMetadataMissingRange", 65, "card_metadata_missing_range");
        T = paymentAnalyticsEvent66;
        PaymentAnalyticsEvent paymentAnalyticsEvent67 = new PaymentAnalyticsEvent("CardMetadataExpectedExtraDigitsButUserEntered16ThenSwitchedFields", 66, "card_metadata.expected_extra_digits_but_user_entered_16_then_switched_fields");
        U = paymentAnalyticsEvent67;
        PaymentAnalyticsEvent[] paymentAnalyticsEventArr = {paymentAnalyticsEvent, paymentAnalyticsEvent2, paymentAnalyticsEvent3, paymentAnalyticsEvent4, paymentAnalyticsEvent5, paymentAnalyticsEvent6, paymentAnalyticsEvent7, paymentAnalyticsEvent8, paymentAnalyticsEvent9, paymentAnalyticsEvent10, paymentAnalyticsEvent11, paymentAnalyticsEvent12, paymentAnalyticsEvent13, paymentAnalyticsEvent14, paymentAnalyticsEvent15, paymentAnalyticsEvent16, paymentAnalyticsEvent17, paymentAnalyticsEvent18, paymentAnalyticsEvent19, paymentAnalyticsEvent20, paymentAnalyticsEvent21, paymentAnalyticsEvent22, paymentAnalyticsEvent23, paymentAnalyticsEvent24, paymentAnalyticsEvent25, paymentAnalyticsEvent26, paymentAnalyticsEvent27, paymentAnalyticsEvent28, paymentAnalyticsEvent29, paymentAnalyticsEvent30, paymentAnalyticsEvent31, paymentAnalyticsEvent32, paymentAnalyticsEvent33, paymentAnalyticsEvent34, paymentAnalyticsEvent35, paymentAnalyticsEvent36, paymentAnalyticsEvent37, paymentAnalyticsEvent38, paymentAnalyticsEvent39, paymentAnalyticsEvent40, paymentAnalyticsEvent41, paymentAnalyticsEvent42, paymentAnalyticsEvent43, paymentAnalyticsEvent44, paymentAnalyticsEvent45, paymentAnalyticsEvent46, paymentAnalyticsEvent47, paymentAnalyticsEvent48, paymentAnalyticsEvent49, paymentAnalyticsEvent50, paymentAnalyticsEvent51, paymentAnalyticsEvent52, paymentAnalyticsEvent53, paymentAnalyticsEvent54, paymentAnalyticsEvent55, paymentAnalyticsEvent56, paymentAnalyticsEvent57, paymentAnalyticsEvent58, paymentAnalyticsEvent59, paymentAnalyticsEvent60, paymentAnalyticsEvent61, paymentAnalyticsEvent62, paymentAnalyticsEvent63, paymentAnalyticsEvent64, paymentAnalyticsEvent65, paymentAnalyticsEvent66, paymentAnalyticsEvent67};
        V = paymentAnalyticsEventArr;
        EnumEntriesKt.a(paymentAnalyticsEventArr);
    }

    public PaymentAnalyticsEvent(String str, int i5, String str2) {
        this.f44097a = str2;
    }

    public static PaymentAnalyticsEvent valueOf(String str) {
        return (PaymentAnalyticsEvent) Enum.valueOf(PaymentAnalyticsEvent.class, str);
    }

    public static PaymentAnalyticsEvent[] values() {
        return (PaymentAnalyticsEvent[]) V.clone();
    }

    @Override // fr.a
    public final String c() {
        return toString();
    }

    @Override // java.lang.Enum
    @Keep
    @NotNull
    public String toString() {
        return c0.k("stripe_android.", this.f44097a);
    }
}
