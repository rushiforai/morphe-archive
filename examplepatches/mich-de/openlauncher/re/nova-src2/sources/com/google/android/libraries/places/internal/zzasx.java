package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public abstract class zzasx extends zzarz {
    private static final Logger zza = Logger.getLogger(zzasx.class.getName());
    private static final boolean zzb = zzawx.zzx();
    public static final /* synthetic */ int zzf = 0;
    zzasy zze;

    private zzasx() {
        throw null;
    }

    public static int zzA(String str) {
        int length;
        try {
            length = zzaxc.zzc(str);
        } catch (zzaxb unused) {
            length = str.getBytes(zzaud.zzb).length;
        }
        return zzB(length) + length;
    }

    public static int zzB(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int zzC(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }

    public static zzasx zzD(byte[] bArr, int i5, int i11) {
        return new zzast(bArr, i5, i11);
    }

    @Deprecated
    public static int zzy(int i5, zzavf zzavfVar, zzavt zzavtVar) {
        int iZzB = zzB(i5 << 3);
        return ((zzart) zzavfVar).zzak(zzavtVar) + iZzB + iZzB;
    }

    public static int zzz(zzavf zzavfVar, zzavt zzavtVar) {
        int iZzak = ((zzart) zzavfVar).zzak(zzavtVar);
        return zzB(iZzak) + iZzak;
    }

    public final void zzE() {
        if (zzb() != 0) {
            throw new IllegalStateException("Did not write as much data as expected.");
        }
    }

    public final void zzF(String str, zzaxb zzaxbVar) throws IOException {
        zza.logp(Level.WARNING, "com.google.protobuf.CodedOutputStream", "inefficientWriteStringNoTag", "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) zzaxbVar);
        byte[] bytes = str.getBytes(zzaud.zzb);
        try {
            int length = bytes.length;
            zzu(length);
            zza(bytes, 0, length);
        } catch (IndexOutOfBoundsException e3) {
            throw new zzasu(e3);
        }
    }

    public abstract void zzJ() throws IOException;

    public abstract void zzK(byte b11) throws IOException;

    public abstract void zzL(int i5, boolean z11) throws IOException;

    public abstract void zzM(int i5, zzask zzaskVar) throws IOException;

    @Override // com.google.android.libraries.places.internal.zzarz
    public abstract void zza(byte[] bArr, int i5, int i11) throws IOException;

    public abstract int zzb();

    public abstract void zzh(int i5, int i11) throws IOException;

    public abstract void zzi(int i5) throws IOException;

    public abstract void zzj(int i5, long j11) throws IOException;

    public abstract void zzk(long j11) throws IOException;

    public abstract void zzl(int i5, int i11) throws IOException;

    public abstract void zzm(int i5) throws IOException;

    public abstract void zzn(int i5, zzavf zzavfVar, zzavt zzavtVar) throws IOException;

    public abstract void zzo(int i5, zzavf zzavfVar) throws IOException;

    public abstract void zzp(int i5, zzask zzaskVar) throws IOException;

    public abstract void zzq(int i5, String str) throws IOException;

    public abstract void zzs(int i5, int i11) throws IOException;

    public abstract void zzt(int i5, int i11) throws IOException;

    public abstract void zzu(int i5) throws IOException;

    public abstract void zzv(int i5, long j11) throws IOException;

    public abstract void zzw(long j11) throws IOException;

    public /* synthetic */ zzasx(zzasw zzaswVar) {
    }
}
