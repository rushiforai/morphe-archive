package com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport;

import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.e;
import j3.b0;
import j3.y;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f42236a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f42237b;

    public /* synthetic */ n(String str, int i5) {
        this.f42236a = i5;
        this.f42237b = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f42236a) {
            case 0:
                return e.d.a(this.f42237b, (o50.n) obj);
            default:
                b0 b0Var = (b0) obj;
                y.e(this.f42237b, b0Var);
                y.j(b0Var, 5);
                return Unit.f71706a;
        }
    }
}
