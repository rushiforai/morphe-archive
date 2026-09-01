package com.google.android.gms.internal.gtm;

import defpackage.ka1;
import defpackage.y30;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzfl extends zzfr {
    private final String zzb;
    private final int zzc;
    private final int zzd;

    public /* synthetic */ zzfl(String str, boolean z, int i, zzfh zzfhVar, zzfi zzfiVar, int i2, zzfk zzfkVar) {
        this.zzb = str;
        this.zzc = i;
        this.zzd = i2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzfr) {
            zzfr zzfrVar = (zzfr) obj;
            if (this.zzb.equals(zzfrVar.zzc())) {
                zzfrVar.zzd();
                int i = this.zzc;
                int iZze = zzfrVar.zze();
                if (i == 0) {
                    throw null;
                }
                if (i == iZze) {
                    zzfrVar.zza();
                    zzfrVar.zzb();
                    int i2 = this.zzd;
                    int iZzf = zzfrVar.zzf();
                    if (i2 == 0) {
                        throw null;
                    }
                    if (iZzf == 1) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = this.zzb.hashCode() ^ 1000003;
        int i = this.zzc;
        if (i == 0) {
            throw null;
        }
        int i2 = (((iHashCode * 1000003) ^ 1237) * 1000003) ^ i;
        if (this.zzd != 0) {
            return (i2 * 583896283) ^ 1;
        }
        throw null;
    }

    public final String toString() {
        int i = this.zzc;
        return ka1.v(y30.u("FileComplianceOptions{fileOwner=", this.zzb, ", hasDifferentDmaOwner=false, fileChecks=", i != 1 ? i != 2 ? i != 3 ? i != 4 ? "null" : "NO_CHECKS" : "SKIP_SECURITY_CHECK" : "SKIP_COMPLIANCE_CHECK" : "ALL_CHECKS", ", dataForwardingNotAllowedResolver=null, multipleProductIdGroupsResolver=null, filePurpose="), this.zzd == 1 ? "READ_AND_WRITE" : "null", "}");
    }

    @Override // com.google.android.gms.internal.gtm.zzfr
    public final zzfh zza() {
        return null;
    }

    @Override // com.google.android.gms.internal.gtm.zzfr
    public final zzfi zzb() {
        return null;
    }

    @Override // com.google.android.gms.internal.gtm.zzfr
    public final String zzc() {
        return this.zzb;
    }

    @Override // com.google.android.gms.internal.gtm.zzfr
    public final boolean zzd() {
        return false;
    }

    @Override // com.google.android.gms.internal.gtm.zzfr
    public final int zze() {
        return this.zzc;
    }

    @Override // com.google.android.gms.internal.gtm.zzfr
    public final int zzf() {
        return this.zzd;
    }
}
