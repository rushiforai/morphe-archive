package com.facebook.ads.redexgen.X;

import com.facebook.debug.log.BLogLevelCallback;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public abstract class YN {
    public static volatile YR A02 = C06434n.A00();
    public static volatile boolean A03 = false;
    public static boolean A00 = false;
    public static final List<BLogLevelCallback> A01 = new ArrayList();

    static {
        A02.AKq(5);
        YT.A02(A02);
    }

    public static void A00(@Nullable String str, String str2) {
        if (A02.ABG(4)) {
            A02.AAX(str, str2);
        }
    }

    public static void A01(@Nullable String str, String str2, Object obj) {
        if (A02.ABG(4)) {
            A00(str, YP.A0J(str2, obj));
        }
    }

    public static void A02(@Nullable String str, String str2, Throwable th2) {
        if (A02.ABG(4)) {
            A02.AAY(str, str2, th2);
        }
    }
}
