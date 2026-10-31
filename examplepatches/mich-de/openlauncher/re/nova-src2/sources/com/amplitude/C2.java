package com.amplitude;

import android.view.ViewTreeObserver;
import android.view.Window;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class C2 {

    /* renamed from: a, reason: collision with root package name */
    public final ViewTreeObserver.OnPreDrawListener f20196a;

    /* renamed from: b, reason: collision with root package name */
    public final ViewTreeObserver.OnGlobalLayoutListener f20197b;

    /* renamed from: c, reason: collision with root package name */
    public final Y2 f20198c;

    /* renamed from: d, reason: collision with root package name */
    public final Window f20199d;

    public C2(ViewTreeObserver.OnPreDrawListener drawListener, ViewTreeObserver.OnGlobalLayoutListener layoutListener, Y2 touchListener, Window window) {
        Intrinsics.g(drawListener, "drawListener");
        Intrinsics.g(layoutListener, "layoutListener");
        Intrinsics.g(touchListener, "touchListener");
        Intrinsics.g(window, "window");
        this.f20196a = drawListener;
        this.f20197b = layoutListener;
        this.f20198c = touchListener;
        this.f20199d = window;
    }
}
