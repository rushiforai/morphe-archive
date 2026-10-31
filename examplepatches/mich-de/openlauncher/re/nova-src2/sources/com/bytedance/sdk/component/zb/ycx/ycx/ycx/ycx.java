package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.component.zb.ycx.dj {
    public static volatile jc ycx;

    /* renamed from: dj, reason: collision with root package name */
    private ExecutorService f24218dj;

    /* renamed from: zb, reason: collision with root package name */
    private List<com.bytedance.sdk.component.zb.ycx.zb> f24219zb = new CopyOnWriteArrayList();
    private List<com.bytedance.sdk.component.zb.ycx.zb> sya = new CopyOnWriteArrayList();

    public ycx(ExecutorService executorService) {
        this.f24218dj = executorService;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public List<com.bytedance.sdk.component.zb.ycx.zb> dj() {
        return this.sya;
    }

    public boolean lud() {
        return (ycx == null || ycx.ycx() == null) ? false : true;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public List<com.bytedance.sdk.component.zb.ycx.zb> sya() {
        return this.f24219zb;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public int ycx() {
        return 0;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public ExecutorService zb() {
        ExecutorService executorServiceYcx = ycx != null ? ycx.ycx() : null;
        return executorServiceYcx != null ? executorServiceYcx : this.f24218dj;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.dj
    public void ycx(int i5) {
    }

    public static void ycx(jc jcVar) {
        ycx = jcVar;
    }
}
