package com.google.android.gms.internal.measurement;

import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public final class q2 {

    /* renamed from: c, reason: collision with root package name */
    public static final q2 f32981c = new q2();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f32983b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final d2 f32982a = new d2(0);

    public final t2 a(Class cls) {
        t2 t2VarY;
        ConcurrentHashMap concurrentHashMap = this.f32983b;
        Object obj = concurrentHashMap.get(cls);
        if (obj != null) {
            return (t2) obj;
        }
        d2 d2Var = this.f32982a;
        d2Var.getClass();
        k1 k1Var = u2.f33101a;
        if (!o1.class.isAssignableFrom(cls)) {
            int i5 = p0.f32944a;
        }
        s2 s2VarZzc = ((d2) d2Var.f32451b).zzc(cls);
        if ((s2VarZzc.f33047d & 2) == 2) {
            int i11 = p0.f32944a;
            k1 k1Var2 = u2.f33101a;
            k1 k1Var3 = f1.f32522a;
            t2VarY = new m2(k1Var2, s2VarZzc.f33044a);
        } else {
            int i12 = p0.f32944a;
            int i13 = n2.f32841a;
            int i14 = b2.f32402a;
            k1 k1Var4 = u2.f33101a;
            k1 k1Var5 = s2VarZzc.a() + (-1) != 1 ? f1.f32522a : null;
            int i15 = g2.f32554a;
            t2VarY = l2.y(s2VarZzc, k1Var4, k1Var5);
        }
        t2 t2Var = (t2) concurrentHashMap.putIfAbsent(cls, t2VarY);
        return t2Var != null ? t2Var : t2VarY;
    }
}
