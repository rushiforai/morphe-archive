package th;

import android.os.IInterface;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.wallet.PaymentCardRecognitionIntentResponse;
import com.google.android.gms.wallet.PaymentData;

/* loaded from: classes3.dex */
public interface b extends IInterface {
    void H(Status status, PaymentCardRecognitionIntentResponse paymentCardRecognitionIntentResponse);

    void h(Status status, PaymentData paymentData);

    void m(Status status, boolean z11);

    void w(int i5, boolean z11);
}
