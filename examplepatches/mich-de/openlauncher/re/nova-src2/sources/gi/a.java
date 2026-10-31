package gi;

import android.os.SystemClock;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fi.j;
import java.util.concurrent.TimeUnit;
import p10.y1;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final long f57678a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f57679b = 0;

    static {
        TimeUnit.MINUTES.toMillis(10L);
        f57678a = SystemClock.elapsedRealtime();
    }

    public static void a(Status status, AbstractSafeParcelable abstractSafeParcelable, j jVar) {
        if (status.d()) {
            jVar.a(abstractSafeParcelable);
        } else {
            jVar.f55135a.v(y1.C(status));
        }
    }
}
