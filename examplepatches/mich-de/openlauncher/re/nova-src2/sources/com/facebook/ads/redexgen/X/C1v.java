package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1v, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C1v {
    public static byte[] A00;
    public static String[] A01 = {"KuTCkc88m5Khn4CyGrhwL", "IxLDI0IPbZApfW", "JVK2BzSuCceVtUDdSj5I07", "lBsBUWPEcrP06ZbqPLvUU4J", "22gZmP1JxBFCsFHb94EDAJ1IphHRhPLW", "4VOii7FoXK5P7l8zZ6nforp6Ebd", "RjeQAgQKhl5JskIp4JuQN5iIalMDBvKB", "EBwOVG6Ugh4W3c0PQTNtiW44jE9"};

    public /* synthetic */ C1v(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 70);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-105, -75, -105, -21, -26, -64, -27, -37, -36, -17, -79, -105, -113, -125, -42, -52, -35, -56, -99, -125, -120, 124, -48, -53, -91, -54, -64, -63, -44, -106, 124, 29, 3, 15, 12, 10, -26, 11, 1, 2, 21, -41, -67, -30, -25, -35, -34, -15, -77, -103, 37, 42, 30, 27, 40};
    }

    static {
        A01();
    }

    public C1v() {
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A02(Collection<?> collection) {
        int hashCode;
        C1h.A09(collection, A00(31, 1, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        int i5 = 1;
        Iterator<?> it = collection.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            String[] strArr = A01;
            String str = strArr[3];
            String str2 = strArr[2];
            int length = str.length();
            int hashCode2 = str2.length();
            if (length == hashCode2) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[6] = "SCwB4moZZna0suClCc4GjhLyaW7wqAtq";
            strArr2[4] = "mduzLj9uz3KnspGGdaJJ9nMm6LkrQb3g";
            if (zHasNext) {
                Object next = it.next();
                int i11 = i5 * 31;
                String[] strArr3 = A01;
                String str3 = strArr3[3];
                String str4 = strArr3[2];
                int length2 = str3.length();
                int hashCode3 = str4.length();
                if (length2 != hashCode3) {
                    String[] strArr4 = A01;
                    strArr4[6] = "hMwjEsxw7wl5skWc3rQN1oqLejAug6sa";
                    strArr4[4] = "wRbKU8F1FGogs5q469JLSPNenN0joauE";
                    hashCode = next != null ? next.hashCode() : 0;
                } else if (next != null) {
                }
                i5 = i11 + hashCode;
            } else {
                return i5;
            }
        }
    }

    public final void A03(int i5, int i11) {
        if (i5 >= 0 && i5 < i11) {
        } else {
            throw new IndexOutOfBoundsException(A00(43, 7, 51) + i5 + A00(12, 8, 29) + i11);
        }
    }

    public final void A04(int i5, int i11) {
        if (i5 >= 0 && i5 <= i11) {
        } else {
            throw new IndexOutOfBoundsException(A00(43, 7, 51) + i5 + A00(12, 8, 29) + i11);
        }
    }

    public final void A05(int i5, int i11, int i12) {
        String strA00 = A00(32, 11, 87);
        if (i5 >= 0 && i11 <= i12) {
            if (i5 <= i11) {
                return;
            } else {
                throw new IllegalArgumentException(strA00 + i5 + A00(0, 12, 49) + i11);
            }
        }
        throw new IndexOutOfBoundsException(strA00 + i5 + A00(20, 11, 22) + i11 + A00(12, 8, 29) + i12);
    }

    public final boolean A06(Collection<?> collection, Collection<?> collection2) {
        C1h.A09(collection, A00(31, 1, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        C1h.A09(collection2, A00(50, 5, 112));
        if (collection.size() != collection2.size()) {
            return false;
        }
        Iterator<?> it = collection2.iterator();
        Iterator<?> it2 = collection.iterator();
        while (it2.hasNext()) {
            if (!C1h.A0C(it2.next(), it.next())) {
                return false;
            }
        }
        return true;
    }
}
