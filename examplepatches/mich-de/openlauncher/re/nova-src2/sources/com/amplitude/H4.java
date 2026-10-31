package com.amplitude;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class H4 extends FunctionReferenceImpl implements Function1 {
    public H4(I4 i42) {
        super(1, 0, I4.class, i42, "handleEmbeddedViewEvent", "handleEmbeddedViewEvent(Ljava/lang/String;)V");
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String p02 = (String) obj;
        Intrinsics.g(p02, "p0");
        ((I4) this.receiver).handleEmbeddedViewEvent(p02);
        return Unit.f71706a;
    }
}
