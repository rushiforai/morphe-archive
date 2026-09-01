package defpackage;

import android.R;
import android.app.Application;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteAction;
import android.app.job.JobParameters;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Icon;
import android.icu.text.DecimalFormatSymbols;
import android.net.Network;
import android.net.NetworkRequest;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.StrictMode;
import android.text.PrecomputedText;
import android.text.StaticLayout;
import android.util.Log;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewStructure;
import android.view.textclassifier.TextClassification;
import android.view.textclassifier.TextClassificationContext;
import android.view.textclassifier.TextClassificationManager;
import android.view.textclassifier.TextClassifier;
import android.widget.TextView;
import com.google.android.gms.internal.common.zzy;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class uy {
    public static String a;
    public static int b;
    public static Boolean c;

    public static boolean A(NetworkRequest networkRequest, int i) {
        networkRequest.getClass();
        return networkRequest.hasTransport(i);
    }

    public static void B(View view) {
        view.resetPivot();
    }

    public static int C(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetBottom();
    }

    public static int D(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetLeft();
    }

    public static int E(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetRight();
    }

    public static int F(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetTop();
    }

    public static void G(TextView textView, int i) {
        textView.setFirstBaselineToTopHeight(i);
    }

    public static void H(ViewStructure viewStructure, int i) {
        viewStructure.setMaxTextLength(i);
    }

    public static void I(View view, int i) {
        view.setOutlineAmbientShadowColor(i);
    }

    public static void J(View view, int i) {
        view.setOutlineSpotShadowColor(i);
    }

    public static void K(Notification.Action.Builder builder) {
        builder.setSemanticAction(0);
    }

    public static final void L(StaticLayout.Builder builder) {
        builder.setUseLineSpacingFromFallbacks(true);
    }

    public static boolean M(ViewConfiguration viewConfiguration) {
        return viewConfiguration.shouldShowMenuShortcutsWhenKeyboardPresent();
    }

    public static boolean N() {
        Boolean boolValueOf = c;
        if (boolValueOf == null) {
            if (Build.VERSION.SDK_INT >= 28) {
                boolValueOf = Boolean.valueOf(Process.isIsolated());
            } else {
                try {
                    Object objInvoke = Process.class.getDeclaredMethod("isIsolated", null).invoke(null, null);
                    Object[] objArr = new Object[0];
                    if (objInvoke == null) {
                        throw new zzy(dl7.A("expected a non-null reference", objArr));
                    }
                    boolValueOf = (Boolean) objInvoke;
                } catch (ReflectiveOperationException unused) {
                    boolValueOf = Boolean.FALSE;
                }
            }
            c = boolValueOf;
        }
        return boolValueOf.booleanValue();
    }

    public static void a(Menu menu, int i, Context context, TextClassification textClassification, int i2) {
        if (i2 < 0) {
            MenuItem menuItemAdd = menu.add(R.id.textAssist, R.id.textAssist, i, textClassification.getLabel());
            menuItemAdd.setShowAsAction(2);
            menuItemAdd.setIcon(textClassification.getIcon());
            menuItemAdd.setOnMenuItemClickListener(new ps(context, i, textClassification));
            return;
        }
        i = i2 != 0 ? 0 : 1;
        final RemoteAction remoteAction = textClassification.getActions().get(i2);
        MenuItem menuItemAdd2 = menu.add(R.id.textAssist, i != 0 ? 16908353 : 0, i, remoteAction.getTitle());
        menuItemAdd2.setShowAsAction(i == 0 ? 0 : 2);
        if (i != 0 || remoteAction.shouldShowIcon()) {
            menuItemAdd2.setIcon(remoteAction.getIcon().loadDrawable(context));
        }
        menuItemAdd2.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: pkd
            @Override // android.view.MenuItem.OnMenuItemClickListener
            public final boolean onMenuItemClick(MenuItem menuItem) throws PendingIntent.CanceledException {
                uy.b(remoteAction);
                return true;
            }
        });
    }

    public static final void b(RemoteAction remoteAction) throws PendingIntent.CanceledException {
        PendingIntent actionIntent = remoteAction.getActionIntent();
        if (Build.VERSION.SDK_INT >= 34) {
            m4.C(actionIntent);
        } else {
            actionIntent.send();
        }
    }

    public static final void c(ClipboardManager clipboardManager) {
        clipboardManager.clearPrimaryClip();
    }

    public static Typeface d(Typeface typeface, int i, boolean z) {
        return Typeface.create(typeface, i, z);
    }

    public static Handler e(Looper looper) {
        return Handler.createAsync(looper);
    }

    public static Handler f(Looper looper) {
        return Handler.createAsync(looper);
    }

    public static Handler g(Looper looper) {
        return Handler.createAsync(looper);
    }

    public static le8 h(int[] iArr, int[] iArr2) {
        NetworkRequest.Builder builder = new NetworkRequest.Builder();
        for (int i : iArr) {
            try {
                builder.addCapability(i);
            } catch (IllegalArgumentException e) {
                d87 d87VarH = d87.h();
                String str = le8.b;
                String str2 = le8.b;
                String strU = ev6.u("Ignoring adding capability '", i, '\'');
                if (d87VarH.b <= 5) {
                    Log.w(str2, strU, e);
                }
            }
        }
        int[] iArr3 = f49.q;
        for (int i2 = 0; i2 < 3; i2++) {
            int i3 = iArr3[i2];
            if (!k80.c0(i3, iArr)) {
                try {
                    builder.removeCapability(i3);
                } catch (IllegalArgumentException e2) {
                    d87 d87VarH2 = d87.h();
                    String str3 = le8.b;
                    String str4 = le8.b;
                    String strU2 = ev6.u("Ignoring removing default capability '", i3, '\'');
                    if (d87VarH2.b <= 5) {
                        Log.w(str4, strU2, e2);
                    }
                }
            }
        }
        for (int i4 : iArr2) {
            builder.addTransportType(i4);
        }
        NetworkRequest networkRequestBuild = builder.build();
        networkRequestBuild.getClass();
        return new le8(networkRequestBuild);
    }

    public static TextClassifier i(Context context, vwb vwbVar) {
        String str;
        TextClassificationManager textClassificationManager = (TextClassificationManager) context.getSystemService(TextClassificationManager.class);
        int i = tgd.a[vwbVar.ordinal()];
        if (i == 1) {
            str = "edittext";
        } else {
            if (i != 2) {
                ygf.a();
                return null;
            }
            str = "textview";
        }
        return textClassificationManager.createTextClassificationSession(new TextClassificationContext.Builder(context.getPackageName(), str).build());
    }

    public static List j(DisplayCutout displayCutout) {
        return displayCutout.getBoundingRects();
    }

    public static final DisplayCutout k(Display display) throws Exception {
        try {
            Constructor<?> constructor = Class.forName("android.view.DisplayInfo").getConstructor(null);
            constructor.setAccessible(true);
            Object objNewInstance = constructor.newInstance(null);
            Method declaredMethod = display.getClass().getDeclaredMethod("getDisplayInfo", objNewInstance.getClass());
            declaredMethod.setAccessible(true);
            declaredMethod.invoke(display, objNewInstance);
            Field declaredField = objNewInstance.getClass().getDeclaredField("displayCutout");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(objNewInstance);
            if (obj instanceof DisplayCutout) {
                return (DisplayCutout) obj;
            }
            return null;
        } catch (Exception e) {
            if (!(e instanceof ClassNotFoundException) && !(e instanceof NoSuchMethodException) && !(e instanceof NoSuchFieldException) && !(e instanceof IllegalAccessException) && !(e instanceof InvocationTargetException) && !(e instanceof InstantiationException)) {
                throw e;
            }
            yx0.U.getClass();
            Log.w(xx0.b, e);
            return null;
        }
    }

    public static String[] l(DecimalFormatSymbols decimalFormatSymbols) {
        return decimalFormatSymbols.getDigitStrings();
    }

    public static String m() throws Throwable {
        BufferedReader bufferedReader;
        String str = a;
        if (str != null) {
            return str;
        }
        if (Build.VERSION.SDK_INT >= 28) {
            String processName = Application.getProcessName();
            a = processName;
            return processName;
        }
        int iMyPid = b;
        if (iMyPid == 0) {
            iMyPid = Process.myPid();
            b = iMyPid;
        }
        String strTrim = null;
        strTrim = null;
        strTrim = null;
        BufferedReader bufferedReader2 = null;
        strTrim = null;
        try {
            if (iMyPid > 0) {
                try {
                    StringBuilder sb = new StringBuilder(String.valueOf(iMyPid).length() + 14);
                    sb.append("/proc/");
                    sb.append(iMyPid);
                    sb.append("/cmdline");
                    String string = sb.toString();
                    StrictMode.ThreadPolicy threadPolicyAllowThreadDiskReads = StrictMode.allowThreadDiskReads();
                    try {
                        bufferedReader = new BufferedReader(new FileReader(string));
                    } finally {
                        StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
                    }
                } catch (IOException unused) {
                    bufferedReader = null;
                } catch (Throwable th) {
                    th = th;
                }
                try {
                    String line = bufferedReader.readLine();
                    vp7.p(line);
                    strTrim = line.trim();
                    bufferedReader.close();
                } catch (IOException unused2) {
                    if (bufferedReader != null) {
                        bufferedReader.close();
                    }
                    a = strTrim;
                    return strTrim;
                } catch (Throwable th2) {
                    th = th2;
                    bufferedReader2 = bufferedReader;
                    if (bufferedReader2 != null) {
                        try {
                            bufferedReader2.close();
                        } catch (IOException unused3) {
                        }
                    }
                    throw th;
                }
            }
        } catch (IOException unused4) {
        }
        a = strTrim;
        return strTrim;
    }

    public static Network n(JobParameters jobParameters) {
        return jobParameters.getNetwork();
    }

    public static String o() {
        String processName = Application.getProcessName();
        processName.getClass();
        return processName;
    }

    public static int p(Object obj) {
        return ((Icon) obj).getResId();
    }

    public static String q(Object obj) {
        return ((Icon) obj).getResPackage();
    }

    public static int r(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetBottom();
    }

    public static int s(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetLeft();
    }

    public static int t(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetRight();
    }

    public static int u(DisplayCutout displayCutout) {
        return displayCutout.getSafeInsetTop();
    }

    public static int v(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledHoverSlop();
    }

    public static PrecomputedText.Params w(r30 r30Var) {
        return r30Var.getTextMetricsParams();
    }

    public static int x(Object obj) {
        return ((Icon) obj).getType();
    }

    public static Uri y(Object obj) {
        return ((Icon) obj).getUri();
    }

    public static boolean z(NetworkRequest networkRequest, int i) {
        networkRequest.getClass();
        return networkRequest.hasCapability(i);
    }
}
