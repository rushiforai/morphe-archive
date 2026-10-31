package com.moloco.sdk.internal;

import android.content.Context;
import com.moloco.sdk.internal.ortb.model.G;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.S;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f36237a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f36238b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f36239c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f36240d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f36241e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f36242f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f36243g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f36244h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f36245i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f36246j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f36247k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f36248l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Object f36249m;
    public final /* synthetic */ Object n;
    public final /* synthetic */ Object o;

    public /* synthetic */ c0(int i5, Integer num, com.moloco.sdk.internal.ortb.model.C c11, G g11, boolean z11, boolean z12, int i11, int i12, Integer num2, Integer num3, Integer num4, Integer num5, Integer num6, Integer num7) {
        this.f36240d = i5;
        this.f36243g = num;
        this.n = c11;
        this.o = g11;
        this.f36238b = z11;
        this.f36239c = z12;
        this.f36241e = i11;
        this.f36242f = i12;
        this.f36244h = num2;
        this.f36245i = num3;
        this.f36246j = num4;
        this.f36247k = num5;
        this.f36248l = num6;
        this.f36249m = num7;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f36237a) {
            case 0:
                return C2930d.a(this.f36240d, (Integer) this.f36243g, (com.moloco.sdk.internal.ortb.model.C) this.n, (G) this.o, this.f36238b, this.f36239c, this.f36241e, this.f36242f, (Integer) this.f36244h, (Integer) this.f36245i, (Integer) this.f36246j, (Integer) this.f36247k, (Integer) this.f36248l, (Integer) this.f36249m, (Context) obj, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i) obj2);
            default:
                int iIntValue = ((Integer) obj2).intValue();
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.B.a((String) this.f36243g, this.f36238b, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.m) this.f36244h, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.m) this.f36245i, this.f36239c, (Function1) this.f36246j, (Function1) this.f36247k, (S) this.f36248l, (Function1) this.f36249m, (Function1) this.n, (b2.t) this.o, this.f36240d, this.f36241e, this.f36242f, (p1.o) obj, iIntValue);
        }
    }

    public /* synthetic */ c0(String str, boolean z11, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.m mVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.m mVar2, boolean z12, Function1 function1, Function1 function12, S s11, Function1 function13, Function1 function14, b2.t tVar, int i5, int i11, int i12) {
        this.f36243g = str;
        this.f36238b = z11;
        this.f36244h = mVar;
        this.f36245i = mVar2;
        this.f36239c = z12;
        this.f36246j = function1;
        this.f36247k = function12;
        this.f36248l = s11;
        this.f36249m = function13;
        this.n = function14;
        this.o = tVar;
        this.f36240d = i5;
        this.f36241e = i11;
        this.f36242f = i12;
    }
}
