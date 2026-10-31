package com.google.android.libraries.places.internal;

import java.io.Closeable;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzbmq implements Closeable, zzbgj {
    private zzbmm zza;
    private int zzb;
    private final zzbqo zzc;
    private final zzbqz zzd;
    private zzazo zze;
    private boolean zzg;
    private zzbge zzh;
    private long zzj;
    private int zzm;
    private int zzp = 1;
    private int zzf = 5;
    private zzbge zzi = new zzbge();
    private boolean zzk = false;
    private int zzl = -1;
    private boolean zzn = false;
    private volatile boolean zzo = false;

    public zzbmq(zzbmm zzbmmVar, zzazo zzazoVar, int i5, zzbqo zzbqoVar, zzbqz zzbqzVar) {
        this.zza = zzbmmVar;
        this.zze = zzazoVar;
        this.zzb = i5;
        this.zzc = zzbqoVar;
        this.zzd = zzbqzVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x006a, code lost:
    
        if (r3 <= 0) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x006c, code lost:
    
        r12.zza.zzE(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0073, code lost:
    
        if (r12.zzp != 2) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0075, code lost:
    
        r12.zzc.zzh(r3);
        r12.zzm += r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0080, code lost:
    
        r3 = r12.zzp;
        r4 = r3 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0085, code lost:
    
        if (r3 == 0) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0087, code lost:
    
        if (r4 == 0) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0089, code lost:
    
        if (r4 == 1) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x008d, code lost:
    
        if (r3 == 1) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x008f, code lost:
    
        r0 = "BODY";
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0092, code lost:
    
        r0 = "HEADER";
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00a8, code lost:
    
        throw new java.lang.AssertionError("Invalid state: " + r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00a9, code lost:
    
        r12.zzc.zzf(r12.zzl, r12.zzm, -1);
        r12.zzm = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00b9, code lost:
    
        if (r12.zzg == false) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00bb, code lost:
    
        r2 = r12.zze;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00bf, code lost:
    
        if (r2 == com.google.android.libraries.places.internal.zzaza.zza) goto L102;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00c1, code lost:
    
        r3 = new com.google.android.libraries.places.internal.zzbmp(r2.zza(new com.google.android.libraries.places.internal.zzbnw(r12.zzh)), r12.zzb, r12.zzc);
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00d6, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00dc, code lost:
    
        throw new java.lang.RuntimeException(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00ea, code lost:
    
        throw new com.google.android.libraries.places.internal.zzbdq(com.google.android.libraries.places.internal.zzbdo.zzo.zzg("Can't decode compressed gRPC message as compression not configured"), null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00eb, code lost:
    
        r12.zzc.zzg(r12.zzh.zzf());
        r3 = new com.google.android.libraries.places.internal.zzbnw(r12.zzh);
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00fe, code lost:
    
        r12.zzh = null;
        r12.zza.zzr(new com.google.android.libraries.places.internal.zzbmo(r3, null));
        r12.zzp = 1;
        r12.zzf = 5;
        r12.zzj--;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0118, code lost:
    
        r3 = r12.zzh.zze();
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0120, code lost:
    
        if ((r3 & 254) != 0) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0124, code lost:
    
        if (1 == (r3 & 1)) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0126, code lost:
    
        r3 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0128, code lost:
    
        r3 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0129, code lost:
    
        r12.zzg = r3;
        r3 = r12.zzh;
        r3.zza(4);
        r3 = r3.zze() | (((r3.zze() << 24) | (r3.zze() << 16)) | (r3.zze() << 8));
        r12.zzf = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x014c, code lost:
    
        if (r3 < 0) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0150, code lost:
    
        if (r3 > r12.zzb) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0152, code lost:
    
        r3 = r12.zzl + 1;
        r12.zzl = r3;
        r12.zzc.zze(r3);
        r12.zzd.zzc();
        r12.zzp = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x019d, code lost:
    
        throw new com.google.android.libraries.places.internal.zzbdq(com.google.android.libraries.places.internal.zzbdo.zzo.zzg("gRPC frame header malformed: reserved bits not zero"), null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x019e, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x01b9, code lost:
    
        if (r12.zzn == false) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x01bf, code lost:
    
        if (zzi() == false) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01c1, code lost:
    
        close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01c6, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void zzh() {
        int i5;
        if (this.zzk) {
            return;
        }
        this.zzk = true;
        while (true) {
            try {
                if (this.zzj <= 0) {
                    break;
                }
                try {
                    if (this.zzh == null) {
                        this.zzh = new zzbge();
                    }
                    i5 = 0;
                    while (true) {
                        try {
                            int iZzf = this.zzf - this.zzh.zzf();
                            if (iZzf <= 0) {
                                break;
                            }
                            if (this.zzi.zzf() != 0) {
                                int iMin = Math.min(iZzf, this.zzi.zzf());
                                i5 += iMin;
                                this.zzh.zzh(this.zzi.zzg(iMin));
                            } else if (i5 > 0) {
                                this.zza.zzE(i5);
                                if (this.zzp == 2) {
                                    this.zzc.zzh(i5);
                                    this.zzm += i5;
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            if (i5 > 0) {
                                this.zza.zzE(i5);
                                if (this.zzp == 2) {
                                    this.zzc.zzh(i5);
                                    this.zzm += i5;
                                }
                            }
                            throw th;
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    i5 = 0;
                }
            } finally {
                this.zzk = false;
            }
        }
        zzbdo zzbdoVar = zzbdo.zzj;
        Locale locale = Locale.US;
        throw new zzbdq(zzbdoVar.zzg("gRPC message exceeds maximum size " + this.zzb + ": " + this.zzf), null);
    }

    private final boolean zzi() {
        return this.zzi.zzf() == 0;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable, com.google.android.libraries.places.internal.zzbgj
    public final void close() {
        if (zzg()) {
            return;
        }
        zzbge zzbgeVar = this.zzh;
        boolean z11 = false;
        if (zzbgeVar != null && zzbgeVar.zzf() > 0) {
            z11 = true;
        }
        try {
            zzbge zzbgeVar2 = this.zzi;
            if (zzbgeVar2 != null) {
                zzbgeVar2.close();
            }
            zzbge zzbgeVar3 = this.zzh;
            if (zzbgeVar3 != null) {
                zzbgeVar3.close();
            }
            this.zzi = null;
            this.zzh = null;
            this.zza.zze(z11);
        } catch (Throwable th2) {
            this.zzi = null;
            this.zzh = null;
            throw th2;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbgj
    public final void zza() {
        if (zzg()) {
            return;
        }
        if (zzi()) {
            close();
        } else {
            this.zzn = true;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbgj
    public final void zzb(zzbnv zzbnvVar) throws Throwable {
        boolean z11 = true;
        try {
            if (!zzg() && !this.zzn) {
                this.zzi.zzh(zzbnvVar);
                try {
                    zzh();
                    return;
                } catch (Throwable th2) {
                    th = th2;
                    z11 = false;
                    if (z11) {
                        zzbnvVar.close();
                    }
                    throw th;
                }
            }
            zzbnvVar.close();
        } catch (Throwable th3) {
            th = th3;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbgj
    public final void zzc(int i5) {
        if (zzg()) {
            return;
        }
        this.zzj += 2;
        zzh();
    }

    @Override // com.google.android.libraries.places.internal.zzbgj
    public final void zzd(zzazo zzazoVar) {
        this.zze = zzazoVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbgj
    public final void zze(int i5) {
        this.zzb = i5;
    }

    public final void zzf(zzbmm zzbmmVar) {
        this.zza = zzbmmVar;
    }

    public final boolean zzg() {
        return this.zzi == null;
    }
}
