package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.data.repo.TravelPlan;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class l1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35770a = 4;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35771b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f35772c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f35773d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35774e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35775f;

    public /* synthetic */ l1(int i5, boolean z11, boolean z12, Function1 function1, Function2 function2, int i11) {
        this.f35774e = i5;
        this.f35771b = z11;
        this.f35772c = z12;
        this.f35773d = function1;
        this.f35775f = function2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35770a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                int iIntValue2 = ((Integer) obj2).intValue();
                break;
            case 2:
                ((Integer) obj2).getClass();
                f1.s0.a(this.f35771b, (b2.t) this.f35773d, this.f35772c, (f1.i1) this.f35775f, (p1.o) obj, p1.a0.l(this.f35774e | 1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                kw.n0.a((kw.i0) this.f35773d, this.f35771b, (b2.t) this.f35775f, this.f35772c, (p1.o) obj, p1.a0.l(this.f35774e | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(196609);
                w00.g0.a(this.f35774e, this.f35771b, this.f35772c, (Function1) this.f35773d, (Function2) this.f35775f, (p1.o) obj, iL);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ l1(TravelPlan travelPlan, boolean z11, boolean z12, Function0 function0, int i5) {
        this.f35775f = travelPlan;
        this.f35771b = z11;
        this.f35772c = z12;
        this.f35773d = function0;
        this.f35774e = i5;
    }

    public /* synthetic */ l1(kw.i0 i0Var, boolean z11, b2.t tVar, boolean z12, int i5) {
        this.f35773d = i0Var;
        this.f35771b = z11;
        this.f35775f = tVar;
        this.f35772c = z12;
        this.f35774e = i5;
    }

    public /* synthetic */ l1(boolean z11, b2.t tVar, boolean z12, f1.i1 i1Var, int i5) {
        this.f35771b = z11;
        this.f35773d = tVar;
        this.f35772c = z12;
        this.f35775f = i1Var;
        this.f35774e = i5;
    }

    public /* synthetic */ l1(boolean z11, boolean z12, Function0 function0, Function0 function02, int i5) {
        this.f35771b = z11;
        this.f35772c = z12;
        this.f35773d = function0;
        this.f35775f = function02;
        this.f35774e = i5;
    }
}
