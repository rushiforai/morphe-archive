package n90;

import java.io.EOFException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import m90.e0;
import m90.x;

/* loaded from: classes5.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f78032a;

    static {
        byte[] bytes = "0123456789abcdef".getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
        f78032a = bytes;
    }

    public static final byte[] a() {
        return f78032a;
    }

    public static final boolean b(e0 e0Var, int i5, byte[] bArr, int i11) {
        int i12 = e0Var.f76117c;
        byte[] bArr2 = e0Var.f76115a;
        for (int i13 = 1; i13 < i11; i13++) {
            if (i5 == i12) {
                e0Var = e0Var.f76120f;
                Intrinsics.d(e0Var);
                bArr2 = e0Var.f76115a;
                i5 = e0Var.f76116b;
                i12 = e0Var.f76117c;
            }
            if (bArr2[i5] != bArr[i13]) {
                return false;
            }
            i5++;
        }
        return true;
    }

    public static final String c(m90.g gVar, long j11) throws EOFException {
        if (j11 > 0) {
            long j12 = j11 - 1;
            if (gVar.f(j12) == 13) {
                String strM = gVar.M(j12, Charsets.f72000b);
                gVar.skip(2L);
                return strM;
            }
        }
        String strM2 = gVar.M(j11, Charsets.f72000b);
        gVar.skip(1L);
        return strM2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x005c, code lost:
    
        if (r18 == false) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005e, code lost:
    
        return -2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x007e, code lost:
    
        return r9;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final int d(m90.g gVar, x options, boolean z11) {
        int i5;
        int i11;
        int i12;
        e0 e0Var;
        int i13;
        Intrinsics.g(options, "options");
        e0 e0Var2 = gVar.f76125a;
        if (e0Var2 != null) {
            byte[] bArr = e0Var2.f76115a;
            int i14 = e0Var2.f76116b;
            int i15 = e0Var2.f76117c;
            int[] iArr = options.f76173c;
            e0 e0Var3 = e0Var2;
            int i16 = -1;
            int i17 = 0;
            loop0: while (true) {
                int i18 = i17 + 1;
                int i19 = iArr[i17];
                int i21 = i17 + 2;
                int i22 = iArr[i18];
                if (i22 != -1) {
                    i16 = i22;
                }
                if (e0Var3 == null) {
                    break;
                }
                if (i19 >= 0) {
                    int i23 = i14 + 1;
                    int i24 = bArr[i14] & 255;
                    int i25 = i21 + i19;
                    while (i21 != i25) {
                        if (i24 == iArr[i21]) {
                            i5 = iArr[i21 + i19];
                            if (i23 == i15) {
                                e0Var3 = e0Var3.f76120f;
                                Intrinsics.d(e0Var3);
                                int i26 = e0Var3.f76116b;
                                byte[] bArr2 = e0Var3.f76115a;
                                i11 = e0Var3.f76117c;
                                if (e0Var3 == e0Var2) {
                                    i12 = i26;
                                    bArr = bArr2;
                                    e0Var3 = null;
                                } else {
                                    i12 = i26;
                                    bArr = bArr2;
                                }
                            } else {
                                i11 = i15;
                                i12 = i23;
                            }
                            if (i5 >= 0) {
                                return i5;
                            }
                            int i27 = i11;
                            i17 = -i5;
                            i14 = i12;
                            i15 = i27;
                        } else {
                            i21++;
                        }
                    }
                    break loop0;
                }
                int i28 = (i19 * (-1)) + i21;
                while (true) {
                    int i29 = i14 + 1;
                    int i31 = i21 + 1;
                    if ((bArr[i14] & 255) != iArr[i21]) {
                        break loop0;
                    }
                    boolean z12 = i31 == i28;
                    if (i29 == i15) {
                        Intrinsics.d(e0Var3);
                        e0 e0Var4 = e0Var3.f76120f;
                        Intrinsics.d(e0Var4);
                        i12 = e0Var4.f76116b;
                        byte[] bArr3 = e0Var4.f76115a;
                        i13 = e0Var4.f76117c;
                        if (e0Var4 != e0Var2) {
                            e0Var = e0Var4;
                            bArr = bArr3;
                        } else {
                            if (!z12) {
                                break loop0;
                            }
                            bArr = bArr3;
                            e0Var = null;
                        }
                    } else {
                        e0Var = e0Var3;
                        i13 = i15;
                        i12 = i29;
                    }
                    if (z12) {
                        i5 = iArr[i31];
                        int i32 = i13;
                        e0Var3 = e0Var;
                        i11 = i32;
                        break;
                    }
                    i14 = i12;
                    i15 = i13;
                    e0Var3 = e0Var;
                    i21 = i31;
                }
            }
        } else {
            return z11 ? -2 : -1;
        }
    }
}
