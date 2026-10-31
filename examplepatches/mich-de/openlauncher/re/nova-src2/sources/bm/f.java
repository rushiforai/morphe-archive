package bm;

import android.os.StrictMode;
import com.google.firebase.concurrent.ExecutorsRegistrar;
import java.util.Collections;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes.dex */
public final /* synthetic */ class f implements nm.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18072a;

    @Override // nm.c
    public final Object get() {
        switch (this.f18072a) {
            case 0:
                return Collections.EMPTY_SET;
            case 1:
                return null;
            case 2:
                m mVar = ExecutorsRegistrar.f34689a;
                StrictMode.ThreadPolicy.Builder builderDetectNetwork = new StrictMode.ThreadPolicy.Builder().detectNetwork();
                builderDetectNetwork.detectResourceMismatches();
                builderDetectNetwork.detectUnbufferedIo();
                return new cm.e(Executors.newFixedThreadPool(4, new cm.a("Firebase Background", 10, builderDetectNetwork.penaltyLog().build())), (ScheduledExecutorService) ExecutorsRegistrar.f34692d.get());
            case 3:
                m mVar2 = ExecutorsRegistrar.f34689a;
                return new cm.e(Executors.newFixedThreadPool(Math.max(2, Runtime.getRuntime().availableProcessors()), new cm.a("Firebase Lite", 0, new StrictMode.ThreadPolicy.Builder().detectAll().penaltyLog().build())), (ScheduledExecutorService) ExecutorsRegistrar.f34692d.get());
            case 4:
                m mVar3 = ExecutorsRegistrar.f34689a;
                return new cm.e(Executors.newCachedThreadPool(new cm.a("Firebase Blocking", 11, null)), (ScheduledExecutorService) ExecutorsRegistrar.f34692d.get());
            default:
                m mVar4 = ExecutorsRegistrar.f34689a;
                return Executors.newSingleThreadScheduledExecutor(new cm.a("Firebase Scheduler", 0, null));
        }
    }
}
