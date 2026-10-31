package iu;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c implements b {
    public static final c A;
    public static final c B;
    public static final /* synthetic */ c[] C;

    /* renamed from: b, reason: collision with root package name */
    public static final c f68051b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f68052c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f68053d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f68054e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f68055f;

    /* renamed from: g, reason: collision with root package name */
    public static final c f68056g;

    /* renamed from: h, reason: collision with root package name */
    public static final c f68057h;

    /* renamed from: i, reason: collision with root package name */
    public static final c f68058i;

    /* renamed from: j, reason: collision with root package name */
    public static final c f68059j;

    /* renamed from: k, reason: collision with root package name */
    public static final c f68060k;

    /* renamed from: l, reason: collision with root package name */
    public static final c f68061l;

    /* renamed from: m, reason: collision with root package name */
    public static final c f68062m;
    public static final c n;
    public static final c o;

    /* renamed from: p, reason: collision with root package name */
    public static final c f68063p;

    /* renamed from: q, reason: collision with root package name */
    public static final c f68064q;

    /* renamed from: r, reason: collision with root package name */
    public static final c f68065r;

    /* renamed from: s, reason: collision with root package name */
    public static final c f68066s;

    /* renamed from: t, reason: collision with root package name */
    public static final c f68067t;

    /* renamed from: u, reason: collision with root package name */
    public static final c f68068u;

    /* renamed from: v, reason: collision with root package name */
    public static final c f68069v;

    /* renamed from: w, reason: collision with root package name */
    public static final c f68070w;

    /* renamed from: x, reason: collision with root package name */
    public static final c f68071x;

    /* renamed from: y, reason: collision with root package name */
    public static final c f68072y;

    /* renamed from: z, reason: collision with root package name */
    public static final c f68073z;

    /* renamed from: a, reason: collision with root package name */
    public final String f68074a;

    static {
        c cVar = new c("AUTH_WEB_VIEW_FAILURE", 0, "payments.auth_web_view.failure");
        f68051b = cVar;
        c cVar2 = new c("AUTH_WEB_VIEW_NULL_ARGS", 1, "payments.auth_web_view.null_args");
        f68052c = cVar2;
        c cVar3 = new c("GET_SAVED_PAYMENT_METHODS_FAILURE", 2, "elements.customer_repository.get_saved_payment_methods_failure");
        f68053d = cVar3;
        c cVar4 = new c("GOOGLE_PAY_IS_READY_API_CALL", 3, "elements.google_pay_repository.is_ready_request_api_call_failure");
        f68054e = cVar4;
        c cVar5 = new c("GOOGLE_PAY_IS_READY_TIMEOUT", 4, "elements.google_pay_repository.is_ready_timeout");
        f68055f = cVar5;
        c cVar6 = new c("CUSTOMER_SHEET_ELEMENTS_SESSION_LOAD_FAILURE", 5, "elements.customer_sheet.elements_session.load_failure");
        c cVar7 = new c("CUSTOMER_SHEET_CUSTOMER_SESSION_ELEMENTS_SESSION_LOAD_FAILURE", 6, "elements.customer_sheet.customer_session.elements_session.load_failure");
        c cVar8 = new c("CUSTOMER_SHEET_PAYMENT_METHODS_LOAD_FAILURE", 7, "elements.customer_sheet.payment_methods.load_failure");
        c cVar9 = new c("CUSTOMER_SHEET_PAYMENT_METHODS_REFRESH_FAILURE", 8, "elements.customer_sheet.payment_methods.refresh_failure");
        c cVar10 = new c("CUSTOMER_SHEET_ADAPTER_NOT_FOUND", 9, "elements.customer_sheet.customer_adapter.not_found");
        f68056g = cVar10;
        c cVar11 = new c("PLACES_FIND_AUTOCOMPLETE_ERROR", 10, "address_element.find_autocomplete.error");
        f68057h = cVar11;
        c cVar12 = new c("PLACES_FETCH_PLACE_ERROR", 11, "address_element.fetch_place.error");
        f68058i = cVar12;
        c cVar13 = new c("LINK_CREATE_PAYMENT_DETAILS_FAILURE", 12, "link.create_new_card.create_payment_details_failure");
        f68059j = cVar13;
        c cVar14 = new c("LINK_SHARE_CARD_FAILURE", 13, "link.create_new_card.share_payment_details_failure");
        f68060k = cVar14;
        c cVar15 = new c("LINK_LOG_OUT_FAILURE", 14, "link.log_out.failure");
        f68061l = cVar15;
        c cVar16 = new c("LINK_NATIVE_FAILED_TO_GET_INTEGRITY_TOKEN", 15, "link.native.failed_to_get_integrity_token");
        f68062m = cVar16;
        c cVar17 = new c("LINK_NATIVE_FAILED_TO_ATTEST_REQUEST", 16, "link.native.failed_to_attest_request");
        n = cVar17;
        c cVar18 = new c("LINK_NATIVE_FAILED_TO_PREPARE_INTEGRITY_MANAGER", 17, "link.native.integrity.preparation_failed");
        o = cVar18;
        c cVar19 = new c("PAYMENT_LAUNCHER_CONFIRMATION_NULL_ARGS", 18, "payments.paymentlauncherconfirmation.null_args");
        f68063p = cVar19;
        c cVar20 = new c("PAYMENT_LAUNCHER_CONFIRMATION_INVALID_ARGS", 19, "payments.paymentlauncherconfirmation.invalid_args");
        f68064q = cVar20;
        c cVar21 = new c("BROWSER_LAUNCHER_ACTIVITY_NOT_FOUND", 20, "payments.browserlauncher.activity_not_found");
        f68065r = cVar21;
        c cVar22 = new c("BROWSER_LAUNCHER_NULL_ARGS", 21, "payments.browserlauncher.null_args");
        f68066s = cVar22;
        c cVar23 = new c("GOOGLE_PAY_SKIPPED_DURING_LOAD", 22, "google_pay.skipped_during_load");
        f68067t = cVar23;
        c cVar24 = new c("GOOGLE_PAY_FAILED", 23, "google_pay.confirm.error");
        f68068u = cVar24;
        c cVar25 = new c("FRAUD_DETECTION_API_FAILURE", 24, "fraud_detection_data_repository.api_failure");
        f68069v = cVar25;
        c cVar26 = new c("SAVED_PAYMENT_METHOD_RADAR_SESSION_FAILURE", 25, "stripe_android.saved_payment_method_radar_session_failure");
        f68070w = cVar26;
        c cVar27 = new c("EXTERNAL_PAYMENT_METHOD_CONFIRM_HANDLER_NULL", 26, "paymentsheet.external_payment_method.confirm_handler_is_null");
        f68071x = cVar27;
        c cVar28 = new c("CUSTOM_PAYMENT_METHOD_CONFIRM_HANDLER_NULL", 27, "paymentsheet.custom_payment_method.confirm_handler_is_null");
        f68072y = cVar28;
        c cVar29 = new c("CREATE_INTENT_CALLBACK_NULL", 28, "paymentsheet.create_intent_callback.is_null");
        f68073z = cVar29;
        c cVar30 = new c("PREPARE_PAYMENT_METHOD_HANDLER_NULL", 29, "paymentsheet.prepare_payment_method_handler.is_null");
        A = cVar30;
        c cVar31 = new c("CREATE_CARD_PRESENT_SETUP_INTENT_CALLBACK_NULL", 30, "elements.tap_to_add.create_card_present_setup_intent_callback.is_null");
        c cVar32 = new c("HCAPTCHA_FAILURE", 31, "elements.captcha.passive.expected_failure");
        B = cVar32;
        c[] cVarArr = {cVar, cVar2, cVar3, cVar4, cVar5, cVar6, cVar7, cVar8, cVar9, cVar10, cVar11, cVar12, cVar13, cVar14, cVar15, cVar16, cVar17, cVar18, cVar19, cVar20, cVar21, cVar22, cVar23, cVar24, cVar25, cVar26, cVar27, cVar28, cVar29, cVar30, cVar31, cVar32, new c("TAP_TO_ADD_DISCOVER_READERS_CALL_FAILURE", 32, "elements.tap_to_add.discover_readers_call.failure"), new c("TAP_TO_ADD_CONNECT_READER_CALL_FAILURE", 33, "elements.tap_to_add.connect_reader_call.failure")};
        C = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public c(String str, int i5, String str2) {
        this.f68074a = str2;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) C.clone();
    }

    @Override // fr.a
    public final String c() {
        return this.f68074a;
    }
}
