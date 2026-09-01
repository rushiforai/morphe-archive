package defpackage;

import android.content.Intent;
import android.content.IntentSender;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import java.util.Arrays;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vy1 extends r7 {
    public final /* synthetic */ xy1 h;

    public vy1(xy1 xy1Var) {
        this.h = xy1Var;
    }

    @Override // defpackage.r7
    public final void b(int i, f7 f7Var, Object obj, z6 z6Var) {
        Bundle bundle;
        int i2;
        xy1 xy1Var = this.h;
        e7 e7VarB = f7Var.b(xy1Var, obj);
        if (e7VarB != null) {
            new Handler(Looper.getMainLooper()).post(new uy1(this, i, e7VarB, 0));
            return;
        }
        Intent intentA = f7Var.a(xy1Var, obj);
        if (intentA.getExtras() != null) {
            Bundle extras = intentA.getExtras();
            extras.getClass();
            if (extras.getClassLoader() == null) {
                intentA.setExtrasClassLoader(xy1Var.getClassLoader());
            }
        }
        if (intentA.hasExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE")) {
            bundle = intentA.getBundleExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
            intentA.removeExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
        } else {
            bundle = z6Var != null ? ((y6) z6Var).a.toBundle() : null;
        }
        Bundle bundle2 = bundle;
        if (!"androidx.activity.result.contract.action.REQUEST_PERMISSIONS".equals(intentA.getAction())) {
            if (!"androidx.activity.result.contract.action.INTENT_SENDER_REQUEST".equals(intentA.getAction())) {
                xy1Var.startActivityForResult(intentA, i, bundle2);
                return;
            }
            a56 a56Var = (a56) intentA.getParcelableExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST");
            try {
                a56Var.getClass();
                i2 = i;
            } catch (IntentSender.SendIntentException e) {
                e = e;
                i2 = i;
            }
            try {
                xy1Var.startIntentSenderForResult(a56Var.a, i2, a56Var.b, a56Var.c, a56Var.d, 0, bundle2);
                return;
            } catch (IntentSender.SendIntentException e2) {
                e = e2;
                new Handler(Looper.getMainLooper()).post(new uy1(this, i2, e, 1));
                return;
            }
        }
        String[] stringArrayExtra = intentA.getStringArrayExtra("androidx.activity.result.contract.extra.PERMISSIONS");
        if (stringArrayExtra == null) {
            stringArrayExtra = new String[0];
        }
        HashSet hashSet = new HashSet();
        for (int i3 = 0; i3 < stringArrayExtra.length; i3++) {
            if (TextUtils.isEmpty(stringArrayExtra[i3])) {
                ay0.e(ka1.v(new StringBuilder("Permission request for permissions "), Arrays.toString(stringArrayExtra), " must not contain null or empty values"));
                return;
            }
            if (Build.VERSION.SDK_INT < 33 && TextUtils.equals(stringArrayExtra[i3], "android.permission.POST_NOTIFICATIONS")) {
                hashSet.add(Integer.valueOf(i3));
            }
        }
        int size = hashSet.size();
        String[] strArr = size > 0 ? new String[stringArrayExtra.length - size] : stringArrayExtra;
        if (size > 0) {
            if (size == stringArrayExtra.length) {
                return;
            }
            int i4 = 0;
            for (int i5 = 0; i5 < stringArrayExtra.length; i5++) {
                if (!hashSet.contains(Integer.valueOf(i5))) {
                    strArr[i4] = stringArrayExtra[i5];
                    i4++;
                }
            }
        }
        xy1Var.requestPermissions(stringArrayExtra, i);
    }
}
