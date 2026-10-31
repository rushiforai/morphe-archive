package pg;

import android.app.Activity;
import android.app.AlertDialog;
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
import androidx.fragment.app.m0;
import b.c0;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.ErrorDialogFragment;
import com.google.android.gms.common.SupportErrorDialogFragment;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.common.internal.zab;
import n4.r;
import sg.w;

/* loaded from: classes.dex */
public final class b extends c {

    /* renamed from: d, reason: collision with root package name */
    public static final Object f82558d = new Object();

    /* renamed from: e, reason: collision with root package name */
    public static final b f82559e = new b();

    /* renamed from: c, reason: collision with root package name */
    public ug.d f82560c;

    public static AlertDialog e(Activity activity, int i5, sg.p pVar, DialogInterface.OnCancelListener onCancelListener) {
        if (i5 == 0) {
            return null;
        }
        TypedValue typedValue = new TypedValue();
        activity.getTheme().resolveAttribute(16843529, typedValue, true);
        AlertDialog.Builder builder = "Theme.Dialog.Alert".equals(activity.getResources().getResourceEntryName(typedValue.resourceId)) ? new AlertDialog.Builder(activity, 5) : null;
        if (builder == null) {
            builder = new AlertDialog.Builder(activity);
        }
        builder.setMessage(sg.m.c(activity, i5));
        if (onCancelListener != null) {
            builder.setOnCancelListener(onCancelListener);
        }
        String strE = sg.m.e(activity, i5);
        if (strE != null) {
            builder.setPositiveButton(strE, pVar);
        }
        String strA = sg.m.a(activity, i5);
        if (strA != null) {
            builder.setTitle(strA);
        }
        Log.w("GoogleApiAvailability", c0.h(i5, "Creating dialog for Google Play services availability issue. ConnectionResult="), new IllegalArgumentException());
        return builder.create();
    }

    public static void i(Activity activity, AlertDialog alertDialog, String str, DialogInterface.OnCancelListener onCancelListener) {
        try {
            if (activity instanceof m0) {
                SupportErrorDialogFragment.o(alertDialog, onCancelListener).show(((m0) activity).getSupportFragmentManager(), str);
                return;
            }
        } catch (NoClassDefFoundError unused) {
        }
        ErrorDialogFragment.a(alertDialog, onCancelListener).show(activity.getFragmentManager(), str);
    }

    public final void d(GoogleApiActivity googleApiActivity, int i5, GoogleApiActivity googleApiActivity2) {
        AlertDialog alertDialogE = e(googleApiActivity, i5, new sg.n(super.a(googleApiActivity, i5, "d"), googleApiActivity), googleApiActivity2);
        if (alertDialogE == null) {
            return;
        }
        i(googleApiActivity, alertDialogE, "GooglePlayServicesErrorDialog", googleApiActivity2);
    }

    public final void f(Activity activity, rg.h hVar, int i5, DialogInterface.OnCancelListener onCancelListener) {
        AlertDialog alertDialogE = e(activity, i5, new sg.o(super.a(activity, i5, "d"), hVar), onCancelListener);
        if (alertDialogE == null) {
            return;
        }
        i(activity, alertDialogE, "GooglePlayServicesErrorDialog", onCancelListener);
    }

    public final void g(Context context, int i5, PendingIntent pendingIntent) {
        int i11;
        Log.w("GoogleApiAvailability", c0.i(i5, "GMS core API Availability. ConnectionResult=", ", tag=null"), new IllegalArgumentException());
        if (i5 == 18) {
            new g(this, context).sendEmptyMessageDelayed(1, 120000L);
            return;
        }
        if (pendingIntent == null) {
            if (i5 == 6) {
                Log.w("GoogleApiAvailability", "Missing resolution for ConnectionResult.RESOLUTION_REQUIRED. Call GoogleApiAvailability#showErrorNotification(Context, ConnectionResult) instead.");
                return;
            }
            return;
        }
        String strB = sg.m.b(context, i5);
        String strD = sg.m.d(context, i5);
        Resources resources = context.getResources();
        Object systemService = context.getSystemService("notification");
        w.h(systemService);
        NotificationManager notificationManager = (NotificationManager) systemService;
        r rVar = new r(context);
        rVar.j();
        rVar.d(true);
        rVar.h(strB);
        n4.p pVar = new n4.p(0);
        pVar.e(strD);
        rVar.m(pVar);
        PackageManager packageManager = context.getPackageManager();
        if (xg.b.f95833c == null) {
            xg.b.f95833c = Boolean.valueOf(packageManager.hasSystemFeature("android.hardware.type.watch"));
        }
        if (xg.b.f95833c.booleanValue()) {
            int i12 = context.getApplicationInfo().icon;
            rVar.l(i12 != 0 ? i12 : 17301642);
            rVar.k(2);
            if (xg.b.e(context)) {
                rVar.a(resources.getString(2132017660), pendingIntent);
            } else {
                rVar.f(pendingIntent);
            }
        } else {
            rVar.l(17301642);
            rVar.n(resources.getString(2132017652));
            rVar.o(System.currentTimeMillis());
            rVar.f(pendingIntent);
            rVar.g(strD);
        }
        synchronized (f82558d) {
        }
        NotificationChannel notificationChannel = notificationManager.getNotificationChannel("com.google.android.gms.availability");
        String string = context.getResources().getString(2132017651);
        if (notificationChannel == null) {
            notificationManager.createNotificationChannel(new NotificationChannel("com.google.android.gms.availability", string, 4));
        } else if (!string.contentEquals(notificationChannel.getName())) {
            notificationChannel.setName(string);
            notificationManager.createNotificationChannel(notificationChannel);
        }
        rVar.e();
        Notification notificationB = rVar.b();
        if (i5 == 1 || i5 == 2 || i5 == 3) {
            e.f82564a.set(false);
            i11 = 10436;
        } else {
            i11 = 39789;
        }
        notificationManager.notify(i11, notificationB);
    }

    public final void h(Context context, ConnectionResult connectionResult, boolean z11) {
        Integer num = connectionResult.f31782j;
        int iIntValue = num == null ? -1 : num.intValue();
        zab zabVar = new zab(iIntValue, connectionResult.f31779g, System.currentTimeMillis(), context.getPackageName(), z11);
        if (this.f82560c == null) {
            this.f82560c = new ug.d(context);
        }
        this.f82560c.e(zabVar);
    }
}
