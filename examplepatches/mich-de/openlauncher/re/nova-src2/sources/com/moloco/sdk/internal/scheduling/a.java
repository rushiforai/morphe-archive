package com.moloco.sdk.internal.scheduling;

import a80.e;
import org.jetbrains.annotations.NotNull;
import t70.c0;
import t70.y0;
import y70.o;

/* loaded from: classes.dex */
public final class a implements DispatcherProvider {
    @Override // com.moloco.sdk.internal.scheduling.DispatcherProvider
    @NotNull
    public c0 getDefault() {
        return y0.f88884a;
    }

    @Override // com.moloco.sdk.internal.scheduling.DispatcherProvider
    @NotNull
    public c0 getIo() {
        e eVar = y0.f88884a;
        return a80.d.f488c;
    }

    @Override // com.moloco.sdk.internal.scheduling.DispatcherProvider
    @NotNull
    public c0 getMain() {
        e eVar = y0.f88884a;
        return o.f96819a;
    }

    @Override // com.moloco.sdk.internal.scheduling.DispatcherProvider
    @NotNull
    public c0 getMainImmediate() {
        e eVar = y0.f88884a;
        return o.f96819a.f90673f;
    }

    @Override // com.moloco.sdk.internal.scheduling.DispatcherProvider
    @NotNull
    public c0 getUnconfined() {
        return y0.f88885b;
    }
}
