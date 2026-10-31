package com.facebook.ads.redexgen.X;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* renamed from: com.facebook.ads.redexgen.X.qq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2440qq {
    public static final int A00 = Runtime.getRuntime().availableProcessors();
    public static final ExecutorService A01 = Executors.newFixedThreadPool(A00);
    public static volatile boolean A02 = true;
}
