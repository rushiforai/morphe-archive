package com.google.android.libraries.places.internal;

import b.c0;
import java.io.Serializable;
import java.util.Arrays;
import kotlin.Unit;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import u90.b;

@SourceDebugExtension
/* loaded from: classes3.dex */
public class zzbwf implements Serializable, Comparable {

    @NotNull
    public static final zzbwe zza = new zzbwe(null);

    @JvmField
    @NotNull
    public static final zzbwf zzb = new zzbwf(new byte[0]);

    @NotNull
    private final byte[] zzc;
    private transient int zzd;

    @Nullable
    private transient String zze;

    public zzbwf(@NotNull byte[] data) {
        Intrinsics.g(data, "data");
        this.zzc = data;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        zzbwf other = (zzbwf) obj;
        Intrinsics.g(other, "other");
        int iZzc = zzc();
        int iZzc2 = other.zzc();
        int iMin = Math.min(iZzc, iZzc2);
        for (int i5 = 0; i5 < iMin; i5++) {
            int iZza = zza(i5) & 255;
            int iZza2 = other.zza(i5) & 255;
            if (iZza != iZza2) {
                return iZza >= iZza2 ? 1 : -1;
            }
        }
        if (iZzc == iZzc2) {
            return 0;
        }
        return iZzc >= iZzc2 ? 1 : -1;
    }

