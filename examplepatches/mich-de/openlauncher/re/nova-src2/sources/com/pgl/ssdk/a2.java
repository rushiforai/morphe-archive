package com.pgl.ssdk;

import com.pgl.ssdk.a1;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes.dex */
public class a2<T extends a1> {

    /* renamed from: a, reason: collision with root package name */
    private int f42242a;

    /* renamed from: b, reason: collision with root package name */
    private BlockingQueue<T> f42243b = new LinkedBlockingQueue();

    private a2(int i5) {
        this.f42242a = i5;
    }

    public T a() {
        return this.f42243b.poll();
    }

    public static a2 a(int i5) {
        return new a2(i5);
    }
}
