package mh;

import b.u4;
import com.google.android.gms.internal.fido.zzhf;
import com.google.android.gms.internal.fido.zzhj;
import com.google.android.gms.internal.measurement.ub;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.io.IOException;
import java.math.RoundingMode;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f76312a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public static volatile ub f76313b;

    public static int a(int i5, int i11) {
        RoundingMode roundingMode = RoundingMode.CEILING;
        roundingMode.getClass();
        if (i11 == 0) {
            throw new ArithmeticException("/ by zero");
        }
        int i12 = i5 / i11;
        int i13 = i5 - (i11 * i12);
        if (i13 == 0) {
            return i12;
        }
        int i14 = ((i5 ^ i11) >> 31) | 1;
        switch (f0.f76334a[roundingMode.ordinal()]) {
            case 1:
                throw new ArithmeticException("mode was UNNECESSARY, but rounding was necessary");
            case 2:
                return i12;
            case 3:
                if (i14 >= 0) {
                    return i12;
                }
                break;
            case 4:
                break;
            case 5:
                if (i14 <= 0) {
                    return i12;
                }
                break;
            case 6:
            case 7:
            case 8:
                int iAbs = Math.abs(i13);
                int iAbs2 = iAbs - (Math.abs(i11) - iAbs);
                if (iAbs2 == 0) {
                    RoundingMode roundingMode2 = RoundingMode.HALF_UP;
                    RoundingMode roundingMode3 = RoundingMode.HALF_EVEN;
                    return i12;
                }
                if (iAbs2 <= 0) {
                    return i12;
                }
                break;
            default:
                throw new AssertionError();
        }
        return i12 + i14;
    }

    public static int b(l lVar) {
        Iterator it = lVar.iterator();
        int iHashCode = 0;
        while (it.hasNext()) {
            Object next = it.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }

    public static String c(String str, Object... objArr) {
        int length;
        int length2;
        int iIndexOf;
        String strN;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            length = objArr.length;
            if (i11 >= length) {
                break;
            }
            Object obj = objArr[i11];
            if (obj == null) {
                strN = AbstractJsonLexerKt.NULL;
            } else {
                try {
                    strN = obj.toString();
                } catch (Exception e3) {
                    String strM = u4.m(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
                    Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strM), (Throwable) e3);
                    strN = b.c0.n("<", strM, " threw ", e3.getClass().getName(), ">");
                }
            }
            objArr[i11] = strN;
            i11++;
        }
        StringBuilder sb2 = new StringBuilder(str.length() + (length * 16));
        int i12 = 0;
        while (true) {
            length2 = objArr.length;
            if (i5 >= length2 || (iIndexOf = str.indexOf("%s", i12)) == -1) {
                break;
            }
            sb2.append((CharSequence) str, i12, iIndexOf);
            sb2.append(objArr[i5]);
            i5++;
            i12 = iIndexOf + 2;
        }
        sb2.append((CharSequence) str, i12, str.length());
        if (i5 < length2) {
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

    public static String d(k0 k0Var) {
        StringBuilder sb2 = new StringBuilder(k0Var.f());
        for (int i5 = 0; i5 < k0Var.f(); i5++) {
            byte bC = k0Var.c(i5);
            if (bC == 34) {
                sb2.append("\\\"");
            } else if (bC == 39) {
                sb2.append("\\'");
            } else if (bC != 92) {
                switch (bC) {
                    case 7:
                        sb2.append("\\a");
                        break;
                    case 8:
                        sb2.append("\\b");
                        break;
                    case 9:
                        sb2.append("\\t");
                        break;
                    case 10:
                        sb2.append("\\n");
                        break;
                    case 11:
                        sb2.append("\\v");
                        break;
                    case 12:
                        sb2.append("\\f");
                        break;
                    case 13:
                        sb2.append("\\r");
                        break;
                    default:
                        if (bC < 32 || bC > 126) {
                            sb2.append(AbstractJsonLexerKt.STRING_ESC);
                            sb2.append((char) (((bC >>> 6) & 3) + 48));
                            sb2.append((char) (((bC >>> 3) & 7) + 48));
                            sb2.append((char) ((bC & 7) + 48));
                            break;
                        } else {
                            sb2.append((char) bC);
                            break;
                        }
                }
            } else {
                sb2.append("\\\\");
            }
        }
        return sb2.toString();
    }

    public static void e(int i5, int i11) {
        String strC;
        if (i5 < 0 || i5 >= i11) {
            if (i5 < 0) {
                strC = c("%s (%s) must not be negative", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5));
            } else {
                if (i11 < 0) {
                    throw new IllegalArgumentException(b.c0.h(i11, "negative size: "));
                }
                strC = c("%s (%s) must be less than size (%s)", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5), Integer.valueOf(i11));
            }
            throw new IndexOutOfBoundsException(strC);
        }
    }

    public static void f(Object obj, Object obj2) {
        if (obj == null) {
            throw new NullPointerException("null key in entry: null=".concat(String.valueOf(obj2)));
        }
        if (obj2 == null) {
            throw new NullPointerException(b.c0.l("null value in entry: ", obj.toString(), "=null"));
        }
    }

    public static final void g(StringBuilder sb2, Iterator it, br.c cVar) {
        if (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            sb2.append(br.c.m(entry.getKey()));
            sb2.append(" : ");
            sb2.append(br.c.m(entry.getValue()));
            while (it.hasNext()) {
                sb2.append(",\n  ");
                Map.Entry entry2 = (Map.Entry) it.next();
                sb2.append(br.c.m(entry2.getKey()));
                sb2.append(" : ");
                sb2.append(br.c.m(entry2.getValue()));
            }
        }
    }

    public static boolean h(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static boolean i(Comparator comparator, Collection collection) {
        Object objComparator;
        comparator.getClass();
        collection.getClass();
        if (collection instanceof SortedSet) {
            objComparator = ((SortedSet) collection).comparator();
            if (objComparator == null) {
                objComparator = s.f76375b;
            }
        } else {
            if (!(collection instanceof z)) {
                return false;
            }
            objComparator = ((p) ((z) collection)).f76367d;
        }
        return comparator.equals(objComparator);
    }

    public static byte[] j(byte[]... bArr) {
        int i5 = 0;
        int length = 0;
        while (true) {
            if (i5 >= bArr.length) {
                break;
            }
            length += bArr[i5].length;
            i5++;
        }
        byte[] bArr2 = new byte[length];
        int i11 = 0;
        for (byte[] bArr3 : bArr) {
            int length2 = bArr3.length;
            System.arraycopy(bArr3, 0, bArr2, i11, length2);
            i11 += length2;
        }
        return bArr2;
    }

    public static final s0 k(u0 u0Var) throws zzhf, zzhj {
        try {
            t0 t0VarD = u0Var.d();
            if (t0VarD == null) {
                throw new zzhj("Parser being asked to parse an empty input stream");
            }
            try {
                try {
                    byte b11 = t0VarD.f76378a;
                    byte b12 = t0VarD.f76379b;
                    int i5 = 0;
                    if (b11 == -128) {
                        long jA = u0Var.a();
                        if (jA > 1000) {
                            throw new zzhj("Parser being asked to read a large CBOR array");
                        }
                        l(jA, b12);
                        s0[] s0VarArr = new s0[(int) jA];
                        while (i5 < jA) {
                            s0VarArr[i5] = k(u0Var);
                            i5++;
                        }
                        return new m0(j.k(s0VarArr));
                    }
                    if (b11 != -96) {
                        if (b11 == -64) {
                            throw new zzhj("Tags are currently unsupported");
                        }
                        if (b11 == -32) {
                            return new n0(u0Var.e());
                        }
                        if (b11 == 0 || b11 == 32) {
                            long jB = u0Var.b();
                            l(jB > 0 ? jB : ~jB, b12);
                            return new p0(jB);
                        }
                        if (b11 == 64) {
                            u0Var.l((byte) 64);
                            byte[] bArrS = u0Var.s();
                            int length = bArrS.length;
                            l(length, b12);
                            return new o0(k0.k(length, bArrS));
                        }
                        if (b11 == 96) {
                            u0Var.l((byte) 96);
                            String str = new String(u0Var.s(), StandardCharsets.UTF_8);
                            l(str.length(), b12);
                            return new r0(str);
                        }
                        throw new zzhj("Unidentifiable major type: " + ((b11 >> 5) & 7));
                    }
                    long jC = u0Var.c();
                    if (jC > 1000) {
                        throw new zzhj("Parser being asked to read a large CBOR map");
                    }
                    l(jC, b12);
                    int i11 = (int) jC;
                    c10.a[] aVarArr = new c10.a[i11];
                    s0 s0Var = null;
                    int i12 = 0;
                    while (i12 < jC) {
                        s0 s0VarK = k(u0Var);
                        if (s0Var != null && s0VarK.compareTo(s0Var) <= 0) {
                            throw new zzhf("Keys in CBOR Map not in strictly ascending natural order:\nPrevious key: " + s0Var.toString() + "\nCurrent key: " + s0VarK.toString());
                        }
                        aVarArr[i12] = new c10.a(27, s0VarK, k(u0Var));
                        i12++;
                        s0Var = s0VarK;
                    }
                    TreeMap treeMap = new TreeMap();
                    while (i5 < i11) {
                        c10.a aVar = aVarArr[i5];
                        if (treeMap.containsKey((s0) aVar.f19148b)) {
                            throw new zzhf("Attempted to add duplicate key to canonical CBOR Map.");
                        }
                        treeMap.put((s0) aVar.f19148b, (s0) aVar.f19149c);
                        i5++;
                    }
                    return new q0(o.b(treeMap));
                } catch (IOException | RuntimeException e3) {
                    e = e3;
                    throw new zzhj(e);
                }
            } catch (RuntimeException e11) {
                e = e11;
                throw new zzhj(e);
            }
        } catch (IOException e12) {
            throw new zzhj(e12);
        }
    }

    public static final void l(long j11, byte b11) throws zzhf {
        switch (b11) {
            case 24:
                if (j11 < 24) {
                    throw new zzhf(c1.o(j11, "Integer value ", " after add info could have been represented in 0 additional bytes, but used 1"));
                }
                return;
            case 25:
                if (j11 < 256) {
                    throw new zzhf(c1.o(j11, "Integer value ", " after add info could have been represented in 0-1 additional bytes, but used 2"));
                }
                return;
            case 26:
                if (j11 < 65536) {
                    throw new zzhf(c1.o(j11, "Integer value ", " after add info could have been represented in 0-2 additional bytes, but used 4"));
                }
                return;
            case 27:
                if (j11 < 4294967296L) {
                    throw new zzhf(c1.o(j11, "Integer value ", " after add info could have been represented in 0-4 additional bytes, but used 8"));
                }
                return;
            default:
                return;
        }
    }

    public static void m(int i5, int i11, int i12) {
        if (i5 < 0 || i11 < i5 || i11 > i12) {
            throw new IndexOutOfBoundsException((i5 < 0 || i5 > i12) ? n(i5, i12, "start index") : (i11 < 0 || i11 > i12) ? n(i11, i12, "end index") : c("end index (%s) must not be less than start index (%s)", Integer.valueOf(i11), Integer.valueOf(i5)));
        }
    }

    public static String n(int i5, int i11, String str) {
        if (i5 < 0) {
            return c("%s (%s) must not be negative", str, Integer.valueOf(i5));
        }
        if (i11 >= 0) {
            return c("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i5), Integer.valueOf(i11));
        }
        throw new IllegalArgumentException(b.c0.h(i11, "negative size: "));
    }
}
