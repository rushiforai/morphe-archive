package com.amplitude;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.h3, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final /* synthetic */ class C0449h3 extends FunctionReferenceImpl implements Function1 {
    public C0449h3(C0496p1 c0496p1) {
        super(1, 0, C0496p1.class, c0496p1, "pack", "pack(Lcom/amplitude/sessionreplay/transform/rrweb/RREvent;)Ljava/lang/String;");
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        W1 p02 = (W1) obj;
        Intrinsics.g(p02, "p0");
        return ((C0496p1) this.receiver).a(p02);
    }
}
