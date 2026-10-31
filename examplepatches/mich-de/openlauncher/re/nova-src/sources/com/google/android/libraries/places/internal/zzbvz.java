package com.google.android.libraries.places.internal;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public class zzbvz extends zzbwv {

    @NotNull
    public static final zzbvw zza = new zzbvw(null);

    @NotNull
    private static final ReentrantLock zzd;

    @NotNull
    private static final Condition zze;

    static {
        ReentrantLock reentrantLock = new ReentrantLock();
        zzd = reentrantLock;
        Condition conditionNewCondition = reentrantLock.newCondition();
        Intrinsics.f(conditionNewCondition, "newCondition(...)");
        zze = conditionNewCondition;
        TimeUnit.MILLISECONDS.toNanos(TimeUnit.SECONDS.toMillis(60L));
    }
}
