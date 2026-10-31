package com.amplitude;

import androidx.compose.ui.graphics.Canvas;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.amplitude.b, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0385b implements k2.d {

    /* renamed from: a, reason: collision with root package name */
    public final C0421d f20494a = new C0421d(this);

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C0391c f20495b;

    public C0385b(C0391c c0391c) {
        this.f20495b = c0391c;
    }

    @Override // k2.d
    public final Canvas getCanvas() {
        return this.f20495b.f20501a.f20461c;
    }

    @Override // k2.d
    public final y3.c getDensity() {
        return this.f20495b.f20501a.f20459a;
    }

    @Override // k2.d
    @Nullable
    public /* bridge */ /* synthetic */ l2.b getGraphicsLayer() {
        return null;
    }

    @Override // k2.d
    public final y3.n getLayoutDirection() {
        return this.f20495b.f20501a.f20460b;
    }

    @Override // k2.d
    /* renamed from: getSize-NH-jbRc, reason: not valid java name */
    public final long mo111getSizeNHjbRc() {
        return this.f20495b.f20501a.f20462d;
    }

    @Override // k2.d
    public final k2.h getTransform() {
        return this.f20494a;
    }

    @Override // k2.d
    public final void setCanvas(Canvas value) {
        Intrinsics.g(value, "value");
        C0360a c0360a = this.f20495b.f20501a;
        c0360a.getClass();
        c0360a.f20461c = value;
    }

    @Override // k2.d
    public final void setDensity(y3.c value) {
        Intrinsics.g(value, "value");
        C0360a c0360a = this.f20495b.f20501a;
        c0360a.getClass();
        c0360a.f20459a = value;
    }

    @Override // k2.d
    public /* bridge */ /* synthetic */ void setGraphicsLayer(@Nullable l2.b bVar) {
    }

    @Override // k2.d
    public final void setLayoutDirection(y3.n value) {
        Intrinsics.g(value, "value");
        C0360a c0360a = this.f20495b.f20501a;
        c0360a.getClass();
        c0360a.f20460b = value;
    }

    @Override // k2.d
    /* renamed from: setSize-uvyYCjk, reason: not valid java name */
    public final void mo112setSizeuvyYCjk(long j11) {
        this.f20495b.f20501a.f20462d = j11;
    }
}
