package com.facebook.ads.redexgen.X;

import com.google.common.base.ElementTypesAreNonnullByDefault;
import java.util.Arrays;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: assets/audience_network/classes.dex */
public abstract class A6 extends AbstractC1339Wz {
    public static int A00(@CheckForNull Object... objects) {
        return Arrays.hashCode(objects);
    }

    public static boolean A01(@CheckForNull Object a11, @CheckForNull Object b11) {
        return a11 == b11 || (a11 != null && a11.equals(b11));
    }
}
