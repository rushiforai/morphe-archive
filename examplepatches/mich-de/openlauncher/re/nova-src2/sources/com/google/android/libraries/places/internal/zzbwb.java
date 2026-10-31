package com.google.android.libraries.places.internal;

import a80.m;
import b.c0;
import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.charset.Charset;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmName;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import u90.b;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbwb implements Cloneable, ByteChannel, zzbwd, zzbwc {

    @JvmField
    @Nullable
    public zzbwn zza;
    private long zzb;

    public final /* synthetic */ Object clone() {
        zzbwb zzbwbVar = new zzbwb();
        if (this.zzb == 0) {
            return zzbwbVar;
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        zzbwn zzbwnVarZzc = zzbwnVar.zzc();
        zzbwbVar.zza = zzbwnVarZzc;
        zzbwnVarZzc.zzh = zzbwnVarZzc;
        zzbwnVarZzc.zzg = zzbwnVarZzc;
        for (zzbwn zzbwnVar2 = zzbwnVar.zzg; zzbwnVar2 != zzbwnVar; zzbwnVar2 = zzbwnVar2.zzg) {
            zzbwn zzbwnVar3 = zzbwnVarZzc.zzh;
            Intrinsics.d(zzbwnVar3);
            Intrinsics.d(zzbwnVar2);
            zzbwnVar3.zzb(zzbwnVar2.zzc());
        }
        zzbwbVar.zzb = this.zzb;
        return zzbwbVar;
    }

    @Override // java.nio.channels.Channel, java.io.Closeable, java.lang.AutoCloseable, com.google.android.libraries.places.internal.zzbws
    public final void close() {
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzbwb)) {
            return false;
        }
        long j11 = this.zzb;
        zzbwb zzbwbVar = (zzbwb) obj;
        if (j11 != zzbwbVar.zzb) {
            return false;
        }
        if (j11 == 0) {
            return true;
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        zzbwn zzbwnVar2 = zzbwbVar.zza;
        Intrinsics.d(zzbwnVar2);
        int i5 = zzbwnVar.zzc;
        int i11 = zzbwnVar2.zzc;
        long j12 = 0;
        while (j12 < this.zzb) {
            long jMin = Math.min(zzbwnVar.zzd - i5, zzbwnVar2.zzd - i11);
            long j13 = 0;
            while (j13 < jMin) {
                int i12 = i5 + 1;
                int i13 = i11 + 1;
                if (zzbwnVar.zzb[i5] != zzbwnVar2.zzb[i11]) {
                    return false;
                }
                j13++;
                i5 = i12;
                i11 = i13;
            }
            if (i5 == zzbwnVar.zzd) {
                zzbwnVar = zzbwnVar.zzg;
                Intrinsics.d(zzbwnVar);
                i5 = zzbwnVar.zzc;
            }
            if (i11 == zzbwnVar2.zzd) {
                zzbwnVar2 = zzbwnVar2.zzg;
                Intrinsics.d(zzbwnVar2);
                i11 = zzbwnVar2.zzc;
            }
            j12 += jMin;
        }
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzbwc, com.google.android.libraries.places.internal.zzbwq, java.io.Flushable
    public final void flush() {
    }

    public final int hashCode() {
        zzbwn zzbwnVar = this.zza;
        if (zzbwnVar == null) {
            return 0;
        }
        int i5 = 1;
        do {
            int i11 = zzbwnVar.zzd;
            for (int i12 = zzbwnVar.zzc; i12 < i11; i12++) {
                i5 = (i5 * 31) + zzbwnVar.zzb[i12];
            }
            zzbwnVar = zzbwnVar.zzg;
            Intrinsics.d(zzbwnVar);
        } while (zzbwnVar != this.zza);
        return i5;
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return true;
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(@NotNull ByteBuffer sink) throws IOException {
        Intrinsics.g(sink, "sink");
        zzbwn zzbwnVar = this.zza;
        if (zzbwnVar == null) {
            return -1;
        }
        int iMin = Math.min(sink.remaining(), zzbwnVar.zzd - zzbwnVar.zzc);
        sink.put(zzbwnVar.zzb, zzbwnVar.zzc, iMin);
        int i5 = zzbwnVar.zzc + iMin;
        zzbwnVar.zzc = i5;
        this.zzb -= iMin;
        if (i5 == zzbwnVar.zzd) {
            this.zza = zzbwnVar.zza();
            zzbwo.zzb(zzbwnVar);
        }
        return iMin;
    }

    @NotNull
    public final String toString() {
        return zzz().toString();
    }

    @Override // java.nio.channels.WritableByteChannel
    public final int write(@NotNull ByteBuffer source) throws IOException {
        Intrinsics.g(source, "source");
        int iRemaining = source.remaining();
        int i5 = iRemaining;
        while (i5 > 0) {
            zzbwn zzbwnVarZzB = zzB(1);
            int iMin = Math.min(i5, 8192 - zzbwnVarZzB.zzd);
            source.get(zzbwnVarZzB.zzb, zzbwnVarZzB.zzd, iMin);
            i5 -= iMin;
            zzbwnVarZzB.zzd += iMin;
        }
        this.zzb += iRemaining;
        return iRemaining;
    }

    @NotNull
    public final zzbwf zzA(int i5) {
        if (i5 == 0) {
            return zzbwf.zzb;
        }
        zzbvv.zzb(this.zzb, 0L, i5);
        zzbwn zzbwnVar = this.zza;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i12 < i5) {
            Intrinsics.d(zzbwnVar);
            int i14 = zzbwnVar.zzd;
            int i15 = zzbwnVar.zzc;
            if (i14 == i15) {
                throw new AssertionError("s.limit == s.pos");
            }
            i12 += i14 - i15;
            i13++;
            zzbwnVar = zzbwnVar.zzg;
        }
        byte[][] bArr = new byte[i13][];
        int[] iArr = new int[i13 + i13];
        zzbwn zzbwnVar2 = this.zza;
        int i16 = 0;
        while (i11 < i5) {
            Intrinsics.d(zzbwnVar2);
            bArr[i16] = zzbwnVar2.zzb;
            i11 += zzbwnVar2.zzd - zzbwnVar2.zzc;
            iArr[i16] = Math.min(i11, i5);
            iArr[i16 + i13] = zzbwnVar2.zzc;
            zzbwnVar2.zze = true;
            i16++;
            zzbwnVar2 = zzbwnVar2.zzg;
        }
        return new zzbwp(bArr, iArr);
    }

    @NotNull
    public final zzbwn zzB(int i5) {
        if (i5 <= 0) {
            throw new IllegalArgumentException("unexpected capacity");
        }
        zzbwn zzbwnVar = this.zza;
        if (zzbwnVar == null) {
            zzbwn zzbwnVarZza = zzbwo.zza();
            this.zza = zzbwnVarZza;
            zzbwnVarZza.zzh = zzbwnVarZza;
            zzbwnVarZza.zzg = zzbwnVarZza;
            return zzbwnVarZza;
        }
        zzbwn zzbwnVar2 = zzbwnVar.zzh;
        Intrinsics.d(zzbwnVar2);
        if (zzbwnVar2.zzd + i5 <= 8192 && zzbwnVar2.zzf) {
            return zzbwnVar2;
        }
        zzbwn zzbwnVarZza2 = zzbwo.zza();
        zzbwnVar2.zzb(zzbwnVarZza2);
        return zzbwnVarZza2;
    }

    public final short zzC() throws EOFException {
        int iZzc;
        if (this.zzb < 2) {
            throw new EOFException(null);
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        int i5 = zzbwnVar.zzc;
        int i11 = zzbwnVar.zzd;
        if (i11 - i5 < 2) {
            iZzc = ((zzc() & 255) << 8) | (zzc() & 255);
        } else {
            byte[] bArr = zzbwnVar.zzb;
            int i12 = (bArr[i5] & 255) << 8;
            int i13 = bArr[i5 + 1] & 255;
            this.zzb -= 2;
            int i14 = i5 + 2;
            if (i14 == i11) {
                this.zza = zzbwnVar.zza();
                zzbwo.zzb(zzbwnVar);
            } else {
                zzbwnVar.zzc = i14;
            }
            iZzc = i12 | i13;
        }
        return (short) iZzc;
    }

    @Override // com.google.android.libraries.places.internal.zzbwd
    public final void zzD(long j11) throws EOFException {
        throw null;
    }

    public final void zzE(long j11) {
        this.zzb = j11;
    }

    @Override // com.google.android.libraries.places.internal.zzbwd
    public final void zzF(long j11) throws EOFException {
        while (j11 > 0) {
            zzbwn zzbwnVar = this.zza;
            if (zzbwnVar == null) {
                throw new EOFException(null);
            }
            int iMin = (int) Math.min(j11, zzbwnVar.zzd - zzbwnVar.zzc);
            long j12 = iMin;
            this.zzb -= j12;
            j11 -= j12;
            int i5 = zzbwnVar.zzc + iMin;
            zzbwnVar.zzc = i5;
            if (i5 == zzbwnVar.zzd) {
                this.zza = zzbwnVar.zza();
                zzbwo.zzb(zzbwnVar);
            }
        }
    }

    public final boolean zzG() {
        return this.zzb == 0;
    }

    @NotNull
    public final byte[] zzH(long j11) throws EOFException {
        if (j11 < 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: "));
        }
        if (this.zzb < j11) {
            throw new EOFException(null);
        }
        int i5 = (int) j11;
        byte[] bArr = new byte[i5];
        int i11 = 0;
        while (i11 < i5) {
            int iZzd = zzd(bArr, i11, i5 - i11);
            if (iZzd == -1) {
                throw new EOFException(null);
            }
            i11 += iZzd;
        }
        return bArr;
    }

    @Override // com.google.android.libraries.places.internal.zzbws
    public final long zza(@NotNull zzbwb sink, long j11) {
        Intrinsics.g(sink, "sink");
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: "));
        }
        long j12 = this.zzb;
        if (j12 == 0) {
            return -1L;
        }
        if (j11 > j12) {
            j11 = j12;
        }
        sink.zzn(this, j11);
        return j11;
    }

    @JvmName
    public final byte zzb(long j11) {
        zzbvv.zzb(this.zzb, j11, 1L);
        zzbwn zzbwnVar = this.zza;
        if (zzbwnVar == null) {
            Intrinsics.d(null);
            throw null;
        }
        long j12 = this.zzb;
        if (j12 - j11 < j11) {
            while (j12 > j11) {
                zzbwnVar = zzbwnVar.zzh;
                Intrinsics.d(zzbwnVar);
                j12 -= zzbwnVar.zzd - zzbwnVar.zzc;
            }
            return zzbwnVar.zzb[(int) ((zzbwnVar.zzc + j11) - j12)];
        }
        long j13 = 0;
        while (true) {
            int i5 = zzbwnVar.zzd;
            int i11 = zzbwnVar.zzc;
            long j14 = (i5 - i11) + j13;
            if (j14 > j11) {
                return zzbwnVar.zzb[(int) ((i11 + j11) - j13)];
            }
            zzbwnVar = zzbwnVar.zzg;
            Intrinsics.d(zzbwnVar);
            j13 = j14;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbwd
    public final byte zzc() throws EOFException {
        if (this.zzb == 0) {
            throw new EOFException(null);
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        int i5 = zzbwnVar.zzc;
        int i11 = zzbwnVar.zzd;
        int i12 = i5 + 1;
        byte b11 = zzbwnVar.zzb[i5];
        this.zzb--;
        if (i12 != i11) {
            zzbwnVar.zzc = i12;
            return b11;
        }
        this.zza = zzbwnVar.zza();
        zzbwo.zzb(zzbwnVar);
        return b11;
    }

    public final int zzd(@NotNull byte[] sink, int i5, int i11) {
        Intrinsics.g(sink, "sink");
        zzbvv.zzb(sink.length, i5, i11);
        zzbwn zzbwnVar = this.zza;
        if (zzbwnVar == null) {
            return -1;
        }
        int iMin = Math.min(i11, zzbwnVar.zzd - zzbwnVar.zzc);
        int i12 = zzbwnVar.zzc;
        b.q(zzbwnVar.zzb, i5, sink, i12, i12 + iMin);
        int i13 = zzbwnVar.zzc + iMin;
        zzbwnVar.zzc = i13;
        this.zzb -= iMin;
        if (i13 != zzbwnVar.zzd) {
            return iMin;
        }
        this.zza = zzbwnVar.zza();
        zzbwo.zzb(zzbwnVar);
        return iMin;
    }

    @Override // com.google.android.libraries.places.internal.zzbwd
    public final int zze() throws EOFException {
        if (this.zzb < 4) {
            throw new EOFException(null);
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        int i5 = zzbwnVar.zzc;
        int i11 = zzbwnVar.zzd;
        if (i11 - i5 < 4) {
            return ((zzc() & 255) << 24) | ((zzc() & 255) << 16) | ((zzc() & 255) << 8) | (zzc() & 255);
        }
        byte[] bArr = zzbwnVar.zzb;
        int i12 = (bArr[i5] & 255) << 24;
        int i13 = (bArr[i5 + 1] & 255) << 16;
        int i14 = (bArr[i5 + 2] & 255) << 8;
        this.zzb -= 4;
        int i15 = (bArr[i5 + 3] & 255) | i13 | i12 | i14;
        int i16 = i5 + 4;
        if (i16 != i11) {
            zzbwnVar.zzc = i16;
            return i15;
        }
        this.zza = zzbwnVar.zza();
        zzbwo.zzb(zzbwnVar);
        return i15;
    }

    public final long zzf() {
        long j11 = this.zzb;
        if (j11 == 0) {
            return 0L;
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        zzbwn zzbwnVar2 = zzbwnVar.zzh;
        Intrinsics.d(zzbwnVar2);
        return (zzbwnVar2.zzd >= 8192 || !zzbwnVar2.zzf) ? j11 : j11 - (r3 - zzbwnVar2.zzc);
    }

    @JvmName
    public final long zzg() {
        return this.zzb;
    }

    @NotNull
    public final String zzh(long j11, @NotNull Charset charset) throws EOFException {
        Intrinsics.g(charset, "charset");
        if (j11 < 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: "));
        }
        if (this.zzb < j11) {
            throw new EOFException();
        }
        if (j11 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        zzbwn zzbwnVar = this.zza;
        Intrinsics.d(zzbwnVar);
        int i5 = zzbwnVar.zzc;
        int i11 = zzbwnVar.zzd;
        if (i5 + j11 > i11) {
            return new String(zzH(j11), charset);
        }
        int i12 = (int) j11;
        String str = new String(zzbwnVar.zzb, i5, i12, charset);
        int i13 = i5 + i12;
        zzbwnVar.zzc = i13;
        this.zzb -= j11;
        if (i13 == i11) {
            this.zza = zzbwnVar.zza();
            zzbwo.zzb(zzbwnVar);
        }
        return str;
    }

    @NotNull
    public final String zzi() {
        return zzh(this.zzb, Charsets.f72000b);
    }

    @NotNull
    public final String zzj(long j11) throws EOFException {
        zzbwn zzbwnVar;
        long j12;
        long j13;
        long j14;
        long j15;
        long j16 = this.zzb;
        long j17 = j16 < Long.MAX_VALUE ? j16 : Long.MAX_VALUE;
        long j18 = 0;
        if (j17 == 0 || (zzbwnVar = this.zza) == null) {
            j12 = 0;
            j15 = -1;
            j13 = -1;
        } else if (j16 < 0) {
            while (j16 > 0) {
                zzbwnVar = zzbwnVar.zzh;
                Intrinsics.d(zzbwnVar);
                j16 -= zzbwnVar.zzd - zzbwnVar.zzc;
            }
            long j19 = 0;
            loop3: while (j16 < j17) {
                byte[] bArr = zzbwnVar.zzb;
                j12 = j18;
                j13 = -1;
                int iMin = (int) Math.min(zzbwnVar.zzd, (zzbwnVar.zzc + j17) - j16);
                for (int i5 = (int) ((zzbwnVar.zzc + j19) - j16); i5 < iMin; i5++) {
                    if (bArr[i5] == 10) {
                        j14 = i5 - zzbwnVar.zzc;
                        j15 = j14 + j16;
                        break loop3;
                    }
                }
                j19 = j16 + (zzbwnVar.zzd - zzbwnVar.zzc);
                zzbwnVar = zzbwnVar.zzg;
                Intrinsics.d(zzbwnVar);
                j18 = j12;
                j16 = j19;
            }
            j12 = j18;
            j13 = -1;
            j15 = j13;
        } else {
            j12 = 0;
            j13 = -1;
            j16 = 0;
            while (true) {
                long j21 = (zzbwnVar.zzd - zzbwnVar.zzc) + j16;
                if (j21 > 0) {
                    break;
                }
                zzbwnVar = zzbwnVar.zzg;
                Intrinsics.d(zzbwnVar);
                j16 = j21;
            }
            long j22 = 0;
            loop6: while (j16 < j17) {
                byte[] bArr2 = zzbwnVar.zzb;
                int iMin2 = (int) Math.min(zzbwnVar.zzd, (zzbwnVar.zzc + j17) - j16);
                for (int i11 = (int) ((zzbwnVar.zzc + j22) - j16); i11 < iMin2; i11++) {
                    if (bArr2[i11] == 10) {
                        j14 = i11 - zzbwnVar.zzc;
                        j15 = j14 + j16;
                        break loop3;
                    }
                }
                j22 = (zzbwnVar.zzd - zzbwnVar.zzc) + j16;
                zzbwnVar = zzbwnVar.zzg;
                Intrinsics.d(zzbwnVar);
                j16 = j22;
            }
            j15 = j13;
        }
        if (j15 != j13) {
            int i12 = zzbwx.zza;
            if (j15 > j12) {
                long j23 = j15 + j13;
                if (zzb(j23) == 13) {
                    String strZzh = zzh(j23, Charsets.f72000b);
                    zzF(2L);
                    return strZzh;
                }
            }
            String strZzh2 = zzh(j15, Charsets.f72000b);
            zzF(1L);
            return strZzh2;
        }
        zzbwb zzbwbVar = new zzbwb();
        long jMin = Math.min(32L, this.zzb);
        zzbvv.zzb(this.zzb, 0L, jMin);
        if (jMin != j12) {
            zzbwbVar.zzb += jMin;
            zzbwn zzbwnVar2 = this.zza;
            long j24 = j12;
            while (true) {
                Intrinsics.d(zzbwnVar2);
                long j25 = zzbwnVar2.zzd - zzbwnVar2.zzc;
                if (j24 < j25) {
                    break;
                }
                zzbwnVar2 = zzbwnVar2.zzg;
                j24 -= j25;
            }
            while (jMin > j12) {
                Intrinsics.d(zzbwnVar2);
                zzbwn zzbwnVarZzc = zzbwnVar2.zzc();
                int i13 = zzbwnVarZzc.zzc + ((int) j24);
                zzbwnVarZzc.zzc = i13;
                zzbwnVarZzc.zzd = Math.min(i13 + ((int) jMin), zzbwnVarZzc.zzd);
                zzbwn zzbwnVar3 = zzbwbVar.zza;
                if (zzbwnVar3 == null) {
                    zzbwnVarZzc.zzh = zzbwnVarZzc;
                    zzbwnVarZzc.zzg = zzbwnVarZzc;
                    zzbwbVar.zza = zzbwnVarZzc;
                } else {
                    zzbwn zzbwnVar4 = zzbwnVar3.zzh;
                    Intrinsics.d(zzbwnVar4);
                    zzbwnVar4.zzb(zzbwnVarZzc);
                }
                jMin -= zzbwnVarZzc.zzd - zzbwnVarZzc.zzc;
                zzbwnVar2 = zzbwnVar2.zzg;
                j24 = j12;
            }
        }
        StringBuilder sbL = m.l(Math.min(this.zzb, Long.MAX_VALUE), "\\n not found: limit=", " content=", zzbwbVar.zzy(zzbwbVar.zzb).zze());
        sbL.append("…");
        throw new EOFException(sbL.toString());
    }

    @NotNull
    public final zzbwb zzk(@NotNull zzbwf byteString) {
        Intrinsics.g(byteString, "byteString");
        byteString.zzj(this, 0, byteString.zzc());
        return this;
    }

    @NotNull
    public final zzbwb zzl(@NotNull byte[] source, int i5, int i11) {
        Intrinsics.g(source, "source");
        long j11 = i11;
        zzbvv.zzb(source.length, i5, j11);
        int i12 = i5;
        while (true) {
            int i13 = i5 + i11;
            if (i12 >= i13) {
                this.zzb += j11;
                return this;
            }
            zzbwn zzbwnVarZzB = zzB(1);
            int iMin = Math.min(i13 - i12, 8192 - zzbwnVarZzB.zzd);
            int i14 = i12 + iMin;
            b.q(source, zzbwnVarZzB.zzd, zzbwnVarZzB.zzb, i12, i14);
            zzbwnVarZzB.zzd += iMin;
            i12 = i14;
        }
    }

    @NotNull
    public final zzbwb zzm(int i5) {
        zzbwn zzbwnVarZzB = zzB(1);
        byte[] bArr = zzbwnVarZzB.zzb;
        int i11 = zzbwnVarZzB.zzd;
        zzbwnVarZzB.zzd = i11 + 1;
        bArr[i11] = (byte) i5;
        this.zzb++;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzbwq
    public final void zzn(@NotNull zzbwb source, long j11) {
        Intrinsics.g(source, "source");
        if (source == this) {
            throw new IllegalArgumentException("source == this");
        }
        zzbvv.zzb(source.zzb, 0L, j11);
        while (j11 > 0) {
            zzbwn zzbwnVar = source.zza;
            Intrinsics.d(zzbwnVar);
            int i5 = zzbwnVar.zzd;
            zzbwn zzbwnVar2 = source.zza;
            Intrinsics.d(zzbwnVar2);
            long j12 = i5 - zzbwnVar2.zzc;
            int i11 = 0;
            if (j11 < j12) {
                zzbwn zzbwnVar3 = this.zza;
                zzbwn zzbwnVar4 = zzbwnVar3 != null ? zzbwnVar3.zzh : null;
                int i12 = (int) j11;
                if (zzbwnVar4 != null && zzbwnVar4.zzf) {
                    if ((zzbwnVar4.zzd + j11) - (zzbwnVar4.zze ? 0 : zzbwnVar4.zzc) <= 8192) {
                        zzbwn zzbwnVar5 = source.zza;
                        Intrinsics.d(zzbwnVar5);
                        zzbwnVar5.zze(zzbwnVar4, i12);
                        source.zzb -= j11;
                        this.zzb += j11;
                        return;
                    }
                }
                zzbwn zzbwnVar6 = source.zza;
                Intrinsics.d(zzbwnVar6);
                source.zza = zzbwnVar6.zzd(i12);
            }
            zzbwn zzbwnVar7 = source.zza;
            Intrinsics.d(zzbwnVar7);
            int i13 = zzbwnVar7.zzd - zzbwnVar7.zzc;
            source.zza = zzbwnVar7.zza();
            zzbwn zzbwnVar8 = this.zza;
            if (zzbwnVar8 == null) {
                this.zza = zzbwnVar7;
                zzbwnVar7.zzh = zzbwnVar7;
                zzbwnVar7.zzg = zzbwnVar7;
            } else {
                zzbwn zzbwnVar9 = zzbwnVar8.zzh;
                Intrinsics.d(zzbwnVar9);
                zzbwnVar9.zzb(zzbwnVar7);
                zzbwn zzbwnVar10 = zzbwnVar7.zzh;
                if (zzbwnVar10 == zzbwnVar7) {
                    throw new IllegalStateException("cannot compact");
                }
                Intrinsics.d(zzbwnVar10);
                if (zzbwnVar10.zzf) {
                    int i14 = zzbwnVar7.zzd - zzbwnVar7.zzc;
                    zzbwn zzbwnVar11 = zzbwnVar7.zzh;
                    Intrinsics.d(zzbwnVar11);
                    int i15 = 8192 - zzbwnVar11.zzd;
                    zzbwn zzbwnVar12 = zzbwnVar7.zzh;
                    Intrinsics.d(zzbwnVar12);
                    if (!zzbwnVar12.zze) {
                        zzbwn zzbwnVar13 = zzbwnVar7.zzh;
                        Intrinsics.d(zzbwnVar13);
                        i11 = zzbwnVar13.zzc;
                    }
                    if (i14 <= i15 + i11) {
                        zzbwn zzbwnVar14 = zzbwnVar7.zzh;
                        Intrinsics.d(zzbwnVar14);
                        zzbwnVar7.zze(zzbwnVar14, i14);
                        zzbwnVar7.zza();
                        zzbwo.zzb(zzbwnVar7);
                    }
                }
            }
            long j13 = i13;
            source.zzb -= j13;
            this.zzb += j13;
            j11 -= j13;
        }
    }

    @NotNull
    public final zzbwb zzo(long j11) {
        if (j11 == 0) {
            zzm(48);
            return this;
        }
        long j12 = (j11 >>> 1) | j11;
        long j13 = j12 | (j12 >>> 2);
        long j14 = j13 | (j13 >>> 4);
        long j15 = j14 | (j14 >>> 8);
        long j16 = j15 - ((j15 >>> 1) & 6148914691236517205L);
        long j17 = ((j16 >>> 2) & 3689348814741910323L) + (j16 & 3689348814741910323L);
        long j18 = ((j17 >>> 4) + j17) & 1085102592571150095L;
        long j19 = j18 + (j18 >>> 8);
        long j21 = j19 + (j19 >>> 16);
        int i5 = (int) ((((j21 & 63) + ((j21 >>> 32) & 63)) + 3) >> 2);
        zzbwn zzbwnVarZzB = zzB(i5);
        byte[] bArr = zzbwnVarZzB.zzb;
        int i11 = zzbwnVarZzB.zzd;
        int i12 = i11 + i5;
        while (true) {
            i12--;
            if (i12 < i11) {
                zzbwnVarZzB.zzd += i5;
                this.zzb += i5;
                return this;
            }
            bArr[i12] = zzbwx.zza()[(int) (15 & j11)];
            j11 >>>= 4;
        }
    }

    @NotNull
    public final zzbwb zzp(int i5) {
        zzbwn zzbwnVarZzB = zzB(4);
        byte[] bArr = zzbwnVarZzB.zzb;
        int i11 = zzbwnVarZzB.zzd;
        bArr[i11] = (byte) (i5 >> 24);
        bArr[i11 + 1] = (byte) ((i5 >>> 16) & 255);
        bArr[i11 + 2] = (byte) ((i5 >>> 8) & 255);
        bArr[i11 + 3] = (byte) (i5 & 255);
        zzbwnVarZzB.zzd = i11 + 4;
        this.zzb += 4;
        return this;
    }

    @NotNull
    public final zzbwb zzq(int i5) {
        zzbwn zzbwnVarZzB = zzB(2);
        byte[] bArr = zzbwnVarZzB.zzb;
        int i11 = zzbwnVarZzB.zzd;
        bArr[i11] = (byte) ((i5 >>> 8) & 255);
        bArr[i11 + 1] = (byte) (i5 & 255);
        zzbwnVarZzB.zzd = i11 + 2;
        this.zzb += 2;
        return this;
    }

    @JvmOverloads
    @NotNull
    public final zzbwb zzr(@NotNull OutputStream out, long j11) throws IOException {
        Intrinsics.g(out, "out");
        zzbvv.zzb(this.zzb, 0L, j11);
        zzbwn zzbwnVar = this.zza;
        long j12 = j11;
        while (j12 > 0) {
            Intrinsics.d(zzbwnVar);
            int iMin = (int) Math.min(j12, zzbwnVar.zzd - zzbwnVar.zzc);
            out.write(zzbwnVar.zzb, zzbwnVar.zzc, iMin);
            int i5 = zzbwnVar.zzc + iMin;
            zzbwnVar.zzc = i5;
            long j13 = iMin;
            this.zzb -= j13;
            j12 -= j13;
            if (i5 == zzbwnVar.zzd) {
                zzbwn zzbwnVarZza = zzbwnVar.zza();
                this.zza = zzbwnVarZza;
                zzbwo.zzb(zzbwnVar);
                zzbwnVar = zzbwnVarZza;
            }
        }
        return this;
    }

    @NotNull
    public final zzbwb zzs(@NotNull String string) {
        Intrinsics.g(string, "string");
        zzt(string, 0, string.length());
        return this;
    }

    @NotNull
    public final zzbwb zzt(@NotNull String string, int i5, int i11) {
        Intrinsics.g(string, "string");
        if (i11 < 0) {
            throw new IllegalArgumentException(c0.i(i11, "endIndex < beginIndex: ", " < 0"));
        }
        if (i11 > string.length()) {
            throw new IllegalArgumentException(c0.g(i11, string.length(), "endIndex > string.length: ", " > "));
        }
        int i12 = 0;
        while (i12 < i11) {
            int i13 = i12 + 1;
            char cCharAt = string.charAt(i12);
            if (cCharAt < 128) {
                zzbwn zzbwnVarZzB = zzB(1);
                byte[] bArr = zzbwnVarZzB.zzb;
                int i14 = zzbwnVarZzB.zzd - i12;
                int iMin = Math.min(i11, 8192 - i14);
                bArr[i12 + i14] = (byte) cCharAt;
                i12 = i13;
                while (i12 < iMin) {
                    char cCharAt2 = string.charAt(i12);
                    if (cCharAt2 >= 128) {
                        break;
                    }
                    bArr[i12 + i14] = (byte) cCharAt2;
                    i12++;
                }
                int i15 = zzbwnVarZzB.zzd;
                int i16 = (i14 + i12) - i15;
                zzbwnVarZzB.zzd = i15 + i16;
                this.zzb += i16;
            } else {
                if (cCharAt < 2048) {
                    zzbwn zzbwnVarZzB2 = zzB(2);
                    byte[] bArr2 = zzbwnVarZzB2.zzb;
                    int i17 = zzbwnVarZzB2.zzd;
                    bArr2[i17] = (byte) ((cCharAt >> 6) | 192);
                    bArr2[i17 + 1] = (byte) ((cCharAt & '?') | 128);
                    zzbwnVarZzB2.zzd = i17 + 2;
                    this.zzb += 2;
                } else if (cCharAt < 55296 || cCharAt > 57343) {
                    zzbwn zzbwnVarZzB3 = zzB(3);
                    byte[] bArr3 = zzbwnVarZzB3.zzb;
                    int i18 = zzbwnVarZzB3.zzd;
                    bArr3[i18] = (byte) ((cCharAt >> '\f') | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
                    bArr3[i18 + 1] = (byte) ((63 & (cCharAt >> 6)) | 128);
                    bArr3[i18 + 2] = (byte) ((cCharAt & '?') | 128);
                    zzbwnVarZzB3.zzd = i18 + 3;
                    this.zzb += 3;
                } else {
                    char cCharAt3 = i13 < i11 ? string.charAt(i13) : (char) 0;
                    if (cCharAt > 56319 || cCharAt3 < 56320 || cCharAt3 >= 57344) {
                        zzm(63);
                    } else {
                        zzbwn zzbwnVarZzB4 = zzB(4);
                        byte[] bArr4 = zzbwnVarZzB4.zzb;
                        int i19 = zzbwnVarZzB4.zzd;
                        int i21 = (((cCharAt & 1023) << 10) | (cCharAt3 & 1023)) + SQLiteDatabase.OPEN_FULLMUTEX;
                        bArr4[i19] = (byte) ((i21 >> 18) | 240);
                        bArr4[i19 + 1] = (byte) (((i21 >> 12) & 63) | 128);
                        bArr4[i19 + 2] = (byte) (((i21 >> 6) & 63) | 128);
                        bArr4[i19 + 3] = (byte) ((i21 & 63) | 128);
                        zzbwnVarZzB4.zzd = i19 + 4;
                        this.zzb += 4;
                        i12 += 2;
                    }
                }
                i12 = i13;
            }
        }
        return this;
    }

    @NotNull
    public final zzbwb zzu(int i5) {
        if (i5 < 128) {
            zzm(i5);
            return this;
        }
        if (i5 < 2048) {
            zzbwn zzbwnVarZzB = zzB(2);
            byte[] bArr = zzbwnVarZzB.zzb;
            int i11 = zzbwnVarZzB.zzd;
            bArr[i11] = (byte) ((i5 >> 6) | 192);
            bArr[i11 + 1] = (byte) ((i5 & 63) | 128);
            zzbwnVarZzB.zzd = i11 + 2;
            this.zzb += 2;
            return this;
        }
        if (i5 >= 55296 && i5 < 57344) {
            zzm(63);
            return this;
        }
        if (i5 < 65536) {
            zzbwn zzbwnVarZzB2 = zzB(3);
            byte[] bArr2 = zzbwnVarZzB2.zzb;
            int i12 = zzbwnVarZzB2.zzd;
            bArr2[i12] = (byte) ((i5 >> 12) | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
            bArr2[i12 + 1] = (byte) (((i5 >> 6) & 63) | 128);
            bArr2[i12 + 2] = (byte) ((i5 & 63) | 128);
            zzbwnVarZzB2.zzd = i12 + 3;
            this.zzb += 3;
            return this;
        }
        if (i5 > 1114111) {
            throw new IllegalArgumentException("Unexpected code point: 0x".concat(String.valueOf(zzbvv.zza(i5))));
        }
        zzbwn zzbwnVarZzB3 = zzB(4);
        byte[] bArr3 = zzbwnVarZzB3.zzb;
        int i13 = zzbwnVarZzB3.zzd;
        bArr3[i13] = (byte) ((i5 >> 18) | 240);
        bArr3[i13 + 1] = (byte) (((i5 >> 12) & 63) | 128);
        bArr3[i13 + 2] = (byte) (((i5 >> 6) & 63) | 128);
        bArr3[i13 + 3] = (byte) ((i5 & 63) | 128);
        zzbwnVarZzB3.zzd = i13 + 4;
        this.zzb += 4;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzbwc
    public final /* bridge */ /* synthetic */ zzbwc zzv(int i5) {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbwc
    public final /* bridge */ /* synthetic */ zzbwc zzw(int i5) {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbwc
    public final /* bridge */ /* synthetic */ zzbwc zzx(String str) {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbwd
    @NotNull
    public final zzbwf zzy(long j11) throws EOFException {
        if (j11 < 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: "));
        }
        if (this.zzb < j11) {
            throw new EOFException(null);
        }
        if (j11 < 4096) {
            return new zzbwf(zzH(j11));
        }
        zzbwf zzbwfVarZzA = zzA((int) j11);
        zzF(j11);
        return zzbwfVarZzA;
    }

    @NotNull
    public final zzbwf zzz() {
        long j11 = this.zzb;
        if (j11 <= 2147483647L) {
            return zzA((int) j11);
        }
        throw new IllegalStateException(u4.g(j11, "size > Int.MAX_VALUE: "));
    }
}
