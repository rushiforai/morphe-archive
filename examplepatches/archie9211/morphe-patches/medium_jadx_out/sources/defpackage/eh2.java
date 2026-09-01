package defpackage;

import android.content.Context;
import android.os.CancellationSignal;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface eh2 {
    boolean isAvailableOnDevice();

    void onClearCredential(jo1 jo1Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var);

    void onGetCredential(Context context, gz9 gz9Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var);

    void onGetCredential(Context context, i95 i95Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var);

    void onPrepareCredential(i95 i95Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var);
}
