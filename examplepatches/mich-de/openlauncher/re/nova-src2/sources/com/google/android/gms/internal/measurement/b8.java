package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class b8 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f32404e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ i8 f32405f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b8(i8 i8Var, boolean z11) {
        super(i8Var, true);
        this.f32404e = z11;
        Objects.requireNonNull(i8Var);
        this.f32405f = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        d7 d7Var = this.f32405f.f32648g;
        sg.w.h(d7Var);
        d7Var.setDataCollectionEnabled(this.f32404e);
    }
}
