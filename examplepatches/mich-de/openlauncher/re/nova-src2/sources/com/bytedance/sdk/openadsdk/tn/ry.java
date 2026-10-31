package com.bytedance.sdk.openadsdk.tn;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import b.u4;
import java.lang.reflect.Array;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
final class ry {

    /* renamed from: dj, reason: collision with root package name */
    private final fby f27059dj;
    private final lud sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f27060zb;

    /* renamed from: com.bytedance.sdk.openadsdk.tn.ry$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        /* renamed from: zb, reason: collision with root package name */
        static final /* synthetic */ int[] f27061zb;

        static {
            int[] iArr = new int[xkz.values().length];
            f27061zb = iArr;
            try {
                iArr[xkz.KANJI.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", 144);
            }
            try {
                f27061zb[xkz.ALPHANUMERIC.ordinal()] = 2;
            } catch (NoSuchFieldError e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", 144);
            }
            try {
                f27061zb[xkz.NUMERIC.ordinal()] = 3;
            } catch (NoSuchFieldError e12) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", 144);
            }
            try {
                f27061zb[xkz.BYTE.ordinal()] = 4;
            } catch (NoSuchFieldError e13) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", 144);
            }
            try {
                f27061zb[xkz.ECI.ordinal()] = 5;
            } catch (NoSuchFieldError e14) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e14, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", 144);
            }
            int[] iArr2 = new int[sya.values().length];
            ycx = iArr2;
            try {
                iArr2[sya.SMALL.ordinal()] = 1;
            } catch (NoSuchFieldError e15) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e15, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[sya.MEDIUM.ordinal()] = 2;
            } catch (NoSuchFieldError e16) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e16, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[sya.LARGE.ordinal()] = 3;
            } catch (NoSuchFieldError e17) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e17, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "ducjnA69ZeKOSdhZiQPkeQ==", "B+0hnA21fZk=", -1);
            }
        }
    }

    public enum sya {
        SMALL("version 1-9"),
        MEDIUM("version 10-26"),
        LARGE("version 27-40");

        sya(String str) {
        }
    }

    public final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private final int f27064dj;

        /* renamed from: lt, reason: collision with root package name */
        private final ycx f27065lt;
        private final int lud;
        private final int sya;

        /* renamed from: ul, reason: collision with root package name */
        private final int f27066ul;

        /* renamed from: zb, reason: collision with root package name */
        private final xkz f27067zb;

        public /* synthetic */ ycx(ry ryVar, xkz xkzVar, int i5, int i11, int i12, ycx ycxVar, uh uhVar, AnonymousClass1 anonymousClass1) {
            this(xkzVar, i5, i11, i12, ycxVar, uhVar);
        }

        private ycx(xkz xkzVar, int i5, int i11, int i12, ycx ycxVar, uh uhVar) {
            this.f27067zb = xkzVar;
            this.sya = i5;
            xkz xkzVar2 = xkz.BYTE;
            int i13 = (xkzVar == xkzVar2 || ycxVar == null) ? i11 : ycxVar.f27064dj;
            this.f27064dj = i13;
            this.lud = i12;
            this.f27065lt = ycxVar;
            boolean z11 = false;
            int iYcx = ycxVar != null ? ycxVar.f27066ul : 0;
            if ((xkzVar == xkzVar2 && ycxVar == null && i13 != 0) || (ycxVar != null && i13 != ycxVar.f27064dj)) {
                z11 = true;
            }
            iYcx = (ycxVar == null || xkzVar != ycxVar.f27067zb || z11) ? iYcx + xkzVar.ycx(uhVar) + 4 : iYcx;
            int i14 = AnonymousClass1.f27061zb[xkzVar.ordinal()];
            if (i14 == 1) {
                iYcx += 13;
            } else if (i14 == 2) {
                iYcx += i12 == 1 ? 6 : 11;
            } else if (i14 == 3) {
                iYcx += i12 != 1 ? i12 == 2 ? 7 : 10 : 4;
            } else if (i14 == 4) {
                iYcx += ry.this.sya.ycx(ry.this.ycx.substring(i5, i12 + i5), i11).length * 8;
                if (z11) {
                    iYcx += 12;
                }
            }
            this.f27066ul = iYcx;
        }
    }

    public final class zb {
        private final uh sya;

        /* renamed from: zb, reason: collision with root package name */
        private final List<ycx> f27068zb = new ArrayList();

        public final class ycx {

            /* renamed from: dj, reason: collision with root package name */
            private final int f27069dj;
            private final int lud;
            private final int sya;

            /* renamed from: zb, reason: collision with root package name */
            private final xkz f27070zb;

            public ycx(xkz xkzVar, int i5, int i11, int i12) {
                this.f27070zb = xkzVar;
                this.sya = i5;
                this.f27069dj = i11;
                this.lud = i12;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public int ycx(uh uhVar) {
                int iYcx = this.f27070zb.ycx(uhVar);
                int i5 = iYcx + 4;
                int i11 = AnonymousClass1.f27061zb[this.f27070zb.ordinal()];
                if (i11 == 1) {
                    return (this.lud * 13) + i5;
                }
                if (i11 == 2) {
                    int i12 = this.lud;
                    return u4.b(i12, 2, 11, i5) + (i12 % 2 == 1 ? 6 : 0);
                }
                if (i11 != 3) {
                    if (i11 != 4) {
                        return i11 != 5 ? i5 : iYcx + 12;
                    }
                    return (ycx() * 8) + i5;
                }
                int i13 = this.lud;
                int iB = u4.b(i13, 3, 10, i5);
                int i14 = i13 % 3;
                if (i14 == 1) {
                    i = 4;
                } else if (i14 == 2) {
                    i = 7;
                }
                return iB + i;
            }

            private int ycx() {
                if (this.f27070zb != xkz.BYTE) {
                    return this.lud;
                }
                lud ludVar = ry.this.sya;
                String str = ry.this.ycx;
                int i5 = this.sya;
                return ludVar.ycx(str.substring(i5, this.lud + i5), this.f27069dj).length;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void ycx(com.bytedance.sdk.openadsdk.tn.ycx ycxVar) throws htf {
                ycxVar.ycx(this.f27070zb.ycx(), 4);
                if (this.lud > 0) {
                    ycxVar.ycx(ycx(), this.f27070zb.ycx(zb.this.sya));
                }
                if (this.f27070zb == xkz.ECI) {
                    ycxVar.ycx(ry.this.sya.zb(this.f27069dj), 8);
                } else if (this.lud > 0) {
                    String str = ry.this.ycx;
                    int i5 = this.sya;
                    ul.ycx(str.substring(i5, this.lud + i5), this.f27070zb, ycxVar, ry.this.sya.ycx(this.f27069dj));
                }
            }
        }

        public zb(uh uhVar, ycx ycxVar) {
            int i5;
            int i11;
            int i12;
            ycx ycxVar2 = ycxVar;
            int i13 = 0;
            int i14 = 0;
            while (true) {
                if (ycxVar2 == null) {
                    break;
                }
                int i15 = i13 + ycxVar2.lud;
                ycx ycxVar3 = ycxVar2.f27065lt;
                boolean z11 = (ycxVar2.f27067zb == xkz.BYTE && ycxVar3 == null && ycxVar2.f27064dj != 0) || !(ycxVar3 == null || ycxVar2.f27064dj == ycxVar3.f27064dj);
                i5 = z11 ? 1 : i14;
                if (ycxVar3 == null || ycxVar3.f27067zb != ycxVar2.f27067zb || z11) {
                    this.f27068zb.add(0, new ycx(ycxVar2.f27067zb, ycxVar2.sya, ycxVar2.f27064dj, i15));
                    i12 = 0;
                } else {
                    i12 = i15;
                }
                if (z11) {
                    this.f27068zb.add(0, new ycx(xkz.ECI, ycxVar2.sya, ycxVar2.f27064dj, 0));
                }
                i14 = i5;
                ycxVar2 = ycxVar3;
                i13 = i12;
            }
            if (ry.this.f27060zb) {
                ycx ycxVar4 = this.f27068zb.get(0);
                if (ycxVar4 != null) {
                    xkz xkzVar = ycxVar4.f27070zb;
                    int i16 = i14;
                    xkz xkzVar2 = xkz.ECI;
                    if (xkzVar != xkzVar2 && i16 != 0) {
                        this.f27068zb.add(0, new ycx(xkzVar2, 0, 0, 0));
                    }
                }
                this.f27068zb.add(this.f27068zb.get(0).f27070zb == xkz.ECI ? 1 : 0, new ycx(xkz.FNC1_FIRST_POSITION, 0, 0, 0));
            }
            int iYcx = uhVar.ycx();
            int i17 = AnonymousClass1.ycx[ry.zb(uhVar).ordinal()];
            if (i17 == 1) {
                i11 = 9;
            } else if (i17 != 2) {
                i5 = 27;
                i11 = 40;
            } else {
                i5 = 10;
                i11 = 26;
            }
            int iYcx2 = ycx(uhVar);
            while (iYcx < i11 && !ul.ycx(iYcx2, uh.ycx(iYcx), ry.this.f27059dj)) {
                iYcx++;
            }
            while (iYcx > i5 && ul.ycx(iYcx2, uh.ycx(iYcx - 1), ry.this.f27059dj)) {
                iYcx--;
            }
            this.sya = uh.ycx(iYcx);
        }

        public uh zb() {
            return this.sya;
        }

        public int ycx() {
            return ycx(this.sya);
        }

        private int ycx(uh uhVar) {
            Iterator<ycx> it = this.f27068zb.iterator();
            int iYcx = 0;
            while (it.hasNext()) {
                iYcx += it.next().ycx(uhVar);
            }
            return iYcx;
        }

        public void ycx(com.bytedance.sdk.openadsdk.tn.ycx ycxVar) throws htf {
            Iterator<ycx> it = this.f27068zb.iterator();
            while (it.hasNext()) {
                it.next().ycx(ycxVar);
            }
        }
    }

    public ry(String str, Charset charset, boolean z11, fby fbyVar) {
        this.ycx = str;
        this.f27060zb = z11;
        this.sya = new lud(str, charset, -1);
        this.f27059dj = fbyVar;
    }

    public static boolean ycx(char c11) {
        return c11 >= '0' && c11 <= '9';
    }

    public static boolean sya(char c11) {
        return ul.ycx(c11) != -1;
    }

    public static sya zb(uh uhVar) {
        return uhVar.ycx() <= 9 ? sya.SMALL : uhVar.ycx() <= 26 ? sya.MEDIUM : sya.LARGE;
    }

    public static zb ycx(String str, uh uhVar, Charset charset, boolean z11, fby fbyVar) throws htf {
        return new ry(str, charset, z11, fbyVar).ycx(uhVar);
    }

    public static boolean zb(char c11) {
        return ul.ycx(String.valueOf(c11));
    }

    public zb sya(uh uhVar) throws htf {
        int length = this.ycx.length();
        ycx[][][] ycxVarArr = (ycx[][][]) Array.newInstance((Class<?>) ycx.class, length + 1, this.sya.ycx(), 4);
        ycx(uhVar, ycxVarArr, 0, null);
        for (int i5 = 1; i5 <= length; i5++) {
            for (int i11 = 0; i11 < this.sya.ycx(); i11++) {
                for (int i12 = 0; i12 < 4; i12++) {
                    ycx ycxVar = ycxVarArr[i5][i11][i12];
                    if (ycxVar != null && i5 < length) {
                        ycx(uhVar, ycxVarArr, i5, ycxVar);
                    }
                }
            }
        }
        int i13 = -1;
        int i14 = Integer.MAX_VALUE;
        int i15 = -1;
        for (int i16 = 0; i16 < this.sya.ycx(); i16++) {
            for (int i17 = 0; i17 < 4; i17++) {
                ycx ycxVar2 = ycxVarArr[length][i16][i17];
                if (ycxVar2 != null && ycxVar2.f27066ul < i14) {
                    i14 = ycxVar2.f27066ul;
                    i13 = i16;
                    i15 = i17;
                }
            }
        }
        if (i13 >= 0) {
            return new zb(uhVar, ycxVarArr[length][i13][i15]);
        }
        throw new htf(c0.q(new StringBuilder("Internal error: failed to encode \""), this.ycx, "\""));
    }

    public zb ycx(uh uhVar) throws htf {
        if (uhVar == null) {
            uh[] uhVarArr = {ycx(sya.SMALL), ycx(sya.MEDIUM), ycx(sya.LARGE)};
            zb[] zbVarArr = {sya(uhVarArr[0]), sya(uhVarArr[1]), sya(uhVarArr[2])};
            int i5 = LayoutNode.NotPlacedPlaceOrder;
            int i11 = -1;
            for (int i12 = 0; i12 < 3; i12++) {
                int iYcx = zbVarArr[i12].ycx();
                if (ul.ycx(iYcx, uhVarArr[i12], this.f27059dj) && iYcx < i5) {
                    i11 = i12;
                    i5 = iYcx;
                }
            }
            if (i11 >= 0) {
                return zbVarArr[i11];
            }
            throw new htf("Data too big for any version");
        }
        zb zbVarSya = sya(uhVar);
        if (ul.ycx(zbVarSya.ycx(), ycx(zb(zbVarSya.zb())), this.f27059dj)) {
            return zbVarSya;
        }
        throw new htf("Data too big for version".concat(String.valueOf(uhVar)));
    }

    public static uh ycx(sya syaVar) {
        int i5 = AnonymousClass1.ycx[syaVar.ordinal()];
        if (i5 == 1) {
            return uh.ycx(9);
        }
        if (i5 != 2) {
            return uh.ycx(40);
        }
        return uh.ycx(26);
    }

    public boolean ycx(xkz xkzVar, char c11) {
        int i5 = AnonymousClass1.f27061zb[xkzVar.ordinal()];
        if (i5 == 1) {
            return zb(c11);
        }
        if (i5 == 2) {
            return sya(c11);
        }
        if (i5 != 3) {
            return i5 == 4;
        }
        return ycx(c11);
    }

    public static int ycx(xkz xkzVar) {
        int i5;
        if (xkzVar == null || (i5 = AnonymousClass1.f27061zb[xkzVar.ordinal()]) == 1) {
            return 0;
        }
        if (i5 == 2) {
            return 1;
        }
        if (i5 == 3) {
            return 2;
        }
        if (i5 == 4) {
            return 3;
        }
        throw new IllegalStateException("Illegal mode ".concat(String.valueOf(xkzVar)));
    }

    public void ycx(ycx[][][] ycxVarArr, int i5, ycx ycxVar) {
        ycx[] ycxVarArr2 = ycxVarArr[i5 + ycxVar.lud][ycxVar.f27064dj];
        int iYcx = ycx(ycxVar.f27067zb);
        ycx ycxVar2 = ycxVarArr2[iYcx];
        if (ycxVar2 == null || ycxVar2.f27066ul > ycxVar.f27066ul) {
            ycxVarArr2[iYcx] = ycxVar;
        }
    }

    public void ycx(uh uhVar, ycx[][][] ycxVarArr, int i5, ycx ycxVar) {
        int i11;
        int iYcx = this.sya.ycx();
        int iZb = this.sya.zb();
        if (iZb < 0 || !this.sya.ycx(this.ycx.charAt(i5), iZb)) {
            iZb = 0;
        } else {
            iYcx = iZb + 1;
        }
        int i12 = iYcx;
        for (int i13 = iZb; i13 < i12; i13++) {
            if (this.sya.ycx(this.ycx.charAt(i5), i13)) {
                ycx(ycxVarArr, i5, new ycx(this, xkz.BYTE, i5, i13, 1, ycxVar, uhVar, null));
            }
        }
        xkz xkzVar = xkz.KANJI;
        if (ycx(xkzVar, this.ycx.charAt(i5))) {
            ycx(ycxVarArr, i5, new ycx(this, xkzVar, i5, 0, 1, ycxVar, uhVar, null));
        }
        int length = this.ycx.length();
        xkz xkzVar2 = xkz.ALPHANUMERIC;
        int i14 = 2;
        if (ycx(xkzVar2, this.ycx.charAt(i5))) {
            int i15 = i5 + 1;
            ycx(ycxVarArr, i5, new ycx(this, xkzVar2, i5, 0, (i15 >= length || !ycx(xkzVar2, this.ycx.charAt(i15))) ? 1 : 2, ycxVar, uhVar, null));
        }
        xkz xkzVar3 = xkz.NUMERIC;
        if (ycx(xkzVar3, this.ycx.charAt(i5))) {
            int i16 = i5 + 1;
            if (i16 >= length || !ycx(xkzVar3, this.ycx.charAt(i16))) {
                i11 = 1;
            } else {
                int i17 = i5 + 2;
                if (i17 < length && ycx(xkzVar3, this.ycx.charAt(i17))) {
                    i14 = 3;
                }
                i11 = i14;
            }
            ycx(ycxVarArr, i5, new ycx(this, xkzVar3, i5, 0, i11, ycxVar, uhVar, null));
        }
    }
}
