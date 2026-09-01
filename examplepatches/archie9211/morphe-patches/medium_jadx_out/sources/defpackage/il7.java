package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Typeface;
import android.os.Build;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.reader.R;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.File;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class il7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static boolean e = false;
    public static long f = 3000;
    public static long g = 30000;
    public static int h = 3;

    public il7() {
        new ConcurrentHashMap();
    }

    public static final Object A(l75 l75Var, o75 o75Var, int i) {
        l75Var.getClass();
        l75Var.m(o75Var);
        zf4 zf4Var = l75Var.a;
        m75 m75Var = o75Var.d;
        zf4Var.getClass();
        ngc ngcVar = zf4Var.a;
        if (!m75Var.c) {
            ay0.e("getRepeatedField() can only be called on repeated fields.");
            return null;
        }
        Object obj = ngcVar.get(m75Var);
        if (i < (obj == null ? 0 : ((List) obj).size())) {
            l75Var.m(o75Var);
            if (m75Var.c) {
                Object obj2 = ngcVar.get(m75Var);
                if (obj2 != null) {
                    return o75Var.a(((List) obj2).get(i));
                }
                throw new IndexOutOfBoundsException();
            }
            ay0.e("getRepeatedField() can only be called on repeated fields.");
        }
        return null;
    }

    public static void B(String str, Object obj) {
        if (obj != null) {
            return;
        }
        z72.c(str);
    }

    public static final mkd C(mkd mkdVar, ip6 ip6Var) {
        int i;
        skc skcVar = mkdVar.a;
        wid widVar = ukc.d;
        wid widVarD = skcVar.a.d(new tkc(0));
        long j = skcVar.b;
        rkd[] rkdVarArr = qkd.b;
        if ((j & 1095216660480L) == 0) {
            j = ukc.a;
        }
        long j2 = j;
        d05 d05Var = skcVar.c;
        if (d05Var == null) {
            d05Var = d05.f;
        }
        d05 d05Var2 = d05Var;
        zz4 zz4Var = skcVar.d;
        zz4 zz4Var2 = new zz4(zz4Var != null ? zz4Var.a : 0);
        a05 a05Var = skcVar.e;
        a05 a05Var2 = new a05(a05Var != null ? a05Var.a : 65535);
        az4 az4Var = skcVar.f;
        if (az4Var == null) {
            az4Var = az4.a;
        }
        az4 az4Var2 = az4Var;
        String str = skcVar.g;
        if (str == null) {
            str = "";
        }
        String str2 = str;
        long j3 = skcVar.h;
        if ((j3 & 1095216660480L) == 0) {
            j3 = ukc.b;
        }
        long j4 = j3;
        lo0 lo0Var = skcVar.i;
        float f2 = lo0Var != null ? lo0Var.a : 0.0f;
        lo0 lo0Var2 = new lo0(Float.isNaN(f2) ? 0.0f : f2);
        xid xidVar = skcVar.j;
        if (xidVar == null) {
            xidVar = xid.c;
        }
        xid xidVar2 = xidVar;
        h67 h67VarF = skcVar.k;
        if (h67VarF == null) {
            h67 h67Var = h67.c;
            h67VarF = ka9.a.f();
        }
        h67 h67Var2 = h67VarF;
        long j5 = skcVar.l;
        if (j5 == 16) {
            j5 = ukc.c;
        }
        long j6 = j5;
        ohd ohdVar = skcVar.m;
        if (ohdVar == null) {
            ohdVar = ohd.b;
        }
        ohd ohdVar2 = ohdVar;
        i3c i3cVar = skcVar.n;
        if (i3cVar == null) {
            i3cVar = i3c.d;
        }
        i3c i3cVar2 = i3cVar;
        pxf pxfVar = skcVar.o;
        if (pxfVar == null) {
            pxfVar = ph4.R;
        }
        skc skcVar2 = new skc(widVarD, j2, d05Var2, zz4Var2, a05Var2, az4Var2, str2, j4, lo0Var2, xidVar2, h67Var2, j6, ohdVar2, i3cVar2, pxfVar);
        s29 s29Var = mkdVar.b;
        int i2 = t29.b;
        int i3 = s29Var.a;
        int i4 = 5;
        int i5 = i3 == 0 ? 5 : i3;
        int i6 = s29Var.b;
        if (i6 == 3) {
            int i7 = nkd.a[ip6Var.ordinal()];
            if (i7 == 1) {
                i4 = 4;
            } else if (i7 != 2) {
                ygf.a();
                return null;
            }
            i = i4;
        } else if (i6 == 0) {
            int i8 = nkd.a[ip6Var.ordinal()];
            if (i8 == 1) {
                i = 1;
            } else {
                if (i8 != 2) {
                    ygf.a();
                    return null;
                }
                i = 2;
            }
        } else {
            i = i6;
        }
        long j7 = s29Var.c;
        if ((j7 & 1095216660480L) == 0) {
            j7 = t29.a;
        }
        yid yidVar = s29Var.d;
        if (yidVar == null) {
            yidVar = yid.c;
        }
        yid yidVar2 = yidVar;
        pa9 pa9Var = s29Var.e;
        lz6 lz6Var = s29Var.f;
        int i9 = s29Var.g;
        if (i9 == 0) {
            i9 = bz6.b;
        }
        int i10 = i9;
        int i11 = s29Var.h;
        int i12 = i11 == 0 ? 1 : i11;
        zjd zjdVar = s29Var.i;
        if (zjdVar == null) {
            zjdVar = zjd.c;
        }
        return new mkd(skcVar2, new s29(i5, i, j7, yidVar2, pa9Var, lz6Var, i10, i12, zjdVar), mkdVar.c);
    }

    public static void D(ao6 ao6Var, ds0 ds0Var) {
        PorterDuff.Mode mode;
        if (Build.VERSION.SDK_INT >= 29) {
            nm.C(ao6Var, ds0Var != null ? nm.w(ds0Var) : null);
            return;
        }
        if (ds0Var == null) {
            ao6Var.setXfermode(null);
            return;
        }
        switch (es0.a[ds0Var.ordinal()]) {
            case 1:
                mode = PorterDuff.Mode.CLEAR;
                break;
            case 2:
                mode = PorterDuff.Mode.SRC;
                break;
            case 3:
                mode = PorterDuff.Mode.DST;
                break;
            case 4:
                mode = PorterDuff.Mode.SRC_OVER;
                break;
            case 5:
                mode = PorterDuff.Mode.DST_OVER;
                break;
            case 6:
                mode = PorterDuff.Mode.SRC_IN;
                break;
            case 7:
                mode = PorterDuff.Mode.DST_IN;
                break;
            case 8:
                mode = PorterDuff.Mode.SRC_OUT;
                break;
            case 9:
                mode = PorterDuff.Mode.DST_OUT;
                break;
            case 10:
                mode = PorterDuff.Mode.SRC_ATOP;
                break;
            case 11:
                mode = PorterDuff.Mode.DST_ATOP;
                break;
            case 12:
                mode = PorterDuff.Mode.XOR;
                break;
            case 13:
                mode = PorterDuff.Mode.ADD;
                break;
            case 14:
                mode = PorterDuff.Mode.MULTIPLY;
                break;
            case 15:
                mode = PorterDuff.Mode.SCREEN;
                break;
            case 16:
                mode = PorterDuff.Mode.OVERLAY;
                break;
            case 17:
                mode = PorterDuff.Mode.DARKEN;
                break;
            case 18:
                mode = PorterDuff.Mode.LIGHTEN;
                break;
            default:
                mode = null;
                break;
        }
        ao6Var.setXfermode(mode != null ? new PorterDuffXfermode(mode) : null);
    }

    public static final void E(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, int i) {
        if (i < 0 || byteBuffer2.remaining() < i || byteBuffer3.remaining() < i || byteBuffer.remaining() < i) {
            ay0.e("That combination of buffers, offsets and length to xor result in out-of-bond accesses.");
            return;
        }
        for (int i2 = 0; i2 < i; i2++) {
            byteBuffer.put((byte) (byteBuffer2.get() ^ byteBuffer3.get()));
        }
    }

    public static final byte[] F(byte[] bArr, int i, byte[] bArr2, int i2) {
        if (i2 < 0 || bArr.length - i2 < i || bArr2.length - i2 < 0) {
            ay0.e("That combination of buffers, offsets and length to xor result in out-of-bond accesses.");
            return null;
        }
        byte[] bArr3 = new byte[i2];
        for (int i3 = 0; i3 < i2; i3++) {
            bArr3[i3] = (byte) (bArr[i3 + i] ^ bArr2[i3]);
        }
        return bArr3;
    }

    public static final byte[] G(byte[] bArr, byte[] bArr2) {
        if (bArr.length == bArr2.length) {
            return F(bArr, 0, bArr2, bArr.length);
        }
        ay0.e("The lengths of x and y should match.");
        return null;
    }

    public static byte[] H(byte[]... bArr) throws GeneralSecurityException {
        int length = 0;
        for (byte[] bArr2 : bArr) {
            if (length > Integer.MAX_VALUE - bArr2.length) {
                ygf.l("exceeded size limit");
                return null;
            }
            length += bArr2.length;
        }
        byte[] bArr3 = new byte[length];
        int length2 = 0;
        for (byte[] bArr4 : bArr) {
            System.arraycopy(bArr4, 0, bArr3, length2, bArr4.length);
            length2 += bArr4.length;
        }
        return bArr3;
    }

    public static final void I(pmf pmfVar, ArrayDeque arrayDeque) {
        if (!pmfVar.A()) {
            if (!(pmfVar instanceof uof)) {
                ay0.e("Has a new type of ByteString been created? Found ".concat(String.valueOf(pmfVar.getClass())));
                return;
            }
            uof uofVar = (uof) pmfVar;
            I(uofVar.d, arrayDeque);
            I(uofVar.e, arrayDeque);
            return;
        }
        int iBinarySearch = Arrays.binarySearch(uof.h, pmfVar.m());
        if (iBinarySearch < 0) {
            iBinarySearch = (-(iBinarySearch + 1)) - 1;
        }
        int iF = uof.F(iBinarySearch + 1);
        if (arrayDeque.isEmpty() || ((pmf) arrayDeque.peek()).m() >= iF) {
            arrayDeque.push(pmfVar);
            return;
        }
        int iF2 = uof.F(iBinarySearch);
        pmf uofVar2 = (pmf) arrayDeque.pop();
        while (!arrayDeque.isEmpty() && ((pmf) arrayDeque.peek()).m() < iF2) {
            uofVar2 = new uof((pmf) arrayDeque.pop(), uofVar2);
        }
        uof uofVar3 = new uof(uofVar2, pmfVar);
        while (!arrayDeque.isEmpty()) {
            int iBinarySearch2 = Arrays.binarySearch(uof.h, uofVar3.c);
            if (iBinarySearch2 < 0) {
                iBinarySearch2 = (-(iBinarySearch2 + 1)) - 1;
            }
            if (((pmf) arrayDeque.peek()).m() >= uof.F(iBinarySearch2 + 1)) {
                break;
            } else {
                uofVar3 = new uof((pmf) arrayDeque.pop(), uofVar3);
            }
        }
        arrayDeque.push(uofVar3);
    }

    public static final void a(mz1 mz1Var, b55 b55Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1302703572);
        int i2 = (p65Var.h(mz1Var) ? 4 : 2) | i | (p65Var.h(b55Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 16.0f, 0.0f, 8.0f, 0.0f, 10);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new id(15);
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7Var);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarE = w2g.E(kng.J(o28Var, "text"), 0.0f, 6.0f, 1);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR2);
            km4.H(i2 & 14, mz1Var, p65Var, true);
            r28 r28VarJ = kng.J(o28Var, "action");
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            int iS3 = w2g.s(p65Var);
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS3))) {
                lv8.w(iS3, p65Var, iS3, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR3);
            b55Var.invoke(p65Var, Integer.valueOf((i2 >> 3) & 14));
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new phc(mz1Var, b55Var, i);
        }
    }

    public static final void b(final dr9 dr9Var, final r28 r28Var, x12 x12Var, final int i) {
        final int i2;
        mwa mwaVarS;
        b55 b55Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-771433845);
        int i3 = (p65Var.f(dr9Var) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        final int i4 = 0;
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            i2 = 1;
            p65Var.S();
        } else {
            if (!(((p99) guc.x(dr9Var.o, new n99(false), p65Var, 0).getValue()) instanceof o99)) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    b55Var = new b55(dr9Var, r28Var, i, i4) { // from class: dtc
                        public final /* synthetic */ int a;
                        public final /* synthetic */ dr9 b;
                        public final /* synthetic */ r28 c;

                        {
                            this.a = i4;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i5 = this.a;
                            c1e c1eVar = c1e.a;
                            r28 r28Var2 = this.c;
                            dr9 dr9Var2 = this.b;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i5) {
                                case 0:
                                    il7.b(dr9Var2, r28Var2, x12Var2, tr7.y(1));
                                    break;
                                default:
                                    il7.b(dr9Var2, r28Var2, x12Var2, tr7.y(1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            r28 r28VarN = bgf.N(w2g.G(r28Var, 2.0f, 0.0f, 0.0f, 16.0f, 6), "pin_state");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ic_pinned, 0, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarL = jfc.l(o28Var, 16.0f);
            sn3 sn3Var = kt7.b;
            i2 = 1;
            qv5.b(c09VarJ, null, r28VarL, ((zo7) p65Var.j(sn3Var)).o, p65Var, 440, 0);
            jjd.b(vo7.R(p65Var, R.string.common_pinned_no_dot), w2g.G(o28Var, 10.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).n, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            b55Var = new b55(dr9Var, r28Var, i, i2) { // from class: dtc
                public final /* synthetic */ int a;
                public final /* synthetic */ dr9 b;
                public final /* synthetic */ r28 c;

                {
                    this.a = i2;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i52 = this.a;
                    c1e c1eVar = c1e.a;
                    r28 r28Var2 = this.c;
                    dr9 dr9Var2 = this.b;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i52) {
                        case 0:
                            il7.b(dr9Var2, r28Var2, x12Var2, tr7.y(1));
                            break;
                        default:
                            il7.b(dr9Var2, r28Var2, x12Var2, tr7.y(1));
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void c(final ql9 ql9Var, final ek8 ek8Var, x12 x12Var, int i) {
        int i2;
        String str = ql9Var.h;
        String strD = ql9Var.f;
        int i3 = ql9Var.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-472334272);
        int i4 = (p65Var.f(ql9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            String str2 = ql9Var.d;
            boolean z = ql9Var.a;
            kx kxVarW = ho2.w(p65Var, 1353310148);
            if (i3 == 1) {
                p65Var.Y(-73019861);
                p65Var.p(false);
                i2 = 1;
            } else {
                i2 = 1;
                p65Var.Y(-73018397);
                int i5 = i3 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i5, new Object[]{strD, Integer.valueOf(i5)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i2] = str;
            String strQ = vo7.Q(R.string.notification_type_post_recommended, objArr, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strD, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, strD.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = ql9Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
                int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i4 & 14;
                int i8 = (i6 == 32 ? i2 : 0) | (i7 == 4 ? i2 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i8 != 0 || objM == uobVar) {
                    objM = new m45() { // from class: rl9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i9 = i;
                            c1e c1eVar = c1e.a;
                            ql9 ql9Var2 = ql9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i9) {
                                case 0:
                                    ek8Var2.n(ql9Var2.c, ql9Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(ql9Var2.e, ql9Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i9 = (i6 == 32 ? i2 : 0) | (i7 == 4 ? i2 : 0);
                Object objM2 = p65Var.M();
                if (i9 != 0 || objM2 == uobVar) {
                    final int i10 = i2;
                    objM2 = new m45() { // from class: rl9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i92 = i10;
                            c1e c1eVar = c1e.a;
                            ql9 ql9Var2 = ql9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i92) {
                                case 0:
                                    ek8Var2.n(ql9Var2.c, ql9Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(ql9Var2.e, ql9Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str2, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(ql9Var, ek8Var, i, 11);
        }
    }

    public static final void d(final dr9 dr9Var, final sh9 sh9Var, final r28 r28Var, x12 x12Var, final int i) {
        mwa mwaVarS;
        b55 b55Var;
        yq0 yq0Var = z46.p;
        rz5 rz5Var = qb8.c;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1954432996);
        int i2 = (p65Var.f(r28Var) ? 256 : 128) | i | (p65Var.f(dr9Var) ? 4 : 2) | (p65Var.f(sh9Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            final cr9 cr9Var = dr9Var.q;
            if (cr9Var == null) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    final int i3 = 1;
                    b55Var = new b55(dr9Var, sh9Var, r28Var, i, i3) { // from class: ctc
                        public final /* synthetic */ int a;
                        public final /* synthetic */ dr9 b;
                        public final /* synthetic */ sh9 c;
                        public final /* synthetic */ r28 d;

                        {
                            this.a = i3;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i4 = this.a;
                            c1e c1eVar = c1e.a;
                            r28 r28Var2 = this.d;
                            sh9 sh9Var2 = this.c;
                            dr9 dr9Var2 = this.b;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i4) {
                                case 0:
                                    il7.d(dr9Var2, sh9Var2, r28Var2, x12Var2, tr7.y(1));
                                    break;
                                default:
                                    il7.d(dr9Var2, sh9Var2, r28Var2, x12Var2, tr7.y(1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            boolean z = cr9Var instanceof yq9;
            uob uobVar = w12.a;
            o28 o28Var = o28.b;
            if (z) {
                p65Var.Y(1309411005);
                wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
                long j = p65Var.T;
                int i4 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28Var);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, wv1VarA);
                tp7.B(p65Var, q12.e, i89VarL);
                tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR);
                yq9 yq9Var = (yq9) cr9Var;
                String str = yq9Var.b;
                String str2 = yq9Var.c;
                boolean z2 = yq9Var.d;
                String strR = vo7.R(p65Var, R.string.user_activity_clapped);
                sn3 sn3Var = kt7.b;
                long j2 = ((zo7) p65Var.j(sn3Var)).n;
                r28 r28VarN = bgf.N(o28Var, "cta_recommendation_reason");
                boolean zF = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(cr9Var);
                Object objM = p65Var.M();
                if (zF || objM == uobVar) {
                    final int i5 = 1;
                    objM = new m45() { // from class: btc
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i6 = i5;
                            c1e c1eVar = c1e.a;
                            dr9 dr9Var2 = dr9Var;
                            cr9 cr9Var2 = cr9Var;
                            sh9 sh9Var2 = sh9Var;
                            switch (i6) {
                                case 0:
                                    sh9Var2.i(((br9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                                case 1:
                                    sh9Var2.i(((yq9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                                default:
                                    sh9Var2.i(((zq9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                w2g.a(str, str2, z2, R.drawable.ic_clap_filled_16, strR, null, r28VarN, j2, (m45) objM, p65Var, 1572864, 0);
                tp7.e(0.0f, 6, 4, ((zo7) p65Var.j(sn3Var)).z, p65Var, jfc.e(w2g.G(o28Var, 11.5f, 8.0f, 0.0f, 8.0f, 4), 12.0f));
                p65Var.p(true);
                p65Var.p(false);
            } else if (cr9Var instanceof zq9) {
                p65Var.Y(1309449734);
                wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
                long j3 = p65Var.T;
                int i6 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28Var);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, wv1VarA2);
                tp7.B(p65Var, q12.e, i89VarL2);
                tp7.B(p65Var, q12.g, Integer.valueOf(i6));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR2);
                zq9 zq9Var = (zq9) cr9Var;
                String str3 = zq9Var.b;
                String str4 = zq9Var.c;
                boolean z3 = zq9Var.d;
                String strR2 = vo7.R(p65Var, R.string.user_activity_highlighted);
                sn3 sn3Var2 = kt7.b;
                long j4 = ((zo7) p65Var.j(sn3Var2)).n;
                r28 r28VarN2 = bgf.N(o28Var, "cta_recommendation_reason");
                boolean zF2 = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(cr9Var);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    final int i7 = 2;
                    objM2 = new m45() { // from class: btc
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i7;
                            c1e c1eVar = c1e.a;
                            dr9 dr9Var2 = dr9Var;
                            cr9 cr9Var2 = cr9Var;
                            sh9 sh9Var2 = sh9Var;
                            switch (i62) {
                                case 0:
                                    sh9Var2.i(((br9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                                case 1:
                                    sh9Var2.i(((yq9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                                default:
                                    sh9Var2.i(((zq9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                w2g.a(str3, str4, z3, R.drawable.ic_highlight_filled_16, strR2, null, r28VarN2, j4, (m45) objM2, p65Var, 1572864, 0);
                tp7.e(0.0f, 6, 4, ((zo7) p65Var.j(sn3Var2)).z, p65Var, jfc.e(w2g.G(o28Var, 11.5f, 8.0f, 0.0f, 8.0f, 4), 12.0f));
                p65Var.p(true);
                p65Var.p(false);
            } else if (cr9Var instanceof br9) {
                p65Var.Y(1309488674);
                wv1 wv1VarA3 = uv1.a(rz5Var, yq0Var, p65Var, 0);
                long j5 = p65Var.T;
                int i8 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28Var);
                r12.W.getClass();
                ot2 ot2Var3 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var3);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, wv1VarA3);
                tp7.B(p65Var, q12.e, i89VarL3);
                tp7.B(p65Var, q12.g, Integer.valueOf(i8));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR3);
                br9 br9Var = (br9) cr9Var;
                String str5 = br9Var.b;
                String str6 = br9Var.c;
                boolean z4 = br9Var.d;
                String strR3 = vo7.R(p65Var, R.string.user_activity_responded);
                sn3 sn3Var3 = kt7.b;
                long j6 = ((zo7) p65Var.j(sn3Var3)).n;
                r28 r28VarN3 = bgf.N(o28Var, "cta_recommendation_reason");
                boolean zF3 = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(cr9Var) | ((i2 & 14) == 4);
                Object objM3 = p65Var.M();
                if (zF3 || objM3 == uobVar) {
                    final int i9 = 0;
                    objM3 = new m45() { // from class: btc
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i9;
                            c1e c1eVar = c1e.a;
                            dr9 dr9Var2 = dr9Var;
                            cr9 cr9Var2 = cr9Var;
                            sh9 sh9Var2 = sh9Var;
                            switch (i62) {
                                case 0:
                                    sh9Var2.i(((br9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                                case 1:
                                    sh9Var2.i(((yq9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                                default:
                                    sh9Var2.i(((zq9) cr9Var2).a, dr9Var2.x.b);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM3);
                }
                w2g.a(str5, str6, z4, R.drawable.ic_respond_filled_16, strR3, null, r28VarN3, j6, (m45) objM3, p65Var, 1572864, 0);
                tp7.e(0.0f, 6, 4, ((zo7) p65Var.j(sn3Var3)).z, p65Var, jfc.e(w2g.G(o28Var, 11.5f, 8.0f, 0.0f, 8.0f, 4), 12.0f));
                p65Var.p(true);
                p65Var.p(false);
            } else if (cr9Var instanceof xq9) {
                p65Var.Y(1309526503);
                m(dr9Var, (xq9) cr9Var, sh9Var, w2g.G(r28Var, 2.0f, 0.0f, 0.0f, 0.0f, 14), p65Var, (i2 & 14) | ((i2 << 3) & 896));
                p65Var.p(false);
            } else {
                if (!(cr9Var instanceof ar9)) {
                    throw ho2.L(p65Var, 1309411038, false);
                }
                p65Var.Y(1309535528);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final int i10 = 0;
            b55Var = new b55(dr9Var, sh9Var, r28Var, i, i10) { // from class: ctc
                public final /* synthetic */ int a;
                public final /* synthetic */ dr9 b;
                public final /* synthetic */ sh9 c;
                public final /* synthetic */ r28 d;

                {
                    this.a = i10;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i42 = this.a;
                    c1e c1eVar = c1e.a;
                    r28 r28Var2 = this.d;
                    sh9 sh9Var2 = this.c;
                    dr9 dr9Var2 = this.b;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i42) {
                        case 0:
                            il7.d(dr9Var2, sh9Var2, r28Var2, x12Var2, tr7.y(1));
                            break;
                        default:
                            il7.d(dr9Var2, sh9Var2, r28Var2, x12Var2, tr7.y(1));
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void e(mkd mkdVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-162778754);
        int i2 = i | (p65Var.f(mkdVar) ? 4 : 2) | 48;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.d(o28Var, 1.0f), "repost_note_hidden");
            omb ombVarA = nmb.a(new h70(4.0f, true, new z10(21)), z46.n, p65Var, 54);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ic_unlisted_24, 0, p65Var);
            String strR = vo7.R(p65Var, R.string.reposter_note_hidden);
            r28 r28VarL = jfc.l(o28Var, 24.0f);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, strR, r28VarL, ((zo7) p65Var.j(sn3Var)).o, p65Var, 392, 0);
            jjd.b(vo7.R(p65Var, R.string.reposter_note_hidden), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(mkdVar, r28Var2, i, 15);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:60:0x0278  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0280  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x029c  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x02ad  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x039a  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x039f  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x03a4  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x03b0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.bab r74, defpackage.nab r75, defpackage.r28 r76, defpackage.x12 r77, int r78, int r79) {
        /*
            Method dump skipped, instruction units count: 991
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.il7.f(bab, nab, r28, x12, int, int):void");
    }

    public static final void g(bab babVar, nab nabVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1694800081);
        int i3 = 4;
        if ((i & 6) == 0) {
            i2 = i | (p65Var.f(babVar) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(nabVar) ? 32 : 16;
        }
        int i4 = i2 | 384;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i6 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var, i3);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, null, false, null, null, n01.k, p65Var, 1572870, 62);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new z7b(l78Var, 5);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(743380626, new gab(babVar, nabVar, l78Var, i5), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 23, babVar, nabVar, r28Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0063 A[LOOP:0: B:4:0x000d->B:35:0x0063, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0066 A[EDGE_INSN: B:43:0x0066->B:36:0x0066 BREAK  A[LOOP:0: B:4:0x000d->B:35:0x0063], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.zxb h(defpackage.aq6 r8, boolean r9) {
        /*
            hj0 r0 = r8.F
            java.lang.Object r0 = r0.g
            q28 r0 = (defpackage.q28) r0
            int r1 = r0.d
            r1 = r1 & 8
            r2 = 0
            if (r1 == 0) goto L66
        Ld:
            if (r0 == 0) goto L66
            int r1 = r0.c
            r1 = r1 & 8
            if (r1 == 0) goto L5d
            r1 = r0
            r3 = r2
        L17:
            if (r1 == 0) goto L5d
            boolean r4 = r1 instanceof defpackage.xxb
            if (r4 == 0) goto L1f
            r2 = r1
            goto L66
        L1f:
            int r4 = r1.c
            r4 = r4 & 8
            if (r4 == 0) goto L58
            boolean r4 = r1 instanceof defpackage.b43
            if (r4 == 0) goto L58
            r4 = r1
            b43 r4 = (defpackage.b43) r4
            q28 r4 = r4.p
            r5 = 0
        L2f:
            r6 = 1
            if (r4 == 0) goto L55
            int r7 = r4.c
            r7 = r7 & 8
            if (r7 == 0) goto L52
            int r5 = r5 + 1
            if (r5 != r6) goto L3e
            r1 = r4
            goto L52
        L3e:
            if (r3 != 0) goto L49
            o78 r3 = new o78
            r6 = 16
            q28[] r6 = new defpackage.q28[r6]
            r3.<init>(r6)
        L49:
            if (r1 == 0) goto L4f
            r3.b(r1)
            r1 = r2
        L4f:
            r3.b(r4)
        L52:
            q28 r4 = r4.f
            goto L2f
        L55:
            if (r5 != r6) goto L58
            goto L17
        L58:
            q28 r1 = defpackage.flb.q0(r3)
            goto L17
        L5d:
            int r1 = r0.d
            r1 = r1 & 8
            if (r1 == 0) goto L66
            q28 r0 = r0.f
            goto Ld
        L66:
            r2.getClass()
            xxb r2 = (defpackage.xxb) r2
            q28 r2 = (defpackage.q28) r2
            q28 r0 = r2.a
            txb r1 = r8.x()
            if (r1 != 0) goto L7a
            txb r1 = new txb
            r1.<init>()
        L7a:
            zxb r2 = new zxb
            r2.<init>(r0, r9, r8, r1)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.il7.h(aq6, boolean):zxb");
    }

    public static final void i(r28 r28Var, b55 b55Var, m3c m3cVar, long j, long j2, float f2, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-662779944);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(b55Var) ? 32 : 16;
        }
        int i3 = 0;
        if ((i & 384) == 0) {
            i2 |= p65Var2.g(false) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(m3cVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.e(j) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var2.e(j2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i & 1572864) == 0) {
            i2 |= p65Var2.c(f2) ? 1048576 : 524288;
        }
        if ((12582912 & i) == 0) {
            i2 |= p65Var2.h(mz1Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i2 & 1, (4793491 & i2) != 4793490)) {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            int i4 = i2 >> 6;
            p65Var = p65Var2;
            br7.i(r28Var, m3cVar, j, j2, f2, pxf.E(-1429068516, new phc(b55Var, mz1Var, i3), p65Var2), p65Var, 1572864 | (i2 & 14) | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i4 & 896) | (i4 & 7168) | ((i2 >> 3) & 458752), 16);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w00(r28Var, b55Var, m3cVar, j, j2, f2, mz1Var, i);
        }
    }

    public static final void j(final jhc jhcVar, r28 r28Var, m3c m3cVar, long j, long j2, long j3, float f2, x12 x12Var, final int i) {
        int i2;
        p65 p65Var;
        final r28 r28Var2;
        final m3c m3cVar2;
        final long j4;
        final long j5;
        final long j6;
        final float f3;
        int i3;
        int i4;
        long jM;
        int i5;
        r28 r28Var3;
        m3c m3cVar3;
        long j7;
        float f4;
        long j8;
        mz1 mz1VarE;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(258660814);
        if ((i & 6) == 0) {
            i2 = ((i & 8) == 0 ? p65Var2.f(jhcVar) : p65Var2.h(jhcVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i6 = i2 | 432;
        if ((i & 3072) == 0) {
            i6 = i2 | 1456;
        }
        if ((i & 24576) == 0) {
            i6 |= 8192;
        }
        if ((196608 & i) == 0) {
            i6 |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i6 |= 524288;
        }
        int i7 = i6 | 12582912;
        if (p65Var2.P(i7 & 1, (4793491 & i7) != 4793490)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                amb ambVar = ((x4c) p65Var2.j(a5c.a)).a;
                sn3 sn3Var = tv1.a;
                long jM2 = op8.M(uu1.b(0.8f, ((sv1) p65Var2.j(sn3Var)).c()), ((sv1) p65Var2.j(sn3Var)).e());
                long jE = ((sv1) p65Var2.j(sn3Var)).e();
                sv1 sv1Var = (sv1) p65Var2.j(sn3Var);
                if (sv1Var.f()) {
                    i3 = 12582912;
                    i4 = i7;
                    jM = op8.M(uu1.b(0.6f, sv1Var.e()), sv1Var.d());
                } else {
                    i3 = 12582912;
                    i4 = i7;
                    jM = ((uu1) sv1Var.b.getValue()).a;
                }
                i5 = (-4193281) & i4;
                r28Var3 = o28.b;
                m3cVar3 = ambVar;
                j7 = jM2;
                f4 = 6.0f;
                j8 = jE;
            } else {
                p65Var2.S();
                r28Var3 = r28Var;
                m3cVar3 = m3cVar;
                j7 = j;
                j8 = j2;
                f4 = f2;
                i3 = 12582912;
                i5 = i7 & (-4193281);
                jM = j3;
            }
            p65Var2.q();
            String str = jhcVar.b;
            if (str != null) {
                p65Var2.Y(593497188);
                mz1VarE = pxf.E(1843479216, new qo(jM, jhcVar, str), p65Var2);
                p65Var2.p(false);
            } else {
                p65Var2.Y(593796152);
                p65Var2.p(false);
                mz1VarE = null;
            }
            p65Var = p65Var2;
            i(w2g.C(r28Var3, 12.0f), mz1VarE, m3cVar3, j7, j8, f4, pxf.E(-261845785, new h9b(13, jhcVar), p65Var2), p65Var, (i5 & 896) | i3 | ((i5 >> 3) & 3670016));
            j6 = jM;
            r28Var2 = r28Var3;
            m3cVar2 = m3cVar3;
            j4 = j7;
            j5 = j8;
            f3 = f4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            m3cVar2 = m3cVar;
            j4 = j;
            j5 = j2;
            j6 = j3;
            f3 = f2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: qhc
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    il7.j(jhcVar, r28Var2, m3cVar2, j4, j5, j6, f3, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:145:0x02b4  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x02ca  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x02d5  */
    /* JADX WARN: Removed duplicated region for block: B:152:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0099  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k(defpackage.dr9 r25, defpackage.stc r26, defpackage.sh9 r27, defpackage.r28 r28, defpackage.hy8 r29, defpackage.x12 r30, int r31, int r32) {
        /*
            Method dump skipped, instruction units count: 741
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.il7.k(dr9, stc, sh9, r28, hy8, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0194  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:89:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.stc r24, defpackage.r28 r25, long r26, defpackage.hy8 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 429
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.il7.l(stc, r28, long, hy8, x12, int, int):void");
    }

    public static final void m(dr9 dr9Var, xq9 xq9Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1748296224);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(dr9Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(xq9Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(sh9Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarY = r40.y(jfc.f(w2g.G(o28Var, 0.0f, 0.0f, 24.0f, 0.0f, 11), 28.0f, 0.0f, 2), bmb.a(4.0f));
            boolean z = ((i2 & 14) == 4) | ((i2 & 896) == 256) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new i16(sh9Var, xq9Var, dr9Var, 25);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 2.0f, 4.0f, 2.0f, 4.0f), "cta_recommendation_reason");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            c09 c09VarJ = vn7.J(R.drawable.ic_topic_16, 0, p65Var);
            r28 r28VarL = jfc.l(o28Var, 16.0f);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, r28VarL, ((zo7) p65Var.j(sn3Var)).o, p65Var, 440, 0);
            String strY = km4.y(y30.n(10.0f, R.string.recommendation_reason_tag_followed, p65Var, p65Var, o28Var), " ");
            sn3 sn3Var2 = jt7.c;
            jjd.b(strY, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).n, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            jjd.b(xq9Var.b, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(sn3Var2)).n, p65Var, 0, 24960, 110590);
            p65Var = p65Var;
            p65Var.p(true);
            tp7.e(0.0f, 6, 4, ((zo7) p65Var.j(sn3Var)).z, p65Var, jfc.e(w2g.G(o28Var, 9.5f, 8.0f, 0.0f, 8.0f, 4), 12.0f));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 21, dr9Var, xq9Var, sh9Var, r28Var);
        }
    }

    public static final void n(mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(343813818);
        int i2 = (p65Var.h(mz1Var) ? 4 : 2) | i;
        int i3 = 14;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = id.l;
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7Var);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = w2g.D(o28Var, 16.0f, 6.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR2);
            mz1Var.invoke(p65Var, Integer.valueOf(i2 & 14));
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dd(mz1Var, i, i3);
        }
    }

    public static final void o(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        r28 r28Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-246135728);
        int i2 = i | 6 | (p65Var.h(m45Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String strR = vo7.R(p65Var, R.string.user_profile_not_found_title);
            String strR2 = vo7.R(p65Var, R.string.user_profile_not_found_content);
            String strR3 = vo7.R(p65Var, R.string.user_profile_account_suspended_primary_button);
            int i3 = 6 | ((i2 << 15) & 3670016);
            r28Var2 = o28.b;
            gq7.a(r28Var2, null, strR, strR2, 0L, strR3, m45Var, null, null, 0.0f, 0.0f, p65Var, i3, 0, 1938);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(r28Var2, m45Var, i, 9);
        }
    }

    public static kse p(f7a f7aVar) {
        f7aVar.getClass();
        if (f7aVar.b.size() == 0) {
            return kse.b;
        }
        List list = f7aVar.b;
        list.getClass();
        return new kse(list);
    }

    public static g05 u(g05[] g05VarArr, int i) {
        int i2 = (i & 1) == 0 ? 400 : 700;
        boolean z = (i & 2) != 0;
        g05 g05Var = null;
        int i3 = Integer.MAX_VALUE;
        for (g05 g05Var2 : g05VarArr) {
            int iAbs = (Math.abs(g05Var2.c - i2) * 2) + (g05Var2.d == z ? 0 : 1);
            if (g05Var == null || i3 > iAbs) {
                g05Var = g05Var2;
                i3 = iAbs;
            }
        }
        return g05Var;
    }

    public static final HashSet v(Iterable iterable) {
        HashSet hashSet = new HashSet();
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            Set setC = ((ev7) it2.next()).c();
            if (setC == null) {
                return null;
            }
            bu1.n0(setC, hashSet);
        }
        return hashSet;
    }

    public static final h7f w(c8f c8fVar) {
        c8fVar.getClass();
        return new h7f(c8fVar.a, c8fVar.t);
    }

    public static final String x(tk7 tk7Var) {
        String string;
        Object objF = kng.F(tk7Var);
        if (objF == null) {
            tk7Var.w();
            objF = null;
        }
        return (objF == null || (string = objF.toString()) == null) ? "null" : string;
    }

    public static final int y(gnb gnbVar, String str) {
        gnbVar.getClass();
        int iQ = en7.q(gnbVar, str);
        if (iQ >= 0) {
            return iQ;
        }
        int columnCount = gnbVar.getColumnCount();
        ArrayList arrayList = new ArrayList(columnCount);
        for (int i = 0; i < columnCount; i++) {
            arrayList.add(gnbVar.getColumnName(i));
        }
        lg8.h(93, "Column '", str, "' does not exist. Available columns: [", bu1.F0(arrayList, null, null, null, null, 63));
        return 0;
    }

    public static final Object z(l75 l75Var, o75 o75Var) {
        l75Var.getClass();
        if (l75Var.j(o75Var)) {
            return l75Var.i(o75Var);
        }
        return null;
    }

    public abstract Typeface q(Context context, tz4 tz4Var, Resources resources, int i);

    public abstract Typeface r(Context context, g05[] g05VarArr, int i);

    public Typeface s(Context context, List list, int i) {
        throw new IllegalStateException("createFromFontInfoWithFallback must only be called on API 29+");
    }

    public Typeface t(Context context, Resources resources, int i, String str, int i2) {
        File fileC = en7.C(context);
        if (fileC == null) {
            return null;
        }
        try {
            if (en7.r(fileC, resources, i)) {
                return Typeface.createFromFile(fileC.getPath());
            }
            return null;
        } catch (RuntimeException unused) {
            return null;
        } finally {
            fileC.delete();
        }
    }
}
