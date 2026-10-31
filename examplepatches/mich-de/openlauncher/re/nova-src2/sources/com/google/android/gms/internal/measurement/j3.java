package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public abstract class j3 {

    /* renamed from: a, reason: collision with root package name */
    public static final gd f32676a;

    /* renamed from: b, reason: collision with root package name */
    public static volatile String f32677b;

    /* renamed from: c, reason: collision with root package name */
    public static final d2 f32678c;

    static {
        i3 i3Var = i3.f32630b;
        int i5 = xk.d1.f95891c;
        kd kdVar = new kd(i3Var, true, xk.z2.f96074j);
        td tdVar = new td();
        tdVar.f33084b = kdVar;
        f32678c = new d2(tdVar, 10);
        f32676a = new gd("__phenotype_server_token", tdVar, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f32677b = null;
    }

    public static String a() {
        return (String) f32676a.get();
    }
}
