package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.content.ComponentName;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.S;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.functions.Function7;

/* loaded from: classes4.dex */
public final /* synthetic */ class f0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f41176a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f41177b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f41178c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f41179d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f41180e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f41181f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f41182g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f41183h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f41184i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f41185j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f41186k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f41187l;

    public /* synthetic */ f0(b2.t tVar, mx.f fVar, ComponentName componentName, String str, int i5, gz.f fVar2, gz.f fVar3, fz.h0 h0Var, fz.d dVar, mx.k0 k0Var, int i11) {
        this.f41177b = tVar;
        this.f41180e = fVar;
        this.f41181f = componentName;
        this.f41182g = str;
        this.f41178c = i5;
        this.f41183h = fVar2;
        this.f41184i = fVar3;
        this.f41185j = h0Var;
        this.f41186k = dVar;
        this.f41187l = k0Var;
        this.f41179d = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f41176a) {
            case 0:
                return j.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k) this.f41180e, (Function0) this.f41181f, this.f41177b, (Function7) this.f41183h, (Function5) this.f41185j, (Function6) this.f41186k, (Function7) this.f41184i, (S) this.f41187l, (Function0) this.f41182g, this.f41178c, this.f41179d, (p1.o) obj, ((Integer) obj2).intValue());
            default:
                ((Integer) obj2).intValue();
                t00.q.a(this.f41177b, (mx.f) this.f41180e, (ComponentName) this.f41181f, (String) this.f41182g, this.f41178c, (gz.f) this.f41183h, (gz.f) this.f41184i, (fz.h0) this.f41185j, (fz.d) this.f41186k, (mx.k0) this.f41187l, (p1.o) obj, p1.a0.l(this.f41179d | 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ f0(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k kVar, Function0 function0, b2.t tVar, Function7 function7, Function5 function5, Function6 function6, Function7 function72, S s11, Function0 function02, int i5, int i11) {
        this.f41180e = kVar;
        this.f41181f = function0;
        this.f41177b = tVar;
        this.f41183h = function7;
        this.f41185j = function5;
        this.f41186k = function6;
        this.f41184i = function72;
        this.f41187l = s11;
        this.f41182g = function02;
        this.f41178c = i5;
        this.f41179d = i11;
    }
}
