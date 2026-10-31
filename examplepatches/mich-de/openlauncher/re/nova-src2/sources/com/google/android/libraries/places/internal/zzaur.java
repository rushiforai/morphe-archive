package com.google.android.libraries.places.internal;

import java.util.List;

/* loaded from: classes3.dex */
final class zzaur extends zzaut {
    private zzaur() {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzaut
    public final List zza(Object obj, long j11) {
        zzauc zzaucVar = (zzauc) zzawx.zzf(obj, j11);
        if (zzaucVar.zzc()) {
            return zzaucVar;
        }
        int size = zzaucVar.size();
        zzauc zzaucVarZzd = zzaucVar.zzd(size == 0 ? 10 : size + size);
        zzawx.zzs(obj, j11, zzaucVarZzd);
        return zzaucVarZzd;
    }

    @Override // com.google.android.libraries.places.internal.zzaut
    public final void zzb(Object obj, long j11) {
        ((zzauc) zzawx.zzf(obj, j11)).zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzaut
    public final void zzc(Object obj, Object obj2, long j11) {
        zzauc zzaucVarZzd = (zzauc) zzawx.zzf(obj, j11);
        zzauc zzaucVar = (zzauc) zzawx.zzf(obj2, j11);
        int size = zzaucVarZzd.size();
        int size2 = zzaucVar.size();
        if (size > 0 && size2 > 0) {
            if (!zzaucVarZzd.zzc()) {
                zzaucVarZzd = zzaucVarZzd.zzd(size2 + size);
            }
            zzaucVarZzd.addAll(zzaucVar);
        }
        if (size > 0) {
            zzaucVar = zzaucVarZzd;
        }
        zzawx.zzs(obj, j11, zzaucVar);
    }

    public /* synthetic */ zzaur(zzauq zzauqVar) {
        super(null);
    }
}
