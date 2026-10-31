package com.google.android.libraries.places.internal;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes3.dex */
public abstract class zzask implements Iterable, Serializable {
    private static final Comparator zza;
    public static final zzask zzb = new zzash(zzaud.zzd);
    private static final zzasj zzd;
    private int zzc = 0;

    static {
        int i5 = zzarx.zza;
        zzd = new zzasj(null);
        zza = new zzasb();
    }

    public static int zzj(int i5, int i11, int i12) {
        int i13 = i11 - i5;
        if ((i5 | i11 | i13 | (i12 - i11)) >= 0) {
            return i13;
        }
        if (i5 < 0) {
            throw new IndexOutOfBoundsException(c0.i(i5, "Beginning index: ", " < 0"));
        }
        if (i11 < i5) {
            throw new IndexOutOfBoundsException(c0.g(i5, i11, "Beginning index larger than ending index: ", ", "));
        }
        throw new IndexOutOfBoundsException(c0.g(i11, i12, "End index: ", " >= "));
    }

    public static zzask zzl(byte[] bArr, int i5, int i11) {
        zzj(i5, i5 + i11, bArr.length);
        byte[] bArr2 = new byte[i11];
        System.arraycopy(bArr, i5, bArr2, 0, i11);
        return new zzash(bArr2);
    }

    public abstract boolean equals(Object obj);

    public final int hashCode() {
        int iZze = this.zzc;
        if (iZze == 0) {
            int iZzd = zzd();
            iZze = zze(iZzd, 0, iZzd);
            if (iZze == 0) {
                iZze = 1;
            }
            this.zzc = iZze;
        }
        return iZze;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new zzasa(this);
    }

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return c0.q(c0.v("<ByteString@", zzd(), hexString, " size=", " contents=\""), zzd() <= 50 ? zzawi.zza(this) : zzawi.zza(zzf(0, 47)).concat("..."), "\">");
    }

    public abstract byte zza(int i5);

    public abstract byte zzb(int i5);

    public abstract int zzd();

    public abstract int zze(int i5, int i11, int i12);

    public abstract zzask zzf(int i5, int i11);

    public abstract String zzg(Charset charset);

    public abstract void zzh(zzarz zzarzVar) throws IOException;

    public abstract boolean zzi();

    public final int zzk() {
        return this.zzc;
    }

    public final String zzm(Charset charset) {
        return zzd() == 0 ? b.f42142b : zzg(charset);
    }
}
