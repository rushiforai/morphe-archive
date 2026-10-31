package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.Plan;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class f implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35669a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35670b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f35671c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f35672d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35673e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35674f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f35675g;

    public /* synthetic */ f(Plan plan, boolean z11, boolean z12, long j11, Function0 function0, int i5) {
        this.f35674f = plan;
        this.f35670b = z11;
        this.f35672d = z12;
        this.f35671c = j11;
        this.f35675g = function0;
        this.f35673e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35669a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return BoosterPlansScreenKt.BoosterRow_ww6aTOc$lambda$29((Plan) this.f35674f, this.f35670b, this.f35672d, this.f35671c, (Function0) this.f35675g, this.f35673e, (p1.o) obj, iIntValue);
            default:
                ((Integer) obj2).getClass();
                kw.n0.c((ResolvableString) this.f35674f, this.f35670b, (String) this.f35675g, this.f35671c, this.f35672d, (p1.o) obj, p1.a0.l(this.f35673e | 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ f(ResolvableString resolvableString, boolean z11, String str, long j11, boolean z12, int i5) {
        this.f35674f = resolvableString;
        this.f35670b = z11;
        this.f35675g = str;
        this.f35671c = j11;
        this.f35672d = z12;
        this.f35673e = i5;
    }
}
