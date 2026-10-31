package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.theme;

import android.content.Context;
import hv.g4;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.o;
import w70.g2;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f40098a = 2;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f40099b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f40100c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f40101d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f40102e;

    public /* synthetic */ f(Context context, boolean z11, int i5, int i11) {
        this.f40102e = context;
        this.f40099b = z11;
        this.f40100c = i5;
        this.f40101d = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f40098a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL = a0.l(1);
                g4.b((g2) this.f40102e, this.f40099b, this.f40100c, this.f40101d, (o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = a0.l(this.f40100c | 1);
                zg.a.n((Context) this.f40102e, this.f40099b, (o) obj, iL2, this.f40101d);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ f(g2 g2Var, boolean z11, int i5, int i11, int i12) {
        this.f40102e = g2Var;
        this.f40099b = z11;
        this.f40100c = i5;
        this.f40101d = i11;
    }

    public /* synthetic */ f(boolean z11, Function2 function2, int i5, int i11) {
        this.f40099b = z11;
        this.f40102e = function2;
        this.f40100c = i5;
        this.f40101d = i11;
    }
}
