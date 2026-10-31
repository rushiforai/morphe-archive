package com.bytedance.sdk.openadsdk.oty.zb;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.oty.zb.lud;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public abstract class zb {

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicLong f26961dj;
    private final Integer fby;

    /* renamed from: jw, reason: collision with root package name */
    private volatile boolean f26962jw = false;

    /* renamed from: lt, reason: collision with root package name */
    private final lud.ycx f26963lt;
    private final AtomicBoolean lud;
    protected final AtomicBoolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private final int f26964ul;
    protected WeakReference<View> ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected tn f26965zb;

    public zb(Integer num, View view, tn tnVar, int i5, lud.ycx ycxVar) {
        this.fby = num;
        this.f26964ul = i5;
        this.f26965zb = tnVar;
        this.f26963lt = ycxVar;
        ycx(view);
        this.sya = new AtomicBoolean(false);
        this.f26961dj = new AtomicLong(-1L);
        this.lud = new AtomicBoolean(false);
    }

    public static zb ycx(boolean z11, Integer num, View view, tn tnVar, lud.ycx ycxVar) {
        return z11 ? new fby(num, view, tnVar, ycxVar) : new sya(num, view, tnVar, ycxVar);
    }

    public void dj() {
        if (this.lud.compareAndSet(false, true)) {
            dj.ycx(this.f26965zb, lud(), this.f26963lt);
        }
    }

    public Integer ea() {
        return this.fby;
    }

    public void fby() {
        this.f26961dj.set(-1L);
    }

    public void jc() {
        this.f26962jw = true;
        ul.zb(this);
    }

    public boolean jw() {
        return this.lud.get();
    }

    public abstract int lt();

    public ycx lud() {
        WeakReference<View> weakReference = this.ycx;
        if (weakReference == null) {
            return new ycx(-1, -1, -1.0f);
        }
        View view = weakReference.get();
        return view == null ? new ycx(0, 0, 0.0f) : new ycx(view.getWidth(), view.getHeight(), view.getAlpha());
    }

    public boolean ok() {
        return this.sya.get();
    }

    public void ry() {
        this.sya.set(false);
        fby();
    }

    public abstract boolean sya();

    public void ul() {
        if (jw()) {
            return;
        }
        if (!this.sya.get()) {
            fby();
        } else if (!this.f26961dj.compareAndSet(-1L, System.currentTimeMillis()) && System.currentTimeMillis() - this.f26961dj.get() >= this.f26964ul) {
            dj();
        }
    }

    public int zb() {
        if (jw()) {
            return 1;
        }
        WeakReference<View> weakReference = this.ycx;
        View view = weakReference != null ? weakReference.get() : null;
        if (view == null || this.f26962jw) {
            return 3;
        }
        if (ea().equals(view.getTag(33554433))) {
            return (ea().equals(view.getTag(33554433)) && sya()) ? 1 : 2;
        }
        jc();
        lud.zb(ea());
        return 3;
    }

    public abstract void zb(int i5);

    public void ycx() {
        if (this.sya.compareAndSet(false, true)) {
            ul.ycx(this);
        }
    }

    public void ycx(int i5) {
        if (i5 == 4) {
            ycx();
            return;
        }
        if (i5 == 8) {
            ry();
        } else if (i5 == 9) {
            dj();
        } else {
            zb(i5);
        }
    }

    public void ycx(View view) {
        if (view != null) {
            view.setTag(33554433, ea());
        }
        this.ycx = new WeakReference<>(view);
    }
}
