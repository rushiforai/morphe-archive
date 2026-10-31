package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import javax.security.auth.x500.X500Principal;

/* loaded from: classes3.dex */
final class zzbta {
    private final String zza;
    private final int zzb;
    private int zzc;
    private int zzd;
    private int zze;
    private int zzf;
    private char[] zzg;

    public zzbta(X500Principal x500Principal) {
        String name = x500Principal.getName("RFC2253");
        this.zza = name;
        this.zzb = name.length();
    }

    private final char zzb() {
        int i5;
        int i11;
        int i12 = this.zzc + 1;
        this.zzc = i12;
        if (i12 == this.zzb) {
            throw new IllegalStateException("Unexpected end of DN: ".concat(String.valueOf(this.zza)));
        }
        char c11 = this.zzg[i12];
        if (c11 != ' ' && c11 != '%' && c11 != '\\' && c11 != '_' && c11 != '\"' && c11 != '#') {
            switch (c11) {
                default:
                    switch (c11) {
                        case ';':
                        case '<':
                        case '=':
                        case '>':
                            break;
                        default:
                            int iZzc = zzc(i12);
                            this.zzc++;
                            if (iZzc >= 128) {
                                if (iZzc < 192 || iZzc > 247) {
                                    iZzc = 63;
                                } else {
                                    if (iZzc <= 223) {
                                        i5 = iZzc & 31;
                                        i11 = 1;
                                    } else if (iZzc <= 239) {
                                        i5 = iZzc & 15;
                                        i11 = 2;
                                    } else {
                                        i5 = iZzc & 7;
                                        i11 = 3;
                                    }
                                    for (int i13 = 0; i13 < i11; i13++) {
                                        int i14 = this.zzc;
                                        int i15 = i14 + 1;
                                        this.zzc = i15;
                                        if (i15 != this.zzb && this.zzg[i15] == '\\') {
                                            int i16 = i14 + 2;
                                            this.zzc = i16;
                                            int iZzc2 = zzc(i16);
                                            this.zzc++;
                                            if ((iZzc2 & 192) == 128) {
                                                i5 = (i5 << 6) + (iZzc2 & 63);
                                            }
                                        }
                                        iZzc = 63;
                                    }
                                    iZzc = (char) i5;
                                }
                            }
                            return (char) iZzc;
                    }
                case '*':
                case '+':
                case ',':
                    return c11;
            }
        }
        return c11;
    }

    private final int zzc(int i5) {
        int i11;
        int i12;
        int i13 = i5 + 1;
        if (i13 >= this.zzb) {
            throw new IllegalStateException("Malformed DN: ".concat(String.valueOf(this.zza)));
        }
        char[] cArr = this.zzg;
        char c11 = cArr[i5];
        if (c11 >= '0' && c11 <= '9') {
            i11 = c11 - '0';
        } else if (c11 >= 'a' && c11 <= 'f') {
            i11 = c11 - 'W';
        } else {
            if (c11 < 'A' || c11 > 'F') {
                throw new IllegalStateException("Malformed DN: ".concat(String.valueOf(this.zza)));
            }
            i11 = c11 - '7';
        }
        char c12 = cArr[i13];
        if (c12 >= '0' && c12 <= '9') {
            i12 = c12 - '0';
        } else if (c12 >= 'a' && c12 <= 'f') {
            i12 = c12 - 'W';
        } else {
            if (c12 < 'A' || c12 > 'F') {
                throw new IllegalStateException("Malformed DN: ".concat(String.valueOf(this.zza)));
            }
            i12 = c12 - '7';
        }
        return (i11 << 4) + i12;
    }

