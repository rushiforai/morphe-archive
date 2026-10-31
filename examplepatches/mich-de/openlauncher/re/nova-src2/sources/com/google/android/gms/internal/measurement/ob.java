package com.google.android.gms.internal.measurement;

import android.content.Context;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class ob {

    /* renamed from: j, reason: collision with root package name */
    public static final Object f32917j = new Object();

    /* renamed from: k, reason: collision with root package name */
    public static final AtomicReference f32918k = new AtomicReference();

    /* renamed from: l, reason: collision with root package name */
    public static volatile ob f32919l = null;

    /* renamed from: m, reason: collision with root package name */
    public static final vk.u f32920m = vk.b0.q(sb.f33055b);

    /* renamed from: a, reason: collision with root package name */
    public final mg.l f32921a = new mg.l(17);

    /* renamed from: b, reason: collision with root package name */
    public final Context f32922b;

    /* renamed from: c, reason: collision with root package name */
    public final vk.u f32923c;

    /* renamed from: d, reason: collision with root package name */
    public final vk.u f32924d;

    /* renamed from: e, reason: collision with root package name */
    public final vk.u f32925e;

    /* renamed from: f, reason: collision with root package name */
    public final vk.u f32926f;

    /* renamed from: g, reason: collision with root package name */
    public final qe f32927g;

    /* renamed from: h, reason: collision with root package name */
    public final vk.u f32928h;

    /* renamed from: i, reason: collision with root package name */
    public final ee f32929i;

    public ob(Context context, vk.u uVar, vk.u uVar2, vk.u uVar3, vk.u uVar4, vk.u uVar5) {
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        uVar.getClass();
        uVar2.getClass();
        uVar3.getClass();
        uVar4.getClass();
        uVar5.getClass();
        vk.u uVarQ = vk.b0.q(uVar);
        vk.u uVarQ2 = vk.b0.q(uVar2);
        vk.u uVarQ3 = vk.b0.q(new tb(uVar3, 0));
        vk.u uVarQ4 = vk.b0.q(uVar4);
        vk.u uVarQ5 = vk.b0.q(uVar5);
        this.f32922b = applicationContext;
        this.f32923c = uVarQ;
        this.f32924d = uVarQ2;
        this.f32925e = uVarQ3;
        this.f32926f = uVarQ4;
        this.f32927g = new qe(applicationContext, uVarQ, uVarQ4, uVarQ2);
        this.f32928h = uVarQ5;
        this.f32929i = new ee(applicationContext, uVarQ, uVarQ3, uVarQ2);
    }

    public static void b() {
        synchronized (fb.f32532c) {
        }
        if (f32918k.get() == null && fb.f32533d == null) {
            fb.f32533d = new ub();
        }
    }

    public final cl.e1 a() {
        return (cl.e1) this.f32923c.get();
    }
}
