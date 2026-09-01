package defpackage;

import android.R;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.FragmentManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.util.Log;
import android.util.TypedValue;
import com.google.android.gms.common.api.GoogleApiActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ae5 extends be5 {
    public static final Object d = new Object();
    public static final ae5 e = new ae5();
    public b66 c;

    public static AlertDialog e(Activity activity, int i, pjf pjfVar, DialogInterface.OnCancelListener onCancelListener) {
        if (i == 0) {
            return null;
        }
        TypedValue typedValue = new TypedValue();
        activity.getTheme().resolveAttribute(R.attr.alertDialogTheme, typedValue, true);
        AlertDialog.Builder builder = "Theme.Dialog.Alert".equals(activity.getResources().getResourceEntryName(typedValue.resourceId)) ? new AlertDialog.Builder(activity, 5) : null;
        if (builder == null) {
            builder = new AlertDialog.Builder(activity);
        }
        builder.setMessage(hjf.b(activity, i));
        if (onCancelListener != null) {
            builder.setOnCancelListener(onCancelListener);
        }
        Resources resources = activity.getResources();
        String string = i != 1 ? i != 2 ? i != 3 ? resources.getString(R.string.ok) : resources.getString(com.medium.reader.R.string.common_google_play_services_enable_button) : resources.getString(com.medium.reader.R.string.common_google_play_services_update_button) : resources.getString(com.medium.reader.R.string.common_google_play_services_install_button);
        if (string != null) {
            builder.setPositiveButton(string, pjfVar);
        }
        String strA = hjf.a(activity, i);
        if (strA != null) {
            builder.setTitle(strA);
        }
        Log.w("GoogleApiAvailability", b09.w(i, "Creating dialog for Google Play services availability issue. ConnectionResult="), new IllegalArgumentException());
        return builder.create();
    }

    public static void h(Activity activity, AlertDialog alertDialog, String str, DialogInterface.OnCancelListener onCancelListener) {
        try {
            if (activity instanceof m15) {
                g25 g25VarM = ((m15) activity).m();
                o2d o2dVar = new o2d();
                vp7.q("Cannot display null dialog", alertDialog);
                alertDialog.setOnCancelListener(null);
                alertDialog.setOnDismissListener(null);
                o2dVar.C0 = alertDialog;
                if (onCancelListener != null) {
                    o2dVar.D0 = onCancelListener;
                }
                o2dVar.c0(g25VarM, str);
                return;
            }
        } catch (NoClassDefFoundError unused) {
        }
        FragmentManager fragmentManager = activity.getFragmentManager();
        f14 f14Var = new f14();
        vp7.q("Cannot display null dialog", alertDialog);
        alertDialog.setOnCancelListener(null);
        alertDialog.setOnDismissListener(null);
        f14Var.a = alertDialog;
        if (onCancelListener != null) {
            f14Var.b = onCancelListener;
        }
        f14Var.show(fragmentManager, str);
    }

    @Override // defpackage.be5
    public final int b(Context context) {
        return super.c(context, be5.a);
    }

    public final void d(GoogleApiActivity googleApiActivity, int i, GoogleApiActivity googleApiActivity2) {
        AlertDialog alertDialogE = e(googleApiActivity, i, new ijf(super.a(i, googleApiActivity, "d"), googleApiActivity), googleApiActivity2);
        if (alertDialogE == null) {
            return;
        }
        h(googleApiActivity, alertDialogE, "GooglePlayServicesErrorDialog", googleApiActivity2);
    }

    public final void f(Activity activity, dy6 dy6Var, int i, DialogInterface.OnCancelListener onCancelListener) {
        AlertDialog alertDialogE = e(activity, i, new mjf(super.a(i, activity, "d"), dy6Var), onCancelListener);
        if (alertDialogE == null) {
            return;
        }
        h(activity, alertDialogE, "GooglePlayServicesErrorDialog", onCancelListener);
    }

    public final void g(Context context, int i, PendingIntent pendingIntent) {
        int i2;
        Log.w("GoogleApiAvailability", ev6.w("GMS core API Availability. ConnectionResult=", i, ", tag=null"), new IllegalArgumentException());
        if (i == 18) {
            new cjf(this, context).sendEmptyMessageDelayed(1, 120000L);
            return;
        }
        if (pendingIntent == null) {
            if (i == 6) {
                Log.w("GoogleApiAvailability", "Missing resolution for ConnectionResult.RESOLUTION_REQUIRED. Call GoogleApiAvailability#showErrorNotification(Context, ConnectionResult) instead.");
                return;
            }
            return;
        }
        String strE = i == 6 ? hjf.e(context, "common_google_play_services_resolution_required_title") : hjf.a(context, i);
        if (strE == null) {
            strE = context.getResources().getString(com.medium.reader.R.string.common_google_play_services_notification_ticker);
        }
        String strD = (i == 6 || i == 19) ? hjf.d(context, "common_google_play_services_resolution_required_text", hjf.c(context)) : hjf.b(context, i);
        Resources resources = context.getResources();
        Object systemService = context.getSystemService("notification");
        vp7.p(systemService);
        NotificationManager notificationManager = (NotificationManager) systemService;
        ti8 ti8Var = new ti8(context, null);
        ti8Var.m = true;
        ti8Var.c(true);
        ti8Var.e = ti8.b(strE);
        si8 si8Var = new si8(4);
        si8Var.c = ti8.b(strD);
        ti8Var.e(si8Var);
        PackageManager packageManager = context.getPackageManager();
        Boolean boolValueOf = r40.l;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(packageManager.hasSystemFeature("android.hardware.type.watch"));
            r40.l = boolValueOf;
        }
        boolean zBooleanValue = boolValueOf.booleanValue();
        int i3 = R.drawable.stat_sys_warning;
        if (zBooleanValue) {
            int i4 = context.getApplicationInfo().icon;
            if (i4 != 0) {
                i3 = i4;
            }
            ti8Var.s.icon = i3;
            ti8Var.j = 2;
            if (r40.G(context)) {
                ti8Var.b.add(new ni8(2131230879, resources.getString(com.medium.reader.R.string.common_open_on_phone), pendingIntent));
            } else {
                ti8Var.g = pendingIntent;
            }
        } else {
            ti8Var.s.icon = R.drawable.stat_sys_warning;
            ti8Var.s.tickerText = ti8.b(resources.getString(com.medium.reader.R.string.common_google_play_services_notification_ticker));
            ti8Var.s.when = System.currentTimeMillis();
            ti8Var.g = pendingIntent;
            ti8Var.f = ti8.b(strD);
        }
        if (gq7.D()) {
            if (!gq7.D()) {
                lg8.d();
                return;
            }
            synchronized (d) {
            }
            NotificationChannel notificationChannel = notificationManager.getNotificationChannel("com.google.android.gms.availability");
            String string = context.getResources().getString(com.medium.reader.R.string.common_google_play_services_notification_channel_name);
            if (notificationChannel == null) {
                notificationManager.createNotificationChannel(new NotificationChannel("com.google.android.gms.availability", string, 4));
            } else if (!string.contentEquals(notificationChannel.getName())) {
                notificationChannel.setName(string);
                notificationManager.createNotificationChannel(notificationChannel);
            }
            ti8Var.q = "com.google.android.gms.availability";
        }
        Notification notificationA = ti8Var.a();
        if (i == 1 || i == 2 || i == 3) {
            he5.a.set(false);
            i2 = 10436;
        } else {
            i2 = 39789;
        }
        notificationManager.notify(i2, notificationA);
    }
}
