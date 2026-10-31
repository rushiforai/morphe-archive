package com.vungle.ads.internal.task;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements m {
    public final int a(e jobInfo) {
        Intrinsics.g(jobInfo, "jobInfo");
        return Math.min(19, Math.abs(Math.min(0, jobInfo.e() - 2)) + 10);
    }
}
