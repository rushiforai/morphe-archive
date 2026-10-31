package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbry extends zzbef {
    private static final zzbwb zza = new zzbwb();
    private final zzbcl zzb;
    private final String zzc;
    private final zzbqo zzd;
    private final String zze;
    private final zzbrx zzf;
    private final zzbrw zzg;
    private final zzaye zzh;
    private final boolean zzi;

    public zzbry(zzbcl zzbclVar, zzbcf zzbcfVar, zzbrk zzbrkVar, zzbsf zzbsfVar, zzbsu zzbsuVar, Object obj, int i5, int i11, String str, String str2, zzbqo zzbqoVar, zzbqz zzbqzVar, zzayj zzayjVar, boolean z11) {
        super(new zzbso(), zzbqoVar, zzbqzVar, zzbcfVar, zzayjVar, false);
        this.zzg = new zzbrw(this);
        this.zzi = false;
        this.zzd = zzbqoVar;
        this.zzb = zzbclVar;
        this.zze = str;
        this.zzc = str2;
        this.zzh = zzbsfVar.zze();
        this.zzf = new zzbrx(this, i5, zzbqoVar, obj, zzbrkVar, zzbsuVar, zzbsfVar, i11, zzbclVar.zzf(), zzayjVar);
    }

    public final zzbrx zzD() {
        return this.zzf;
    }

    public final boolean zzI() {
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzbef
    public final /* synthetic */ zzbec zza() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final zzaye zzam() {
        return this.zzh;
    }

    @Override // com.google.android.libraries.places.internal.zzbef
    public final /* synthetic */ zzbee zzb() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.internal.zzbef, com.google.android.libraries.places.internal.zzbej
    public final /* synthetic */ zzbei zzc() {
        return this.zzf;
    }

    public final zzbcj zzx() {
        return this.zzb.zzb();
    }
}
