package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class p7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f32955e = 1;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ i8 f32956f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f32957g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p7(i8 i8Var, ab.z zVar) {
        super(i8Var, true);
        this.f32957g = zVar;
        this.f32956f = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f32955e) {
            case 0:
                d7 d7Var = this.f32956f.f32648g;
                sg.w.h(d7Var);
                d7Var.setConditionalUserProperty((Bundle) this.f32957g, this.f32460a);
                break;
            case 1:
                d7 d7Var2 = this.f32956f.f32648g;
                sg.w.h(d7Var2);
                d7Var2.retrieveAndUploadBatches(new w7(this, (ab.z) this.f32957g));
                break;
            case 2:
                d7 d7Var3 = this.f32956f.f32648g;
                sg.w.h(d7Var3);
                d7Var3.getGmpAppId((a7) this.f32957g);
                break;
            case 3:
                d7 d7Var4 = this.f32956f.f32648g;
                sg.w.h(d7Var4);
                d7Var4.setEventInterceptor((e8) this.f32957g);
                break;
            default:
                d7 d7Var5 = this.f32956f.f32648g;
                sg.w.h(d7Var5);
                d7Var5.unregisterOnMeasurementEventListener((f8) this.f32957g);
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public void b() {
        switch (this.f32955e) {
            case 2:
                ((a7) this.f32957g).G(null);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p7(i8 i8Var, Bundle bundle) {
        super(i8Var, true);
        this.f32957g = bundle;
        Objects.requireNonNull(i8Var);
        this.f32956f = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p7(i8 i8Var, a7 a7Var) {
        super(i8Var, true);
        this.f32957g = a7Var;
        Objects.requireNonNull(i8Var);
        this.f32956f = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p7(i8 i8Var, e8 e8Var) {
        super(i8Var, true);
        this.f32957g = e8Var;
        Objects.requireNonNull(i8Var);
        this.f32956f = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p7(i8 i8Var, f8 f8Var) {
        super(i8Var, true);
        this.f32957g = f8Var;
        Objects.requireNonNull(i8Var);
        this.f32956f = i8Var;
    }
}