    public boolean equals(@Nullable Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzbwf) {
            zzbwf zzbwfVar = (zzbwf) obj;
            int iZzc = zzbwfVar.zzc();
            byte[] bArr = this.zzc;
            int length = bArr.length;
            return iZzc == length && zzbwfVar.zzl(0, bArr, 0, length);
        }
        return false;
    }

    public int hashCode() {
        int i5 = this.zzd;
        if (i5 != 0) {
            return i5;
        }
        int iHashCode = Arrays.hashCode(this.zzc);
        this.zzd = iHashCode;
        return iHashCode;
    }

    /* JADX WARN: Code restructure failed: missing block: B:177:0x004d, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0029, code lost:
    
        r6 = -1;
     */
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String toString() {
        int i5;
        byte[] bArr = this.zzc;
        int length = bArr.length;
        if (length == 0) {
            return "[size=0]";
        }
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        loop0: while (true) {
            if (i11 >= length) {
                break;
            }
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                i5 = i12 + 1;
                if (i12 == 64) {
                    break;
                }
                if (b11 != 10 && b11 != 13 && (b11 < 32 || b11 >= 127)) {
                    break;
                }
                i13++;
                i11++;
                while (i11 < length) {
                    byte b12 = bArr[i11];
                    if (b12 >= 0) {
                        i11++;
                        int i14 = i5 + 1;
                        if (i5 != 64) {
                            if (b12 != 10 && b12 != 13 && (b12 < 32 || b12 >= 127)) {
                                break loop0;
                            }
                            i13++;
                            i5 = i14;
                        } else {
                            break loop0;
                        }
                    }
                }
                i12 = i5;
            } else if ((b11 >> 5) == -2) {
                int i15 = i11 + 1;
                if (length > i15) {
                    byte b13 = bArr[i15];
                    if ((b13 & 192) == 128) {
                        int i16 = (b11 << 6) ^ (b13 ^ 3968);
                        if (i16 >= 128) {
                            i5 = i12 + 1;
                            if (i12 != 64) {
                                if (i16 < 160 || i16 == 65533) {
                                    break;
                                }
                                i11 += 2;
                                i13 += i16 < 65536 ? 1 : 2;
                                Unit unit = Unit.f71706a;
                                i12 = i5;
                            } else {
                                break;
                            }
                        } else if (i12 != 64) {
                            break;
                        }
                    } else if (i12 != 64) {
                        break;
                    }
                } else if (i12 != 64) {
                    break;
                }
            } else if ((b11 >> 4) == -2) {
                int i17 = i11 + 2;
                if (length > i17) {
                    byte b14 = bArr[i11 + 1];
                    if ((b14 & 192) == 128) {
                        byte b15 = bArr[i17];
                        if ((b15 & 192) == 128) {
                            int i18 = ((b15 ^ (-123008)) ^ (b14 << 6)) ^ (b11 << 12);
                            if (i18 < 2048) {
                                if (i12 != 64) {
                                    break;
                                }
                            } else if (i18 < 55296 || i18 >= 57344) {
                                i5 = i12 + 1;
                                if (i12 == 64) {
                                    break;
                                }
                                if (i18 == 65533) {
                                    break;
                                }
                                i11 += 3;
                                i13 += i18 < 65536 ? 1 : 2;
                                Unit unit2 = Unit.f71706a;
                                i12 = i5;
                            } else if (i12 != 64) {
                                break;
                            }
                        } else if (i12 != 64) {
                            break;
                        }
                    } else if (i12 != 64) {
                        break;
                    }
                } else if (i12 != 64) {
                    break;
                }
            } else if ((b11 >> 3) == -2) {
                int i19 = i11 + 3;
                if (length > i19) {
                    byte b16 = bArr[i11 + 1];
                    if ((b16 & 192) == 128) {
                        byte b17 = bArr[i11 + 2];
                        if ((b17 & 192) == 128) {
                            byte b18 = bArr[i19];
                            if ((b18 & 192) == 128) {
                                int i21 = (((b18 ^ 3678080) ^ (b17 << 6)) ^ (b16 << 12)) ^ (b11 << 18);
                                if (i21 > 1114111) {
                                    if (i12 != 64) {
                                        break;
                                    }
                                } else if (i21 < 55296 || i21 >= 57344) {
                                    if (i21 >= 65536) {
                                        i5 = i12 + 1;
                                        if (i12 == 64) {
                                            break;
                                        }
                                        i13 += 2;
                                        Unit unit3 = Unit.f71706a;
                                        i11 += 4;
                                        i12 = i5;
                                    } else if (i12 != 64) {
                                        break;
                                    }
                                } else if (i12 != 64) {
                                    break;
                                }
                            } else if (i12 != 64) {
                                break;
                            }
                        } else if (i12 != 64) {
                            break;
                        }
                    } else if (i12 != 64) {
                        break;
                    }
                } else if (i12 != 64) {
                    break;
                }
            } else if (i12 != 64) {
                break;
            }
        }
        if (i13 != -1) {
            String strZzf = zzf();
            String strSubstring = strZzf.substring(0, i13);
            Intrinsics.f(strSubstring, "substring(...)");
            String strF0 = j.F0(j.F0(j.F0(strSubstring, "\\", "\\\\", false), "\n", "\\n", false), "\r", "\\r", false);
            if (i13 >= strZzf.length()) {
                return c0.l("[text=", strF0, "]");
            }
            return "[size=" + this.zzc.length + " text=" + strF0 + "…]";
        }
        byte[] bArr2 = this.zzc;
        int length2 = bArr2.length;
        if (length2 <= 64) {
            return c0.l("[hex=", zze(), "]");
        }
        int length3 = bArr2.length;
        if (length3 < 64) {
            throw new IllegalArgumentException(c0.i(length3, "endIndex > length(", ")"));
        }
        return "[size=" + length2 + " hex=" + (length3 != 64 ? new zzbwf(b.x(0, 64, bArr2)) : this).zze() + "…]";
    }

    public byte zza(int i5) {
        return this.zzc[i5];
    }

    public final int zzb() {
        return this.zzd;
    }

    public int zzc() {
        return this.zzc.length;
    }

    @NotNull
    public final String zzd() {
        return zzbvu.zza(this.zzc, null, 1, null);
    }

    @NotNull
    public String zze() {
        byte[] bArr = this.zzc;
        int length = bArr.length;
        char[] cArr = new char[length + length];
        int i5 = 0;
        for (byte b11 : bArr) {
            cArr[i5] = zzbwy.zza()[(b11 >> 4) & 15];
            cArr[i5 + 1] = zzbwy.zza()[b11 & 15];
            i5 += 2;
        }
        return new String(cArr);
    }

    @NotNull
    public final String zzf() {
        String str = this.zze;
        if (str != null) {
            return str;
        }
        String strZza = zzbww.zza(zzo());
        this.zze = strZza;
        return strZza;
    }

    @NotNull
    public zzbwf zzg() {
        int i5 = 0;
        while (true) {
            byte[] bArr = this.zzc;
            int length = bArr.length;
            if (i5 >= length) {
                return this;
            }
            int i11 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 65 && b11 <= 90) {
                byte[] bArrCopyOf = Arrays.copyOf(bArr, length);
                Intrinsics.f(bArrCopyOf, "copyOf(...)");
                bArrCopyOf[i5] = (byte) (b11 + 32);
                while (i11 < bArrCopyOf.length) {
                    int i12 = i11 + 1;
                    byte b12 = bArrCopyOf[i11];
                    if (b12 >= 65 && b12 <= 90) {
                        bArrCopyOf[i11] = (byte) (b12 + 32);
                    }
                    i11 = i12;
                }
                return new zzbwf(bArrCopyOf);
            }
            i5 = i11;
        }
    }

    public final void zzh(int i5) {
        this.zzd = i5;
    }

    public final void zzi(@Nullable String str) {
        this.zze = str;
    }

    public void zzj(@NotNull zzbwb buffer, int i5, int i11) {
        Intrinsics.g(buffer, "buffer");
        buffer.zzl(this.zzc, 0, i11);
    }

    public boolean zzk(int i5, @NotNull zzbwf other, int i11, int i12) {
        Intrinsics.g(other, "other");
        return other.zzl(0, this.zzc, 0, i12);
    }

    public boolean zzl(int i5, @NotNull byte[] other, int i11, int i12) {
        Intrinsics.g(other, "other");
        if (i5 < 0) {
            return false;
        }
        byte[] bArr = this.zzc;
        return i5 <= bArr.length - i12 && i11 >= 0 && i11 <= other.length - i12 && zzbvv.zzc(bArr, i5, other, i11, i12);
    }

    public final boolean zzm(@NotNull zzbwf prefix) {
        Intrinsics.g(prefix, "prefix");
        return zzk(0, prefix, 0, prefix.zzc.length);
    }

    @NotNull
    public final byte[] zzn() {
        return this.zzc;
    }

    @NotNull
    public byte[] zzo() {
        return this.zzc;
    }

    @NotNull
    public byte[] zzp() {
        byte[] bArr = this.zzc;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
        Intrinsics.f(bArrCopyOf, "copyOf(...)");
        return bArrCopyOf;
    }
}
