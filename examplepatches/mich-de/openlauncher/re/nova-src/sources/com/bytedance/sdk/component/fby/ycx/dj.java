package com.bytedance.sdk.component.fby.ycx;

import com.bytedance.sdk.component.fby.ycx.sya;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes2.dex */
public class dj<T extends sya> {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private BlockingQueue<T> f23740zb = new LinkedBlockingQueue();

    private dj(int i5) {
        this.ycx = i5;
    }

    public static dj ycx(int i5) {
        return new dj(i5);
    }

    public T ycx() {
        return this.f23740zb.poll();
    }

    public boolean ycx(T t6) {
        if (t6 == null) {
            return false;
        }
        t6.ycx();
        if (this.f23740zb.size() >= this.ycx) {
            return false;
        }
        return this.f23740zb.offer(t6);
    }
}
