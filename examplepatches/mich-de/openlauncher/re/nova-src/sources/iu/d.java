package iu;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d implements b {

    /* renamed from: b, reason: collision with root package name */
    public static final d f68075b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f68076c;

    /* renamed from: d, reason: collision with root package name */
    public static final d f68077d;

    /* renamed from: e, reason: collision with root package name */
    public static final d f68078e;

    /* renamed from: f, reason: collision with root package name */
    public static final d f68079f;

    /* renamed from: g, reason: collision with root package name */
    public static final d f68080g;

    /* renamed from: h, reason: collision with root package name */
    public static final d f68081h;

    /* renamed from: i, reason: collision with root package name */
    public static final d f68082i;

    /* renamed from: j, reason: collision with root package name */
    public static final d f68083j;

    /* renamed from: k, reason: collision with root package name */
    public static final d f68084k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ d[] f68085l;

    /* renamed from: a, reason: collision with root package name */
    public final String f68086a;

    static {
        d dVar = new d("CUSTOMER_SHEET_ELEMENTS_SESSION_LOAD_SUCCESS", 0, "elements.customer_sheet.elements_session.load_success");
        d dVar2 = new d("CUSTOMER_SHEET_CUSTOMER_SESSION_ELEMENTS_SESSION_LOAD_SUCCESS", 1, "elements.customer_sheet.customer_session.elements_session.load_success");
        d dVar3 = new d("CUSTOMER_SHEET_PAYMENT_METHODS_LOAD_SUCCESS", 2, "elements.customer_sheet.payment_methods.load_success");
        d dVar4 = new d("GET_SAVED_PAYMENT_METHODS_SUCCESS", 3, "elements.customer_repository.get_saved_payment_methods_success");
        f68075b = dVar4;
        d dVar5 = new d("PLACES_FIND_AUTOCOMPLETE_SUCCESS", 4, "address_element.find_autocomplete.success");
        f68076c = dVar5;
        d dVar6 = new d("PLACES_FETCH_PLACE_SUCCESS", 5, "address_element.fetch_place.success");
        f68077d = dVar6;
        d dVar7 = new d("LINK_CREATE_CARD_SUCCESS", 6, "link.create_new_card.success");
        f68078e = dVar7;
        d dVar8 = new d("LINK_LOG_OUT_SUCCESS", 7, "link.log_out.success");
        f68079f = dVar8;
        d dVar9 = new d("CUSTOMER_SHEET_PAYMENT_METHODS_REFRESH_SUCCESS", 8, "elements.customer_sheet.payment_methods.refresh_success");
        d dVar10 = new d("EXTERNAL_PAYMENT_METHODS_LAUNCH_SUCCESS", 9, "paymentsheet.external_payment_method.launch_success");
        f68080g = dVar10;
        d dVar11 = new d("CUSTOM_PAYMENT_METHODS_LAUNCH_SUCCESS", 10, "paymentsheet.custom_payment_method.launch_success");
        f68081h = dVar11;
        d dVar12 = new d("FOUND_CREATE_INTENT_CALLBACK_WHILE_POLLING", 11, "paymentsheet.polling_for_create_intent_callback.found");
        f68082i = dVar12;
        d dVar13 = new d("FOUND_CREATE_INTENT_WITH_CONFIRMATION_TOKEN_CALLBACK_WHILE_POLLING", 12, "paymentsheet.polling_for_create_intent_with_confirmation_token_callback.found");
        f68083j = dVar13;
        d dVar14 = new d("FOUND_PREPARE_PAYMENT_METHOD_HANDLER_WHILE_POLLING", 13, "paymentsheet.polling_for_prepare_payment_method_handler.found");
        f68084k = dVar14;
        d[] dVarArr = {dVar, dVar2, dVar3, dVar4, dVar5, dVar6, dVar7, dVar8, dVar9, dVar10, dVar11, dVar12, dVar13, dVar14, new d("TAP_TO_ADD_DISCOVER_READERS_CALL_SUCCESS", 14, "elements.tap_to_add.discover_readers_call.success"), new d("TAP_TO_ADD_CONNECT_READER_CALL_SUCCESS", 15, "elements.tap_to_add.connect_reader_call.success"), new d("FOUND_CREATE_CARD_PRESENT_SETUP_INTENT_CALLBACK_WHILE_POLLING", 16, "elements.tap_to_add.polling_for_create_card_present_setup_intent_callback.success")};
        f68085l = dVarArr;
        EnumEntriesKt.a(dVarArr);
    }

    public d(String str, int i5, String str2) {
        this.f68086a = str2;
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f68085l.clone();
    }

    @Override // fr.a
    public final String c() {
        return this.f68086a;
    }
}
