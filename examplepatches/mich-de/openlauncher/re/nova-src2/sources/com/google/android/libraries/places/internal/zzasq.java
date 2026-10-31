package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public abstract class zzasq {
    public static final /* synthetic */ int zze = 0;
    private static volatile int zzf = 100;
    int zza;
    final int zzb = zzf;
    int zzc = LayoutNode.NotPlacedPlaceOrder;
    zzasr zzd;

    public /* synthetic */ zzasq(zzasp zzaspVar) {
    }

    public static int zzF(int i5) {
        return (i5 >>> 1) ^ (-(i5 & 1));
    }

    public static long zzH(long j11) {
        return (j11 >>> 1) ^ (-(1 & j11));
    }

    public static zzasq zzI(InputStream inputStream, int i5) {
        return new zzaso(inputStream, u1.FLAG_APPEARED_IN_PRE_LAYOUT, null);
    }

    public static zzasq zzJ(byte[] bArr, int i5, int i11) {
        return zzK(bArr, 0, i11, false);
    }

    public static zzasq zzK(byte[] bArr, int i5, int i11, boolean z11) {
        zzasm zzasmVar = new zzasm(bArr, 0, i11, false, null);
        try {
            zzasmVar.zze(i11);
            return zzasmVar;
        } catch (zzauf e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public abstract void zzA(int i5);

    public abstract boolean zzC() throws IOException;

    public abstract boolean zzD() throws IOException;

    public abstract boolean zzE(int i5) throws IOException;

    public final int zzG(int i5) {
        int i11 = this.zzc;
        this.zzc = LayoutNode.NotPlacedPlaceOrder;
        return i11;
    }

    public abstract double zzb() throws IOException;

    public abstract float zzc() throws IOException;

    public abstract int zzd();

    public abstract int zze(int i5) throws zzauf;

    public abstract int zzf() throws IOException;

    public abstract int zzg() throws IOException;

    public abstract int zzh() throws IOException;

    public abstract int zzk() throws IOException;

    public abstract int zzl() throws IOException;

    public abstract int zzm() throws IOException;

    public abstract int zzn() throws IOException;

    public abstract long zzo() throws IOException;

    public abstract long zzp() throws IOException;

    public abstract long zzt() throws IOException;

    public abstract long zzu() throws IOException;

    public abstract long zzv() throws IOException;

    public abstract zzask zzw() throws IOException;

    public abstract String zzx() throws IOException;

    public abstract String zzy() throws IOException;

    public abstract void zzz(int i5) throws zzauf;
}
