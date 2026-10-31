package com.google.android.gms.internal.measurement;

import android.app.Activity;
import android.os.Bundle;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class a8 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f32373e = 3;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f32374f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f32375g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f32376h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a8(h8 h8Var, Activity activity, a7 a7Var) {
        super(h8Var.f32607a, true);
        this.f32376h = activity;
        this.f32374f = a7Var;
        this.f32375g = h8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        Bundle bundle;
        switch (this.f32373e) {
            case 0:
                d7 d7Var = ((i8) this.f32375g).f32648g;
                sg.w.h(d7Var);
                d7Var.performAction((Bundle) this.f32376h, (a7) this.f32374f, this.f32460a);
                break;
            case 1:
                d7 d7Var2 = ((i8) this.f32375g).f32648g;
                sg.w.h(d7Var2);
                d7Var2.getMaxUserProperties((String) this.f32376h, (a7) this.f32374f);
                break;
            case 2:
                Bundle bundle2 = (Bundle) this.f32376h;
                if (bundle2 != null) {
                    bundle = new Bundle();
                    if (bundle2.containsKey("com.google.app_measurement.screen_service")) {
                        Object obj = bundle2.get("com.google.app_measurement.screen_service");
                        if (obj instanceof Bundle) {
                            bundle.putBundle("com.google.app_measurement.screen_service", (Bundle) obj);
                        }
                    }
                } else {
                    bundle = null;
                }
                d7 d7Var3 = ((h8) this.f32375g).f32607a.f32648g;
                sg.w.h(d7Var3);
                Activity activity = (Activity) this.f32374f;
                d7Var3.onActivityCreatedByScionActivityInfo(zzdd.b(activity), bundle, this.f32461b);
                break;
            default:
                d7 d7Var4 = ((h8) this.f32375g).f32607a.f32648g;
                sg.w.h(d7Var4);
                d7Var4.onActivitySaveInstanceStateByScionActivityInfo(zzdd.b((Activity) this.f32376h), (a7) this.f32374f, this.f32461b);
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public void b() {
        switch (this.f32373e) {
            case 0:
                ((a7) this.f32374f).G(null);
                break;
            case 1:
                ((a7) this.f32374f).G(null);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a8(h8 h8Var, Bundle bundle, Activity activity) {
        super(h8Var.f32607a, true);
        this.f32376h = bundle;
        this.f32374f = activity;
        this.f32375g = h8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a8(i8 i8Var, Bundle bundle, a7 a7Var) {
        super(i8Var, true);
        this.f32376h = bundle;
        this.f32374f = a7Var;
        Objects.requireNonNull(i8Var);
        this.f32375g = i8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a8(i8 i8Var, String str, a7 a7Var) {
        super(i8Var, true);
        this.f32376h = str;
        this.f32374f = a7Var;
        Objects.requireNonNull(i8Var);
        this.f32375g = i8Var;
    }
}
