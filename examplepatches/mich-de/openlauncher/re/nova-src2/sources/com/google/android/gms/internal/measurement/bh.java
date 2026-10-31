package com.google.android.gms.internal.measurement;

import java.util.HashMap;
import java.util.Random;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class bh {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f32414a = 0;

    static {
        new Random().nextInt();
        new HashMap();
    }

    public static final l6 a(cl.c0 asyncCallable) {
        Intrinsics.g(asyncCallable, "asyncCallable");
        return new l6(7, jg.a(), asyncCallable);
    }
}
