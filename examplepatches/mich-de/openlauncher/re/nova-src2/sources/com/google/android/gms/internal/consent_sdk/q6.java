package com.google.android.gms.internal.consent_sdk;

import java.nio.charset.Charset;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public final class q6 {

    /* renamed from: c, reason: collision with root package name */
    public static final q6 f32217c = new q6();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f32219b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final h6 f32218a = new h6(0);

    public final t6 a(Class cls) {
        t6 t6VarG;
        Charset charset = b6.f31997a;
        if (cls == null) {
            throw new NullPointerException("messageType");
        }
        ConcurrentHashMap concurrentHashMap = this.f32219b;
        t6 t6Var = (t6) concurrentHashMap.get(cls);
        if (t6Var != null) {
            return t6Var;
        }
        h6 h6Var = this.f32218a;
        h6Var.getClass();
        z6 z6Var = u6.f32258a;
        if (!x5.class.isAssignableFrom(cls)) {
            int i5 = k5.f32121a;
        }
        s6 s6VarZzb = ((h6) h6Var.f32089b).zzb(cls);
        if ((s6VarZzb.f32240d & 2) == 2) {
            int i11 = k5.f32121a;
            z6 z6Var2 = u6.f32258a;
            o4 o4Var = r5.f32223a;
            t6VarG = new o6(z6Var2, s6VarZzb.f32237a);
        } else {
            int i12 = k5.f32121a;
            int i13 = p6.f32213a;
            int i14 = f6.f32074a;
            z6 z6Var3 = u6.f32258a;
            o4 o4Var2 = s6VarZzb.a() + (-1) != 1 ? r5.f32223a : null;
            int i15 = k6.f32122a;
            t6VarG = n6.g(s6VarZzb, z6Var3, o4Var2);
        }
        t6 t6Var2 = (t6) concurrentHashMap.putIfAbsent(cls, t6VarG);
        return t6Var2 != null ? t6Var2 : t6VarG;
    }
}
