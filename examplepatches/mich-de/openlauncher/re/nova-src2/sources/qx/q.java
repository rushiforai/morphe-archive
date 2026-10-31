package qx;

import android.os.Handler;
import android.os.Looper;
import androidx.lifecycle.DefaultLifecycleObserver;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class q implements DefaultLifecycleObserver {

    /* renamed from: d, reason: collision with root package name */
    public static volatile boolean f84579d;

    /* renamed from: f, reason: collision with root package name */
    public static volatile boolean f84581f;

    /* renamed from: a, reason: collision with root package name */
    public static final q f84576a = new q();

    /* renamed from: b, reason: collision with root package name */
    public static final LinkedHashSet f84577b = new LinkedHashSet();

    /* renamed from: c, reason: collision with root package name */
    public static final Object f84578c = new Object();

    /* renamed from: e, reason: collision with root package name */
    public static volatile boolean f84580e = true;

    /* renamed from: g, reason: collision with root package name */
    public static final Handler f84582g = new Handler(Looper.getMainLooper());

    /* renamed from: h, reason: collision with root package name */
    public static final ao.c f84583h = new ao.c(4);

    public static void a() {
        List listI1;
        synchronized (f84578c) {
            listI1 = b70.g.I1(f84577b);
        }
        Iterator it = listI1.iterator();
        while (it.hasNext()) {
            ((p) it.next()).a();
        }
    }

    public static void b(Function0 function0) {
        if (f84581f) {
            f84582g.postDelayed(new b4.b(function0, 5), 350L);
        } else {
            f84582g.post(new b4.b(function0, 6));
        }
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStart(h6.a0 a0Var) {
        boolean z11 = f84579d;
        f84579d = true;
        if (z11) {
            return;
        }
        a();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStop(h6.a0 a0Var) {
        f84579d = false;
    }
}
