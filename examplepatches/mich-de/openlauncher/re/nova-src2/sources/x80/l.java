package x80;

import java.util.Comparator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        String a11 = (String) obj;
        String b11 = (String) obj2;
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        int iMin = Math.min(a11.length(), b11.length());
        for (int i5 = 4; i5 < iMin; i5++) {
            char cCharAt = a11.charAt(i5);
            char cCharAt2 = b11.charAt(i5);
            if (cCharAt != cCharAt2) {
                return Intrinsics.h(cCharAt, cCharAt2) < 0 ? -1 : 1;
            }
        }
        int length = a11.length();
        int length2 = b11.length();
        if (length != length2) {
            return length < length2 ? -1 : 1;
        }
        return 0;
    }
}
