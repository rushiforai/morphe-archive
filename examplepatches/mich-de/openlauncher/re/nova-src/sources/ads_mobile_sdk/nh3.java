package ads_mobile_sdk;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import b.o2;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

/* loaded from: classes2.dex */
public final class nh3 implements b.j1 {

    /* renamed from: a, reason: collision with root package name */
    public long f7564a = -1;

    /* renamed from: b, reason: collision with root package name */
    public long f7565b = -1;

    /* renamed from: c, reason: collision with root package name */
    public long f7566c = -1;

    /* renamed from: d, reason: collision with root package name */
    public long f7567d = -1;

    /* renamed from: e, reason: collision with root package name */
    public long f7568e = -1;

    /* renamed from: f, reason: collision with root package name */
    public long f7569f = -1;

    /* renamed from: g, reason: collision with root package name */
    public long f7570g = -1;

    /* renamed from: h, reason: collision with root package name */
    public long f7571h = -1;

    /* renamed from: i, reason: collision with root package name */
    public final o2 f7572i;

    /* renamed from: j, reason: collision with root package name */
    public final long f7573j;

    public nh3(o2 o2Var) {
        this.f7572i = o2Var;
        o2Var.getClass();
        this.f7573j = SystemClock.uptimeMillis();
    }

    @Override // b.j1
    public final synchronized void a(HashMap map) {
        this.f7565b = this.f7564a;
        this.f7572i.getClass();
        this.f7564a = SystemClock.uptimeMillis();
        c(map);
    }

    @Override // b.j1
    public final synchronized void b(HashMap map) {
        this.f7571h = this.f7570g;
        this.f7572i.getClass();
        this.f7570g = SystemClock.uptimeMillis();
        c(map);
    }

    public final void c(HashMap map) {
        map.put("tcq", Long.valueOf(this.f7564a));
        map.put("tpq", Long.valueOf(this.f7565b));
        map.put("tcc", Long.valueOf(this.f7570g));
        map.put("tpc", Long.valueOf(this.f7571h));
        map.put("tpv", Long.valueOf(this.f7567d));
        map.put("tcv", Long.valueOf(this.f7566c));
        map.put("tchv", Long.valueOf(this.f7568e));
        map.put("tphv", Long.valueOf(this.f7569f));
        map.put("tst", Long.valueOf(this.f7573j));
    }

    public static View b(View view) {
        return view.getClass().getName().contains("DebugGestureViewWrapper") ? ((ViewGroup) view).getChildAt(0) : view;
    }

    @Override // b.j1
    public final synchronized void a(HashMap map, Context context, View view) {
        WindowManager windowManager;
        DisplayMetrics displayMetrics;
        try {
            this.f7567d = this.f7566c;
            this.f7572i.getClass();
            this.f7566c = SystemClock.uptimeMillis();
            long j11 = this.f7568e;
            if (j11 != -1) {
                this.f7569f = j11;
            }
            if ((Build.VERSION.SDK_INT < 33 || context.isUiContext()) && (windowManager = (WindowManager) context.getSystemService("window")) != null) {
                Display defaultDisplay = windowManager.getDefaultDisplay();
                DisplayMetrics displayMetrics2 = new DisplayMetrics();
                try {
                    defaultDisplay.getRealMetrics(displayMetrics2);
                } catch (NoSuchMethodError unused) {
                    defaultDisplay.getMetrics(displayMetrics2);
                }
                displayMetrics = displayMetrics2;
            } else {
                displayMetrics = null;
            }
            if (displayMetrics != null) {
                int i5 = displayMetrics.widthPixels * displayMetrics.heightPixels;
                if (view != null && view.getVisibility() == 0 && view.getAlpha() > 0.0f && (!view.isShown() || view.getGlobalVisibleRect(new Rect()))) {
                    int iMin = Math.min(view.getHeight(), displayMetrics.heightPixels) * Math.min(view.getWidth(), displayMetrics.widthPixels);
                    if (iMin * 2 >= i5 || (iMin == 0 && a(view))) {
                        this.f7568e = this.f7566c;
                    }
                }
                c(map);
            }
            this.f7568e = -1L;
            c(map);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public static boolean a(View view) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            View viewB = b(view);
            Object objInvoke = viewB.getClass().getMethod("getAdConfiguration", null).invoke(viewB, null);
            Integer num = (Integer) objInvoke.getClass().getField("adType").get(objInvoke);
            num.getClass();
            String str = (String) objInvoke.getClass().getMethod("adTypeToString", Integer.TYPE).invoke(null, num);
            if (str.contains("INTERSTITIAL") || str.contains("APP_OPEN")) {
                return true;
            }
            return str.contains("REWARDED");
        } catch (NullPointerException | ReflectiveOperationException | SecurityException unused) {
            return false;
        }
    }
}
