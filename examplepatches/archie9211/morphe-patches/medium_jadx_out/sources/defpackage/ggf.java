package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import j$.util.DesugarCollections;
import j$.util.DesugarTimeZone;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ggf {
    public static final TimeZone a;
    public static final String b;

    static {
        TimeZone timeZone = DesugarTimeZone.getTimeZone("GMT");
        timeZone.getClass();
        a = timeZone;
        b = muc.l0(muc.j0("okhttp3.", up8.class.getName()), "Client");
    }

    public static final boolean a(qt5 qt5Var, qt5 qt5Var2) {
        qt5Var.getClass();
        return g76.L(qt5Var.d, qt5Var2.d) && qt5Var.e == qt5Var2.e && g76.L(qt5Var.a, qt5Var2.a);
    }

    public static final void c(Socket socket) {
        socket.getClass();
        try {
            socket.close();
        } catch (AssertionError e) {
            throw e;
        } catch (RuntimeException e2) {
            if (!g76.L(e2.getMessage(), "bio == null")) {
                throw e2;
            }
        } catch (Exception unused) {
        }
    }

    public static final String d(String str, Object... objArr) {
        Locale locale = Locale.US;
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        return String.format(locale, str, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length));
    }

    public static final long e(adb adbVar) {
        String strD = adbVar.f.d("Content-Length");
        if (strD == null) {
            return -1L;
        }
        byte[] bArr = egf.a;
        try {
            return Long.parseLong(strD);
        } catch (NumberFormatException unused) {
            return -1L;
        }
    }

    public static final Charset f(zz0 zz0Var, Charset charset) {
        zz0Var.getClass();
        charset.getClass();
        int iW = zz0Var.w(egf.b);
        if (iW == -1) {
            return charset;
        }
        if (iW == 0) {
            return wk1.a;
        }
        if (iW == 1) {
            return wk1.b;
        }
        if (iW == 2) {
            Charset charset2 = wk1.a;
            Charset charset3 = wk1.f;
            if (charset3 != null) {
                return charset3;
            }
            Charset charsetForName = Charset.forName("UTF-32LE");
            charsetForName.getClass();
            wk1.f = charsetForName;
            return charsetForName;
        }
        if (iW == 3) {
            return wk1.c;
        }
        if (iW != 4) {
            ywb.d();
            return null;
        }
        Charset charset4 = wk1.a;
        Charset charset5 = wk1.g;
        if (charset5 != null) {
            return charset5;
        }
        Charset charsetForName2 = Charset.forName("UTF-32BE");
        charsetForName2.getClass();
        wk1.g = charsetForName2;
        return charsetForName2;
    }

    public static final boolean g(ikc ikcVar, int i) {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        timeUnit.getClass();
        long jNanoTime = System.nanoTime();
        long jC = ikcVar.b().e() ? ikcVar.b().c() - jNanoTime : Long.MAX_VALUE;
        ikcVar.b().d(Math.min(jC, timeUnit.toNanos(i)) + jNanoTime);
        try {
            kz0 kz0Var = new kz0();
            while (ikcVar.q0(kz0Var, 8192L) != -1) {
                kz0Var.B();
            }
            if (jC == Long.MAX_VALUE) {
                ikcVar.b().a();
                return true;
            }
            ikcVar.b().d(jNanoTime + jC);
            return true;
        } catch (InterruptedIOException unused) {
            if (jC == Long.MAX_VALUE) {
                ikcVar.b().a();
                return false;
            }
            ikcVar.b().d(jNanoTime + jC);
            return false;
        } catch (Throwable th) {
            if (jC == Long.MAX_VALUE) {
                ikcVar.b().a();
            } else {
                ikcVar.b().d(jNanoTime + jC);
            }
            throw th;
        }
    }

    public static final yi5 h(List list) {
        ArrayList arrayList = new ArrayList(20);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            vi5 vi5Var = (vi5) it2.next();
            h21 h21Var = vi5Var.a;
            h21 h21Var2 = vi5Var.b;
            String strT = h21Var.t();
            String strT2 = h21Var2.t();
            arrayList.add(strT);
            arrayList.add(muc.y0(strT2).toString());
        }
        return new yi5((String[]) arrayList.toArray(new String[0]));
    }

    public static final String i(qt5 qt5Var, boolean z) {
        qt5Var.getClass();
        int i = qt5Var.e;
        String strT = qt5Var.d;
        if (muc.Q(strT, ":", false)) {
            strT = wgd.t(']', "[", strT);
        }
        if (!z) {
            String str = qt5Var.a;
            str.getClass();
            if (i == (str.equals("http") ? 80 : str.equals("https") ? 443 : -1)) {
                return strT;
            }
        }
        return strT + ':' + i;
    }

    public static final List j(List list) {
        list.getClass();
        if (list.isEmpty()) {
            return ey3.a;
        }
        if (list.size() == 1) {
            List listSingletonList = Collections.singletonList(list.get(0));
            listSingletonList.getClass();
            return listSingletonList;
        }
        Object[] array = list.toArray();
        array.getClass();
        List listAsList = Arrays.asList(array);
        listAsList.getClass();
        List listUnmodifiableList = DesugarCollections.unmodifiableList(listAsList);
        listUnmodifiableList.getClass();
        return listUnmodifiableList;
    }

    public static final List k(Object[] objArr) {
        if (objArr == null || objArr.length == 0) {
            return ey3.a;
        }
        if (objArr.length == 1) {
            List listSingletonList = Collections.singletonList(objArr[0]);
            listSingletonList.getClass();
            return listSingletonList;
        }
        List listUnmodifiableList = DesugarCollections.unmodifiableList(k80.a0((Object[]) objArr.clone()));
        listUnmodifiableList.getClass();
        return listUnmodifiableList;
    }

    public static final int b(long j, TimeUnit timeUnit) {
        timeUnit.getClass();
        if (j >= 0) {
            long millis = timeUnit.toMillis(j);
            if (millis <= 2147483647L) {
                if (millis == 0 && j > 0) {
                    ywb.g("timeout".concat(" too small"));
                    return 0;
                }
                return (int) millis;
            }
            ywb.g("timeout".concat(QFTsJPDEnO.nzwrrDCWlDmk));
            return 0;
        }
        lg8.i("timeout".concat(" < 0"));
        return 0;
    }
}
