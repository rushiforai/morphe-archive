package defpackage;

import android.os.Message;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wn0 extends tjf {
    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        int i = message.what;
        if (i != 1) {
            if (i != 2) {
                Log.wtf("BasePendingResult", b09.A(new StringBuilder(String.valueOf(i).length() + 34), i, "Don't know how to handle message: "), new Exception());
                return;
            } else {
                ((BasePendingResult) message.obj).forceFailureUnlessReady(Status.h);
                return;
            }
        }
        Pair pair = (Pair) message.obj;
        if (pair.first != null) {
            rd6.m();
            return;
        }
        cjb cjbVar = (cjb) pair.second;
        try {
            throw null;
        } catch (RuntimeException e) {
            BasePendingResult.zal(cjbVar);
            throw e;
        }
    }
}
