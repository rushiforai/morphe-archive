package defpackage;

import java.io.Closeable;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class egf {
    public static final byte[] a = new byte[0];
    public static final dw8 b;

    static {
        h21 h21Var = h21.d;
        b = mq7.E(dq1.n("efbbbf"), dq1.n("feff"), dq1.n("fffe0000"), dq1.n("fffe"), dq1.n("0000feff"));
    }

    public static final void a(long j, long j2, long j3) {
        if ((j2 | j3) < 0 || j2 > j || j - j2 < j3) {
            StringBuilder sbD = b09.D("length=", ", offset=", j);
            sbD.append(j2);
            sbD.append(", count=");
            sbD.append(j2);
            throw new ArrayIndexOutOfBoundsException(sbD.toString());
        }
    }

    public static final void b(Closeable closeable) {
        closeable.getClass();
        try {
            closeable.close();
        } catch (RuntimeException e) {
            throw e;
        } catch (Exception unused) {
        }
    }

    public static final void c(ch4 ch4Var, g59 g59Var) throws IOException {
        ch4Var.getClass();
        try {
            IOException iOException = null;
            for (g59 g59Var2 : ch4Var.N(g59Var)) {
                try {
                    if (ch4Var.Q(g59Var2).c) {
                        c(ch4Var, g59Var2);
                    }
                    ch4Var.D(g59Var2);
                } catch (IOException e) {
                    if (iOException == null) {
                        iOException = e;
                    }
                }
            }
            if (iOException != null) {
                throw iOException;
            }
        } catch (FileNotFoundException unused) {
        }
    }

    public static final void d(ig3 ig3Var, g59 g59Var) {
        ig3Var.getClass();
        g59Var.getClass();
        try {
            ig3Var.c.D(g59Var);
        } catch (FileNotFoundException unused) {
        }
    }

    public static final int e(String str, char c, int i, int i2) {
        str.getClass();
        while (i < i2) {
            if (str.charAt(i) == c) {
                return i;
            }
            i++;
        }
        return i2;
    }

    public static final int f(String str, int i, int i2, String str2) {
        str.getClass();
        while (i < i2) {
            if (muc.R(str2, str.charAt(i))) {
                return i;
            }
            i++;
        }
        return i2;
    }

    public static /* synthetic */ int g(String str, char c, int i, int i2, int i3) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 4) != 0) {
            i2 = str.length();
        }
        return e(str, c, i, i2);
    }

    public static final boolean h(String[] strArr, String[] strArr2, Comparator comparator) {
        strArr.getClass();
        if (strArr.length != 0 && strArr2 != null && strArr2.length != 0) {
            for (String str : strArr) {
                for (String str2 : strArr2) {
                    if (comparator.compare(str, str2) == 0) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static final int i(String str) {
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char cCharAt = str.charAt(i);
            if (g76.Q(cCharAt, 31) <= 0 || g76.Q(cCharAt, 127) >= 0) {
                return i;
            }
        }
        return -1;
    }

    public static final int j(int i, int i2, String str) {
        str.getClass();
        while (i < i2) {
            char cCharAt = str.charAt(i);
            if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\f' && cCharAt != '\r' && cCharAt != ' ') {
                return i;
            }
            i++;
        }
        return i2;
    }

    public static final int k(int i, int i2, String str) {
        str.getClass();
        int i3 = i2 - 1;
        if (i <= i3) {
            while (true) {
                char cCharAt = str.charAt(i3);
                if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\f' && cCharAt != '\r' && cCharAt != ' ') {
                    return i3 + 1;
                }
                if (i3 == i) {
                    break;
                }
                i3--;
            }
        }
        return i;
    }

    public static final String[] l(String[] strArr, String[] strArr2, Comparator comparator) {
        strArr.getClass();
        strArr2.getClass();
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            int length = strArr2.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                if (comparator.compare(str, strArr2[i]) == 0) {
                    arrayList.add(str);
                    break;
                }
                i++;
            }
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    public static final boolean m(String str) {
        str.getClass();
        return str.equalsIgnoreCase("Authorization") || str.equalsIgnoreCase("Cookie") || str.equalsIgnoreCase("Proxy-Authorization") || str.equalsIgnoreCase("Set-Cookie");
    }

    public static final int n(char c) {
        if ('0' <= c && c < ':') {
            return c - '0';
        }
        if ('a' <= c && c < 'g') {
            return c - 'W';
        }
        if ('A' > c || c >= 'G') {
            return -1;
        }
        return c - '7';
    }

    public static final int o(yua yuaVar) {
        return (yuaVar.readByte() & 255) | ((yuaVar.readByte() & 255) << 16) | ((yuaVar.readByte() & 255) << 8);
    }

    public static final int p(int i, String str) {
        if (str == null) {
            return i;
        }
        try {
            long j = Long.parseLong(str);
            if (j > 2147483647L) {
                return Integer.MAX_VALUE;
            }
            if (j < 0) {
                return 0;
            }
            return (int) j;
        } catch (NumberFormatException unused) {
            return i;
        }
    }
}
