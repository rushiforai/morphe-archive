package com.bytedance.sdk.component.fby.zb;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

/* loaded from: classes2.dex */
public class zb<V> extends FutureTask<V> implements Comparable<zb<V>> {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23765zb;

    public zb(Callable<V> callable, int i5, int i11) {
        super(callable);
        this.ycx = i5 == -1 ? 5 : i5;
        this.f23765zb = i11;
    }

    @Override // java.lang.Comparable
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public int compareTo(zb zbVar) {
        if (ycx() < zbVar.ycx()) {
            return 1;
        }
        return ycx() > zbVar.ycx() ? -1 : 0;
    }

    public int ycx() {
        return this.ycx;
    }
}
