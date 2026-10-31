package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.j;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f41128a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j.b f41129b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2.t f41130c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f41131d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f41132e;

    public /* synthetic */ a0(j.b bVar, b2.t tVar, int i5, int i11, int i12) {
        this.f41128a = i12;
        this.f41129b = bVar;
        this.f41130c = tVar;
        this.f41131d = i5;
        this.f41132e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f41128a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return A.a(this.f41129b, this.f41130c, this.f41131d, this.f41132e, (p1.o) obj, iIntValue);
            default:
                int iIntValue2 = ((Integer) obj2).intValue();
                return C3024a.a(this.f41129b, this.f41130c, this.f41131d, this.f41132e, (p1.o) obj, iIntValue2);
        }
    }
}
