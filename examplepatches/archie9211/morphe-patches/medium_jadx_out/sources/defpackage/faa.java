package defpackage;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.IDN;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class faa {
    public static final h21 b = new h21(Arrays.copyOf(new byte[]{42}, 1));
    public static final List c = d46.Q("*");
    public static final faa d;
    public final ing a;

    static {
        ing ingVar = new ing();
        ingVar.b = new AtomicBoolean(false);
        ingVar.c = new CountDownLatch(1);
        ingVar.a = "PublicSuffixDatabase.list";
        d = new faa(ingVar);
    }

    public faa(ing ingVar) {
        this.a = ingVar;
    }

    public static List b(String str) {
        List listO0 = muc.o0(str, new char[]{'.'});
        return g76.L(bu1.H0(listO0), "") ? bu1.t0(listO0) : listO0;
    }

    public final String a(String str) {
        String strI;
        String strI2;
        String strI3;
        List listO0;
        int size;
        int size2;
        str.getClass();
        String unicode = IDN.toUnicode(str);
        unicode.getClass();
        List listB = b(unicode);
        ing ingVar = this.a;
        AtomicBoolean atomicBoolean = (AtomicBoolean) ingVar.b;
        int i = 1;
        if (atomicBoolean.get() || !atomicBoolean.compareAndSet(false, true)) {
            try {
                ((CountDownLatch) ingVar.c).await();
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
        } else {
            boolean z = false;
            while (true) {
                try {
                    try {
                        try {
                            ingVar.f();
                            break;
                        } catch (InterruptedIOException unused2) {
                            Thread.interrupted();
                            z = true;
                        }
                    } catch (IOException e) {
                        ingVar.f = e;
                        if (z) {
                        }
                    }
                } finally {
                    if (z) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
        if (((h21) ingVar.d) == null) {
            StringBuilder sb = new StringBuilder("Unable to load ");
            sb.append(ingVar.a);
            sb.append(" resource.");
            IllegalStateException illegalStateException = new IllegalStateException(sb.toString());
            illegalStateException.initCause((IOException) ingVar.f);
            throw illegalStateException;
        }
        int size3 = listB.size();
        h21[] h21VarArr = new h21[size3];
        for (int i2 = 0; i2 < size3; i2++) {
            h21 h21Var = h21.d;
            h21VarArr[i2] = dq1.o((String) listB.get(i2));
        }
        int i3 = 0;
        while (true) {
            if (i3 >= size3) {
                strI = null;
                break;
            }
            h21 h21Var2 = (h21) ingVar.d;
            if (h21Var2 == null) {
                g76.g0("bytes");
                throw null;
            }
            strI = to7.i(h21Var2, h21VarArr, i3);
            if (strI != null) {
                break;
            }
            i3++;
        }
        if (size3 > 1) {
            h21[] h21VarArr2 = (h21[]) h21VarArr.clone();
            int length = h21VarArr2.length - 1;
            for (int i4 = 0; i4 < length; i4++) {
                h21VarArr2[i4] = b;
                h21 h21Var3 = (h21) ingVar.d;
                if (h21Var3 == null) {
                    g76.g0("bytes");
                    throw null;
                }
                strI2 = to7.i(h21Var3, h21VarArr2, i4);
                if (strI2 != null) {
                    break;
                }
            }
            strI2 = null;
        } else {
            strI2 = null;
        }
        if (strI2 != null) {
            int i5 = size3 - 1;
            for (int i6 = 0; i6 < i5; i6++) {
                h21 h21Var4 = (h21) ingVar.e;
                if (h21Var4 == null) {
                    g76.g0("exceptionBytes");
                    throw null;
                }
                strI3 = to7.i(h21Var4, h21VarArr, i6);
                if (strI3 != null) {
                    break;
                }
            }
            strI3 = null;
        } else {
            strI3 = null;
        }
        if (strI3 != null) {
            listO0 = muc.o0("!".concat(strI3), new char[]{'.'});
        } else if (strI == null && strI2 == null) {
            listO0 = c;
        } else {
            List listO02 = ey3.a;
            List listO03 = strI != null ? muc.o0(strI, new char[]{'.'}) : listO02;
            if (strI2 != null) {
                listO02 = muc.o0(strI2, new char[]{'.'});
            }
            listO0 = listO03.size() > listO02.size() ? listO03 : listO02;
        }
        if (listB.size() == listO0.size() && ((String) listO0.get(0)).charAt(0) != '!') {
            return null;
        }
        if (((String) listO0.get(0)).charAt(0) == '!') {
            size = listB.size();
            size2 = listO0.size();
        } else {
            size = listB.size();
            size2 = listO0.size() + 1;
        }
        return szb.L0(szb.G0(new j80(i, b(str)), size - size2), ".");
    }
}
