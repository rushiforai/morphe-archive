package com.google.android.gms.internal.play_billing;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class i1 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final i1 f33419a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i1[] f33420b;

    static {
        i1 i1Var = new i1("INSTANCE", 0);
        f33419a = i1Var;
        f33420b = new i1[]{i1Var};
    }

    public static i1[] values() {
        return (i1[]) f33420b.clone();
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.run();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "MoreExecutors.directExecutor()";
    }
}
