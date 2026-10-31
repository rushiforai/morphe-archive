package rg;

import android.os.Message;
import android.util.Log;
import android.util.Pair;
import b.a3;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import com.google.android.gms.internal.measurement.z6;

/* loaded from: classes3.dex */
public final class d extends z6 {
    @Override // com.google.android.gms.internal.measurement.z6, android.os.Handler
    public final void handleMessage(Message message) {
        int i5 = message.what;
        if (i5 != 1) {
            if (i5 != 2) {
                Log.wtf("BasePendingResult", b.c0.p(new StringBuilder(String.valueOf(i5).length() + 34), "Don't know how to handle message: ", i5), new Exception());
                return;
            } else {
                ((BasePendingResult) message.obj).A(Status.f31809m);
                return;
            }
        }
        Pair pair = (Pair) message.obj;
        if (pair.first != null) {
            throw new ClassCastException();
        }
        try {
            throw null;
        } catch (RuntimeException e3) {
            a3 a3Var = BasePendingResult.f31815j;
            throw e3;
        }
    }
}
