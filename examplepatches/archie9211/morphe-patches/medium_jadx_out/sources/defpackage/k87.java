package defpackage;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k87 extends ScheduledThreadPoolExecutor implements AutoCloseable {
    public final f66 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k87(final f66 f66Var, final fm0 fm0Var) {
        super(1, new lv2("upload", 0), new RejectedExecutionHandler(fm0Var) { // from class: j87
            @Override // java.util.concurrent.RejectedExecutionHandler
            public final void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor) {
                if (runnable != null) {
                    d66 d66Var = d66.ERROR;
                    List listR = d46.R(e66.MAINTAINER, e66.TELEMETRY);
                    ir irVar = new ir(24, runnable);
                    Map mapSingletonMap = Collections.singletonMap("executor.context", "upload");
                    mapSingletonMap.getClass();
                    ((nig) this.a).A(d66Var, listR, irVar, null, false, mapSingletonMap);
                }
            }
        });
        f66Var.getClass();
        this.a = f66Var;
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    public final void afterExecute(Runnable runnable, Throwable th) {
        super.afterExecute(runnable, th);
        mo7.Q(runnable, th, this.a);
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() {
        cm0.f(this);
    }
}
