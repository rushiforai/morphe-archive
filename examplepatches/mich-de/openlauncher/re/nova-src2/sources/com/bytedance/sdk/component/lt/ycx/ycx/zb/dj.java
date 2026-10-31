package com.bytedance.sdk.component.lt.ycx.ycx.zb;

import com.bytedance.sdk.component.lt.ycx.dj.ycx;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

/* loaded from: classes2.dex */
public abstract class dj<T extends com.bytedance.sdk.component.lt.ycx.dj.ycx> {

    /* renamed from: dj, reason: collision with root package name */
    private String f23906dj;
    private Queue<String> sya;
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Queue<T> f23907zb = new ConcurrentLinkedQueue();

    public dj(com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar, Queue<String> queue, String str) {
        this.ycx = ycxVar;
        this.sya = queue;
        this.f23906dj = str;
    }

    public void ycx(T t6) {
        Queue<T> queue = this.f23907zb;
        if (queue == null || t6 == null) {
            return;
        }
        queue.offer(t6);
    }

    public synchronized boolean zb(int i5, int i11) {
        int size = this.f23907zb.size();
        int iYcx = this.ycx.ycx();
        return (i5 == 2 || i5 == 1) ? com.bytedance.sdk.component.lt.ycx.sya.ycx.sya() ? size > 0 : size >= iYcx : size >= iYcx;
    }

    public synchronized List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(int i5, int i11) {
        if (!zb(i5, i11)) {
            return null;
        }
        ArrayList arrayList = new ArrayList(this.ycx.ycx());
        do {
            T tPoll = this.f23907zb.poll();
            if (tPoll == null) {
                break;
            }
            arrayList.add(tPoll);
        } while (arrayList.size() != this.ycx.zb());
        return arrayList;
    }

    public synchronized void ycx(int i5, List<T> list) {
        if (i5 != -1 && i5 != 200 && i5 != 509) {
            this.f23907zb.addAll(list);
        } else {
            this.f23907zb.size();
        }
    }
}
