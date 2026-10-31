package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes.dex */
public final class s7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ zzdd f33051e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ String f33052f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f33053g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ i8 f33054h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s7(i8 i8Var, zzdd zzddVar, String str, String str2) {
        super(i8Var, true);
        this.f33051e = zzddVar;
        this.f33052f = str;
        this.f33053g = str2;
        Objects.requireNonNull(i8Var);
        this.f33054h = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        d7 d7VarL = this.f33054h.l();
        sg.w.h(d7VarL);
        d7VarL.setCurrentScreenByScionActivityInfo(this.f33051e, this.f33052f, this.f33053g, this.f32460a);
    }
}
