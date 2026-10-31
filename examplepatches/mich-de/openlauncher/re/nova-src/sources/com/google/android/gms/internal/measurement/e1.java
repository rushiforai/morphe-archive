package com.google.android.gms.internal.measurement;

import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class e1 {

    /* renamed from: a, reason: collision with root package name */
    public static volatile e1 f32488a;

    /* renamed from: b, reason: collision with root package name */
    public static final e1 f32489b;

    static {
        e1 e1Var = new e1();
        Map map = Collections.EMPTY_MAP;
        f32489b = e1Var;
    }

    public static e1 a() {
        e1 e1Var = f32488a;
        if (e1Var != null) {
            return e1Var;
        }
        synchronized (e1.class) {
            try {
                e1 e1Var2 = f32488a;
                if (e1Var2 != null) {
                    return e1Var2;
                }
                int i5 = p0.f32944a;
                e1 e1VarC = j1.c();
                f32488a = e1VarC;
                return e1VarC;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
