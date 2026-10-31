package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.view.ViewOutlineProvider;
import i2.v0;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class k0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f41244a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f41245b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f41246c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f41247d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f41248e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f41249f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f41250g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f41251h;

    public /* synthetic */ k0(b2.t tVar, String str, String str2, long j11, Function0 function0, int i5, int i11) {
        this.f41245b = tVar;
        this.f41249f = str;
        this.f41250g = str2;
        this.f41246c = j11;
        this.f41251h = function0;
        this.f41247d = i5;
        this.f41248e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f41244a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                ((Integer) obj2).getClass();
                com.google.android.gms.internal.consent_sdk.e0.f((dx.w) this.f41249f, this.f41245b, this.f41246c, (ViewOutlineProvider) this.f41250g, (hx.c) this.f41251h, (p1.o) obj, p1.a0.l(this.f41247d | 1), this.f41248e);
                break;
            default:
                ((Integer) obj2).getClass();
                hy.a0.d((tz.o) this.f41249f, (Function0) this.f41251h, this.f41245b, this.f41246c, (v0) this.f41250g, (p1.o) obj, p1.a0.l(this.f41247d | 1), this.f41248e);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ k0(dx.w wVar, b2.t tVar, long j11, ViewOutlineProvider viewOutlineProvider, hx.c cVar, int i5, int i11) {
        this.f41249f = wVar;
        this.f41245b = tVar;
        this.f41246c = j11;
        this.f41250g = viewOutlineProvider;
        this.f41251h = cVar;
        this.f41247d = i5;
        this.f41248e = i11;
    }

    public /* synthetic */ k0(tz.o oVar, Function0 function0, b2.t tVar, long j11, v0 v0Var, int i5, int i11) {
        this.f41249f = oVar;
        this.f41251h = function0;
        this.f41245b = tVar;
        this.f41246c = j11;
        this.f41250g = v0Var;
        this.f41247d = i5;
        this.f41248e = i11;
    }
}
