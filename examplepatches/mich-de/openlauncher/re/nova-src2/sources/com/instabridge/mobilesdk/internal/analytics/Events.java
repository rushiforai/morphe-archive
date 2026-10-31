package com.instabridge.mobilesdk.internal.analytics;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b+\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010'\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010(\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010)\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010*\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010-\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u00100\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u00101\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u00102\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u00063"}, d2 = {"Lcom/instabridge/mobilesdk/internal/analytics/Events;", b.f42142b, "<init>", "()V", "forProduct", b.f42142b, DatabaseConstants.EVENT_FIELD, "travel", b.f42142b, "OFFER_START", "OFFER_END", "SIGN_IN_CLICK", "SIGN_IN_STARTED", "SIGN_IN_SUCCESS", "SIGN_IN_FAILED", "SIGN_IN_ENDED", "PLAN_SELECTED", "PURCHASE_STARTED", "PURCHASE_COMPLETED", "PURCHASE_FAILED", "CHECKOUT_ERROR", "ADDRESS_FORM_SUBMITTED", "ADDRESS_FORM_DISMISSED", "PAYMENT_SHEET_CANCELED", "INSTALL_CLICK", "INSTALL_REQUEST", "INSTALL_SUCCESS", "INSTALL_FAILED", "COULDNT_INSTALL_ACTION", "CARRIER_LOCK_VIEW", "BACKEND_RESPONSE", "JOURNEY_OFFER_CLAIMED", "ELIGIBILITY_FAILURE", "BACK_PRESSED", "SUPPORT_CLICK", "ADD_DATA_CLICK", "MANAGE_PLAN_CLICK", "CANCEL_PLAN_SUBMIT", "CANCEL_PLAN_SUCCESS", "CANCEL_PLAN_FAILED", "TRAVEL_INTRO_SHOWN", "TRAVEL_INTRO_CLICK", "TRAVEL_CLICK", "DASHBOARD_CLICK", "DATA_STORE_CLICK", "CHECKOUT_CLICK", "MANUAL_INSTALL_CLICK", "MY_ESIMS_CLICK", "US_OFFER_IMPRESSION", "OFFER_CLICK", "TRAVEL_ESIM_REPORTED", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class Events {
    public static final int $stable = 0;

    @NotNull
    public static final String ADDRESS_FORM_DISMISSED = "primary_mobile_address_form_dismissed";

    @NotNull
    public static final String ADDRESS_FORM_SUBMITTED = "primary_mobile_address_form_submitted";

    @NotNull
    public static final String ADD_DATA_CLICK = "primary_mobile_add_data_click";

    @NotNull
    public static final String BACKEND_RESPONSE = "backend_response";

    @NotNull
    public static final String BACK_PRESSED = "primary_mobile_back_pressed";

    @NotNull
    public static final String CANCEL_PLAN_FAILED = "primary_mobile_cancel_plan_failed";

    @NotNull
    public static final String CANCEL_PLAN_SUBMIT = "primary_mobile_cancel_plan_submit";

    @NotNull
    public static final String CANCEL_PLAN_SUCCESS = "primary_mobile_cancel_plan_success";

    @NotNull
    public static final String CARRIER_LOCK_VIEW = "primary_mobile_carrier_lock_view";

    @NotNull
    public static final String CHECKOUT_CLICK = "checkout_click";

    @NotNull
    public static final String CHECKOUT_ERROR = "checkout_error";

    @NotNull
    public static final String COULDNT_INSTALL_ACTION = "primary_mobile_couldnt_install_action";

    @NotNull
    public static final String DASHBOARD_CLICK = "dashboard_click";

    @NotNull
    public static final String DATA_STORE_CLICK = "data_store_click";

    @NotNull
    public static final String ELIGIBILITY_FAILURE = "primary_mobile_eligibility_failure";

    @NotNull
    public static final String INSTALL_CLICK = "esim_installation_onboarding_click";

    @NotNull
    public static final String INSTALL_FAILED = "esim_install_failed";

    @NotNull
    public static final String INSTALL_REQUEST = "esim_request_operation";

    @NotNull
    public static final String INSTALL_SUCCESS = "esim_install_success";

    @NotNull
    public static final Events INSTANCE = new Events();

    @NotNull
    public static final String JOURNEY_OFFER_CLAIMED = "primary_mobile_journey_offer_claimed";

    @NotNull
    public static final String MANAGE_PLAN_CLICK = "primary_mobile_manage_plan_click";

    @NotNull
    public static final String MANUAL_INSTALL_CLICK = "esim_manual_installation_click";

    @NotNull
    public static final String MY_ESIMS_CLICK = "my_esims_click";

    @NotNull
    public static final String OFFER_CLICK = "primary_mobile_offer_click";

    @NotNull
    public static final String OFFER_END = "primary_mobile_offer_end";

    @NotNull
    public static final String OFFER_START = "primary_mobile_offer_start";

    @NotNull
    public static final String PAYMENT_SHEET_CANCELED = "primary_mobile_payment_sheet_canceled";

    @NotNull
    public static final String PLAN_SELECTED = "primary_mobile_plan_selected";

    @NotNull
    public static final String PURCHASE_COMPLETED = "core_purchase_completed";

    @NotNull
    public static final String PURCHASE_FAILED = "core_purchase_failed";

    @NotNull
    public static final String PURCHASE_STARTED = "core_purchase_started";

    @NotNull
    public static final String SIGN_IN_CLICK = "sign_in_click";

    @NotNull
    public static final String SIGN_IN_ENDED = "sign_in_ended";

    @NotNull
    public static final String SIGN_IN_FAILED = "sign_in_failed";

    @NotNull
    public static final String SIGN_IN_STARTED = "sign_in_started";

    @NotNull
    public static final String SIGN_IN_SUCCESS = "sign_in_success";

    @NotNull
    public static final String SUPPORT_CLICK = "primary_mobile_support_click";

    @NotNull
    public static final String TRAVEL_CLICK = "travel_esim_click";

    @NotNull
    public static final String TRAVEL_ESIM_REPORTED = "travel_esim_reported";

    @NotNull
    public static final String TRAVEL_INTRO_CLICK = "travel_esim_intro_click";

    @NotNull
    public static final String TRAVEL_INTRO_SHOWN = "travel_esim_intro_shown";

    @NotNull
    public static final String US_OFFER_IMPRESSION = "eyecon_mobile_banner_impression";

    private Events() {
    }

    @NotNull
    public final String forProduct(@NotNull String event, boolean travel) {
        Intrinsics.g(event, "event");
        return (travel && j.I0(event, "primary_mobile_", false)) ? "travel_esim_".concat(k.a1(event, "primary_mobile_")) : event;
    }
}