    private final String zzd() {
        int i5;
        int i11;
        int i12;
        int i13;
        char c11;
        char c12;
        char c13;
        int i14;
        char c14;
        char c15;
        while (true) {
            i5 = this.zzc;
            i11 = this.zzb;
            if (i5 >= i11 || this.zzg[i5] != ' ') {
                break;
            }
            this.zzc = i5 + 1;
        }
        if (i5 == i11) {
            return null;
        }
        this.zzd = i5;
        this.zzc = i5 + 1;
        while (true) {
            i12 = this.zzc;
            i13 = this.zzb;
            if (i12 >= i13 || (c15 = this.zzg[i12]) == '=' || c15 == ' ') {
                break;
            }
            this.zzc = i12 + 1;
        }
        if (i12 >= i13) {
            throw new IllegalStateException("Unexpected end of DN: ".concat(String.valueOf(this.zza)));
        }
        this.zze = i12;
        if (this.zzg[i12] == ' ') {
            while (true) {
                i12 = this.zzc;
                i14 = this.zzb;
                if (i12 >= i14 || (c14 = this.zzg[i12]) == '=' || c14 != ' ') {
                    break;
                }
                this.zzc = i12 + 1;
            }
            if (this.zzg[i12] != '=' || i12 == i14) {
                throw new IllegalStateException("Unexpected end of DN: ".concat(String.valueOf(this.zza)));
            }
        }
        this.zzc = i12 + 1;
        while (true) {
            int i15 = this.zzc;
            if (i15 >= this.zzb || this.zzg[i15] != ' ') {
                break;
            }
            this.zzc = i15 + 1;
        }
        int i16 = this.zze;
        int i17 = this.zzd;
        if (i16 - i17 > 4) {
            char[] cArr = this.zzg;
            if (cArr[i17 + 3] == '.' && (((c11 = cArr[i17]) == 'O' || c11 == 'o') && (((c12 = cArr[i17 + 1]) == 'I' || c12 == 'i') && ((c13 = cArr[i17 + 2]) == 'D' || c13 == 'd')))) {
                i17 += 4;
                this.zzd = i17;
            }
        }
        return new String(this.zzg, i17, i16 - i17);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0083, code lost:
    
        r4 = r12.zzd;
        r2 = new java.lang.String(r3, r4, r12.zze - r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0118, code lost:
    
        r12.zze = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String zza(String str) {
        String str2;
        char[] cArr;
        char c11;
        int i5;
        int i11;
        char c12;
        this.zzc = 0;
        this.zzd = 0;
        this.zze = 0;
        this.zzf = 0;
        this.zzg = this.zza.toCharArray();
        String strZzd = zzd();
        if (strZzd == null) {
            return null;
        }
        do {
            int i12 = this.zzc;
            int i13 = this.zzb;
            if (i12 == i13) {
                return null;
            }
            char c13 = this.zzg[i12];
            if (c13 == '\"') {
                int i14 = i12 + 1;
                this.zzc = i14;
                this.zzd = i14;
                this.zze = i14;
                while (true) {
                    int i15 = this.zzc;
                    if (i15 == this.zzb) {
                        throw new IllegalStateException("Unexpected end of DN: ".concat(String.valueOf(this.zza)));
                    }
                    char[] cArr2 = this.zzg;
                    char c14 = cArr2[i15];
                    if (c14 == '\"') {
                        this.zzc = i15 + 1;
                        while (true) {
                            int i16 = this.zzc;
                            if (i16 >= this.zzb || this.zzg[i16] != ' ') {
                                break;
                            }
                            this.zzc = i16 + 1;
                        }
                        char[] cArr3 = this.zzg;
                        int i17 = this.zzd;
                        str2 = new String(cArr3, i17, this.zze - i17);
                    } else {
                        if (c14 == '\\') {
                            cArr2[this.zze] = zzb();
                        } else {
                            cArr2[this.zze] = c14;
                        }
                        this.zzc++;
                        this.zze++;
                    }
                }
            } else if (c13 != '#') {
                if (c13 == '+' || c13 == ',' || c13 == ';') {
                    str2 = b.f42142b;
                } else {
                    this.zzd = i12;
                    this.zze = i12;
                    while (true) {
                        int i18 = this.zzc;
                        if (i18 >= this.zzb) {
                            char[] cArr4 = this.zzg;
                            int i19 = this.zzd;
                            str2 = new String(cArr4, i19, this.zze - i19);
                            break;
                        }
                        char[] cArr5 = this.zzg;
                        char c15 = cArr5[i18];
                        if (c15 == ' ') {
                            int i21 = this.zze;
                            this.zzf = i21;
                            this.zzc = i18 + 1;
                            this.zze = i21 + 1;
                            cArr5[i21] = ' ';
                            while (true) {
                                i5 = this.zzc;
                                i11 = this.zzb;
                                if (i5 >= i11) {
                                    break;
                                }
                                char[] cArr6 = this.zzg;
                                if (cArr6[i5] != ' ') {
                                    break;
                                }
                                int i22 = this.zze;
                                this.zze = i22 + 1;
                                cArr6[i22] = ' ';
                                this.zzc = i5 + 1;
                            }
                            if (i5 == i11 || (c12 = this.zzg[i5]) == ',' || c12 == '+' || c12 == ';') {
                                break;
                            }
                        } else {
                            if (c15 == ';') {
                                break;
                            }
                            if (c15 == '\\') {
                                int i23 = this.zze;
                                this.zze = i23 + 1;
                                cArr5[i23] = zzb();
                                this.zzc++;
                            } else {
                                if (c15 == '+' || c15 == ',') {
                                    break;
                                }
                                int i24 = this.zze;
                                this.zze = i24 + 1;
                                cArr5[i24] = c15;
                                this.zzc = i18 + 1;
                            }
                        }
                    }
                    char[] cArr7 = this.zzg;
                    int i25 = this.zzd;
                    str2 = new String(cArr7, i25, this.zzf - i25);
                }
            } else {
                if (i12 + 4 >= i13) {
                    throw new IllegalStateException("Unexpected end of DN: ".concat(String.valueOf(this.zza)));
                }
                this.zzd = i12;
                this.zzc = i12 + 1;
                while (true) {
                    int i26 = this.zzc;
                    if (i26 == this.zzb || (c11 = (cArr = this.zzg)[i26]) == '+' || c11 == ',' || c11 == ';') {
                        break;
                    }
                    int i27 = i26 + 1;
                    if (c11 == ' ') {
                        this.zze = i26;
                        this.zzc = i27;
                        while (true) {
                            int i28 = this.zzc;
                            if (i28 >= this.zzb || this.zzg[i28] != ' ') {
                                break;
                            }
                            this.zzc = i28 + 1;
                        }
                    } else {
                        if (c11 >= 'A' && c11 <= 'F') {
                            cArr[i26] = (char) (c11 + ' ');
                        }
                        this.zzc = i27;
                    }
                }
                int i29 = this.zze;
                int i31 = this.zzd;
                int i32 = i29 - i31;
                if (i32 < 5 || (i32 & 1) == 0) {
                    throw new IllegalStateException("Unexpected end of DN: ".concat(String.valueOf(this.zza)));
                }
                int i33 = i32 >> 1;
                byte[] bArr = new byte[i33];
                int i34 = i31 + 1;
                int i35 = 0;
                while (i35 < i33) {
                    bArr[i35] = (byte) zzc(i34);
                    i35++;
                    i34 += 2;
                }
                str2 = new String(this.zzg, this.zzd, i32);
            }
            if ("cn".equalsIgnoreCase(strZzd)) {
                return str2;
            }
            int i36 = this.zzc;
            if (i36 >= this.zzb) {
                return null;
            }
            char c16 = this.zzg[i36];
            if (c16 != ',' && c16 != ';' && c16 != '+') {
                throw new IllegalStateException("Malformed DN: ".concat(String.valueOf(this.zza)));
            }
            this.zzc = i36 + 1;
            strZzd = zzd();
        } while (strZzd != null);
        throw new IllegalStateException("Malformed DN: ".concat(String.valueOf(this.zza)));
    }
}
