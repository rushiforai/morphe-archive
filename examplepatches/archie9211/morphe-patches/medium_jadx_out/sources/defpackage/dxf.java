package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.billingclient.api.AlternativeBillingOnlyAvailabilityListener;
import com.android.billingclient.api.AlternativeBillingOnlyReportingDetails;
import com.android.billingclient.api.AlternativeBillingOnlyReportingDetailsListener;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ExternalOfferAvailabilityListener;
import com.android.billingclient.api.ExternalOfferReportingDetails;
import com.android.billingclient.api.ExternalOfferReportingDetailsListener;
import com.android.billingclient.api.n;
import com.android.billingclient.api.zzcy;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dxf extends ihf {
    public final /* synthetic */ int f = 2;
    public final d0g g;
    public final int h;
    public final Object i;

    public dxf(AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener, zjf zjfVar, int i) {
        super("com.android.vending.billing.IInAppBillingIsAlternativeBillingOnlyAvailableCallback", 3);
        this.i = alternativeBillingOnlyAvailabilityListener;
        this.g = zjfVar;
        this.h = i;
    }

    @Override // defpackage.ihf
    public final boolean f(int i, Parcel parcel, Parcel parcel2) {
        int i2 = this.f;
        d0g d0gVar = this.g;
        int i3 = this.h;
        Object obj = this.i;
        switch (i2) {
            case 0:
                if (i == 1) {
                    Parcelable.Creator creator = Bundle.CREATOR;
                    Bundle bundle = (Bundle) nvf.a(parcel);
                    ihf.g(parcel);
                    AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener = (AlternativeBillingOnlyReportingDetailsListener) obj;
                    if (bundle == null) {
                        cbg cbgVar = cbg.NULL_BUNDLE_FROM_CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL;
                        BillingResult billingResult = n.h;
                        int i4 = zzcy.zza;
                        ((zjf) d0gVar).n(zzcy.zzb(cbgVar, 15, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                        alternativeBillingOnlyReportingDetailsListener.onAlternativeBillingOnlyTokenResponse(billingResult, null);
                    } else {
                        int iA = rxf.a("BillingClient", bundle);
                        BillingResult billingResultA = n.a(iA, rxf.g("BillingClient", bundle));
                        if (iA != 0) {
                            rxf.i("BillingClient", "createAlternativeBillingOnlyReportingDetailsAsync() failed. Response code: " + iA);
                            cbg cbgVar2 = cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                            int i5 = zzcy.zza;
                            ((zjf) d0gVar).n(zzcy.zzb(cbgVar2, 15, billingResultA, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                            alternativeBillingOnlyReportingDetailsListener.onAlternativeBillingOnlyTokenResponse(billingResultA, null);
                        } else {
                            try {
                                alternativeBillingOnlyReportingDetailsListener.onAlternativeBillingOnlyTokenResponse(billingResultA, new AlternativeBillingOnlyReportingDetails(bundle.getString("CREATE_ALTERNATIVE_BILLING_ONLY_REPORTING_DETAILS")));
                            } catch (JSONException e) {
                                rxf.j("BillingClient", "Error when parsing invalid alternative billing only reporting details. \n Exception: ", e);
                                cbg cbgVar3 = cbg.ERROR_DECODING_ALTERNATIVE_BILLING_ONLY_REPORTING_DETAILS;
                                BillingResult billingResult2 = n.h;
                                int i6 = zzcy.zza;
                                ((zjf) d0gVar).n(zzcy.zzb(cbgVar3, 15, billingResult2, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                                alternativeBillingOnlyReportingDetailsListener.onAlternativeBillingOnlyTokenResponse(billingResult2, null);
                            }
                        }
                    }
                }
                break;
            case 1:
                if (i == 1) {
                    Parcelable.Creator creator2 = Bundle.CREATOR;
                    Bundle bundle2 = (Bundle) nvf.a(parcel);
                    ihf.g(parcel);
                    ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener = (ExternalOfferReportingDetailsListener) obj;
                    if (bundle2 == null) {
                        cbg cbgVar4 = cbg.NULL_BUNDLE_FROM_CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL;
                        BillingResult billingResult3 = n.h;
                        int i7 = zzcy.zza;
                        ((zjf) d0gVar).n(zzcy.zzb(cbgVar4, 24, billingResult3, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                        externalOfferReportingDetailsListener.onExternalOfferReportingDetailsResponse(billingResult3, null);
                    } else {
                        int iA2 = rxf.a("BillingClient", bundle2);
                        BillingResult billingResultA2 = n.a(iA2, rxf.g("BillingClient", bundle2));
                        if (iA2 != 0) {
                            rxf.i("BillingClient", "createExternalOfferReportingDetailsAsync() failed. Response code: " + iA2);
                            cbg cbgVar5 = cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                            int i8 = zzcy.zza;
                            ((zjf) d0gVar).n(zzcy.zzb(cbgVar5, 24, billingResultA2, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                            externalOfferReportingDetailsListener.onExternalOfferReportingDetailsResponse(billingResultA2, null);
                        } else {
                            try {
                                externalOfferReportingDetailsListener.onExternalOfferReportingDetailsResponse(billingResultA2, new ExternalOfferReportingDetails(bundle2.getString("CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS")));
                            } catch (JSONException e2) {
                                rxf.j("BillingClient", "Error when parsing invalid external offer reporting details. \n Exception: ", e2);
                                cbg cbgVar6 = cbg.ERROR_DECODING_EXTERNAL_OFFER_REPORTING_DETAILS;
                                BillingResult billingResult4 = n.h;
                                int i9 = zzcy.zza;
                                ((zjf) d0gVar).n(zzcy.zzb(cbgVar6, 24, billingResult4, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                                externalOfferReportingDetailsListener.onExternalOfferReportingDetailsResponse(billingResult4, null);
                            }
                        }
                    }
                }
                break;
            case 2:
                if (i == 1) {
                    Parcelable.Creator creator3 = Bundle.CREATOR;
                    Bundle bundle3 = (Bundle) nvf.a(parcel);
                    ihf.g(parcel);
                    AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener = (AlternativeBillingOnlyAvailabilityListener) obj;
                    if (bundle3 == null) {
                        cbg cbgVar7 = cbg.NULL_BUNDLE_FROM_IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL;
                        BillingResult billingResult5 = n.h;
                        int i10 = zzcy.zza;
                        ((zjf) d0gVar).n(zzcy.zzb(cbgVar7, 14, billingResult5, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                        alternativeBillingOnlyAvailabilityListener.onAlternativeBillingOnlyAvailabilityResponse(billingResult5);
                    } else {
                        int iA3 = rxf.a("BillingClient", bundle3);
                        BillingResult billingResultA3 = n.a(iA3, rxf.g("BillingClient", bundle3));
                        if (iA3 != 0) {
                            rxf.i("BillingClient", "isAlternativeBillingOnlyAvailableAsync() failed. Response code: " + iA3);
                            cbg cbgVar8 = cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                            int i11 = zzcy.zza;
                            ((zjf) d0gVar).n(zzcy.zzb(cbgVar8, 14, billingResultA3, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                        }
                        alternativeBillingOnlyAvailabilityListener.onAlternativeBillingOnlyAvailabilityResponse(billingResultA3);
                    }
                }
                break;
            default:
                if (i == 1) {
                    Parcelable.Creator creator4 = Bundle.CREATOR;
                    Bundle bundle4 = (Bundle) nvf.a(parcel);
                    ihf.g(parcel);
                    ExternalOfferAvailabilityListener externalOfferAvailabilityListener = (ExternalOfferAvailabilityListener) obj;
                    if (bundle4 == null) {
                        cbg cbgVar9 = cbg.NULL_BUNDLE_FROM_IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL;
                        BillingResult billingResult6 = n.h;
                        int i12 = zzcy.zza;
                        ((zjf) d0gVar).n(zzcy.zzb(cbgVar9, 23, billingResult6, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                        externalOfferAvailabilityListener.onExternalOfferAvailabilityResponse(billingResult6);
                    } else {
                        int iA4 = rxf.a("BillingClient", bundle4);
                        BillingResult billingResultA4 = n.a(iA4, rxf.g("BillingClient", bundle4));
                        if (iA4 != 0) {
                            rxf.i("BillingClient", "isExternalOfferAvailableAsync() failed. Response code: " + iA4);
                            cbg cbgVar10 = cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                            int i13 = zzcy.zza;
                            ((zjf) d0gVar).n(zzcy.zzb(cbgVar10, 23, billingResultA4, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                        }
                        externalOfferAvailabilityListener.onExternalOfferAvailabilityResponse(billingResultA4);
                    }
                }
                break;
        }
        return false;
    }

    public dxf(AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener, zjf zjfVar, int i) {
        super("com.android.vending.billing.IInAppBillingCreateAlternativeBillingOnlyTokenCallback", 3);
        this.i = alternativeBillingOnlyReportingDetailsListener;
        this.g = zjfVar;
        this.h = i;
    }

    public dxf(ExternalOfferAvailabilityListener externalOfferAvailabilityListener, zjf zjfVar, int i) {
        super("com.android.vending.billing.IInAppBillingIsExternalPaymentAvailableCallback", 3);
        this.i = externalOfferAvailabilityListener;
        this.g = zjfVar;
        this.h = i;
    }

    public dxf(ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener, zjf zjfVar, int i) {
        super("com.android.vending.billing.IInAppBillingCreateExternalPaymentReportingDetailsCallback", 3);
        this.i = externalOfferReportingDetailsListener;
        this.g = zjfVar;
        this.h = i;
    }
}
