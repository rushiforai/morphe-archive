package vk;

import b.c0;
import b.u4;
import com.google.common.util.concurrent.ListenableFuture;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class b0 {
    public static String a(int i5, int i11, String str) {
        if (i5 < 0) {
            return p("%s (%s) must not be negative", str, Integer.valueOf(i5));
        }
        if (i11 >= 0) {
            return p("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i5), Integer.valueOf(i11));
        }
        throw new IllegalArgumentException(c0.h(i11, "negative size: "));
    }

    public static void b(String str, boolean z11) {
        if (!z11) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void c(boolean z11) {
        if (!z11) {
            throw new IllegalArgumentException();
        }
    }

    public static void d(boolean z11, String str, Object obj) {
        if (!z11) {
            throw new IllegalArgumentException(p(str, obj));
        }
    }

    public static void e(int i5, int i11) {
        String strP;
        if (i5 < 0 || i5 >= i11) {
            if (i5 < 0) {
                strP = p("%s (%s) must not be negative", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5));
            } else {
                if (i11 < 0) {
                    throw new IllegalArgumentException(c0.h(i11, "negative size: "));
                }
                strP = p("%s (%s) must be less than size (%s)", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5), Integer.valueOf(i11));
            }
            throw new IndexOutOfBoundsException(strP);
        }
    }

    public static void f(ListenableFuture listenableFuture, String str, Object obj) {
        if (listenableFuture == null) {
            throw new NullPointerException(p(str, obj));
        }
    }

    public static void g(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    public static void h(int i5, int i11) {
        if (i5 < 0 || i5 > i11) {
            throw new IndexOutOfBoundsException(a(i5, i11, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX));
        }
    }

    public static void i(int i5, int i11, int i12) {
        if (i5 < 0 || i11 < i5 || i11 > i12) {
            throw new IndexOutOfBoundsException((i5 < 0 || i5 > i12) ? a(i5, i12, "start index") : (i11 < 0 || i11 > i12) ? a(i11, i12, "end index") : p("end index (%s) must not be less than start index (%s)", Integer.valueOf(i11), Integer.valueOf(i5)));
        }
    }

    public static void j(String str, boolean z11) {
        if (!z11) {
            throw new IllegalStateException(str);
        }
    }

    public static Object n(Object obj, Object obj2) {
        if (obj != null) {
            return obj;
        }
        if (obj2 != null) {
            return obj2;
        }
        throw new NullPointerException("Both parameters are null");
    }

    public static boolean o(char c11) {
        return c11 >= 'A' && c11 <= 'Z';
    }

    public static String p(String str, Object... objArr) {
        int iIndexOf;
        String string;
        String strValueOf = String.valueOf(str);
        int i5 = 0;
        for (int i11 = 0; i11 < objArr.length; i11++) {
            Object obj = objArr[i11];
            if (obj == null) {
                string = AbstractJsonLexerKt.NULL;
            } else {
                try {
                    string = obj.toString();
                } catch (Exception e3) {
                    String str2 = obj.getClass().getName() + '@' + Integer.toHexString(System.identityHashCode(obj));
                    Logger.getLogger("com.google.common.base.Strings").log(Level.WARNING, "Exception during lenientFormat for " + str2, (Throwable) e3);
                    StringBuilder sbK = u4.k("<", str2, " threw ");
                    sbK.append(e3.getClass().getName());
                    sbK.append(">");
                    string = sbK.toString();
                }
            }
            objArr[i11] = string;
        }
        StringBuilder sb2 = new StringBuilder((objArr.length * 16) + strValueOf.length());
        int i12 = 0;
        while (i5 < objArr.length && (iIndexOf = strValueOf.indexOf("%s", i12)) != -1) {
            sb2.append((CharSequence) strValueOf, i12, iIndexOf);
            sb2.append(objArr[i5]);
            i12 = iIndexOf + 2;
            i5++;
        }
        sb2.append((CharSequence) strValueOf, i12, strValueOf.length());
        if (i5 < objArr.length) {
            sb2.append(" [");
            sb2.append(objArr[i5]);
            for (int i13 = i5 + 1; i13 < objArr.length; i13++) {
                sb2.append(", ");
                sb2.append(objArr[i13]);
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        return sb2.toString();
    }

    public static u q(u uVar) {
        if ((uVar instanceof x) || (uVar instanceof v)) {
            return uVar;
        }
        if (uVar instanceof Serializable) {
            return new v(uVar);
        }
        x xVar = new x();
        uVar.getClass();
        xVar.f92837a = uVar;
        return xVar;
    }

    public static String s(String str) {
        int length = str.length();
        int i5 = 0;
        while (i5 < length) {
            if (o(str.charAt(i5))) {
                char[] charArray = str.toCharArray();
                while (i5 < length) {
                    char c11 = charArray[i5];
                    if (o(c11)) {
                        charArray[i5] = (char) (c11 ^ ' ');
                    }
                    i5++;
                }
                return String.valueOf(charArray);
            }
            i5++;
        }
        return str;
    }

    public static String t(String str) {
        int length = str.length();
        int i5 = 0;
        while (i5 < length) {
            char cCharAt = str.charAt(i5);
            if (cCharAt >= 'a' && cCharAt <= 'z') {
                char[] charArray = str.toCharArray();
                while (i5 < length) {
                    char c11 = charArray[i5];
                    if (c11 >= 'a' && c11 <= 'z') {
                        charArray[i5] = (char) (c11 ^ ' ');
                    }
                    i5++;
                }
                return String.valueOf(charArray);
            }
            i5++;
        }
        return str;
    }

    public abstract boolean k(Object obj, Object obj2);

    public abstract int l(Object obj);

    public boolean m(Object obj, Object obj2) {
        if (obj == obj2) {
            return true;
        }
        if (obj == null || obj2 == null) {
            return false;
        }
        return k(obj, obj2);
    }

    public abstract long r();
}
