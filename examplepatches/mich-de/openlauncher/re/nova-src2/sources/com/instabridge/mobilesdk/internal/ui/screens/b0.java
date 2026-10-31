package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.Plan;
import com.instabridge.mobilesdk.internal.ui.CheckoutStatus;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class b0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35614a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35615b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f35616c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f35617d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function0 f35618e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f35619f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f35620g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f35621h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f35622i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f35623j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f35624k;

    public /* synthetic */ b0(b2.t tVar, qx.l lVar, String str, String str2, boolean z11, long j11, Function0 function0, qx.s0 s0Var, Long l9, int i5) {
        this.f35620g = tVar;
        this.f35621h = lVar;
        this.f35615b = str;
        this.f35622i = str2;
        this.f35616c = z11;
        this.f35617d = j11;
        this.f35618e = function0;
        this.f35623j = s0Var;
        this.f35624k = l9;
        this.f35619f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35614a) {
            case 0:
                return CheckoutScreenKt.PrimaryCta_1YH7lEI$lambda$58((CheckoutStatus) this.f35620g, this.f35616c, (Double) this.f35621h, this.f35615b, (Plan) this.f35622i, this.f35617d, this.f35618e, (Function0) this.f35623j, (Function0) this.f35624k, this.f35619f, (p1.o) obj, ((Integer) obj2).intValue());
            default:
                ((Integer) obj2).getClass();
                ex.i.i((b2.t) this.f35620g, (qx.l) this.f35621h, this.f35615b, (String) this.f35622i, this.f35616c, this.f35617d, this.f35618e, (qx.s0) this.f35623j, (Long) this.f35624k, (p1.o) obj, p1.a0.l(this.f35619f | 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ b0(CheckoutStatus checkoutStatus, boolean z11, Double d5, String str, Plan plan, long j11, Function0 function0, Function0 function02, Function0 function03, int i5) {
        this.f35620g = checkoutStatus;
        this.f35616c = z11;
        this.f35621h = d5;
        this.f35615b = str;
        this.f35622i = plan;
        this.f35617d = j11;
        this.f35618e = function0;
        this.f35623j = function02;
        this.f35624k = function03;
        this.f35619f = i5;
    }
}
