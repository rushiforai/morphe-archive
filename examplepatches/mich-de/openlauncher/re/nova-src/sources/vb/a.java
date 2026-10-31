package vb;

import android.os.Build;
import android.view.View;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int f92583a = Build.VERSION.SDK_INT;

    public static int a(long j11, long j12) {
        return Math.min(Math.max(0, j12 > 0 ? (int) (((j11 * 1.0d) / j12) * 100.0d) : 0), 100);
    }

    public static String b(long j11) {
        StringBuilder sb2 = new StringBuilder();
        long j12 = j11 / 60000;
        long j13 = ((j11 % 3600000) % 60000) / 1000;
        if (j12 >= 10) {
            sb2.append(j12);
        } else if (j12 > 0) {
            sb2.append(0);
            sb2.append(j12);
        } else {
            sb2.append("00");
        }
        sb2.append(":");
        if (j13 >= 10) {
            sb2.append(j13);
        } else if (j13 > 0) {
            sb2.append(0);
            sb2.append(j13);
        } else {
            sb2.append("00");
        }
        return sb2.toString();
    }

    public static void c(View view, boolean z11) {
        if (view == null) {
            return;
        }
        if (z11) {
            view.setSystemUiVisibility(0);
            return;
        }
        int i5 = f92583a;
        if (i5 >= 19) {
            view.setSystemUiVisibility(3846);
        } else if (i5 >= 16) {
            view.setSystemUiVisibility(5);
        } else {
            view.setSystemUiVisibility(1);
        }
    }
}
