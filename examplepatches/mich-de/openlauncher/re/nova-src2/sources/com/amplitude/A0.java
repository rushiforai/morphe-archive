package com.amplitude;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class A0 extends FunctionReferenceImpl implements Function1 {
    public A0(B0 b02) {
        super(1, 0, B0.class, b02, "handleEmbeddedViewEvent", "handleEmbeddedViewEvent(Ljava/lang/String;)V");
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String p02 = (String) obj;
        Intrinsics.g(p02, "p0");
        ((B0) this.receiver).handleEmbeddedViewEvent(p02);
        return Unit.f71706a;
    }
}
