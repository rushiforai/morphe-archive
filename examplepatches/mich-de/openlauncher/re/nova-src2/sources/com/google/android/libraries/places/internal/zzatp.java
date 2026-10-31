package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
public final class zzatp extends zzarv {
    private final zzatu zza;

    public zzatp(zzatu zzatuVar) {
        this.zza = zzatuVar;
    }

    @Override // com.google.android.libraries.places.internal.zzavn
    public final /* synthetic */ Object zzb(zzasq zzasqVar, zzatf zzatfVar) throws zzauf {
        int i5 = zzatu.zzd;
        zzatu zzatuVarZzat = this.zza.zzat();
        try {
            zzavt zzavtVarZzb = zzavp.zza().zzb(zzatuVarZzat.getClass());
            zzavtVarZzb.zzf(zzatuVarZzat, zzasr.zzq(zzasqVar), zzatfVar);
            zzavtVarZzb.zzd(zzatuVarZzat);
            return zzatuVarZzat;
        } catch (zzauf e3) {
            e = e3;
            if (e.zzl()) {
                e = new zzauf(e);
            }
            e.zzh(zzatuVarZzat);
            throw e;
        } catch (zzawm e11) {
            zzauf zzaufVarZza = e11.zza();
            zzaufVarZza.zzh(zzatuVarZzat);
            throw zzaufVarZza;
        } catch (IOException e12) {
            if (e12.getCause() instanceof zzauf) {
                throw ((zzauf) e12.getCause());
            }
            zzauf zzaufVar = new zzauf(e12);
            zzaufVar.zzh(zzatuVarZzat);
            throw zzaufVar;
        } catch (RuntimeException e13) {
            if (e13.getCause() instanceof zzauf) {
                throw ((zzauf) e13.getCause());
            }
            throw e13;
        }
    }
}
