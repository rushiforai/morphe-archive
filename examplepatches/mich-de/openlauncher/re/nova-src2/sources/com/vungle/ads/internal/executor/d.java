package com.vungle.ads.internal.executor;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class d implements a {

    /* renamed from: a, reason: collision with root package name */
    public j f46820a;

    /* renamed from: b, reason: collision with root package name */
    public j f46821b;

    /* renamed from: c, reason: collision with root package name */
    public j f46822c;

    /* renamed from: d, reason: collision with root package name */
    public j f46823d;

    /* renamed from: e, reason: collision with root package name */
    public j f46824e;

    /* renamed from: f, reason: collision with root package name */
    public j f46825f;

    /* renamed from: g, reason: collision with root package name */
    public j f46826g;

    /* renamed from: h, reason: collision with root package name */
    public j f46827h;

    /* renamed from: i, reason: collision with root package name */
    public j f46828i;

    public d() {
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        this.f46822c = new j(iAvailableProcessors, iAvailableProcessors, 5L, timeUnit, new LinkedBlockingQueue(), new c("vng_jr"));
        this.f46820a = new j(1, 1, 5L, timeUnit, new LinkedBlockingQueue(), new c("vng_io"));
        this.f46828i = new j(1, 1, 10L, timeUnit, new LinkedBlockingQueue(), new c("vng_api"));
        this.f46823d = new j(1, 1, 10L, timeUnit, new LinkedBlockingQueue(), new c("vng_logger"));
        this.f46821b = new j(1, 1, 10L, timeUnit, new LinkedBlockingQueue(), new c("vng_background"));
        this.f46824e = new j(1, 1, 10L, timeUnit, new LinkedBlockingQueue(), new c("vng_ua"));
        this.f46825f = new j(4, 4, 1L, timeUnit, new PriorityBlockingQueue(), new c("vng_down"));
        this.f46826g = new j(2, 2, 1L, timeUnit, new PriorityBlockingQueue(), new c("vng_pre_down"));
        this.f46827h = new j(1, 1, 10L, timeUnit, new LinkedBlockingQueue(), new c("vng_ol"));
    }

    public final j a() {
        return this.f46828i;
    }

    public final j b() {
        return this.f46821b;
    }

    public final j c() {
        return this.f46820a;
    }

    public final j d() {
        return this.f46822c;
    }

    public final j e() {
        return this.f46823d;
    }

    public final j f() {
        return this.f46827h;
    }
}
