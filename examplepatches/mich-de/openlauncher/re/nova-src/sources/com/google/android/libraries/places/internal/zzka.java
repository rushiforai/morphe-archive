package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public abstract class zzka {
    public abstract zzka zzb(int i5);

    public abstract zzkb zzc();

    public abstract zzka zzd(int i5);

    public final zzkb zze() {
        zzkb zzkbVarZzc = zzc();
        zzmt.zzp(!zzkbVarZzc.zzb().isEmpty(), "Package name must not be empty.");
        return zzkbVarZzc;
    }
}
