package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class U3 extends Exception {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public U3(String msg) {
        super(msg);
        Intrinsics.g(msg, "msg");
    }
}
