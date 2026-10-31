package gi;

import android.os.Looper;
import android.util.SparseArray;
import com.google.android.gms.internal.measurement.z6;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public abstract class f implements fi.e, Runnable {

    /* renamed from: a, reason: collision with root package name */
    public static final SparseArray f57686a;

    static {
        new z6(Looper.getMainLooper(), 3, false);
        Looper.getMainLooper();
        f57686a = new SparseArray(2);
        new AtomicInteger();
    }
}
