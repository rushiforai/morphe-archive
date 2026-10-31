package com.amplitude;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class K4 extends FunctionReferenceImpl implements Function1 {
    public K4(Object obj) {
        super(1, 0, M4.class, obj, "storeEvent", "storeEvent(Lcom/amplitude/sessionreplay/transform/rrweb/RREvent;)V");
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        W1 p02 = (W1) obj;
        Intrinsics.g(p02, "p0");
        ((M4) this.receiver).a(p02);
        return Unit.f71706a;
    }
}
