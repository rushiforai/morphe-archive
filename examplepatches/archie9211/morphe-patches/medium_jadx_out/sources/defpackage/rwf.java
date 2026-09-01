package defpackage;

import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import com.android.billingclient.api.InAppMessageResponseListener;
import com.android.billingclient.api.InAppMessageResult;
import com.android.billingclient.api.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rwf extends ResultReceiver {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rwf(Handler handler, wfd wfdVar) {
        super(handler);
        this.b = wfdVar;
    }

    @Override // android.os.ResultReceiver
    public final void onReceiveResult(int i, Bundle bundle) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                InAppMessageResponseListener inAppMessageResponseListener = (InAppMessageResponseListener) obj;
                int i3 = rxf.a;
                inAppMessageResponseListener.onInAppMessageResponse(bundle == null ? new InAppMessageResult(0, null) : new InAppMessageResult(bundle.getInt("IN_APP_MESSAGE_RESPONSE_CODE", 0), bundle.getString("IN_APP_MESSAGE_PURCHASE_TOKEN")));
                break;
            default:
                ((wfd) obj).d(null);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rwf(a aVar, Handler handler, InAppMessageResponseListener inAppMessageResponseListener) {
        super(handler);
        this.b = inAppMessageResponseListener;
    }
}
