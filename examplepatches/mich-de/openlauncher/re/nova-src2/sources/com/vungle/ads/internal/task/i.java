package com.vungle.ads.internal.task;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class i implements com.vungle.ads.internal.executor.h {
    public abstract int a();

    @Override // java.lang.Comparable
    public int compareTo(Object other) {
        Intrinsics.g(other, "other");
        if (!(other instanceof i)) {
            return -1;
        }
        return Intrinsics.h(((i) other).a(), a());
    }
}
