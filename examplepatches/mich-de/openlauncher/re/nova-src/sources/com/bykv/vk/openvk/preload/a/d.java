package com.bykv.vk.openvk.preload.a;

import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public abstract class d<IN, OUT> {

    /* renamed from: d, reason: collision with root package name */
    private static AtomicLong f21940d = new AtomicLong();

    /* renamed from: a, reason: collision with root package name */
    d f21941a;

    /* renamed from: b, reason: collision with root package name */
    IN f21942b;

    /* renamed from: c, reason: collision with root package name */
    OUT f21943c;

    /* renamed from: e, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.a.b.a f21944e;

    /* renamed from: f, reason: collision with root package name */
    private b f21945f;

    /* renamed from: g, reason: collision with root package name */
    private long f21946g;

    public abstract Object a(b<OUT> bVar, IN in2) throws Throwable;

    public void a(Object... objArr) {
    }

    public final long b() {
        return this.f21946g;
    }

    public final void c() {
        com.bykv.vk.openvk.preload.a.b.a aVar = this.f21944e;
        if (aVar == null) {
            return;
        }
        aVar.a(this.f21945f, this);
    }

    public final void d() {
        com.bykv.vk.openvk.preload.a.b.a aVar = this.f21944e;
        if (aVar == null) {
            return;
        }
        aVar.c(this.f21945f, this);
    }

    public final void e() {
        com.bykv.vk.openvk.preload.a.b.a aVar = this.f21944e;
        if (aVar == null) {
            return;
        }
        aVar.b(this.f21945f, this);
    }

    public final OUT f() {
        return this.f21943c;
    }

    public final void a(b bVar, d dVar, IN in2, com.bykv.vk.openvk.preload.a.b.a aVar, Object[] objArr) {
        this.f21945f = new m(bVar);
        this.f21941a = dVar;
        this.f21942b = in2;
        this.f21944e = aVar;
        if (dVar != null) {
            this.f21946g = dVar.f21946g;
        } else {
            long andIncrement = f21940d.getAndIncrement();
            this.f21946g = andIncrement;
            if (andIncrement < 0) {
                throw new RuntimeException("Pipeline ID use up!");
            }
        }
        a(objArr);
    }

    public final void b(Throwable th2) {
        com.bykv.vk.openvk.preload.a.b.a aVar = this.f21944e;
        if (aVar == null) {
            return;
        }
        aVar.a(this.f21945f, this, th2);
    }

    public final void c(Throwable th2) {
        com.bykv.vk.openvk.preload.a.b.a aVar = this.f21944e;
        if (aVar == null) {
            return;
        }
        aVar.b(this.f21945f, this, th2);
    }

    public final void d(Throwable th2) {
        com.bykv.vk.openvk.preload.a.b.a aVar = this.f21944e;
        if (aVar == null) {
            return;
        }
        aVar.c(this.f21945f, this, th2);
    }
}
