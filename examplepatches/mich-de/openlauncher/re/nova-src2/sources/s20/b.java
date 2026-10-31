package s20;

import java.util.Arrays;

/* loaded from: classes4.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f86652a = {"com.google.android.apps.nbu.paisa.user", "com.google.android.apps.walletnfcrel", "com.samsung.android.spay"};

    public static boolean a(String str) {
        return Arrays.binarySearch(f86652a, str) >= 0;
    }
}
