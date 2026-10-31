package com.google.android.libraries.places.internal;

import b.c0;
import java.net.IDN;
import java.net.InetAddress;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzbug {
    String zza;
    String zzb;
    int zzc = -1;

    /* JADX WARN: Code restructure failed: missing block: B:100:?, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002c, code lost:
    
        r17 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x008d, code lost:
    
        if ((r12 - r10) == 0) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x008f, code lost:
    
        r3[r7] = (byte) r14;
        r11 = r17;
        r7 = r7 + 1;
        r10 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x00d7, code lost:
    
        if (r8 == 16) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x00d9, code lost:
    
        if (r9 != (-1)) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x00db, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x00dc, code lost:
    
        r0 = r8 - r9;
        java.lang.System.arraycopy(r3, r9, r3, 16 - r0, r0);
        java.util.Arrays.fill(r3, r9, (16 - r8) + r9, (byte) 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x00ec, code lost:
    
        return java.net.InetAddress.getByAddress(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x00f2, code lost:
    
        throw new java.lang.AssertionError();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static InetAddress zzf(String str, int i5, int i11) {
        InetAddress inetAddress;
        InetAddress inetAddress2;
        byte[] bArr = new byte[16];
        int i12 = 1;
        int i13 = -1;
        int i14 = -1;
        int i15 = 0;
        while (true) {
            InetAddress inetAddress3 = null;
            if (i12 >= i11) {
                break;
            }
            if (i15 == 16) {
                return null;
            }
            int i16 = i12 + 2;
            if (i16 > i11 || !str.regionMatches(i12, "::", 0, 2)) {
                if (i15 == 0) {
                    inetAddress = null;
                    i14 = i12;
                } else if (str.regionMatches(i12, ":", 0, 1)) {
                    i14 = i12 + 1;
                    inetAddress = null;
                } else {
                    if (!str.regionMatches(i12, ".", 0, 1)) {
                        return null;
                    }
                    int i17 = i15 - 2;
                    int i18 = i17;
                    while (i14 < i11) {
                        if (i18 != 16) {
                            if (i18 != i17) {
                                if (str.charAt(i14) == '.') {
                                    i14++;
                                }
                            }
                            int i19 = 0;
                            int i21 = i14;
                            while (true) {
                                if (i21 >= i11) {
                                    inetAddress2 = inetAddress3;
                                    break;
                                }
                                char cCharAt = str.charAt(i21);
                                inetAddress2 = inetAddress3;
                                if (cCharAt < '0' || cCharAt > '9') {
                                    break;
                                }
                                if (i19 == 0) {
                                    if (i14 != i21) {
                                        return inetAddress2;
                                    }
                                    i19 = 0;
                                }
                                i19 = ((i19 * 10) + cCharAt) - 48;
                                if (i19 > 255) {
                                    return inetAddress2;
                                }
                                i21++;
                                inetAddress3 = inetAddress2;
                            }
                        }
                        return inetAddress3;
                    }
                    InetAddress inetAddress4 = inetAddress3;
                    if (i18 != i15 + 2) {
                        return inetAddress4;
                    }
                    i15 += 2;
                }
            } else {
                if (i13 != -1) {
                    return null;
                }
                i15 += 2;
                if (i16 == i11) {
                    i13 = i15;
                    break;
                }
                i13 = i15;
                inetAddress = null;
                i14 = i16;
            }
            int i22 = 0;
            i12 = i14;
            while (i12 < i11) {
                int iZza = zzbui.zza(str.charAt(i12));
                if (iZza == -1) {
                    break;
                }
                i12++;
                i22 = (i22 << 4) + iZza;
            }
            int i23 = i12 - i14;
            if (i23 == 0 || i23 > 4) {
                break;
            }
            int i24 = i15 + 1;
            bArr[i15] = (byte) (255 & (i22 >>> 8));
            i15 += 2;
            bArr[i24] = (byte) (i22 & 255);
        }
        return inetAddress;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.zza);
        sb2.append("://");
        if (this.zzb.indexOf(58) != -1) {
            sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
            sb2.append(this.zzb);
            sb2.append(AbstractJsonLexerKt.END_LIST);
        } else {
            sb2.append(this.zzb);
        }
        int iZza = zza();
        if (iZza != zzbui.zzb(this.zza)) {
            sb2.append(AbstractJsonLexerKt.COLON);
            sb2.append(iZza);
        }
        return sb2.toString();
    }

    public final int zza() {
        int i5 = this.zzc;
        return i5 != -1 ? i5 : zzbui.zzb(this.zza);
    }

    public final zzbug zzb(String str) {
        int i5;
        String strSubstring;
        if (str == null) {
            throw new IllegalArgumentException("host == null");
        }
        int i11 = 0;
        int iCharCount = 0;
        while (true) {
            int length = str.length();
            i5 = -1;
            if (iCharCount >= length) {
                strSubstring = str.substring(0, length);
                break;
            }
            if (str.charAt(iCharCount) != '%') {
                iCharCount++;
            } else {
                zzbwb zzbwbVar = new zzbwb();
                zzbwbVar.zzt(str, 0, iCharCount);
                while (iCharCount < length) {
                    int iCodePointAt = str.codePointAt(iCharCount);
                    if (iCodePointAt != 37) {
                        zzbwbVar.zzu(iCodePointAt);
                    } else {
                        int i12 = iCharCount + 2;
                        if (i12 < length) {
                            int iZza = zzbui.zza(str.charAt(iCharCount + 1));
                            int iZza2 = zzbui.zza(str.charAt(i12));
                            if (iZza != -1 && iZza2 != -1) {
                                zzbwbVar.zzm((iZza << 4) + iZza2);
                                iCharCount = i12;
                                iCodePointAt = 37;
                            }
                        }
                        iCodePointAt = 37;
                        zzbwbVar.zzu(iCodePointAt);
                    }
                    iCharCount += Character.charCount(iCodePointAt);
                }
                strSubstring = zzbwbVar.zzi();
            }
        }
        String strZzi = null;
        if (strSubstring.startsWith("[") && strSubstring.endsWith("]")) {
            InetAddress inetAddressZzf = zzf(strSubstring, 1, strSubstring.length() - 1);
            if (inetAddressZzf != null) {
                byte[] address = inetAddressZzf.getAddress();
                if (address.length != 16) {
                    throw new AssertionError();
                }
                int i13 = 0;
                int i14 = 0;
                while (i13 < address.length) {
                    int i15 = i13;
                    while (i15 < 16 && address[i15] == 0 && address[i15 + 1] == 0) {
                        i15 += 2;
                    }
                    int i16 = i15 - i13;
                    int i17 = i16 > i14 ? i16 : i14;
                    if (i16 > i14) {
                        i5 = i13;
                    }
                    i13 = i15 + 2;
                    i14 = i17;
                }
                zzbwb zzbwbVar2 = new zzbwb();
                while (i11 < address.length) {
                    if (i11 == i5) {
                        zzbwbVar2.zzm(58);
                        i11 += i14;
                        if (i11 == 16) {
                            zzbwbVar2.zzm(58);
                        }
                    } else {
                        if (i11 > 0) {
                            zzbwbVar2.zzm(58);
                        }
                        zzbwbVar2.zzo(((address[i11] & 255) << 8) | (address[i11 + 1] & 255));
                        i11 += 2;
                    }
                }
                strZzi = zzbwbVar2.zzi();
            }
        } else {
            try {
                String lowerCase = IDN.toASCII(strSubstring).toLowerCase(Locale.US);
                if (!lowerCase.isEmpty()) {
                    while (true) {
                        if (i11 >= lowerCase.length()) {
                            strZzi = lowerCase;
                            break;
                        }
                        char cCharAt = lowerCase.charAt(i11);
                        if (cCharAt <= 31 || cCharAt >= 127 || " #%/:?@[\\]".indexOf(cCharAt) != -1) {
                            break;
                        }
                        i11++;
                    }
                }
            } catch (IllegalArgumentException unused) {
            }
        }
        if (strZzi == null) {
            throw new IllegalArgumentException("unexpected host: ".concat(str));
        }
        this.zzb = strZzi;
        return this;
    }

    public final zzbug zzc(int i5) {
        if (i5 <= 0 || i5 > 65535) {
            throw new IllegalArgumentException(c0.h(i5, "unexpected port: "));
        }
        this.zzc = i5;
        return this;
    }

    public final zzbug zzd(String str) {
        this.zza = "https";
        return this;
    }

    public final zzbui zze() {
        if (this.zza == null) {
            throw new IllegalStateException("scheme == null");
        }
        if (this.zzb != null) {
            return new zzbui(this, null);
        }
        throw new IllegalStateException("host == null");
    }
}
