package f5;

import android.content.Context;
import android.os.CancellationSignal;
import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public interface f {
    boolean isAvailableOnDevice();

    void onGetCredential(Context context, l lVar, CancellationSignal cancellationSignal, Executor executor, d dVar);
}
