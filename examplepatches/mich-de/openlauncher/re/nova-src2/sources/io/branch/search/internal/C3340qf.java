package io.branch.search.internal;

import android.os.UserManager;
import io.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.qf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3340qf {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public static C3323pf f65581a;

    @JvmStatic
    @NotNull
    public static final synchronized UserHandleDataSource a(@NotNull UserManager um2) {
        C3323pf c3323pf;
        try {
            Intrinsics.g(um2, "um");
            if (f65581a == null) {
                f65581a = new C3323pf(um2);
            }
            c3323pf = f65581a;
            Intrinsics.d(c3323pf);
        } catch (Throwable th2) {
            throw th2;
        }
        return c3323pf;
    }
}
