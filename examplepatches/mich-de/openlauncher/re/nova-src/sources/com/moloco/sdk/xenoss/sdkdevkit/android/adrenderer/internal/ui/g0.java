package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.d;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.x;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39806a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f39807b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f39808c;

    public /* synthetic */ g0(Function0 function0, Function0 function02, int i5) {
        this.f39806a = i5;
        this.f39807b = function0;
        this.f39808c = function02;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f39806a) {
            case 0:
                return d.a.C0237a.C0238a.a(this.f39807b, this.f39808c);
            case 1:
                return x.e.a.C0282a.a(this.f39807b, this.f39808c);
            case 2:
                return x.e.a.b.a(this.f39807b, this.f39808c);
            default:
                this.f39807b.invoke();
                this.f39808c.invoke();
                return Unit.f71706a;
        }
    }
}
