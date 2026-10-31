package com.bytedance.sdk.component.lt.ycx.lud;

import com.amplitude.core.events.Identify;
import java.util.UUID;

/* loaded from: classes2.dex */
public abstract class lud implements Comparable<lud>, Runnable {
    private String sya;
    private int ycx = 5;

    /* renamed from: zb, reason: collision with root package name */
    private String f23848zb = UUID.randomUUID().toString() + Identify.UNSET_VALUE + String.valueOf(System.nanoTime());

    public lud(String str) {
        this.sya = str;
    }

    public void ycx(int i5) {
        this.ycx = i5;
    }

    public int ycx() {
        return this.ycx;
    }

    @Override // java.lang.Comparable
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public int compareTo(lud ludVar) {
        if (ycx() < ludVar.ycx()) {
            return 1;
        }
        return ycx() >= ludVar.ycx() ? -1 : 0;
    }
}
