package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class f0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39803a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f39804b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f39805c;

    public /* synthetic */ f0(Function1 function1, String str, int i5) {
        this.f39803a = i5;
        this.f39804b = function1;
        this.f39805c = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f39803a) {
            case 0:
                return C2994a.a(this.f39804b, this.f39805c);
            default:
                this.f39804b.invoke(this.f39805c);
                return Unit.f71706a;
        }
    }
}
