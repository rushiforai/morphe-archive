package defpackage;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import com.android.billingclient.api.BillingConfig;
import com.android.billingclient.api.BillingConfigResponseListener;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ProxyBillingActivity;
import com.android.billingclient.api.ProxyBillingActivityV2;
import com.android.billingclient.api.a;
import com.android.billingclient.api.e;
import com.android.billingclient.api.f;
import com.android.billingclient.api.g;
import com.android.billingclient.api.j;
import com.android.billingclient.api.k;
import com.android.billingclient.api.n;
import com.android.billingclient.api.zzcy;
import com.android.billingclient.api.zzeo;
import j$.util.Objects;
import java.util.Arrays;
import java.util.concurrent.CancellationException;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class plf extends ihf {
    public final /* synthetic */ int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public plf(int i) {
        super("com.android.vending.billing.IInAppBillingDelegateToBackendCallback", 3);
        this.f = i;
        switch (i) {
            case 3:
                super("com.android.vending.billing.IInAppBillingGetExternalPaymentDialogIntentCallback", 3);
                break;
            default:
                break;
        }
    }

    @Override // defpackage.ihf
    public final boolean f(int i, Parcel parcel, Parcel parcel2) {
        gyf dzfVar;
        switch (this.f) {
            case 0:
                if (i != 1) {
                    return false;
                }
                Parcelable.Creator creator = Bundle.CREATOR;
                Bundle bundle = (Bundle) nvf.a(parcel);
                ihf.g(parcel);
                o(bundle);
                return true;
            case 1:
                if (i != 1) {
                    return false;
                }
                Parcelable.Creator creator2 = Bundle.CREATOR;
                Bundle bundle2 = (Bundle) nvf.a(parcel);
                ihf.g(parcel);
                f fVar = (f) this;
                ResultReceiver resultReceiver = fVar.h;
                if (bundle2 == null) {
                    resultReceiver.send(6, null);
                    return true;
                }
                if (!bundle2.containsKey("RESPONSE_CODE")) {
                    rxf.i("BillingClient", "Response bundle doesn't contain a response code");
                    resultReceiver.send(6, bundle2);
                    return true;
                }
                int iA = rxf.a("BillingClient", bundle2);
                if (iA != 0) {
                    rxf.i("BillingClient", "Unable to launch intent for alternative billing only dialog" + iA);
                    resultReceiver.send(iA, bundle2);
                    return true;
                }
                PendingIntent pendingIntent = (PendingIntent) bundle2.getParcelable("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT");
                if (pendingIntent == null) {
                    rxf.h("BillingClient", "User has acknowledged the alternative billing only dialog before.");
                    resultReceiver.send(0, bundle2);
                    return true;
                }
                try {
                    Activity activity = (Activity) fVar.g.get();
                    Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivityV2.class);
                    intent.putExtra("alternative_billing_only_dialog_result_receiver", resultReceiver);
                    intent.putExtra("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT", pendingIntent);
                    activity.startActivity(intent);
                    return true;
                } catch (RuntimeException e) {
                    rxf.j("BillingClient", "Runtime error while launching intent for alternative billing only dialog.", e);
                    Bundle bundle3 = new Bundle();
                    bundle3.putInt("RESPONSE_CODE", 6);
                    bundle3.putString("DEBUG_MESSAGE", "An internal error occurred.");
                    bundle3.putInt("INTERNAL_LOG_ERROR_REASON", cbg.RUNTIME_EXCEPTION_ON_LAUNCHING_ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT.zza());
                    String name = e.getClass().getName();
                    String message = e.getMessage();
                    if (message == null) {
                        message = "";
                    }
                    bundle3.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", name + ": " + message);
                    resultReceiver.send(6, bundle3);
                    return true;
                }
            case 2:
                if (i != 1) {
                    return false;
                }
                Parcelable.Creator creator3 = Bundle.CREATOR;
                Bundle bundle4 = (Bundle) nvf.a(parcel);
                ihf.g(parcel);
                g gVar = (g) this;
                int i2 = gVar.i;
                d0g d0gVar = gVar.h;
                BillingConfigResponseListener billingConfigResponseListener = gVar.g;
                if (bundle4 != null) {
                    int iA2 = rxf.a("BillingClient", bundle4);
                    String strG = rxf.g("BillingClient", bundle4);
                    BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
                    builderNewBuilder.setResponseCode(iA2);
                    builderNewBuilder.setDebugMessage(strG);
                    if (iA2 != 0) {
                        rxf.i("BillingClient", "getBillingConfig() failed. Response code: " + iA2);
                        BillingResult billingResultBuild = builderNewBuilder.build();
                        cbg cbgVar = cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                        int i3 = zzcy.zza;
                        ((zjf) d0gVar).n(zzcy.zzb(cbgVar, 13, billingResultBuild, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i2);
                        billingConfigResponseListener.onBillingConfigResponse(billingResultBuild, null);
                    } else if (bundle4.containsKey("BILLING_CONFIG")) {
                        try {
                            billingConfigResponseListener.onBillingConfigResponse(builderNewBuilder.build(), new BillingConfig(bundle4.getString("BILLING_CONFIG")));
                        } catch (JSONException e2) {
                            rxf.j("BillingClient", "Got a JSON exception trying to decode BillingConfig. \n Exception: ", e2);
                            cbg cbgVar2 = cbg.ERROR_DECODING_BILLING_CONFIG_DATA;
                            BillingResult billingResult = n.h;
                            int i4 = zzcy.zza;
                            ((zjf) d0gVar).n(zzcy.zzb(cbgVar2, 13, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i2);
                            billingConfigResponseListener.onBillingConfigResponse(billingResult, null);
                        }
                    } else {
                        rxf.i("BillingClient", "getBillingConfig() returned a bundle with neither an error nor a billing config response");
                        builderNewBuilder.setResponseCode(6);
                        BillingResult billingResultBuild2 = builderNewBuilder.build();
                        cbg cbgVar3 = cbg.MISSING_BILLING_CONFIG_IN_GET_BILLING_CONFIG_RESPONSE;
                        int i5 = zzcy.zza;
                        ((zjf) d0gVar).n(zzcy.zzb(cbgVar3, 13, billingResultBuild2, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i2);
                        billingConfigResponseListener.onBillingConfigResponse(billingResultBuild2, null);
                    }
                    break;
                } else {
                    cbg cbgVar4 = cbg.NULL_BUNDLE_FROM_GET_BILLING_CONFIG_SERVICE_CALL;
                    BillingResult billingResult2 = n.h;
                    int i6 = zzcy.zza;
                    ((zjf) d0gVar).n(zzcy.zzb(cbgVar4, 13, billingResult2, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i2);
                    billingConfigResponseListener.onBillingConfigResponse(billingResult2, null);
                }
                parcel2.writeNoException();
                return true;
            case 3:
                if (i != 1) {
                    return false;
                }
                Parcelable.Creator creator4 = Bundle.CREATOR;
                Bundle bundle5 = (Bundle) nvf.a(parcel);
                ihf.g(parcel);
                p(bundle5);
                return true;
            case 4:
                if (i != 1) {
                    return false;
                }
                Parcelable.Creator creator5 = Bundle.CREATOR;
                Bundle bundle6 = (Bundle) nvf.a(parcel);
                ihf.g(parcel);
                j jVar = (j) this;
                if (bundle6 == null) {
                    rxf.i("BillingClient", "Response bundle is null.");
                    jVar.q(jVar.g, n.h, cbg.NULL_BUNDLE_RETURNED_BY_PHONESKY, jVar.h.booleanValue(), null, jVar.i);
                    return true;
                }
                if (!bundle6.containsKey("RESPONSE_CODE")) {
                    rxf.i("BillingClient", "Response bundle doesn't contain a response code");
                    jVar.q(jVar.g, n.h, cbg.zzby, jVar.h.booleanValue(), null, jVar.i);
                    return true;
                }
                if (bundle6.getInt("RESPONSE_CODE") != 0) {
                    jVar.q(jVar.g, n.a(bundle6.getInt("RESPONSE_CODE"), bundle6.getString("DEBUG_MESSAGE", "")), cbg.NON_OK_CODE_RETURNED_BY_PHONESKY, jVar.h.booleanValue(), b09.w(bundle6.getInt("RESPONSE_CODE"), "Response code from Phonesky: "), jVar.i);
                    return true;
                }
                if (!bundle6.containsKey("BILLING_API_VERSION_KEY")) {
                    rxf.i("BillingClient", "Billing API version not found in response bundle.");
                    jVar.q(jVar.g, n.h, cbg.BILLING_API_VERSION_NOT_SET_IN_BUNDLE, jVar.h.booleanValue(), null, jVar.i);
                    return true;
                }
                int i7 = bundle6.getInt("BILLING_API_VERSION_KEY");
                a aVar = jVar.j;
                a.r(aVar, i7);
                aVar.l = i7 >= 5;
                aVar.k = i7 >= 3;
                Bundle bundle7 = bundle6.getBundle("EXPERIMENT_VALUES_KEY");
                if (bundle7 != null) {
                    try {
                        il7.e = bundle7.getBoolean("DELEGATION_API_ENABLED_KEY");
                    } catch (Throwable th) {
                        rxf.j("BillingClient", "Error reading EnableDelegationApi experiment flag: ".concat(bundle7.toString()), th);
                    }
                    try {
                        il7.f = bundle7.getLong("AUTO_SERVICE_RECONNECTION_SYNCHRONOUS_TIMEOUT_MS_KEY");
                    } catch (Throwable th2) {
                        rxf.j("BillingClient", "Error reading AutoServiceReconnectionSynchronousTimeoutMs experiment flag: ".concat(bundle7.toString()), th2);
                    }
                    try {
                        il7.g = bundle7.getLong("AUTO_SERVICE_RECONNECTION_ASYNCHRONOUS_TIMEOUT_MS_KEY");
                    } catch (Throwable th3) {
                        rxf.j("BillingClient", "Error reading AutoServiceReconnectionAsynchronousTimeoutMs experiment flag: ".concat(bundle7.toString()), th3);
                    }
                    try {
                        il7.h = bundle7.getInt("AUTO_SERVICE_RECONNECTION_MAX_NUM_RETRIES_KEY");
                    } catch (Throwable th4) {
                        rxf.j("BillingClient", "Error reading AutoServiceReconnectionMaxNumRetries experiment flag: ".concat(bundle7.toString()), th4);
                    }
                    break;
                }
                Bundle bundle8 = bundle6.getBundle("ENABLED_SUBSCRIPTION_CLIENT_ACTIONS_KEY");
                if (bundle8 != null) {
                    Object[] objArrCopyOf = new Object[4];
                    int i8 = 0;
                    for (zzeo zzeoVar : zzeo.values()) {
                        if (bundle8.getBoolean(zzeoVar.name(), false)) {
                            int length = objArrCopyOf.length;
                            int i9 = i8 + 1;
                            int iB = tr7.B(length, i9);
                            if (iB > length) {
                                objArrCopyOf = Arrays.copyOf(objArrCopyOf, iB);
                            }
                            objArrCopyOf[i8] = zzeoVar;
                            i8 = i9;
                        }
                    }
                    a aVar2 = jVar.j;
                    if (i8 == 0) {
                        dzfVar = zyf.j;
                    } else if (i8 != 1) {
                        dzfVar = gyf.t(i8, objArrCopyOf);
                        dzfVar.size();
                    } else {
                        Object obj = objArrCopyOf[0];
                        Objects.requireNonNull(obj);
                        dzfVar = new dzf(obj);
                    }
                    aVar2.I = dzfVar;
                    if (aVar2.f != null) {
                        aVar2.f.i = aVar2.I;
                    }
                }
                a aVar3 = jVar.j;
                if (aVar3.m < 3) {
                    rxf.i("BillingClient", "In-app billing API version 3 is not supported on this device.");
                    jVar.q(jVar.g, n.b, cbg.ONE_TIME_PRODUCT_NOT_SUPPORTED, jVar.h.booleanValue(), null, jVar.i);
                    return true;
                }
                e eVar = jVar.g;
                Boolean bool = jVar.h;
                int i10 = jVar.i;
                boolean zBooleanValue = bool.booleanValue();
                a.s(aVar3, 0);
                synchronized (aVar3.a) {
                    try {
                        if (aVar3.b != 3) {
                            eVar.d(i10, zBooleanValue);
                            eVar.e(n.i);
                        }
                    } finally {
                    }
                }
                return true;
            default:
                if (i != 1) {
                    return false;
                }
                Parcelable.Creator creator6 = Bundle.CREATOR;
                Bundle bundle9 = (Bundle) nvf.a(parcel);
                ihf.g(parcel);
                k kVar = (k) this;
                ResultReceiver resultReceiver2 = kVar.h;
                if (resultReceiver2 != null) {
                    if (bundle9 == null) {
                        resultReceiver2.send(0, null);
                    } else {
                        Activity activity2 = (Activity) kVar.g.get();
                        PendingIntent pendingIntent2 = (PendingIntent) bundle9.getParcelable("KEY_LAUNCH_INTENT");
                        if (activity2 == null || pendingIntent2 == null) {
                            resultReceiver2.send(0, null);
                            rxf.i("BillingClient", "Unable to launch intent for in-app messaging");
                        } else {
                            try {
                                Intent intent2 = new Intent(activity2, (Class<?>) ProxyBillingActivity.class);
                                intent2.putExtra("in_app_message_result_receiver", resultReceiver2);
                                intent2.putExtra("IN_APP_MESSAGE_INTENT", pendingIntent2);
                                activity2.startActivity(intent2);
                            } catch (CancellationException e3) {
                                resultReceiver2.send(0, null);
                                rxf.j("BillingClient", "Exception caught while launching intent for in-app messaging.", e3);
                            }
                        }
                    }
                    break;
                } else {
                    rxf.i("BillingClient", "Unable to send result for in-app messaging");
                }
                parcel2.writeNoException();
                return true;
        }
    }

    public abstract void o(Bundle bundle);

    public abstract void p(Bundle bundle);

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ plf(String str, int i) {
        super(str, 3);
        this.f = i;
    }
}
