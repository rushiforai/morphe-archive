package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class m1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35787a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35788b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f35789c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function f35790d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35791e;

    public /* synthetic */ m1(boolean z11, boolean z12, Function function, int i5, int i11) {
        this.f35787a = i11;
        this.f35788b = z11;
        this.f35789c = z12;
        this.f35790d = function;
        this.f35791e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35787a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                ((Integer) obj2).intValue();
                int iL = p1.a0.l(this.f35791e | 1);
                ys.p.d(this.f35788b, this.f35789c, (Function0) this.f35790d, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).intValue();
                int iL2 = p1.a0.l(this.f35791e | 1);
                a.a.m(this.f35788b, this.f35789c, (Function1) this.f35790d, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }
}
