package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/* loaded from: classes3.dex */
final class zzbnp extends zzbbm {
    private final zzbbd zzf;
    private zzbbj zzg;
    private zzaze zzh = zzaze.IDLE;

    public zzbnp(zzbbd zzbbdVar) {
        this.zzf = zzbbdVar;
    }

    public static /* bridge */ /* synthetic */ void zzh(zzbnp zzbnpVar, zzbbj zzbbjVar, zzazf zzazfVar) {
        zzbbk zzbnmVar;
        zzaze zzazeVarZza = zzazfVar.zza();
        if (zzazeVarZza == zzaze.SHUTDOWN) {
            return;
        }
        zzaze zzazeVar = zzaze.TRANSIENT_FAILURE;
        if (zzazeVarZza == zzazeVar || zzazeVarZza == zzaze.IDLE) {
            zzbnpVar.zzf.zzd();
        }
        if (zzbnpVar.zzh == zzazeVar) {
            if (zzazeVarZza == zzaze.CONNECTING) {
                return;
            }
            if (zzazeVarZza == zzaze.IDLE) {
                zzbnpVar.zzd();
                return;
            }
        }
        int iOrdinal = zzazeVarZza.ordinal();
        if (iOrdinal == 0) {
            zzbnmVar = new zzbnm(zzbbe.zzc());
        } else if (iOrdinal == 1) {
            zzbnmVar = new zzbnm(zzbbe.zzd(zzbbjVar, null));
        } else if (iOrdinal == 2) {
            zzbnmVar = new zzbnm(zzbbe.zzb(zzazfVar.zzd()));
        } else {
            if (iOrdinal != 3) {
                throw new IllegalArgumentException("Unsupported state:".concat(zzazeVarZza.toString()));
            }
            zzbnmVar = new zzbno(zzbnpVar, zzbbjVar);
        }
        zzbnpVar.zzi(zzazeVarZza, zzbnmVar);
    }

    private final void zzi(zzaze zzazeVar, zzbbk zzbbkVar) {
        this.zzh = zzazeVar;
        this.zzf.zze(zzazeVar, zzbbkVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final zzbdo zza(zzbbi zzbbiVar) {
        Boolean bool;
        List listZze = zzbbiVar.zze();
        if (listZze.isEmpty()) {
            zzbdo zzbdoVarZzg = zzbdo.zzp.zzg("NameResolver returned no usable address. addrs=" + String.valueOf(zzbbiVar.zze()) + ", attrs=" + zzbbiVar.zza().toString());
            zzb(zzbdoVarZzg);
            return zzbdoVarZzg;
        }
        if ((zzbbiVar.zzd() instanceof zzbnl) && (bool = ((zzbnl) zzbbiVar.zzd()).zza) != null && bool.booleanValue()) {
            ArrayList arrayList = new ArrayList(listZze);
            Collections.shuffle(arrayList, new Random());
            listZze = arrayList;
        }
        zzbbj zzbbjVar = this.zzg;
        if (zzbbjVar == null) {
            zzbbd zzbbdVar = this.zzf;
            zzbax zzbaxVarZzb = zzbba.zzb();
            zzbaxVarZzb.zzb(listZze);
            zzbbj zzbbjVarZza = zzbbdVar.zza(zzbaxVarZzb.zzc());
            zzbbjVarZza.zzc(new zzbnk(this, zzbbjVarZza));
            this.zzg = zzbbjVarZza;
            zzi(zzaze.CONNECTING, new zzbnm(zzbbe.zzd(zzbbjVarZza, null)));
            zzbbjVarZza.zza();
        } else {
            zzbbjVar.zzd(listZze);
        }
        return zzbdo.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzb(zzbdo zzbdoVar) {
        zzbbj zzbbjVar = this.zzg;
        if (zzbbjVar != null) {
            zzbbjVar.zzb();
            this.zzg = null;
        }
        zzi(zzaze.TRANSIENT_FAILURE, new zzbnm(zzbbe.zzb(zzbdoVar)));
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzd() {
        zzbbj zzbbjVar = this.zzg;
        if (zzbbjVar != null) {
            zzbbjVar.zza();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zze() {
        zzbbj zzbbjVar = this.zzg;
        if (zzbbjVar != null) {
            zzbbjVar.zzb();
        }
    }
}
