package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import androidx.compose.ui.node.LayoutNode;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class lt extends com.bytedance.sdk.component.zb.ycx.dj {
    private ExecutorService ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<com.bytedance.sdk.component.zb.ycx.zb> f24215zb = new CopyOnWriteArrayList();
    private List<com.bytedance.sdk.component.zb.ycx.zb> sya = new CopyOnWriteArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private AtomicInteger f24214dj = new AtomicInteger(64);

    public lt() {
        if (this.ycx == null) {
            this.ycx = new ThreadPoolExecutor(0, LayoutNode.NotPlacedPlaceOrder, 20L, TimeUnit.SECONDS, new SynchronousQueue(), new ThreadFactory() { // from class: com.bytedance.sdk.component.zb.ycx.ycx.ycx.lt.1
                @Override // java.util.concurrent.ThreadFactory
                public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "systemHttp Dispatcher");
                    thread.setDaemon(false);
                    thread.setPriority(10);
                    return thread;
                }
            });
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public List<com.bytedance.sdk.component.zb.ycx.zb> dj() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public List<com.bytedance.sdk.component.zb.ycx.zb> sya() {
        return this.f24215zb;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public void ycx(int i5) {
        this.f24214dj.set(i5);
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public ExecutorService zb() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public int ycx() {
        return this.f24214dj.get();
    }
}
