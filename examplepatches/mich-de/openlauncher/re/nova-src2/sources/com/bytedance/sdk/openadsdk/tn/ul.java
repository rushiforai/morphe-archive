package com.bytedance.sdk.openadsdk.tn;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import com.bytedance.sdk.openadsdk.tn.ry;
import com.bytedance.sdk.openadsdk.tn.uh;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public final class ul {

    /* renamed from: zb, reason: collision with root package name */
    private static final int[] f27076zb = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 36, -1, -1, -1, 37, 38, -1, -1, -1, -1, 39, 40, -1, 41, 42, 43, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 44, -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, -1, -1, -1, -1, -1};
    static final Charset ycx = StandardCharsets.ISO_8859_1;

    /* renamed from: com.bytedance.sdk.openadsdk.tn.ul$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[xkz.values().length];
            ycx = iArr;
            try {
                iArr[xkz.NUMERIC.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "fuAumge5e4PR", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[xkz.ALPHANUMERIC.ordinal()] = 2;
            } catch (NoSuchFieldError e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "fuAumge5e4PR", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[xkz.BYTE.ordinal()] = 3;
            } catch (NoSuchFieldError e12) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "fuAumge5e4PR", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[xkz.KANJI.ordinal()] = 4;
            } catch (NoSuchFieldError e13) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "fuAumge5e4PR", "B+0hnA21fZk=", -1);
            }
        }
    }

    public static final class ycx {
        private final byte[] ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final byte[] f27077zb;

        public ycx(byte[] bArr, byte[] bArr2) {
            this.ycx = bArr;
            this.f27077zb = bArr2;
        }

        public byte[] ycx() {
            return this.ycx;
        }

        public byte[] zb() {
            return this.f27077zb;
        }
    }

    private static int ycx(sya syaVar) {
        return ea.ycx(syaVar) + ea.zb(syaVar) + ea.sya(syaVar) + ea.dj(syaVar);
    }

    public static void zb(CharSequence charSequence, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) throws htf {
        int length = charSequence.length();
        int i5 = 0;
        while (i5 < length) {
            int iYcx = ycx(charSequence.charAt(i5));
            if (iYcx == -1) {
                throw new htf();
            }
            int i11 = i5 + 1;
            if (i11 < length) {
                int iYcx2 = ycx(charSequence.charAt(i11));
                if (iYcx2 == -1) {
                    throw new htf();
                }
                ycxVar.ycx((iYcx * 45) + iYcx2, 11);
                i5 += 2;
            } else {
                ycxVar.ycx(iYcx, 6);
                i5 = i11;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static syc ycx(String str, fby fbyVar, Map<lt, ?> map) throws htf, NumberFormatException {
        boolean z11;
        boolean z12;
        uh uhVarYcx;
        uh uhVarZb;
        com.bytedance.sdk.openadsdk.tn.ycx ycxVar;
        dj djVarYcx;
        int iYcx;
        boolean z13 = false;
        if (map != null) {
            lt ltVar = lt.GS1_FORMAT;
            z11 = map.containsKey(ltVar) && Boolean.parseBoolean(map.get(ltVar).toString());
        }
        if (map != null) {
            lt ltVar2 = lt.QR_COMPACT;
            z12 = map.containsKey(ltVar2) && Boolean.parseBoolean(map.get(ltVar2).toString());
        }
        Charset charsetForName = ycx;
        if (map != null && map.containsKey(lt.CHARACTER_SET)) {
            z13 = true;
        }
        if (z13) {
            try {
                charsetForName = Charset.forName(map.get(lt.CHARACTER_SET).toString());
            } catch (UnsupportedCharsetException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "fuAumge5ew==", "XuAumge5", 86);
            }
        }
        if (z12) {
            xkz xkzVar = xkz.NUMERIC;
            if (charsetForName.equals(ycx)) {
                charsetForName = null;
            }
            ry.zb zbVarYcx = ry.ycx(str, null, charsetForName, z11, fbyVar);
            ycxVar = new com.bytedance.sdk.openadsdk.tn.ycx();
            zbVarYcx.ycx(ycxVar);
            uhVarZb = zbVarYcx.zb();
        } else {
            xkz xkzVarYcx = ycx(str, charsetForName);
            com.bytedance.sdk.openadsdk.tn.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.tn.ycx();
            xkz xkzVar2 = xkz.BYTE;
            if (xkzVarYcx == xkzVar2 && z13 && (djVarYcx = dj.ycx(charsetForName)) != null) {
                ycx(djVarYcx, ycxVar2);
            }
            if (z11) {
                ycx(xkz.FNC1_FIRST_POSITION, ycxVar2);
            }
            ycx(xkzVarYcx, ycxVar2);
            com.bytedance.sdk.openadsdk.tn.ycx ycxVar3 = new com.bytedance.sdk.openadsdk.tn.ycx();
            ycx(str, xkzVarYcx, ycxVar3, charsetForName);
            if (map != null) {
                lt ltVar3 = lt.QR_VERSION;
                if (map.containsKey(ltVar3)) {
                    uhVarYcx = uh.ycx(Integer.parseInt(map.get(ltVar3).toString()));
                    if (!ycx(ycx(xkzVarYcx, ycxVar2, ycxVar3, uhVarYcx), uhVarYcx, fbyVar)) {
                        throw new htf("Data too big for requested version");
                    }
                } else {
                    uhVarYcx = ycx(fbyVar, xkzVarYcx, ycxVar2, ycxVar3);
                }
                com.bytedance.sdk.openadsdk.tn.ycx ycxVar4 = new com.bytedance.sdk.openadsdk.tn.ycx();
                ycxVar4.ycx(ycxVar2);
                ycx(xkzVarYcx == xkzVar2 ? ycxVar3.zb() : str.length(), uhVarYcx, xkzVarYcx, ycxVar4);
                ycxVar4.ycx(ycxVar3);
                uhVarZb = uhVarYcx;
                ycxVar = ycxVar4;
            }
        }
        uh.zb zbVarYcx2 = uhVarZb.ycx(fbyVar);
        int iZb = uhVarZb.zb() - zbVarYcx2.sya();
        ycx(iZb, ycxVar);
        com.bytedance.sdk.openadsdk.tn.ycx ycxVarYcx = ycx(ycxVar, uhVarZb.zb(), iZb, zbVarYcx2.zb());
        syc sycVar = new syc();
        int iSya = uhVarZb.sya();
        sya syaVar = new sya(iSya, iSya);
        if (map != null) {
            lt ltVar4 = lt.QR_MASK_PATTERN;
            if (map.containsKey(ltVar4)) {
                iYcx = Integer.parseInt(map.get(ltVar4).toString());
                if (!syc.ycx(iYcx)) {
                    iYcx = -1;
                }
            }
        }
        if (iYcx == -1) {
            iYcx = ycx(ycxVarYcx, fbyVar, uhVarZb, syaVar);
        }
        ok.ycx(ycxVarYcx, fbyVar, uhVarZb, iYcx, syaVar);
        sycVar.ycx(syaVar);
        return sycVar;
    }

    private static uh ycx(fby fbyVar, xkz xkzVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar2) throws htf {
        return ycx(ycx(xkzVar, ycxVar, ycxVar2, ycx(ycx(xkzVar, ycxVar, ycxVar2, uh.ycx(1)), fbyVar)), fbyVar);
    }

    private static int ycx(xkz xkzVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar2, uh uhVar) {
        return ycxVar2.ycx() + xkzVar.ycx(uhVar) + ycxVar.ycx();
    }

    public static int ycx(int i5) {
        int[] iArr = f27076zb;
        if (i5 < iArr.length) {
            return iArr[i5];
        }
        return -1;
    }

    private static xkz ycx(String str, Charset charset) {
        Charset charset2 = pmi.ycx;
        if (charset2 != null && charset2.equals(charset) && ycx(str)) {
            return xkz.KANJI;
        }
        boolean z11 = false;
        boolean z12 = false;
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt >= '0' && cCharAt <= '9') {
                z12 = true;
            } else {
                if (ycx(cCharAt) == -1) {
                    return xkz.BYTE;
                }
                z11 = true;
            }
        }
        if (z11) {
            return xkz.ALPHANUMERIC;
        }
        if (z12) {
            return xkz.NUMERIC;
        }
        return xkz.BYTE;
    }

    public static boolean ycx(String str) {
        byte[] bytes = str.getBytes(pmi.ycx);
        int length = bytes.length;
        if (length % 2 != 0) {
            return false;
        }
        for (int i5 = 0; i5 < length; i5 += 2) {
            int i11 = bytes[i5] & 255;
            if ((i11 < 129 || i11 > 159) && (i11 < 224 || i11 > 235)) {
                return false;
            }
        }
        return true;
    }

    private static int ycx(com.bytedance.sdk.openadsdk.tn.ycx ycxVar, fby fbyVar, uh uhVar, sya syaVar) throws htf {
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        int i11 = -1;
        for (int i12 = 0; i12 < 8; i12++) {
            ok.ycx(ycxVar, fbyVar, uhVar, i12, syaVar);
            int iYcx = ycx(syaVar);
            if (iYcx < i5) {
                i11 = i12;
                i5 = iYcx;
            }
        }
        return i11;
    }

    private static uh ycx(int i5, fby fbyVar) throws htf {
        for (int i11 = 1; i11 <= 40; i11++) {
            uh uhVarYcx = uh.ycx(i11);
            if (ycx(i5, uhVarYcx, fbyVar)) {
                return uhVarYcx;
            }
        }
        throw new htf("Data too big");
    }

    public static boolean ycx(int i5, uh uhVar, fby fbyVar) {
        return uhVar.zb() - uhVar.ycx(fbyVar).sya() >= (i5 + 7) / 8;
    }

    public static void ycx(int i5, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) throws htf {
        int i11 = i5 * 8;
        if (ycxVar.ycx() <= i11) {
            for (int i12 = 0; i12 < 4 && ycxVar.ycx() < i11; i12++) {
                ycxVar.ycx(false);
            }
            int iYcx = ycxVar.ycx() & 7;
            if (iYcx > 0) {
                while (iYcx < 8) {
                    ycxVar.ycx(false);
                    iYcx++;
                }
            }
            int iZb = i5 - ycxVar.zb();
            for (int i13 = 0; i13 < iZb; i13++) {
                ycxVar.ycx((i13 & 1) == 0 ? 236 : 17, 8);
            }
            if (ycxVar.ycx() != i11) {
                throw new htf("Bits size does not equal capacity");
            }
            return;
        }
        throw new htf("data bits cannot fit in the QR Code" + ycxVar.ycx() + " > " + i11);
    }

    public static void ycx(int i5, int i11, int i12, int i13, int[] iArr, int[] iArr2) throws htf {
        if (i13 < i12) {
            int i14 = i5 % i12;
            int i15 = i12 - i14;
            int i16 = i5 / i12;
            int i17 = i16 + 1;
            int i18 = i11 / i12;
            int i19 = i18 + 1;
            int i21 = i16 - i18;
            int i22 = i17 - i19;
            if (i21 != i22) {
                throw new htf("EC bytes mismatch");
            }
            if (i12 != i15 + i14) {
                throw new htf("RS blocks mismatch");
            }
            if (i5 != ((i19 + i22) * i14) + ((i18 + i21) * i15)) {
                throw new htf("Total bytes mismatch");
            }
            if (i13 < i15) {
                iArr[0] = i18;
                iArr2[0] = i21;
                return;
            } else {
                iArr[0] = i19;
                iArr2[0] = i22;
                return;
            }
        }
        throw new htf("Block ID too large");
    }

    public static com.bytedance.sdk.openadsdk.tn.ycx ycx(com.bytedance.sdk.openadsdk.tn.ycx ycxVar, int i5, int i11, int i12) throws htf {
        if (ycxVar.zb() == i11) {
            ArrayList arrayList = new ArrayList(i12);
            int i13 = 0;
            int i14 = 0;
            int iMax = 0;
            int iMax2 = 0;
            while (i13 < i12) {
                int[] iArr = new int[1];
                int[] iArr2 = new int[1];
                int i15 = i5;
                int i16 = i11;
                int i17 = i12;
                ycx(i15, i16, i17, i13, iArr, iArr2);
                int i18 = iArr[0];
                byte[] bArr = new byte[i18];
                ycxVar.ycx(i14 * 8, bArr, 0, i18);
                byte[] bArrYcx = ycx(bArr, iArr2[0]);
                arrayList.add(new ycx(bArr, bArrYcx));
                iMax = Math.max(iMax, i18);
                iMax2 = Math.max(iMax2, bArrYcx.length);
                i14 += iArr[0];
                i13++;
                i5 = i15;
                i11 = i16;
                i12 = i17;
            }
            int i19 = i5;
            if (i11 == i14) {
                com.bytedance.sdk.openadsdk.tn.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.tn.ycx();
                for (int i21 = 0; i21 < iMax; i21++) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        byte[] bArrYcx2 = ((ycx) it.next()).ycx();
                        if (i21 < bArrYcx2.length) {
                            ycxVar2.ycx(bArrYcx2[i21], 8);
                        }
                    }
                }
                for (int i22 = 0; i22 < iMax2; i22++) {
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        byte[] bArrZb = ((ycx) it2.next()).zb();
                        if (i22 < bArrZb.length) {
                            ycxVar2.ycx(bArrZb[i22], 8);
                        }
                    }
                }
                if (i19 == ycxVar2.zb()) {
                    return ycxVar2;
                }
                StringBuilder sbJ = u4.j(i19, "Interleaving error: ", " and ");
                sbJ.append(ycxVar2.zb());
                sbJ.append(" differ.");
                throw new htf(sbJ.toString());
            }
            throw new htf("Data bytes does not match offset");
        }
        throw new htf("Number of bits and data bytes does not match");
    }

    public static byte[] ycx(byte[] bArr, int i5) {
        int length = bArr.length;
        int[] iArr = new int[length + i5];
        for (int i11 = 0; i11 < length; i11++) {
            iArr[i11] = bArr[i11] & 255;
        }
        new wie(jw.ycx).ycx(iArr, i5);
        byte[] bArr2 = new byte[i5];
        for (int i12 = 0; i12 < i5; i12++) {
            bArr2[i12] = (byte) iArr[length + i12];
        }
        return bArr2;
    }

    public static void ycx(xkz xkzVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) {
        ycxVar.ycx(xkzVar.ycx(), 4);
    }

    public static void ycx(int i5, uh uhVar, xkz xkzVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) throws htf {
        int iYcx = xkzVar.ycx(uhVar);
        int i11 = 1 << iYcx;
        if (i5 < i11) {
            ycxVar.ycx(i5, iYcx);
            return;
        }
        throw new htf(i5 + " is bigger than " + (i11 - 1));
    }

    public static void ycx(String str, xkz xkzVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar, Charset charset) throws htf {
        int i5 = AnonymousClass1.ycx[xkzVar.ordinal()];
        if (i5 == 1) {
            ycx((CharSequence) str, ycxVar);
            return;
        }
        if (i5 == 2) {
            zb(str, ycxVar);
        } else if (i5 == 3) {
            ycx(str, ycxVar, charset);
        } else {
            if (i5 == 4) {
                ycx(str, ycxVar);
                return;
            }
            throw new htf("Invalid mode: ".concat(String.valueOf(xkzVar)));
        }
    }

    public static void ycx(CharSequence charSequence, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) {
        int length = charSequence.length();
        int i5 = 0;
        while (i5 < length) {
            int iCharAt = charSequence.charAt(i5) - '0';
            int i11 = i5 + 2;
            if (i11 < length) {
                ycxVar.ycx(((charSequence.charAt(i5 + 1) - '0') * 10) + (iCharAt * 100) + (charSequence.charAt(i11) - '0'), 10);
                i5 += 3;
            } else {
                i5++;
                if (i5 < length) {
                    ycxVar.ycx((iCharAt * 10) + (charSequence.charAt(i5) - '0'), 7);
                    i5 = i11;
                } else {
                    ycxVar.ycx(iCharAt, 4);
                }
            }
        }
    }

    public static void ycx(String str, com.bytedance.sdk.openadsdk.tn.ycx ycxVar, Charset charset) {
        for (byte b11 : str.getBytes(charset)) {
            ycxVar.ycx(b11, 8);
        }
    }

    public static void ycx(String str, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) throws htf {
        int i5;
        Charset charset = pmi.ycx;
        if (charset != null) {
            byte[] bytes = str.getBytes(charset);
            if (bytes.length % 2 == 0) {
                int length = bytes.length - 1;
                for (int i11 = 0; i11 < length; i11 += 2) {
                    int i12 = ((bytes[i11] & 255) << 8) | (bytes[i11 + 1] & 255);
                    int i13 = 33088;
                    if (i12 >= 33088 && i12 <= 40956) {
                        i5 = i12 - i13;
                    } else if (i12 < 57408 || i12 > 60351) {
                        i5 = -1;
                    } else {
                        i13 = 49472;
                        i5 = i12 - i13;
                    }
                    if (i5 != -1) {
                        ycxVar.ycx(((i5 >> 8) * 192) + (i5 & 255), 13);
                    } else {
                        throw new htf("Invalid byte sequence");
                    }
                }
                return;
            }
            throw new htf("Kanji byte size not even");
        }
        throw new htf("SJIS Charset not supported on this platform");
    }

    private static void ycx(dj djVar, com.bytedance.sdk.openadsdk.tn.ycx ycxVar) {
        ycxVar.ycx(xkz.ECI.ycx(), 4);
        ycxVar.ycx(djVar.ycx(), 8);
    }
}
