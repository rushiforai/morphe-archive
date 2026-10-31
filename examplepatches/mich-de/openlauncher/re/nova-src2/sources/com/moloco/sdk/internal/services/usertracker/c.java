package com.moloco.sdk.internal.services.usertracker;

import com.moloco.sdk.internal.services.w;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class c implements b {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38138b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final w f38139a;

    public c(@NotNull w dataStoreService) {
        Intrinsics.g(dataStoreService, "dataStoreService");
        this.f38139a = dataStoreService;
    }

    @Override // com.moloco.sdk.internal.services.usertracker.b
    @Nullable
    public Object a(@NotNull String str, @NotNull Continuation<? super Unit> continuation) {
        Object objA = this.f38139a.a(d.f38140a, str, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // com.moloco.sdk.internal.services.usertracker.b
    @Nullable
    public Object b(@NotNull Continuation<? super String> continuation) {
        return this.f38139a.d(d.f38140a, continuation);
    }

    @Override // com.moloco.sdk.internal.services.usertracker.b
    @Nullable
    public Object a(@NotNull Continuation<? super Unit> continuation) {
        Object objA = this.f38139a.a(d.f38140a, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
