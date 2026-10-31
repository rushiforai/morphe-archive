package com.google.android.gms.internal.measurement;

import android.util.Log;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public abstract class c3 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f32423a;

    public abstract Object a();

    public abstract void b(Object obj, long j11, byte b11);

    public Object c(rh rhVar, h hVar) {
        ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) this.f32423a;
        Object obj = concurrentHashMap.get(rhVar);
        if (obj != null) {
            return obj;
        }
        Object objA = a();
        Object objPutIfAbsent = concurrentHashMap.putIfAbsent(rhVar, objA);
        if (objPutIfAbsent != null) {
            return objPutIfAbsent;
        }
        int iA = hVar.a();
        for (int i5 = 0; i5 < iA; i5++) {
            if (mh.f32830f.equals(hVar.h(i5))) {
                hVar.i(i5);
            }
        }
        return objA;
    }

    public abstract boolean d(long j11, Object obj);

    public abstract boolean e(Level level);

    public abstract void f(jh jhVar);

    public abstract void g(Object obj, long j11, boolean z11);

    public abstract float h(long j11, Object obj);

    public void i(RuntimeException runtimeException, jh jhVar) {
        Log.e("AbstractAndroidBackend", "Internal logging error", runtimeException);
    }

    public abstract void j(Object obj, long j11, float f11);

    public abstract double k(long j11, Object obj);

    public abstract void l(Object obj, long j11, double d5);

    public c3() {
        this.f32423a = new ConcurrentHashMap();
    }
}
