package defpackage;

import android.app.Activity;
import android.app.ForegroundServiceStartNotAllowedException;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetFileDescriptor;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.ImageDecoder;
import android.graphics.Insets;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderNode;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.ColorStateListDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.text.MeasuredText;
import android.os.Binder;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.Trace;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.view.contentcapture.ContentCaptureSession;
import androidx.work.impl.foreground.SystemForegroundService;
import com.medium.android.donkey.audio.AudioService;
import com.medium.reader.R;
import defpackage.c2a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nm {
    public static Intent A(Context context, BroadcastReceiver broadcastReceiver, IntentFilter intentFilter, String str, int i) {
        int i2 = i & 2;
        if (i2 == 0 && (i & 4) == 0) {
            ay0.e("One of either RECEIVER_EXPORTED or RECEIVER_NOT_EXPORTED is required");
            return null;
        }
        if (i2 == 0 || (i & 4) == 0) {
            int i3 = Build.VERSION.SDK_INT;
            return i3 >= 33 ? epe.U(context, broadcastReceiver, intentFilter, str, i) : i3 >= 26 ? u36.r(context, broadcastReceiver, intentFilter, str, i) : ((i & 4) == 0 || str != null) ? context.registerReceiver(broadcastReceiver, intentFilter, str, null) : context.registerReceiver(broadcastReceiver, intentFilter, v(context), null);
        }
        ay0.e("Cannot specify both RECEIVER_EXPORTED and RECEIVER_NOT_EXPORTED");
        return null;
    }

    public static void B(Notification.Builder builder, boolean z) {
        builder.setAllowSystemGeneratedContextualActions(z);
    }

    public static void C(Paint paint, Object obj) {
        paint.setBlendMode((BlendMode) obj);
    }

    public static void D(Paint paint, int i) {
        paint.setBlendMode(K(i));
    }

    public static void E(Notification.Builder builder) {
        builder.setBubbleMetadata(null);
    }

    public static void F(Notification.Action.Builder builder) {
        builder.setContextual(false);
    }

    public static void G(SystemForegroundService systemForegroundService, int i, Notification notification, int i2) {
        systemForegroundService.startForeground(i, notification, i2);
    }

    public static void H(AudioService audioService, Notification notification, int i) {
        if (i == 0 || i == -1) {
            audioService.startForeground(R.id.audio_service_notification_id, notification, i);
        } else {
            audioService.startForeground(R.id.audio_service_notification_id, notification, i & 255);
        }
    }

    public static void I(SystemForegroundService systemForegroundService, int i, Notification notification, int i2) {
        try {
            systemForegroundService.startForeground(i, notification, i2);
        } catch (ForegroundServiceStartNotAllowedException e) {
            d87 d87VarH = d87.h();
            String str = SystemForegroundService.e;
            if (d87VarH.b <= 5) {
                Log.w(str, "Unable to start foreground service", e);
            }
        } catch (SecurityException e2) {
            d87 d87VarH2 = d87.h();
            String str2 = SystemForegroundService.e;
            if (d87VarH2.b <= 5) {
                Log.w(str2, "Unable to start foreground service", e2);
            }
        }
    }

    public static void J(AudioService audioService, Notification notification, int i) {
        if (i == 0 || i == -1) {
            audioService.startForeground(R.id.audio_service_notification_id, notification, i);
        } else {
            audioService.startForeground(R.id.audio_service_notification_id, notification, i & 1073745919);
        }
    }

    public static final BlendMode K(int i) {
        return i == 0 ? BlendMode.CLEAR : i == 1 ? BlendMode.SRC : i == 2 ? BlendMode.DST : i == 3 ? BlendMode.SRC_OVER : i == 4 ? BlendMode.DST_OVER : i == 5 ? BlendMode.SRC_IN : i == 6 ? BlendMode.DST_IN : i == 7 ? BlendMode.SRC_OUT : i == 8 ? BlendMode.DST_OUT : i == 9 ? BlendMode.SRC_ATOP : i == 10 ? BlendMode.DST_ATOP : i == 11 ? BlendMode.XOR : i == 12 ? BlendMode.PLUS : i == 13 ? BlendMode.MODULATE : i == 14 ? BlendMode.SCREEN : i == 15 ? BlendMode.OVERLAY : i == 16 ? BlendMode.DARKEN : i == 17 ? BlendMode.LIGHTEN : i == 18 ? BlendMode.COLOR_DODGE : i == 19 ? BlendMode.COLOR_BURN : i == 20 ? BlendMode.HARD_LIGHT : i == 21 ? BlendMode.SOFT_LIGHT : i == 22 ? BlendMode.DIFFERENCE : i == 23 ? BlendMode.EXCLUSION : i == 24 ? BlendMode.MULTIPLY : i == 25 ? BlendMode.HUE : i == 26 ? BlendMode.SATURATION : i == 27 ? BlendMode.COLOR : i == 28 ? BlendMode.LUMINOSITY : BlendMode.SRC_OVER;
    }

    public static final ImageDecoder.Source L(yx5 yx5Var, ew8 ew8Var, boolean z) {
        g59 g59VarM0;
        if (yx5Var.getFileSystem() == ch4.a && (g59VarM0 = yx5Var.m0()) != null) {
            return ImageDecoder.createSource(g59VarM0.toFile());
        }
        kng kngVarK = yx5Var.K();
        if (kngVarK instanceof p80) {
            return ImageDecoder.createSource(ew8Var.a.getAssets(), ((p80) kngVarK).B);
        }
        if ((kngVarK instanceof q82) && Build.VERSION.SDK_INT >= 29) {
            try {
                AssetFileDescriptor assetFileDescriptor = ((q82) kngVarK).B;
                Os.lseek(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), OsConstants.SEEK_SET);
                return ImageDecoder.createSource(new lc2(3, assetFileDescriptor));
            } catch (ErrnoException unused) {
                return null;
            }
        }
        if (kngVarK instanceof tcb) {
            tcb tcbVar = (tcb) kngVarK;
            if (tcbVar.B.equals(ew8Var.a.getPackageName())) {
                return ImageDecoder.createSource(ew8Var.a.getResources(), tcbVar.C);
            }
        }
        if (!(kngVarK instanceof t11)) {
            return null;
        }
        if (Build.VERSION.SDK_INT >= 30 || !z || ((t11) kngVarK).B.isDirect()) {
            return ImageDecoder.createSource(((t11) kngVarK).B);
        }
        return null;
    }

    public static final PorterDuff.Mode M(int i) {
        return i == 0 ? PorterDuff.Mode.CLEAR : i == 1 ? PorterDuff.Mode.SRC : i == 2 ? PorterDuff.Mode.DST : i == 3 ? PorterDuff.Mode.SRC_OVER : i == 4 ? PorterDuff.Mode.DST_OVER : i == 5 ? PorterDuff.Mode.SRC_IN : i == 6 ? PorterDuff.Mode.DST_IN : i == 7 ? PorterDuff.Mode.SRC_OUT : i == 8 ? PorterDuff.Mode.DST_OUT : i == 9 ? PorterDuff.Mode.SRC_ATOP : i == 10 ? PorterDuff.Mode.DST_ATOP : i == 11 ? PorterDuff.Mode.XOR : i == 12 ? PorterDuff.Mode.ADD : i == 14 ? PorterDuff.Mode.SCREEN : i == 15 ? PorterDuff.Mode.OVERLAY : i == 16 ? PorterDuff.Mode.DARKEN : i == 17 ? PorterDuff.Mode.LIGHTEN : i == 13 ? PorterDuff.Mode.MULTIPLY : PorterDuff.Mode.SRC_OVER;
    }

    public static final void N(long j, String str) {
        if (Build.VERSION.SDK_INT >= 29) {
            Trace.setCounter(str, j);
        }
    }

    public static int a(Context context, String str) {
        if (str != null) {
            return (Build.VERSION.SDK_INT >= 33 || !TextUtils.equals("android.permission.POST_NOTIFICATIONS", str)) ? context.checkPermission(str, Process.myPid(), Process.myUid()) : new mj8(context).a() ? 0 : -1;
        }
        z72.c("permission must be non-null");
        return 0;
    }

    public static void b(Canvas canvas) {
        canvas.disableZ();
    }

    public static void c(Canvas canvas, int i, BlendMode blendMode) {
        canvas.drawColor(i, blendMode);
    }

    public static void d(Canvas canvas, long j) {
        canvas.drawColor(j);
    }

    public static void e(Canvas canvas, long j, BlendMode blendMode) {
        canvas.drawColor(j, blendMode);
    }

    public static void f(Canvas canvas, RectF rectF, float f, float f2, RectF rectF2, float f3, float f4, Paint paint) {
        canvas.drawDoubleRoundRect(rectF, f, f2, rectF2, f3, f4, paint);
    }

    public static void g(Canvas canvas, RectF rectF, float[] fArr, RectF rectF2, float[] fArr2, Paint paint) {
        canvas.drawDoubleRoundRect(rectF, fArr, rectF2, fArr2, paint);
    }

    public static void h(Canvas canvas, RenderNode renderNode) {
        canvas.drawRenderNode(renderNode);
    }

    public static void i(Canvas canvas, MeasuredText measuredText, int i, int i2, int i3, int i4, float f, float f2, boolean z, Paint paint) {
        canvas.drawTextRun(measuredText, i, i2, i3, i4, f, f2, z, paint);
    }

    public static void j(Canvas canvas) {
        canvas.enableZ();
    }

    public static void k(Canvas canvas, boolean z) {
        if (z) {
            canvas.enableZ();
        } else {
            canvas.disableZ();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0046, code lost:
    
        if (r5.c == r8.hashCode()) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.content.res.ColorStateList l(android.content.Context r8, int r9) {
        /*
            android.content.res.Resources r0 = r8.getResources()
            android.content.res.Resources$Theme r8 = r8.getTheme()
            vcb r1 = new vcb
            r1.<init>(r0, r8)
            java.lang.Object r2 = defpackage.wcb.c
            monitor-enter(r2)
            java.util.WeakHashMap r3 = defpackage.wcb.b     // Catch: java.lang.Throwable -> L3c
            java.lang.Object r3 = r3.get(r1)     // Catch: java.lang.Throwable -> L3c
            android.util.SparseArray r3 = (android.util.SparseArray) r3     // Catch: java.lang.Throwable -> L3c
            r4 = 0
            if (r3 == 0) goto L4f
            int r5 = r3.size()     // Catch: java.lang.Throwable -> L3c
            if (r5 <= 0) goto L4f
            java.lang.Object r5 = r3.get(r9)     // Catch: java.lang.Throwable -> L3c
            ucb r5 = (defpackage.ucb) r5     // Catch: java.lang.Throwable -> L3c
            if (r5 == 0) goto L4f
            android.content.res.Configuration r6 = r5.b     // Catch: java.lang.Throwable -> L3c
            android.content.res.Configuration r7 = r0.getConfiguration()     // Catch: java.lang.Throwable -> L3c
            boolean r6 = r6.equals(r7)     // Catch: java.lang.Throwable -> L3c
            if (r6 == 0) goto L4c
            if (r8 != 0) goto L3e
            int r6 = r5.c     // Catch: java.lang.Throwable -> L3c
            if (r6 == 0) goto L48
            goto L3e
        L3c:
            r8 = move-exception
            goto L91
        L3e:
            if (r8 == 0) goto L4c
            int r6 = r5.c     // Catch: java.lang.Throwable -> L3c
            int r7 = r8.hashCode()     // Catch: java.lang.Throwable -> L3c
            if (r6 != r7) goto L4c
        L48:
            android.content.res.ColorStateList r3 = r5.a     // Catch: java.lang.Throwable -> L3c
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L3c
            goto L51
        L4c:
            r3.remove(r9)     // Catch: java.lang.Throwable -> L3c
        L4f:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L3c
            r3 = r4
        L51:
            if (r3 == 0) goto L54
            return r3
        L54:
            java.lang.ThreadLocal r2 = defpackage.wcb.a
            java.lang.Object r3 = r2.get()
            android.util.TypedValue r3 = (android.util.TypedValue) r3
            if (r3 != 0) goto L66
            android.util.TypedValue r3 = new android.util.TypedValue
            r3.<init>()
            r2.set(r3)
        L66:
            r2 = 1
            r0.getValue(r9, r3, r2)
            int r2 = r3.type
            r3 = 28
            if (r2 < r3) goto L75
            r3 = 31
            if (r2 > r3) goto L75
            goto L86
        L75:
            android.content.res.XmlResourceParser r2 = r0.getXml(r9)
            android.content.res.ColorStateList r4 = defpackage.ov1.a(r0, r2, r8)     // Catch: java.lang.Exception -> L7e
            goto L86
        L7e:
            r2 = move-exception
            java.lang.String r3 = "ResourcesCompat"
            java.lang.String r5 = "Failed to inflate ColorStateList, leaving it to the framework"
            android.util.Log.w(r3, r5, r2)
        L86:
            if (r4 == 0) goto L8c
            defpackage.wcb.a(r1, r9, r4, r8)
            goto L90
        L8c:
            android.content.res.ColorStateList r4 = r0.getColorStateList(r9, r8)
        L90:
            return r4
        L91:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L3c
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nm.l(android.content.Context, int):android.content.res.ColorStateList");
    }

    public static ColorStateList m(Drawable drawable) {
        if (drawable instanceof ColorDrawable) {
            return ColorStateList.valueOf(((ColorDrawable) drawable).getColor());
        }
        if (Build.VERSION.SDK_INT < 29 || !(drawable instanceof ColorStateListDrawable)) {
            return null;
        }
        return ((ColorStateListDrawable) drawable).getColorStateList();
    }

    public static ContentCaptureSession n(View view) {
        return view.getContentCaptureSession();
    }

    public static String o(Context context) {
        return context.getOpPackageName();
    }

    public static int p(AccessibilityManager accessibilityManager, int i, int i2) {
        return accessibilityManager.getRecommendedTimeoutMillis(i, i2);
    }

    public static final void q(Paint paint, CharSequence charSequence, int i, int i2, Rect rect) {
        paint.getTextBounds(charSequence, i, i2, rect);
    }

    public static final long r(mn mnVar) {
        return mnVar.getUniqueDrawingId();
    }

    public static void s(Context context) {
        Context applicationContext;
        PackageManager packageManager;
        ApplicationInfo applicationInfo;
        Bundle bundle;
        if (mo7.O(context).getBoolean("proxy_notification_initialized", false)) {
            return;
        }
        try {
            applicationContext = context.getApplicationContext();
            packageManager = applicationContext.getPackageManager();
        } catch (PackageManager.NameNotFoundException unused) {
        }
        boolean z = (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(applicationContext.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null || !bundle.containsKey("firebase_messaging_notification_delegation_enabled")) ? true : applicationInfo.metaData.getBoolean("firebase_messaging_notification_delegation_enabled");
        if (Build.VERSION.SDK_INT < 29) {
            vp7.x(null);
            return;
        }
        jrg jrgVar = new jrg();
        try {
            if (Binder.getCallingUid() == context.getApplicationInfo().uid) {
                SharedPreferences.Editor editorEdit = mo7.O(context).edit();
                editorEdit.putBoolean("proxy_notification_initialized", true);
                editorEdit.apply();
                NotificationManager notificationManager = (NotificationManager) context.getSystemService(NotificationManager.class);
                if (z) {
                    notificationManager.setNotificationDelegate("com.google.android.gms");
                } else if ("com.google.android.gms".equals(notificationManager.getNotificationDelegate())) {
                    notificationManager.setNotificationDelegate(null);
                }
            } else {
                Log.e("FirebaseMessaging", "error configuring notification delegate for package " + context.getPackageName());
            }
            jrgVar.n(null);
        } catch (Throwable th) {
            jrgVar.n(null);
            throw th;
        }
    }

    public static boolean t() {
        return Trace.isEnabled();
    }

    public static boolean u(Context context) {
        if (Build.VERSION.SDK_INT >= 29) {
            if (Binder.getCallingUid() != context.getApplicationInfo().uid) {
                Log.e("FirebaseMessaging", "error retrieving notification delegate for package " + context.getPackageName());
                return false;
            }
            if ("com.google.android.gms".equals(((NotificationManager) context.getSystemService(NotificationManager.class)).getNotificationDelegate())) {
                if (!Log.isLoggable("FirebaseMessaging", 3)) {
                    return true;
                }
                Log.d("FirebaseMessaging", "GMS core is set for proxying");
                return true;
            }
        } else if (Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "Platform doesn't support proxying.");
        }
        return false;
    }

    public static String v(Context context) {
        String str = context.getApplicationContext().getPackageName() + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION";
        if (tp7.p(context, str) == 0) {
            return str;
        }
        if (Build.VERSION.SDK_INT >= 29) {
            str = context.getOpPackageName() + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION";
            if (tp7.p(context, str) == 0) {
                return str;
            }
        }
        ygf.i(ev6.x("Permission ", str, " is required by your application to receive broadcasts, please add it to your manifest"));
        return null;
    }

    public static Object w(ds0 ds0Var) {
        switch (es0.a[ds0Var.ordinal()]) {
            case 1:
                return BlendMode.CLEAR;
            case 2:
                return BlendMode.SRC;
            case 3:
                return BlendMode.DST;
            case 4:
                return BlendMode.SRC_OVER;
            case 5:
                return BlendMode.DST_OVER;
            case 6:
                return BlendMode.SRC_IN;
            case 7:
                return BlendMode.DST_IN;
            case 8:
                return BlendMode.SRC_OUT;
            case 9:
                return BlendMode.DST_OUT;
            case 10:
                return BlendMode.SRC_ATOP;
            case 11:
                return BlendMode.DST_ATOP;
            case 12:
                return BlendMode.XOR;
            case 13:
                return BlendMode.PLUS;
            case 14:
                return BlendMode.MODULATE;
            case 15:
                return BlendMode.SCREEN;
            case 16:
                return BlendMode.OVERLAY;
            case 17:
                return BlendMode.DARKEN;
            case 18:
                return BlendMode.LIGHTEN;
            case 19:
                return BlendMode.COLOR_DODGE;
            case 20:
                return BlendMode.COLOR_BURN;
            case 21:
                return BlendMode.HARD_LIGHT;
            case 22:
                return BlendMode.SOFT_LIGHT;
            case 23:
                return BlendMode.DIFFERENCE;
            case 24:
                return BlendMode.EXCLUSION;
            case 25:
                return BlendMode.MULTIPLY;
            case 26:
                return BlendMode.HUE;
            case 27:
                return BlendMode.SATURATION;
            case 28:
                return BlendMode.COLOR;
            case 29:
                return BlendMode.LUMINOSITY;
            default:
                return null;
        }
    }

    public static Insets x(int i, int i2, int i3, int i4) {
        return Insets.of(i, i2, i3, i4);
    }

    public static void y(Resources.Theme theme) {
        theme.rebase();
    }

    public static final void z(Activity activity, c2a.a aVar) {
        activity.registerActivityLifecycleCallbacks(aVar);
    }
}
