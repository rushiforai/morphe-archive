package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import android.content.Context;
import android.graphics.Rect;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: j, reason: collision with root package name */
    public static final int f39185j = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f39186a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Rect f39187b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Rect f39188c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Rect f39189d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Rect f39190e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Rect f39191f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Rect f39192g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final Rect f39193h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final Rect f39194i;

    public s(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        this.f39186a = applicationContext;
        this.f39187b = new Rect();
        this.f39188c = new Rect();
        this.f39189d = new Rect();
        this.f39190e = new Rect();
        this.f39191f = new Rect();
        this.f39192g = new Rect();
        this.f39193h = new Rect();
        this.f39194i = new Rect();
    }

    public final void a(Rect rect, Rect rect2) {
        a aVar = a.f39055a;
        rect2.set(aVar.f(rect.left, this.f39186a), aVar.f(rect.top, this.f39186a), aVar.f(rect.right, this.f39186a), aVar.f(rect.bottom, this.f39186a));
    }

    public final void b(int i5, int i11, int i12, int i13) {
        this.f39193h.set(i5, i11, i12 + i5, i13 + i11);
        a(this.f39193h, this.f39194i);
    }

    public final void c(int i5, int i11, int i12, int i13) {
        this.f39189d.set(i5, i11, i12 + i5, i13 + i11);
        a(this.f39189d, this.f39190e);
    }

    @NotNull
    public final Rect d() {
        return this.f39194i;
    }

    @NotNull
    public final Rect e() {
        return this.f39189d;
    }

    @NotNull
    public final Rect f() {
        return this.f39190e;
    }

    @NotNull
    public final Rect g() {
        return this.f39188c;
    }

    @NotNull
    public final Rect b() {
        return this.f39192g;
    }

    @NotNull
    public final Rect c() {
        return this.f39193h;
    }

    public final void a(int i5, int i11) {
        this.f39187b.set(0, 0, i5, i11);
        a(this.f39187b, this.f39188c);
    }

    public final void a(int i5, int i11, int i12, int i13) {
        this.f39191f.set(i5, i11, i12 + i5, i13 + i11);
        a(this.f39191f, this.f39192g);
    }

    @NotNull
    public final Rect a() {
        return this.f39191f;
    }
}
