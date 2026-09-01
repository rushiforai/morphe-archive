package defpackage;

import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ts5 implements Closeable {
    public static final Logger d;
    public final yua a;
    public final ss5 b;
    public final zr5 c;

    static {
        Logger logger = Logger.getLogger(is5.class.getName());
        logger.getClass();
        d = logger;
    }

    public ts5(yua yuaVar) {
        this.a = yuaVar;
        ss5 ss5Var = new ss5(yuaVar);
        this.b = ss5Var;
        this.c = new zr5(ss5Var);
    }

    public final List B(int i, int i2, int i3, int i4) throws IOException {
        ss5 ss5Var = this.b;
        ss5Var.e = i;
        ss5Var.b = i;
        ss5Var.f = i2;
        ss5Var.c = i3;
        ss5Var.d = i4;
        zr5 zr5Var = this.c;
        yua yuaVar = zr5Var.c;
        ArrayList arrayList = zr5Var.b;
        while (!yuaVar.H()) {
            byte b = yuaVar.readByte();
            byte[] bArr = egf.a;
            int i5 = b & 255;
            if (i5 == 128) {
                ik4.g("index == 0");
                return null;
            }
            if ((b & 128) == 128) {
                int iE = zr5Var.e(i5, 127);
                int i6 = iE - 1;
                if (i6 >= 0) {
                    vi5[] vi5VarArr = bs5.a;
                    if (i6 <= vi5VarArr.length - 1) {
                        arrayList.add(vi5VarArr[i6]);
                    }
                }
                int length = zr5Var.e + 1 + (i6 - bs5.a.length);
                if (length >= 0) {
                    vi5[] vi5VarArr2 = zr5Var.d;
                    if (length < vi5VarArr2.length) {
                        vi5 vi5Var = vi5VarArr2[length];
                        vi5Var.getClass();
                        arrayList.add(vi5Var);
                    }
                }
                ik4.g(b09.w(iE, "Header index too large "));
                return null;
            }
            if (i5 == 64) {
                vi5[] vi5VarArr3 = bs5.a;
                h21 h21VarD = zr5Var.d();
                bs5.a(h21VarD);
                zr5Var.c(new vi5(h21VarD, zr5Var.d()));
            } else if ((b & 64) == 64) {
                zr5Var.c(new vi5(zr5Var.b(zr5Var.e(i5, 63) - 1), zr5Var.d()));
            } else if ((b & 32) == 32) {
                int iE2 = zr5Var.e(i5, 31);
                zr5Var.a = iE2;
                if (iE2 < 0 || iE2 > 4096) {
                    throw new IOException("Invalid dynamic table size update " + zr5Var.a);
                }
                int i7 = zr5Var.g;
                if (iE2 < i7) {
                    if (iE2 == 0) {
                        vi5[] vi5VarArr4 = zr5Var.d;
                        k80.o0(0, vi5VarArr4.length, null, vi5VarArr4);
                        zr5Var.e = zr5Var.d.length - 1;
                        zr5Var.f = 0;
                        zr5Var.g = 0;
                    } else {
                        zr5Var.a(i7 - iE2);
                    }
                }
            } else if (i5 == 16 || i5 == 0) {
                vi5[] vi5VarArr5 = bs5.a;
                h21 h21VarD2 = zr5Var.d();
                bs5.a(h21VarD2);
                arrayList.add(new vi5(h21VarD2, zr5Var.d()));
            } else {
                arrayList.add(new vi5(zr5Var.b(zr5Var.e(i5, 15) - 1), zr5Var.d()));
            }
        }
        List listM1 = bu1.m1(arrayList);
        arrayList.clear();
        return listM1;
    }

    public final void D(a3 a3Var, int i, int i2, int i3) throws Throwable {
        boolean z;
        int i4;
        int i5;
        qs5 qs5Var;
        if (i3 == 0) {
            ik4.g("PROTOCOL_ERROR: TYPE_HEADERS streamId == 0");
            return;
        }
        boolean z2 = false;
        boolean z3 = true;
        if ((i2 & 1) != 0) {
            z = true;
        } else {
            z = true;
            z3 = false;
        }
        if ((i2 & 8) != 0) {
            byte b = this.a.readByte();
            byte[] bArr = egf.a;
            i4 = b & 255;
        } else {
            i4 = 0;
        }
        if ((i2 & 32) != 0) {
            yua yuaVar = this.a;
            yuaVar.p();
            yuaVar.readByte();
            byte[] bArr2 = egf.a;
            i5 = i - 5;
        } else {
            i5 = i;
        }
        List listB = B(yi2.O(i5, i2, i4), i4, i2, i3);
        qs5 qs5Var2 = (qs5) a3Var.b;
        if (i3 != 0 && (i3 & 1) == 0) {
            z2 = z;
        }
        if (z2) {
            bgd.c(qs5Var2.i, qs5Var2.c + '[' + i3 + "] onHeaders", 0L, new ls5(qs5Var2, i3, listB, z3), 6);
            return;
        }
        synchronized (qs5Var2) {
            try {
                xs5 xs5VarM = qs5Var2.m(i3);
                if (xs5VarM != null) {
                    xs5VarM.j(ggf.h(listB), z3);
                    return;
                }
                if (qs5Var2.f) {
                    return;
                }
                if (i3 <= qs5Var2.d) {
                    return;
                }
                if (i3 % 2 == qs5Var2.e % 2) {
                    return;
                }
                qs5Var = qs5Var2;
                try {
                    xs5 xs5Var = new xs5(i3, qs5Var, false, z3, ggf.h(listB));
                    qs5Var.d = i3;
                    qs5Var.b.put(Integer.valueOf(i3), xs5Var);
                    bgd.c(qs5Var.g.d(), qs5Var.c + '[' + i3 + "] onStream", 0L, new gd3(qs5Var, 29, xs5Var), 6);
                    return;
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Throwable th2) {
                th = th2;
                qs5Var = qs5Var2;
            }
            Throwable th3 = th;
            throw th3;
        }
    }

    public final void I(a3 a3Var, int i, int i2, int i3) throws IOException {
        if (i != 8) {
            ik4.g(b09.w(i, "TYPE_PING length != 8: "));
            return;
        }
        if (i3 != 0) {
            ik4.g("TYPE_PING streamId != 0");
            return;
        }
        final int iP = this.a.p();
        final int iP2 = this.a.p();
        boolean z = (i2 & 1) != 0;
        qs5 qs5Var = (qs5) a3Var.b;
        if (!z) {
            bgd bgdVar = qs5Var.h;
            String strV = ka1.v(new StringBuilder(), ((qs5) a3Var.b).c, " ping");
            final qs5 qs5Var2 = (qs5) a3Var.b;
            bgd.c(bgdVar, strV, 0L, new m45() { // from class: os5
                @Override // defpackage.m45
                public final Object invoke() {
                    qs5 qs5Var3 = qs5Var2;
                    try {
                        qs5Var3.w.I(iP, iP2, true);
                    } catch (IOException e) {
                        b14 b14Var = b14.PROTOCOL_ERROR;
                        qs5Var3.f(b14Var, b14Var, e);
                    }
                    return c1e.a;
                }
            }, 6);
            return;
        }
        synchronized (qs5Var) {
            try {
                if (iP == 1) {
                    qs5Var.l++;
                } else if (iP == 2) {
                    qs5Var.n++;
                } else if (iP == 3) {
                    qs5Var.notifyAll();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void L(a3 a3Var, int i, int i2, int i3) throws IOException {
        int i4;
        if (i3 == 0) {
            ik4.g("PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0");
            return;
        }
        int i5 = 0;
        if ((i2 & 8) != 0) {
            byte b = this.a.readByte();
            byte[] bArr = egf.a;
            i4 = b & 255;
        } else {
            i4 = 0;
        }
        int iP = this.a.p() & Integer.MAX_VALUE;
        List listB = B(yi2.O(i - 4, i2, i4), i4, i2, i3);
        qs5 qs5Var = (qs5) a3Var.b;
        synchronized (qs5Var) {
            if (qs5Var.y.contains(Integer.valueOf(iP))) {
                qs5Var.N(iP, b14.PROTOCOL_ERROR);
                return;
            }
            qs5Var.y.add(Integer.valueOf(iP));
            bgd.c(qs5Var.i, qs5Var.c + '[' + iP + "] onRequest", 0L, new ls5(qs5Var, iP, listB, i5), 6);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.a.close();
    }

    /* JADX WARN: Code restructure failed: missing block: B:66:0x011b, code lost:
    
        if (r6 == false) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x011d, code lost:
    
        r9.j(defpackage.yi5.b, true);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void m(defpackage.a3 r19, int r20, int r21, final int r22) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ts5.m(a3, int, int, int):void");
    }

    public final void p(a3 a3Var, int i, int i2) throws IOException {
        b14 b14Var;
        Object[] array;
        if (i < 8) {
            ik4.g(b09.w(i, "TYPE_GOAWAY length < 8: "));
            return;
        }
        if (i2 != 0) {
            ik4.g("TYPE_GOAWAY streamId != 0");
            return;
        }
        int iP = this.a.p();
        int iP2 = this.a.p();
        int i3 = i - 8;
        b14.Companion.getClass();
        b14[] b14VarArrValues = b14.values();
        int length = b14VarArrValues.length;
        int i4 = 0;
        while (true) {
            if (i4 >= length) {
                b14Var = null;
                break;
            }
            b14Var = b14VarArrValues[i4];
            if (b14Var.getHttpCode() == iP2) {
                break;
            } else {
                i4++;
            }
        }
        if (b14Var == null) {
            ik4.g(b09.w(iP2, "TYPE_GOAWAY unexpected error code: "));
            return;
        }
        h21 h21VarR = h21.d;
        if (i3 > 0) {
            h21VarR = this.a.r(i3);
        }
        h21VarR.getClass();
        h21VarR.e();
        qs5 qs5Var = (qs5) a3Var.b;
        synchronized (qs5Var) {
            array = qs5Var.b.values().toArray(new xs5[0]);
            qs5Var.f = true;
        }
        for (xs5 xs5Var : (xs5[]) array) {
            if (xs5Var.a > iP && xs5Var.h()) {
                xs5Var.k(b14.REFUSED_STREAM);
                ((qs5) a3Var.b).B(xs5Var.a);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:87:0x0133, code lost:
    
        defpackage.ik4.g(defpackage.b09.w(r9, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: "));
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x013c, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean f(boolean r19, defpackage.a3 r20) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 596
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ts5.f(boolean, a3):boolean");
    }
}
