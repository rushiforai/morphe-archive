package com.instabridge.mobilesdk.internal.esim;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import b.c0;
import com.instabridge.mobilesdk.internal.Logger;
import com.instabridge.mobilesdk.internal.esim.EsimInstallResult;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0016¨\u0006\u000b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EsimInstallReceiver;", "Landroid/content/BroadcastReceiver;", "<init>", "()V", "onReceive", b.f42142b, "context", "Landroid/content/Context;", "intent", "Landroid/content/Intent;", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class EsimInstallReceiver extends BroadcastReceiver {
    public static final int $stable = 0;

    @NotNull
    public static final String ACTION_DOWNLOAD_SUBSCRIPTION = "com.instabridge.mobilesdk.DOWNLOAD_SUBSCRIPTION";

    @NotNull
    public static final String ACTION_RESOLVE_DOWNLOAD_SUBSCRIPTION = "com.instabridge.mobilesdk.RESOLVE_DOWNLOAD_SUBSCRIPTION";
    public static final int REQUEST_CODE_RESOLUTION = 6742;

    @Override // android.content.BroadcastReceiver
    public void onReceive(@NotNull Context context, @NotNull Intent intent) {
        Intrinsics.g(context, "context");
        Intrinsics.g(intent, "intent");
        if (Intrinsics.b(intent.getAction(), ACTION_DOWNLOAD_SUBSCRIPTION) || Intrinsics.b(intent.getAction(), ACTION_RESOLVE_DOWNLOAD_SUBSCRIPTION)) {
            int resultCode = getResultCode();
            int intExtra = intent.getIntExtra("android.telephony.euicc.extra.EMBEDDED_SUBSCRIPTION_ERROR_CODE", 0);
            int intExtra2 = intent.getIntExtra("android.telephony.euicc.extra.EMBEDDED_SUBSCRIPTION_OPERATION_CODE", 0);
            int intExtra3 = intent.getIntExtra("android.telephony.euicc.extra.EMBEDDED_SUBSCRIPTION_DETAILED_CODE", 0);
            String stringExtra = intent.getStringExtra("android.telephony.euicc.extra.EMBEDDED_SUBSCRIPTION_SMDX_SUBJECT_CODE");
            String stringExtra2 = intent.getStringExtra("android.telephony.euicc.extra.EMBEDDED_SUBSCRIPTION_SMDX_REASON_CODE");
            Logger logger = Logger.INSTANCE;
            StringBuilder sbV = c0.v("eSIM install broadcast: action=", resultCode, intent.getAction(), " resultCode=", " errorCode=");
            c0.A(sbV, intExtra, " operationCode=", intExtra2, " detailedCode=");
            sbV.append(intExtra3);
            sbV.append(" smdxSubject=");
            sbV.append(stringExtra);
            sbV.append(" smdxReason=");
            sbV.append(stringExtra2);
            logger.d(sbV.toString());
            if (resultCode == 0) {
                EuiccInstaller.INSTANCE.deliver$mobile_sdk_release(new EsimInstallResult.Ok(b.f42142b));
            } else if (resultCode != 1) {
                EuiccInstaller.INSTANCE.deliver$mobile_sdk_release(new EsimInstallResult.Failed(resultCode, intExtra, intExtra2, intExtra3, stringExtra, stringExtra2, "install failed"));
            } else {
                EuiccInstaller.INSTANCE.deliverResolution$mobile_sdk_release(intent);
            }
        }
    }
}
