package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzauw implements zzavd {
    private final zzavd[] zza;

    public zzauw(zzavd... zzavdVarArr) {
        this.zza = zzavdVarArr;
    }

    @Override // com.google.android.libraries.places.internal.zzavd
    public final zzavc zzb(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            zzavd zzavdVar = this.zza[i5];
            if (zzavdVar.zzc(cls)) {
                return zzavdVar.zzb(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }

    @Override // com.google.android.libraries.places.internal.zzavd
    public final boolean zzc(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            if (this.zza[i5].zzc(cls)) {
                return true;
            }
        }
        return false;
    }
}
