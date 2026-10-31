package com.facebook.ads.redexgen.X;

import android.os.ConditionVariable;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableSet;
import java.util.Random;
import java.util.TreeSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class MT implements InterfaceC1671eB {
    public static byte[] A0B;
    public static String[] A0C = {"P4GoDyo8E", "A6DXkrBmm", "hwMFNj38hDkKhI5gmmInxb4zKvK6iPJg", "hCXbj8yeB1xowdrvIw6pFyMrsJbhR8sX", "UxtGfejscewAzLAsdw84K1LLDY5kqAZS", "DyPv3MK4pHD8x8WOQmHM2WEhEDh0MGrc", "gxUnNkGGbWBalhDbpu57KEZqBJPU7Klh", "pSHQdznhoeLhkKUUepr8Dnp5QExPGK5S"};
    public static final HashSet<File> A0D;
    public long A00;
    public long A01;
    public C1668e8 A02;
    public boolean A03;
    public final InterfaceC1085Ml A04;
    public final C1677eH A05;
    public final C1690eU A06;
    public final File A07;
    public final HashMap<String, ArrayList<InterfaceC1670eA>> A08;
    public final Random A09;
    public final boolean A0A;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0B = new byte[]{AbstractJsonLexerKt.TC_INVALID, 36, 56, 53, 64, 111, 110, 117, 105, 100, 115, 33, 82, 104, 108, 113, 109, 100, 66, 96, 98, 105, 100, 33, 104, 111, 114, 117, 96, 111, 98, 100, 33, 116, 114, 100, 114, 33, 117, 105, 100, 33, 103, 110, 109, 101, 100, 115, 59, 33, 111, 82, 69, 122, 70, 75, 83, 79, 88, 16, 121, 67, 71, 90, 70, 79, 105, 75, 73, 66, 79, 99, 68, 67, 94, 22, 49, 57, 60, 53, 52, 112, 36, 63, 112, 51, 34, 53, 49, 36, 53, 112, 5, 25, 20, 112, 54, 57, 60, 53, 106, 112, 112, 87, 95, 90, 83, 82, 22, 66, 89, 22, 85, 68, 83, 87, 66, 83, 22, 85, 87, 85, 94, 83, 22, 99, AbstractJsonLexerKt.TC_INVALID, 114, 12, 22, 43, 12, 4, 1, 8, 9, 77, 25, 2, 77, 14, 31, 8, 12, 25, 8, 77, 14, 12, 14, 5, 8, 77, 9, 4, 31, 8, 14, 25, 2, 31, 20, 87, 77, 54, 17, 25, 28, 21, 20, 80, 4, 31, 80, 25, 30, 25, 4, 25, 17, 28, 25, 10, 21, 80, 19, 17, 19, 24, 21, 80, 25, 30, 20, 25, 19, 21, 3, 74, 80, 88, AbstractJsonLexerKt.TC_INVALID, 119, 114, 123, 122, 62, 106, 113, 62, 114, 119, 109, 106, 62, 125, AbstractJsonLexerKt.TC_INVALID, 125, 118, 123, 62, 122, 119, 108, 123, 125, 106, 113, 108, 103, 62, 120, 119, 114, 123, 109, 36, 62, 116, 83, 91, 94, 87, 86, 18, 70, 93, 18, 64, 87, 95, 93, 68, 87, 18, 84, 91, 94, 87, 18, 91, 92, 86, 87, 74, 18, 87, 92, 70, 64, 75, 18, 84, 93, 64, 8, 18, 93, 113, 124, 118, AbstractJsonLexerKt.TC_INVALID, 98, 125, 117, 116, 48, 69, 89, 84, 48, 118, 121, 124, 117, 42, 48, 3, 57, 61, 32, 60, 53, 19, 49, 51, 56, 53, 33, 6, 29, 0, 27, 28, 21, 82, 27, 28, 22, 23, 10, 82, 20, 27, 30, 23, 82, 20, 19, 27, 30, 23, 22};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 23 out of bounds for length 22
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:28:0x006d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0G(File file, boolean z11, File[] fileArr, Map<String, C1676eG> map) throws NumberFormatException {
        C1676eG c1676eG;
        if (fileArr == null || fileArr.length == 0) {
            if (z11) {
                return;
            }
            file.delete();
            return;
        }
        for (File file2 : fileArr) {
            String name = file2.getName();
            if (z11 && name.indexOf(46) == -1) {
                File[] fileArrListFiles = file2.listFiles();
                if (A0C[4].charAt(5) != 'e') {
                    throw new RuntimeException();
                }
                A0C[5] = "5GN43lgLpMJ0wZmTsy7BOt9jlWzzrA24";
                A0G(file2, false, fileArrListFiles, map);
            } else {
                if (z11) {
                    boolean zA0A = C1690eU.A0A(name);
                    if (A0C[7].charAt(27) != 'P') {
                        throw new RuntimeException();
                    }
                    A0C[5] = "Y6vD3WplWD8jLPPaXaYaYAbH0nyrA2FJ";
                    if (!zA0A && !name.endsWith(A04(0, 4, 38))) {
                        long j11 = -1;
                        long j12 = -9223372036854775807L;
                        if (map != null) {
                            C1676eG c1676eGRemove = map.remove(name);
                            String[] strArr = A0C;
                            if (strArr[3].charAt(25) != strArr[6].charAt(25)) {
                                throw new RuntimeException();
                            }
                            String[] strArr2 = A0C;
                            strArr2[3] = "xEsDck04987zaIJQDaudZGvr9JlJiHGF";
                            strArr2[6] = "2eXbOc7NWcD8gVF03Arr9f8hVJcFB5gE";
                            c1676eG = c1676eGRemove;
                        } else {
                            c1676eG = null;
                        }
                        if (c1676eG != null) {
                            j11 = c1676eG.A01;
                            j12 = c1676eG.A00;
                            String[] strArr3 = A0C;
                            if (strArr3[3].charAt(25) == strArr3[6].charAt(25)) {
                                String[] strArr4 = A0C;
                                strArr4[0] = "BKyA9hBSa";
                                strArr4[1] = "EZwSQvqM4";
                            }
                        }
                        MK mkA00 = MK.A00(file2, j11, j12, this.A06);
                        if (mkA00 != null) {
                            A0C(mkA00);
                        } else {
                            file2.delete();
                        }
                    }
                }
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized NavigableSet<C1681eL> A0I(String str) {
        C1688eS c1688eSA0C;
        AbstractC1062Ln.A08(!this.A03);
        c1688eSA0C = this.A06.A0C(str);
        return (c1688eSA0C == null || c1688eSA0C.A09()) ? new TreeSet() : new TreeSet((Collection) c1688eSA0C.A06());
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized long A7l(String str, long j11, long j12) {
        long j13;
        long j14 = j11;
        synchronized (this) {
            long j15 = j12 == -1 ? Long.MAX_VALUE : j14 + j12;
            if (j15 < 0) {
                j15 = Long.MAX_VALUE;
            }
            j13 = 0;
            while (j14 < j15) {
                long jA7m = A7m(str, j14, j15 - j14);
                if (jA7m > 0) {
                    j13 += jA7m;
                } else {
                    jA7m = -jA7m;
                }
                j14 += jA7m;
            }
        }
        return j13;
    }

    static {
        A07();
        A0D = new HashSet<>();
    }

    @Deprecated
    public MT(File file, InterfaceC1085Ml interfaceC1085Ml) {
        this(file, interfaceC1085Ml, (byte[]) null, false);
    }

    public MT(File file, InterfaceC1085Ml interfaceC1085Ml, ND nd2, byte[] bArr, boolean z11, boolean z12) {
        C1677eH c1677eH;
        C1690eU c1690eU = new C1690eU(nd2, file, bArr, z11, z12);
        if (nd2 != null && !z12) {
            c1677eH = new C1677eH(nd2);
        } else {
            c1677eH = null;
        }
        this(file, interfaceC1085Ml, c1690eU, c1677eH);
    }

    public MT(File file, InterfaceC1085Ml interfaceC1085Ml, C1690eU c1690eU, C1677eH c1677eH) {
        if (A0H(file)) {
            this.A07 = file;
            this.A04 = interfaceC1085Ml;
            this.A06 = c1690eU;
            this.A05 = c1677eH;
            this.A08 = new HashMap<>();
            this.A09 = new Random();
            this.A0A = interfaceC1085Ml.AK1();
            this.A01 = -1L;
            ConditionVariable conditionVariable = new ConditionVariable();
            new C1697eb(this, A04(50, 25, 93), conditionVariable).start();
            conditionVariable.block();
            return;
        }
        throw new IllegalStateException(A04(4, 46, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE) + file);
    }

    @Deprecated
    public MT(File file, InterfaceC1085Ml interfaceC1085Ml, byte[] bArr, boolean z11) {
        this(file, interfaceC1085Ml, null, bArr, z11, true);
    }

    public static long A00(File file) throws IOException {
        long jNextLong = new SecureRandom().nextLong();
        long jAbs = jNextLong == Long.MIN_VALUE ? 0L : Math.abs(jNextLong);
        File file2 = new File(file, Long.toString(jAbs, 16) + A04(0, 4, 38));
        if (file2.createNewFile()) {
            return jAbs;
        }
        throw new IOException(A04(75, 27, 39) + file2);
    }

    public static long A01(String str) {
        return Long.parseLong(str.substring(0, str.indexOf(46)), 16);
    }

    public static long A02(File[] fileArr) {
        for (File file : fileArr) {
            String fileName = file.getName();
            if (fileName.endsWith(A04(0, 4, 38))) {
                try {
                    return A01(fileName);
                } catch (NumberFormatException unused) {
                    MV.A05(A04(297, 11, 39), A04(277, 20, 103) + file);
                    file.delete();
                }
            }
        }
        return -1L;
    }

    private MK A03(String str, long j11, long j12) {
        MK mkA04;
        C1688eS c1688eSA0C = this.A06.A0C(str);
        if (c1688eSA0C == null) {
            return MK.A03(str, j11, j12);
        }
        while (true) {
            mkA04 = c1688eSA0C.A04(j11, j12);
            if (!mkA04.A05 || mkA04.A03.length() == mkA04.A01) {
                break;
            }
            A06();
        }
        return mkA04;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05() throws NumberFormatException {
        if (!this.A07.exists()) {
            try {
                A0F(this.A07);
            } catch (C1668e8 e3) {
                this.A02 = e3;
                return;
            }
        }
        File[] fileArrListFiles = this.A07.listFiles();
        String strA04 = A04(297, 11, 39);
        if (fileArrListFiles == null) {
            String str = A04(200, 38, 105) + this.A07;
            MV.A05(strA04, str);
            this.A02 = new C1668e8(str);
            return;
        }
        this.A01 = A02(fileArrListFiles);
        if (this.A01 == -1) {
            try {
                this.A01 = A00(this.A07);
            } catch (IOException e11) {
                String str2 = A04(102, 28, 65) + this.A07;
                MV.A08(strA04, str2, e11);
                this.A02 = new C1668e8(str2, e11);
                return;
            }
        }
        try {
            this.A06.A0J(this.A01);
            if (this.A05 != null) {
                this.A05.A06(this.A01);
                Map<String, C1676eG> mapA05 = this.A05.A05();
                A0G(this.A07, true, fileArrListFiles, mapA05);
                this.A05.A09(mapA05.keySet());
            } else {
                A0G(this.A07, true, fileArrListFiles, null);
            }
            this.A06.A0H();
            try {
                this.A06.A0I();
            } catch (IOException e12) {
                MV.A08(strA04, A04(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE, 25, 5), e12);
            }
        } catch (IOException e13) {
            String str3 = A04(164, 36, 7) + this.A07;
            MV.A08(strA04, str3, e13);
            this.A02 = new C1668e8(str3, e13);
        }
    }

    private void A06() {
        ArrayList arrayList = new ArrayList();
        Iterator<C1688eS> it = this.A06.A0G().iterator();
        while (it.hasNext()) {
            Iterator<MK> it2 = it.next().A06().iterator();
            while (it2.hasNext()) {
                MK next = it2.next();
                if (A0C[2].charAt(6) != '3') {
                    throw new RuntimeException();
                }
                String[] strArr = A0C;
                strArr[0] = "eawN8WoeO";
                strArr[1] = "IBPata17s";
                MK mk2 = next;
                if (mk2.A03.length() != mk2.A01) {
                    arrayList.add(mk2);
                }
            }
        }
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            A0A((C1681eL) arrayList.get(i5));
        }
    }

    private final synchronized void A08() throws C1668e8 {
        if (this.A02 != null) {
            throw this.A02;
        }
    }

    private void A09(C1681eL c1681eL) {
        ArrayList<InterfaceC1670eA> arrayList = this.A08.get(c1681eL.A04);
        if (arrayList != null) {
            for (int i5 = arrayList.size() - 1; i5 >= 0; i5--) {
                arrayList.get(i5).AHA(this, c1681eL);
            }
        }
        this.A04.AHA(this, c1681eL);
    }

    private void A0A(C1681eL c1681eL) {
        C1688eS c1688eSA0C = this.A06.A0C(c1681eL.A04);
        if (c1688eSA0C == null || !c1688eSA0C.A0D(c1681eL)) {
            return;
        }
        this.A00 -= c1681eL.A01;
        if (this.A05 != null) {
            String name = c1681eL.A03.getName();
            try {
                this.A05.A07(name);
            } catch (IOException unused) {
                MV.A07(A04(297, 11, 39), A04(238, 39, 69) + name);
            }
        }
        C1690eU c1690eU = this.A06;
        String str = c1688eSA0C.A02;
        if (A0C[7].charAt(27) != 'P') {
            throw new RuntimeException();
        }
        A0C[7] = "4FBL0ef2jxD9PjGt0TcD7gEGeZLPOBaN";
        c1690eU.A0K(str);
        A09(c1681eL);
    }

    private void A0C(MK mk2) {
        this.A06.A0D(mk2.A04).A08(mk2);
        this.A00 += mk2.A01;
        A0D(mk2);
    }

    private void A0D(MK mk2) {
        ArrayList<InterfaceC1670eA> arrayList = this.A08.get(mk2.A04);
        if (arrayList != null) {
            for (int i5 = arrayList.size() - 1; i5 >= 0; i5--) {
                arrayList.get(i5).AH9(this, mk2);
            }
        }
        InterfaceC1085Ml interfaceC1085Ml = this.A04;
        String[] strArr = A0C;
        if (strArr[3].charAt(25) != strArr[6].charAt(25)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0C;
        strArr2[3] = "z3BmcKNpVL7bPTToNuM3mCqzkJELDM7m";
        strArr2[6] = "DURKtpzSiLeRaXMV7NFaS6Sl3Jus5Q8f";
        interfaceC1085Ml.AH9(this, mk2);
    }

    private void A0E(MK mk2, C1681eL c1681eL) {
        ArrayList<InterfaceC1670eA> arrayList = this.A08.get(mk2.A04);
        if (arrayList != null) {
            for (int i5 = arrayList.size() - 1; i5 >= 0; i5--) {
                arrayList.get(i5).AHB(this, mk2, c1681eL);
            }
        }
        this.A04.AHB(this, mk2, c1681eL);
    }

    public static void A0F(File file) throws C1668e8 {
        if (file.mkdirs() || file.isDirectory()) {
            return;
        }
        String str = A04(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 34, 26) + file;
        String message = A04(297, 11, 39);
        MV.A05(message, str);
        throw new C1668e8(str);
    }

    public static synchronized boolean A0H(File file) {
        return A0D.add(file.getAbsoluteFile());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized void A4f(String str, C1693eX c1693eX) throws C1668e8 {
        AbstractC1062Ln.A08(!this.A03);
        A08();
        this.A06.A0L(str, c1693eX);
        try {
            this.A06.A0I();
        } catch (IOException e3) {
            throw new C1668e8(e3);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized void A5e(File file, long j11) throws C1668e8 {
        AbstractC1062Ln.A08(!this.A03);
        if (file.exists()) {
            if (j11 == 0) {
                file.delete();
                return;
            }
            MK mk2 = (MK) AbstractC1062Ln.A01(MK.A01(file, j11, this.A06));
            C1688eS c1688eS = (C1688eS) AbstractC1062Ln.A01(this.A06.A0C(mk2.A04));
            AbstractC1062Ln.A08(c1688eS.A0B(mk2.A02, mk2.A01));
            long jA00 = AbstractC1691eV.A00(c1688eS.A03());
            if (jA00 != -1) {
                AbstractC1062Ln.A08(mk2.A02 + mk2.A01 <= jA00);
            }
            if (this.A05 != null) {
                try {
                    this.A05.A08(file.getName(), mk2.A01, mk2.A00);
                    A0C(mk2);
                    try {
                        this.A06.A0I();
                        notifyAll();
                        return;
                    } catch (IOException e3) {
                        throw new C1668e8(e3);
                    }
                } catch (IOException e11) {
                    throw new C1668e8(e11);
                }
            }
            A0C(mk2);
            this.A06.A0I();
            notifyAll();
            return;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized long A7k() {
        AbstractC1062Ln.A08(!this.A03);
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    @MetaExoPlayerCustomization
    public final synchronized long A7m(String str, long j11, long j12) {
        C1688eS cachedContent;
        AbstractC1062Ln.A08(!this.A03);
        if (j12 == -1) {
            j12 = Long.MAX_VALUE;
        }
        cachedContent = this.A06.A0C(str);
        return cachedContent != null ? cachedContent.A02(j11, j12) : -j12;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized InterfaceC1692eW A83(String str) {
        AbstractC1062Ln.A08(!this.A03);
        return this.A06.A0E(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized void AIu(C1681eL c1681eL) {
        AbstractC1062Ln.A08(!this.A03);
        C1688eS c1688eS = (C1688eS) AbstractC1062Ln.A01(this.A06.A0C(c1681eL.A04));
        c1688eS.A07(c1681eL.A02);
        this.A06.A0K(c1688eS.A02);
        notifyAll();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized void AJl(String str) {
        AbstractC1062Ln.A08(!this.A03);
        Iterator<C1681eL> it = A0I(str).iterator();
        while (it.hasNext()) {
            A0A(it.next());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized void AJm(C1681eL c1681eL) {
        AbstractC1062Ln.A08(!this.A03);
        A0A(c1681eL);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized File ALR(String str, long lastTouchTimestamp, long j11) throws C1668e8 {
        C1688eS c1688eSA0C;
        File file;
        AbstractC1062Ln.A08(!this.A03);
        A08();
        c1688eSA0C = this.A06.A0C(str);
        AbstractC1062Ln.A01(c1688eSA0C);
        AbstractC1062Ln.A08(c1688eSA0C.A0B(lastTouchTimestamp, j11));
        if (!this.A07.exists()) {
            A0F(this.A07);
            A06();
        }
        this.A04.AHC(this, str, lastTouchTimestamp, j11);
        file = new File(this.A07, Integer.toString(this.A09.nextInt(10)));
        if (!file.exists()) {
            A0F(file);
        }
        return MK.A04(file, c1688eSA0C.A01, lastTouchTimestamp, System.currentTimeMillis());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized C1681eL ALT(String str, long j11, long j12, EnumC1669e9 enumC1669e9) throws C1668e8, InterruptedException {
        C1681eL span;
        AbstractC1062Ln.A08(!this.A03);
        A08();
        while (true) {
            span = ALU(str, j11, j12, enumC1669e9);
            if (span == null) {
                wait();
            }
        }
        return span;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1671eB
    public final synchronized MK ALU(String str, long j11, long j12, EnumC1669e9 enumC1669e9) throws C1668e8 {
        AbstractC1062Ln.A08(!this.A03);
        A08();
        MK mkA03 = A03(str, j11, j12);
        if (mkA03.A05) {
            MK span = this.A06.A0C(str).A05(mkA03, mkA03.A00, false);
            A0E(mkA03, span);
            return span;
        }
        if (this.A06.A0D(str).A0C(j11, mkA03.A01)) {
            return mkA03;
        }
        return null;
    }
}
