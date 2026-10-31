package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.data.repo.TravelTarget;
import java.util.List;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class a1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35595a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35596b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f35597c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f35598d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function0 f35599e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function1 f35600f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Function0 f35601g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f35602h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f35603i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f35604j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f35605k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f35606l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Object f35607m;
    public final /* synthetic */ Function n;

    public /* synthetic */ a1(List list, TravelCoverage travelCoverage, boolean z11, TravelTarget travelTarget, TravelTarget travelTarget2, Function0 function0, Function1 function1, Function0 function02, Function1 function12, Function1 function13, Function0 function03, int i5, int i11) {
        this.f35604j = list;
        this.f35605k = travelCoverage;
        this.f35596b = z11;
        this.f35606l = travelTarget;
        this.f35607m = travelTarget2;
        this.f35599e = function0;
        this.f35597c = function1;
        this.f35601g = function02;
        this.f35598d = function12;
        this.f35600f = function13;
        this.n = function03;
        this.f35602h = i5;
        this.f35603i = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35595a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return DashboardTravelKt.TravelActionPrompts$lambda$37((List) this.f35604j, (TravelCoverage) this.f35605k, this.f35596b, (TravelTarget) this.f35606l, (TravelTarget) this.f35607m, this.f35599e, this.f35597c, this.f35601g, this.f35598d, this.f35600f, (Function0) this.n, this.f35602h, this.f35603i, (p1.o) obj, iIntValue);
            default:
                ((Integer) obj2).intValue();
                int iL = p1.a0.l(this.f35602h | 1);
                int iL2 = p1.a0.l(this.f35603i);
                ys.s0.n((ys.t0) this.f35604j, this.f35596b, this.f35597c, this.f35598d, this.f35599e, this.f35600f, (Function1) this.f35605k, (Function1) this.f35606l, this.f35601g, (Function1) this.f35607m, (Function1) this.n, (p1.o) obj, iL, iL2);
                return Unit.f71706a;
        }
    }

    public /* synthetic */ a1(ys.t0 t0Var, boolean z11, Function1 function1, Function1 function12, Function0 function0, Function1 function13, Function1 function14, Function1 function15, Function0 function02, Function1 function16, Function1 function17, int i5, int i11) {
        this.f35604j = t0Var;
        this.f35596b = z11;
        this.f35597c = function1;
        this.f35598d = function12;
        this.f35599e = function0;
        this.f35600f = function13;
        this.f35605k = function14;
        this.f35606l = function15;
        this.f35601g = function02;
        this.f35607m = function16;
        this.n = function17;
        this.f35602h = i5;
        this.f35603i = i11;
    }
}
