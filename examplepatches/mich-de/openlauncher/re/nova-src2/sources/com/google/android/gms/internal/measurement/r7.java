package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import java.util.Objects;

/* loaded from: classes.dex */
public final class r7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f33030e = 2;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ i8 f33031f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f33032g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r7(i8 i8Var, Bundle bundle) {
        super(i8Var, true);
        this.f33032g = bundle;
        Objects.requireNonNull(i8Var);
        this.f33031f = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f33030e) {
            case 0:
                d7 d7VarL = this.f33031f.l();
                sg.w.h(d7VarL);
                d7VarL.setUserId((String) this.f33032g, this.f32460a);
                break;
            case 1:
                d7 d7VarL2 = this.f33031f.l();
                sg.w.h(d7VarL2);
                d7VarL2.setMeasurementEnabled(((Boolean) this.f33032g).booleanValue(), this.f32460a);
                break;
            case 2:
                d7 d7VarL3 = this.f33031f.l();
                sg.w.h(d7VarL3);
                d7VarL3.setConsentThirdParty((Bundle) this.f33032g, this.f32460a);
                break;
            case 3:
                d7 d7VarL4 = this.f33031f.l();
                sg.w.h(d7VarL4);
                d7VarL4.logHealthData(5, "Error with data collection. Data lost.", new ah.d((Exception) this.f33032g), new ah.d(null), new ah.d(null));
                break;
            default:
                d7 d7VarL5 = this.f33031f.l();
                sg.w.h(d7VarL5);
                d7VarL5.registerOnMeasurementEventListener((f8) this.f33032g);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r7(i8 i8Var, f8 f8Var) {
        super(i8Var, true);
        this.f33032g = f8Var;
        Objects.requireNonNull(i8Var);
        this.f33031f = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r7(i8 i8Var, Boolean bool) {
        super(i8Var, true);
        this.f33032g = bool;
        Objects.requireNonNull(i8Var);
        this.f33031f = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r7(i8 i8Var, Exception exc) {
        super(i8Var, false);
        this.f33032g = exc;
        this.f33031f = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r7(i8 i8Var, String str) {
        super(i8Var, true);
        this.f33032g = str;
        Objects.requireNonNull(i8Var);
        this.f33031f = i8Var;
    }
}
