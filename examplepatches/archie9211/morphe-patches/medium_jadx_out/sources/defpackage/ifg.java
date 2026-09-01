package defpackage;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ifg extends ThreadPoolExecutor implements AutoCloseable {
    public final /* synthetic */ qjg a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ifg(qjg qjgVar) {
        super(1, 1, 1L, TimeUnit.MINUTES, new LinkedBlockingQueue());
        this.a = qjgVar;
        setThreadFactory(new igg());
        allowCoreThreadTimeOut(true);
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() {
        cm0.h(this);
    }

    @Override // java.util.concurrent.AbstractExecutorService
    public final RunnableFuture newTaskFor(Runnable runnable, Object obj) {
        return new wc7(this, runnable, obj);
    }
}
