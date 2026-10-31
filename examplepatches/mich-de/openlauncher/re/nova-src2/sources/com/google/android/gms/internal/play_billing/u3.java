package com.google.android.gms.internal.play_billing;

import java.nio.charset.Charset;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public final class u3 {

    /* renamed from: c, reason: collision with root package name */
    public static final u3 f33553c = new u3();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f33555b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final k3 f33554a = new k3();

    public final x3 a(Class cls) {
        x3 x3VarT;
        Charset charset = e3.f33385a;
        if (cls == null) {
            throw new NullPointerException("messageType");
        }
        ConcurrentHashMap concurrentHashMap = this.f33555b;
        x3 x3Var = (x3) concurrentHashMap.get(cls);
        if (x3Var != null) {
            return x3Var;
        }
        k3 k3Var = this.f33554a;
        k3Var.getClass();
        u2 u2Var = y3.f33663a;
        if (!x2.class.isAssignableFrom(cls)) {
            int i5 = i2.f33421a;
        }
        w3 w3VarZzb = ((k3) k3Var.f33440a).zzb(cls);
        if ((w3VarZzb.f33572d & 2) == 2) {
            int i11 = i2.f33421a;
            u2 u2Var2 = y3.f33663a;
            u2 u2Var3 = q2.f33496a;
            x3VarT = new s3(u2Var2, w3VarZzb.f33569a);
        } else {
            int i12 = i2.f33421a;
            int i13 = t3.f33534a;
            int i14 = h3.f33415a;
            u2 u2Var4 = y3.f33663a;
            u2 u2Var5 = w3VarZzb.a() + (-1) != 1 ? q2.f33496a : null;
            int i15 = n3.f33463a;
            x3VarT = r3.t(w3VarZzb, u2Var4, u2Var5);
        }
        x3 x3Var2 = (x3) concurrentHashMap.putIfAbsent(cls, x3VarT);
        return x3Var2 != null ? x3Var2 : x3VarT;
    }
}
