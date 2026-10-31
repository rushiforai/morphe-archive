package iq;

import cv.y;
import h6.f1;
import h6.g1;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class n extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final g f67985a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f67986b;

    /* renamed from: c, reason: collision with root package name */
    public final t1 f67987c;

    /* renamed from: d, reason: collision with root package name */
    public final t1 f67988d;

    /* renamed from: e, reason: collision with root package name */
    public final t1 f67989e;

    /* renamed from: f, reason: collision with root package name */
    public final t1 f67990f;

    public n(g gVar, CoroutineContext workContext) {
        Intrinsics.g(workContext, "workContext");
        this.f67985a = gVar;
        this.f67986b = workContext;
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f67987c = t1VarB;
        this.f67988d = t1VarB;
        t1 t1VarB2 = u1.b(0, 0, null, 7);
        this.f67989e = t1VarB2;
        this.f67990f = t1VarB2;
        m0.t(g1.f(this), workContext, null, new y(this, null, 24), 2);
    }
}
