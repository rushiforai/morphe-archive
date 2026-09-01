package defpackage;

import android.os.Bundle;
import com.android.billingclient.api.BillingProgramAvailabilityDetails;
import com.android.billingclient.api.BillingProgramAvailabilityListener;
import com.android.billingclient.api.BillingProgramReportingDetails;
import com.android.billingclient.api.BillingProgramReportingDetailsListener;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.n;
import com.android.billingclient.api.o;
import com.android.billingclient.api.zzcy;
import com.drew.imaging.riff.pvS.uuLAxLN;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class wd2 extends plf {
    public final /* synthetic */ int g = 1;
    public final int h;
    public final int i;
    public final ExecutorService j;
    public final d0g k;
    public final Object l;

    public wd2(BillingProgramAvailabilityListener billingProgramAvailabilityListener, int i, zjf zjfVar, int i2, ExecutorService executorService) {
        super(0);
        billingProgramAvailabilityListener.getClass();
        this.l = billingProgramAvailabilityListener;
        this.h = i;
        this.k = zjfVar;
        this.i = i2;
        this.j = executorService;
    }

    @Override // defpackage.plf
    public final void o(Bundle bundle) {
        int i = this.g;
        int i2 = this.h;
        d0g d0gVar = this.k;
        int i3 = this.i;
        Object obj = this.l;
        switch (i) {
            case 0:
                BillingProgramReportingDetailsListener billingProgramReportingDetailsListener = (BillingProgramReportingDetailsListener) obj;
                if (bundle == null) {
                    cbg cbgVar = cbg.zzaT;
                    BillingResult billingResult = n.h;
                    qk7.F(cbgVar, billingResult, d0gVar, s0g.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC.b, i3);
                    billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResult, null);
                    return;
                }
                s0g s0gVar = s0g.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC;
                BillingResult billingResultA = o.a(bundle, "CreateBillingProgramReportingDetailsDelegateToBackendCallback", s0gVar.b, d0gVar, i3);
                if (billingProgramReportingDetailsListener == null) {
                    qk7.F(cbg.NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK, billingResultA, d0gVar, s0gVar.b, i3);
                    return;
                }
                if (billingResultA.getResponseCode() != 0) {
                    billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResultA, null);
                    return;
                }
                try {
                    byte[] byteArray = bundle.getByteArray("RESPONSE_DATA");
                    if (byteArray == null) {
                        throw new Exception("Response data is null");
                    }
                    billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResultA, new BillingProgramReportingDetails(o1g.q(byteArray).r().r(), i2));
                    return;
                } catch (Exception e) {
                    rxf.i("CreateBillingProgramReportingDetailsDelegateToBackendCallback", "Got a JSON exception trying to decode billing program reporting details.");
                    cbg cbgVar2 = cbg.ERROR_DECODING_DELEGATE_TO_BACKEND_RESPONSE_DATA;
                    BillingResult billingResult2 = n.h;
                    ((zjf) d0gVar).n(zzcy.zzb(cbgVar2, s0g.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC.b, billingResult2, zzcy.zza(e), lbg.BROADCAST_ACTION_UNSPECIFIED), i3);
                    billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResult2, null);
                    return;
                }
            default:
                BillingProgramAvailabilityListener billingProgramAvailabilityListener = (BillingProgramAvailabilityListener) obj;
                BillingProgramAvailabilityDetails billingProgramAvailabilityDetails = new BillingProgramAvailabilityDetails(i2);
                if (bundle == null) {
                    cbg cbgVar3 = cbg.zzaT;
                    BillingResult billingResult3 = n.h;
                    qk7.F(cbgVar3, billingResult3, d0gVar, s0g.IS_BILLING_PROGRAM_AVAILABLE_ASYNC.b, i3);
                    billingProgramAvailabilityListener.onBillingProgramAvailabilityResponse(billingResult3, billingProgramAvailabilityDetails);
                    return;
                }
                s0g s0gVar2 = s0g.IS_BILLING_PROGRAM_AVAILABLE_ASYNC;
                BillingResult billingResultA2 = o.a(bundle, uuLAxLN.uLHDmgwIXCyOIWZ, s0gVar2.b, d0gVar, i3);
                if (billingProgramAvailabilityListener == null) {
                    qk7.F(cbg.NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK, billingResultA2, d0gVar, s0gVar2.b, i3);
                    return;
                } else {
                    billingProgramAvailabilityListener.onBillingProgramAvailabilityResponse(billingResultA2, billingProgramAvailabilityDetails);
                    return;
                }
        }
    }

    public wd2(BillingProgramReportingDetailsListener billingProgramReportingDetailsListener, int i, zjf zjfVar, int i2, ExecutorService executorService) {
        super(0);
        billingProgramReportingDetailsListener.getClass();
        this.l = billingProgramReportingDetailsListener;
        this.h = i;
        this.k = zjfVar;
        this.i = i2;
        this.j = executorService;
    }
}
