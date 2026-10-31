package com.vungle.ads.internal.network;

import kotlin.jvm.internal.Intrinsics;
import x80.m0;

/* loaded from: classes4.dex */
public abstract class n {
    public static o a(Object obj, m0 rawResponse) {
        Intrinsics.g(rawResponse, "rawResponse");
        if (rawResponse.c()) {
            return new o(rawResponse, obj, 0);
        }
        throw new IllegalArgumentException("rawResponse must be successful response");
    }

    public static o a(m0 rawResponse) {
        Intrinsics.g(rawResponse, "rawResponse");
        if (!rawResponse.c()) {
            return new o(rawResponse, null, 0);
        }
        throw new IllegalArgumentException("rawResponse should not be successful response");
    }
}
