package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes.dex */
public final class x7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f33221e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ a7 f33222f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ i8 f33223g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x7(i8 i8Var, a7 a7Var, int i5) {
        super(i8Var, true);
        this.f33221e = i5;
        switch (i5) {
            case 1:
                this.f33222f = a7Var;
                Objects.requireNonNull(i8Var);
                this.f33223g = i8Var;
                super(i8Var, true);
                break;
            case 2:
                this.f33222f = a7Var;
                Objects.requireNonNull(i8Var);
                this.f33223g = i8Var;
                super(i8Var, true);
                break;
            case 3:
                this.f33222f = a7Var;
                Objects.requireNonNull(i8Var);
                this.f33223g = i8Var;
                super(i8Var, true);
                break;
            default:
                this.f33222f = a7Var;
                Objects.requireNonNull(i8Var);
                this.f33223g = i8Var;
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f33221e) {
            case 0:
                d7 d7VarL = this.f33223g.l();
                sg.w.h(d7VarL);
                d7VarL.getCachedAppInstanceId(this.f33222f);
                break;
            case 1:
                d7 d7VarL2 = this.f33223g.l();
                sg.w.h(d7VarL2);
                d7VarL2.generateEventId(this.f33222f);
                break;
            case 2:
                d7 d7VarL3 = this.f33223g.l();
                sg.w.h(d7VarL3);
                d7VarL3.getCurrentScreenName(this.f33222f);
                break;
            default:
                d7 d7VarL4 = this.f33223g.l();
                sg.w.h(d7VarL4);
                d7VarL4.getCurrentScreenClass(this.f33222f);
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void b() {
        switch (this.f33221e) {
            case 0:
                this.f33222f.G(null);
                break;
            case 1:
                this.f33222f.G(null);
                break;
            case 2:
                this.f33222f.G(null);
                break;
            default:
                this.f33222f.G(null);
                break;
        }
    }
}
