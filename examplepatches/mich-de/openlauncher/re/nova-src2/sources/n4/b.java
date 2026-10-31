package n4;

import android.app.Activity;
import android.app.SharedElementCallback;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.HashSet;

/* loaded from: classes2.dex */
public abstract class b extends o4.a {
    public static void d(m.m mVar) {
        mVar.finishAffinity();
    }

    public static void e(androidx.fragment.app.m0 m0Var) {
        m0Var.finishAfterTransition();
    }

    public static void f(androidx.fragment.app.m0 m0Var) {
        m0Var.postponeEnterTransition();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void g(Activity activity, String[] strArr, int i5) {
        HashSet hashSet = new HashSet();
        for (int i11 = 0; i11 < strArr.length; i11++) {
            if (TextUtils.isEmpty(strArr[i11])) {
                throw new IllegalArgumentException(b.c0.q(new StringBuilder("Permission request for permissions "), Arrays.toString(strArr), " must not contain null or empty values"));
            }
            if (Build.VERSION.SDK_INT < 33 && TextUtils.equals(strArr[i11], "android.permission.POST_NOTIFICATIONS")) {
                hashSet.add(Integer.valueOf(i11));
            }
        }
        int size = hashSet.size();
        String[] strArr2 = size > 0 ? new String[strArr.length - size] : strArr;
        if (size > 0) {
            if (size == strArr.length) {
                return;
            }
            int i12 = 0;
            for (int i13 = 0; i13 < strArr.length; i13++) {
                if (!hashSet.contains(Integer.valueOf(i13))) {
                    strArr2[i12] = strArr[i13];
                    i12++;
                }
            }
        }
        if (activity instanceof a) {
            ((a) activity).validateRequestPermissionsRequestCode(i5);
        }
        activity.requestPermissions(strArr, i5);
    }

    public static void h(androidx.fragment.app.m0 m0Var) {
        m0Var.setEnterSharedElementCallback((SharedElementCallback) null);
    }

    public static void i(androidx.fragment.app.m0 m0Var) {
        m0Var.setExitSharedElementCallback((SharedElementCallback) null);
    }

    public static boolean j(androidx.fragment.app.m0 m0Var, String str) {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 33 && TextUtils.equals("android.permission.POST_NOTIFICATIONS", str)) {
            return false;
        }
        if (i5 < 32 && i5 == 31) {
            try {
                return ((Boolean) PackageManager.class.getMethod("shouldShowRequestPermissionRationale", String.class).invoke(m0Var.getApplication().getPackageManager(), str)).booleanValue();
            } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException unused) {
                return m0Var.shouldShowRequestPermissionRationale(str);
            }
        }
        return m0Var.shouldShowRequestPermissionRationale(str);
    }

    public static void k(Activity activity, Intent intent, int i5, Bundle bundle) {
        activity.startActivityForResult(intent, i5, bundle);
    }

    public static void l(Activity activity, IntentSender intentSender, int i5, Intent intent, int i11, int i12, int i13, Bundle bundle) {
        activity.startIntentSenderForResult(intentSender, i5, intent, i11, i12, i13, bundle);
    }

    public static void m(androidx.fragment.app.m0 m0Var) {
        m0Var.startPostponedEnterTransition();
    }
}
