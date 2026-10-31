package com.facebook.ads.redexgen.X;

import android.app.ActivityManager;
import android.content.Context;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.p3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2332p3 {
    public static byte[] A00;
    public static String[] A01 = {"4Hyw1ld0", "fEzx6YE0SeCvem7jc58qc1uowK5CeHyF", "mKjUZIiYyhCBAWVMkGfhIPNFhY8yjY7b", "XoO13E9Z", "T5DEyuoaMCuUHewoghibS1K19XR2WHTa", "iIUB3596vuf", "PRfLmBQ8OOom6oFwc8jxiiNxNKuVVsiK", "TWoMGSFYHQz"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A01[4].charAt(13) == '3') {
                throw new RuntimeException();
            }
            A01[2] = "lr9od7US3THgayVRC3YximplGEeGYREs";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 10);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{60, 62, 41, 52, 43, 52, 41, 36, 54, 57, 51, 37, 56, 62, 51, 121, 62, 57, 35, 50, 57, 35, 121, 52, 54, 35, 50, 48, 56, 37, 46, 121, 27, 22, 2, 25, 20, 31, 18, 5};
    }

    static {
        A03();
    }

    public static EnumC2331p2 A00(Context context) {
        try {
            return A01(context);
        } catch (Exception unused) {
            return EnumC2331p2.A04;
        }
    }

    public static EnumC2331p2 A01(Context context) {
        if (context == null) {
            return EnumC2331p2.A0C;
        }
        ActivityManager mgr = (ActivityManager) context.getSystemService(A02(0, 8, 87));
        if (mgr == null) {
            return EnumC2331p2.A07;
        }
        List<ActivityManager.AppTask> tasks = mgr.getAppTasks();
        if (tasks.isEmpty()) {
            return EnumC2331p2.A0A;
        }
        Iterator<ActivityManager.AppTask> it = tasks.iterator();
        while (it.hasNext()) {
            ActivityManager.RecentTaskInfo taskInfo = it.next().getTaskInfo();
            if (taskInfo != null && taskInfo.baseIntent != null) {
                Set<String> categories = taskInfo.baseIntent.getCategories();
                if (A01[4].charAt(13) == '3') {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[7] = "rbRaEFWiZz7";
                strArr[5] = "WgbgXmtUXm5";
                if (categories != null && taskInfo.baseIntent.getCategories().contains(A02(8, 32, 93))) {
                    return EnumC2331p2.A05;
                }
            }
        }
        return EnumC2331p2.A08;
    }
}
