package com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public interface i extends d {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f42228a = a.f42229a;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f42229a = new a();

        @NotNull
        public final i a(@NotNull l worker) {
            Intrinsics.g(worker, "worker");
            return new j(worker);
        }
    }
}
