package com.google.android.libraries.places.internal;

import h6.f1;
import h6.j1;
import k6.c;
import kotlin.reflect.KClass;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class zzll implements j1 {
    private final zzla zza;
    private final zzlq zzb;
    private final zzlr zzc;

    public zzll(zzla zzlaVar, zzlq zzlqVar, zzlr zzlrVar) {
        this.zza = zzlaVar;
        this.zzb = zzlqVar;
        this.zzc = zzlrVar;
    }

    @Override // h6.j1
    @NotNull
    public /* bridge */ /* synthetic */ f1 create(@NotNull KClass kClass, @NotNull c cVar) {
        return super.create(kClass, cVar);
    }

    @Override // h6.j1
    public final f1 create(Class cls) {
        zzmt.zzf(cls == zzln.class, "This factory can only be used to instantiate its enclosing class.");
        return new zzln(this.zza, this.zzb, this.zzc, null);
    }

    @Override // h6.j1
    public final f1 create(Class cls, c cVar) {
        return create(cls);
    }
}
