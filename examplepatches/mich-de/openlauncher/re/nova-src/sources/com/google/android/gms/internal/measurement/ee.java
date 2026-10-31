package com.google.android.gms.internal.measurement;

import android.content.Context;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public final class ee {

    /* renamed from: a, reason: collision with root package name */
    public final Context f32502a;

    /* renamed from: b, reason: collision with root package name */
    public final vk.u f32503b;

    /* renamed from: c, reason: collision with root package name */
    public final vk.u f32504c;

    /* renamed from: d, reason: collision with root package name */
    public final vk.u f32505d;

    /* renamed from: e, reason: collision with root package name */
    public volatile int f32506e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final CopyOnWriteArrayList f32507f = new CopyOnWriteArrayList();

    /* renamed from: g, reason: collision with root package name */
    public final Object f32508g = new Object();

    /* renamed from: h, reason: collision with root package name */
    public volatile cl.q0 f32509h = null;

    public ee(Context context, vk.u uVar, vk.u uVar2, vk.u uVar3) {
        this.f32502a = context;
        this.f32503b = uVar;
        this.f32504c = uVar2;
        this.f32505d = uVar3;
    }
}
