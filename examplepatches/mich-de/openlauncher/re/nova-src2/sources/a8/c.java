package a8;

import android.os.Handler;
import android.os.Looper;
import androidx.room.x;
import java.util.concurrent.ExecutorService;
import t70.c0;
import t70.m0;

/* loaded from: classes.dex */
public final class c implements a {

    /* renamed from: a, reason: collision with root package name */
    public final x f458a;

    /* renamed from: b, reason: collision with root package name */
    public final c0 f459b;

    /* renamed from: c, reason: collision with root package name */
    public final Handler f460c = new Handler(Looper.getMainLooper());

    /* renamed from: d, reason: collision with root package name */
    public final b f461d = new b(this, 0);

    public c(ExecutorService executorService) {
        x xVar = new x(executorService, 1);
        this.f458a = xVar;
        this.f459b = m0.l(xVar);
    }
}
