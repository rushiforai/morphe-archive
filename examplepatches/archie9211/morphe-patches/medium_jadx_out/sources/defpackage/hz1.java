package defpackage;

import android.os.StrictMode;
import com.google.firebase.concurrent.ExecutorsRegistrar;
import java.util.Collections;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hz1 implements h8a {
    public final /* synthetic */ int a;

    public /* synthetic */ hz1(int i) {
        this.a = i;
    }

    @Override // defpackage.h8a
    public final Object get() {
        switch (this.a) {
            case 0:
                return Collections.EMPTY_SET;
            case 1:
                return ExecutorsRegistrar.a();
            case 2:
                wq6 wq6Var = ExecutorsRegistrar.a;
                return new i43(Executors.newFixedThreadPool(Math.max(2, Runtime.getRuntime().availableProcessors()), new hm2("Firebase Lite", 0, new StrictMode.ThreadPolicy.Builder().detectAll().penaltyLog().build())), (ScheduledExecutorService) ExecutorsRegistrar.d.get());
            case 3:
                wq6 wq6Var2 = ExecutorsRegistrar.a;
                return new i43(Executors.newCachedThreadPool(new hm2("Firebase Blocking", 11, null)), (ScheduledExecutorService) ExecutorsRegistrar.d.get());
            case 4:
                wq6 wq6Var3 = ExecutorsRegistrar.a;
                return Executors.newSingleThreadScheduledExecutor(new hm2("Firebase Scheduler", 0, null));
            case 5:
            default:
                return null;
        }
    }
}
