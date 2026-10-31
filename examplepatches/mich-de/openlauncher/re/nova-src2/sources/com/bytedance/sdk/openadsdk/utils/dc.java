package com.bytedance.sdk.openadsdk.utils;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Picture;
import android.graphics.Point;
import android.os.Build;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.webkit.WebView;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dc {

    /* renamed from: dj, reason: collision with root package name */
    private static float f27117dj = -1.0f;

    /* renamed from: ea, reason: collision with root package name */
    private static ViewConfiguration f27119ea = null;

    /* renamed from: lt, reason: collision with root package name */
    private static int f27122lt = -1;
    private static int lud = -1;
    private static int sya = -1;

    /* renamed from: ul, reason: collision with root package name */
    private static int f27125ul = -1;
    private static Boolean xkz = null;
    private static float ycx = -1.0f;

    /* renamed from: zb, reason: collision with root package name */
    private static int f27126zb = -1;
    private static final Point fby = new Point();

    /* renamed from: jw, reason: collision with root package name */
    private static int f27121jw = -1;

    /* renamed from: jc, reason: collision with root package name */
    private static int f27120jc = -1;

    /* renamed from: ok, reason: collision with root package name */
    private static int f27123ok = -1;

    /* renamed from: ry, reason: collision with root package name */
    private static float f27124ry = -1.0f;
    private static final Object syc = new Object();

    /* renamed from: dy, reason: collision with root package name */
    private static boolean f27118dy = true;

    public static int dj(Context context) {
        ycx(context);
        return lud;
    }

    public static boolean dy(Context context) throws ClassNotFoundException {
        try {
            Class<?> clsLoadClass = context.getClassLoader().loadClass("android.util.FtFeature");
            return ((Boolean) clsLoadClass.getMethod("isFeatureSupport", Integer.TYPE).invoke(clsLoadClass, 32)).booleanValue();
        } catch (ClassNotFoundException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+hXuFUmh4=", 839);
            return false;
        } catch (NoSuchMethodException e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+hXuFUmh4=", 840);
            return false;
        } catch (Exception e12) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+hXuFUmh4=", 841);
            return false;
        }
    }

    public static int ea(Context context) {
        ycx(context);
        return f27126zb;
    }

    public static int fby(Context context) {
        ycx(context);
        return sya(context, f27122lt);
    }

    private static void htf(Context context) {
        if (f27121jw <= 0 || f27120jc <= 0) {
            if (context == null) {
                try {
                    context = com.bytedance.sdk.openadsdk.core.pmi.ycx();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "UuAkgTG5aMuzQ81Y", 199);
                    return;
                }
            }
            Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
            Point point = new Point();
            defaultDisplay.getRealSize(point);
            f27121jw = point.x;
            f27120jc = point.y;
        }
    }

    public static float jc(Context context) {
        ycx(context);
        return f27117dj;
    }

    public static float jw(Context context) {
        ycx(context, true);
        return ycx;
    }

    public static int lt(Context context) {
        ycx(context);
        return f27122lt;
    }

    public static int lud(Context context) {
        ycx(context);
        return sya(context, lud);
    }

    public static int ok(Context context) {
        ycx(context);
        return sya;
    }

    public static boolean pmi(Context context) {
        try {
            Resources resources = context.getResources();
            int identifier = resources.getIdentifier("config_mainBuiltInDisplayCutout", "string", "android");
            String string = identifier > 0 ? resources.getString(identifier) : null;
            if (string != null) {
                if (!TextUtils.isEmpty(string)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+sQqvecuBU/RImB61PHr6HpQOr3zJhw==", 866);
            return false;
        }
    }

    public static int ry(Context context) {
        return zb(context).y;
    }

    private static boolean sya() {
        return ycx < 0.0f || f27126zb < 0 || f27117dj < 0.0f || lud < 0 || f27122lt < 0;
    }

    public static boolean syc(Context context) throws ClassNotFoundException {
        try {
            Class<?> clsLoadClass = context.getClassLoader().loadClass("com.huawei.android.util.HwNotchSizeUtil");
            return ((Boolean) clsLoadClass.getMethod("hasNotchInScreen", null).invoke(clsLoadClass, null)).booleanValue();
        } catch (ClassNotFoundException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+hXv9IjQalIQ==", 817);
            return false;
        } catch (NoSuchMethodException e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+hXv9IjQalIQ==", 818);
            return false;
        } catch (Exception e12) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+hXv9IjQalIQ==", 819);
            return false;
        }
    }

    public static boolean uh(Context context) {
        return context.getPackageManager().hasSystemFeature("com.oppo.feature.screen.heteromorphism");
    }

    public static int ul(Context context) {
        if (context == null) {
            com.bytedance.sdk.openadsdk.core.pmi.ycx();
        }
        if (context == null) {
            return f27125ul;
        }
        if (context.getResources() != null && context.getResources().getConfiguration() != null) {
            f27125ul = context.getResources().getConfiguration().smallestScreenWidthDp;
        }
        return f27125ul;
    }

    public static boolean wie(Context context) {
        String str = Build.MODEL;
        return str.equals("IN2010") || str.equals("IN2020") || str.equals("KB2000") || str.startsWith("ONEPLUS");
    }

    public static int xkz(Context context) {
        return zb(context).x;
    }

    private static boolean ycx(int i5) {
        return i5 == 0 || i5 == 8 || i5 == 4;
    }

    public static int sya(Context context, float f11) {
        ycx(context, true);
        float fJw = jw(context);
        if (fJw <= 0.0f) {
            fJw = 1.0f;
        }
        return (int) ((f11 / fJw) + 0.5f);
    }

    public static void ycx(Context context) {
        ycx(context, false);
    }

    public static int zb(Context context, float f11) {
        if (f11 == 0.0f) {
            return 0;
        }
        return Float.valueOf(ycx(context, f11, true)).intValue();
    }

    public static boolean dj(View view) {
        return view != null && view.getVisibility() == 0;
    }

    public static void lt(View view) {
        if (view == null) {
            return;
        }
        ycx(view, 0);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, "alpha", 0.0f, 1.0f);
        objectAnimatorOfFloat.addListener(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.openadsdk.utils.dc.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                onAnimationEnd(animator);
            }
        });
        objectAnimatorOfFloat.setDuration(300L);
        objectAnimatorOfFloat.start();
    }

    public static void lud(View view) {
        if (view == null) {
            return;
        }
        final WeakReference weakReference = new WeakReference(view);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, "alpha", 1.0f, 0.0f);
        objectAnimatorOfFloat.addListener(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.openadsdk.utils.dc.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                View view2 = (View) weakReference.get();
                if (view2 != null) {
                    dc.ycx(view2, 8);
                    view2.setAlpha(1.0f);
                }
            }
        });
        objectAnimatorOfFloat.setDuration(800L);
        objectAnimatorOfFloat.start();
    }

    public static void ycx(Context context, boolean z11) {
        Context contextYcx = context == null ? com.bytedance.sdk.openadsdk.core.pmi.ycx() : context;
        if (contextYcx == null) {
            return;
        }
        if (sya() || z11) {
            DisplayMetrics displayMetrics = contextYcx.getResources().getDisplayMetrics();
            ycx = displayMetrics.density;
            f27126zb = displayMetrics.densityDpi;
            f27117dj = displayMetrics.scaledDensity;
            lud = displayMetrics.widthPixels;
            f27122lt = displayMetrics.heightPixels;
            DisplayMetrics displayMetrics2 = Resources.getSystem().getDisplayMetrics();
            if (displayMetrics2 != null) {
                sya = displayMetrics2.densityDpi;
            }
        }
        if (context == null || context.getResources() == null || context.getResources().getConfiguration() == null) {
            return;
        }
        Configuration configuration = context.getResources().getConfiguration();
        if (configuration.orientation == 1) {
            int i5 = lud;
            int i11 = f27122lt;
            if (i5 > i11) {
                lud = i11;
                f27122lt = i5;
            }
        } else {
            int i12 = lud;
            int i13 = f27122lt;
            if (i12 < i13) {
                lud = i13;
                f27122lt = i12;
            }
        }
        f27125ul = configuration.smallestScreenWidthDp;
    }

    public static Point zb(Context context) {
        int i5;
        if (context == null) {
            context = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        }
        htf(context);
        int i11 = f27121jw;
        if (i11 > 0 && (i5 = f27120jc) > 0) {
            fby.set(i11, i5);
        }
        Point point = fby;
        if (point.x > 0 && point.y > 0) {
            return point;
        }
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        point.set(displayMetrics.widthPixels, displayMetrics.heightPixels);
        return point;
    }

    public static boolean dj(Activity activity) {
        if (xkz == null) {
            synchronized (syc) {
                try {
                    if (xkz == null) {
                        String strYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("cutout_devices", b.f42142b);
                        String str = Build.MODEL;
                        if (!TextUtils.isEmpty(strYcx) && !TextUtils.isEmpty(str)) {
                            try {
                                JSONArray jSONArray = new JSONArray(strYcx);
                                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                                    if (str.equals(jSONArray.getString(i5))) {
                                        xkz = Boolean.TRUE;
                                        return true;
                                    }
                                }
                            } catch (Exception e3) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+8+uwyoas+zScVYiR8=", 718);
                                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e3.getMessage());
                            }
                        }
                        xkz = Boolean.valueOf(lud(activity) || ycx("ro.miui.notch", activity) == 1 || syc(activity) || uh(activity) || dy(activity) || wie(activity) || pmi(activity));
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return xkz.booleanValue();
    }

    public static int[] sya(Context context) {
        Point pointZb = zb(context);
        return new int[]{pointZb.x, pointZb.y};
    }

    public static int[] sya(View view) {
        if (view != null) {
            return new int[]{view.getWidth(), view.getHeight()};
        }
        return null;
    }

    public static void ul(View view) {
        if (view == null) {
            return;
        }
        ViewParent parent = view.getParent();
        if (parent instanceof ViewGroup) {
            ((ViewGroup) parent).removeView(view);
        }
    }

    public static boolean lud(Activity activity) {
        DisplayCutout displayCutout;
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                WindowInsets rootWindowInsets = activity.getWindow().getDecorView().getRootWindowInsets();
                if (rootWindowInsets != null) {
                    displayCutout = rootWindowInsets.getDisplayCutout();
                    f27118dy = false;
                } else {
                    displayCutout = null;
                }
                if (displayCutout != null) {
                    return true;
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "Uv0MmweuZs6Eev9cnz+vPFjm", 758);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e3.getMessage());
            }
        }
        return false;
    }

    public static void sya(Activity activity) {
        if (activity == null) {
            return;
        }
        try {
            activity.getWindow().getDecorView().setSystemUiVisibility(1792);
            activity.getWindow().clearFlags(1792);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "SOYigjCletOFR+J0", 688);
        }
    }

    public static int[] zb(View view) {
        if (view == null) {
            return null;
        }
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        return iArr;
    }

    public static void zb(Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        try {
            activity.getWindow().getDecorView().setSystemUiVisibility(3846);
            activity.getWindow().addFlags(1792);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "U+cpkCGzfdOPR+J0oRSuPQ==", 668);
            com.bytedance.sdk.component.utils.htf.sya("UIUtils", e3.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void sya(final com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str, String str2, final Bitmap bitmap, final String str3, final long j11) {
        if (bitmap != null) {
            try {
                if (bitmap.getWidth() > 0 && bitmap.getHeight() > 0 && !bitmap.isRecycled()) {
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.utils.dc.4
                        @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                        public JSONObject sya() throws JSONException {
                            JSONObject jSONObject = new JSONObject();
                            try {
                                int iYcx = dc.ycx(bitmap);
                                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str3);
                                long j12 = j11;
                                if (j12 != -1) {
                                    jSONObject.put("page_id", j12);
                                }
                                jSONObject.put("render_type", "h5");
                                jSONObject.put("render_type_2", 0);
                                jSONObject.put("is_blank", iYcx == 100 ? 1 : 0);
                                jSONObject.put("is_playable", com.bytedance.sdk.openadsdk.core.model.av.zb(tnVar) ? 1 : 0);
                                jSONObject.put("usecache", com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(tnVar) ? 1 : 0);
                                return jSONObject;
                            } catch (JSONException e3) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweoPU", "XOs5tAeZcdOSS/NcmBA=", 1042);
                                return jSONObject;
                            }
                        }
                    });
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "WOYolgiMZcaZS9VRiSK0KU/7PqUGrmrCjl7WWok=", 1047);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", "(Developers can ignore this detection exception)checkWebViewIsTransparent->throwable ex>>>".concat(String.valueOf(th2)));
            }
        }
    }

    public static boolean zb() {
        return f27118dy && Build.VERSION.SDK_INT >= 28;
    }

    private static Bitmap zb(com.bytedance.sdk.component.jw.fby fbyVar) {
        if (fbyVar == null) {
            return null;
        }
        try {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(fbyVar.getWidth(), fbyVar.getHeight(), Bitmap.Config.RGB_565);
            fbyVar.draw(new Canvas(bitmapCreateBitmap));
            return bitmapCreateBitmap;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "WO89gRaubPSDWNJYghevOmnrLpoRuA==", 1063);
            return null;
        }
    }

    public static float ycx(Context context, float f11) {
        ycx(context);
        return jc(context) * f11;
    }

    public static float ycx(Context context, float f11, boolean z11) {
        ycx(context);
        return (jw(context) * f11) + (z11 ? 0.5f : 0.0f);
    }

    private static ArrayList<Integer> zb(Bitmap bitmap) {
        if (bitmap == null) {
            return null;
        }
        try {
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            int i5 = width * height;
            int[] iArr = new int[i5];
            bitmap.getPixels(iArr, 0, width, 0, 0, width, height);
            ArrayList<Integer> arrayList = new ArrayList<>();
            for (int i11 = 0; i11 < i5; i11++) {
                int i12 = iArr[i11];
                arrayList.add(Integer.valueOf(Color.rgb((16711680 & i12) >> 16, (65280 & i12) >> 8, i12 & 255)));
            }
            return arrayList;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5pQq/fdKST+dUlBSs", 1134);
            return null;
        }
    }

    public static boolean ycx(Activity activity) {
        if (activity != null) {
            try {
                if (activity.getResources() != null) {
                    Configuration configuration = activity.getResources().getConfiguration();
                    if (Build.VERSION.SDK_INT >= 36 && configuration != null) {
                        if (configuration.smallestScreenWidthDp >= 600) {
                            return true;
                        }
                    }
                    return false;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "SOYigA+4XNSFZtZPixSTK0nrKJshs3zJhEPZWq4euA==", 279);
            }
        }
        return false;
    }

    public static int[] ycx(View view) {
        if (view == null || view.getVisibility() != 0) {
            return null;
        }
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        return iArr;
    }

    public static void ycx(View view, int i5) {
        if (view == null || view.getVisibility() == i5 || !ycx(i5)) {
            return;
        }
        view.setVisibility(i5);
    }

    public static void zb(View view, final float f11) {
        if (view != null && f11 > 0.0f) {
            view.setOutlineProvider(new ViewOutlineProvider() { // from class: com.bytedance.sdk.openadsdk.utils.dc.5
                @Override // android.view.ViewOutlineProvider
                public void getOutline(View view2, Outline outline) {
                    if (outline == null) {
                        return;
                    }
                    outline.setRoundRect(0, 0, view2.getWidth(), view2.getHeight(), f11);
                }
            });
            view.setClipToOutline(true);
        }
    }

    public static void ycx(TextView textView, CharSequence charSequence) {
        if (textView == null || TextUtils.isEmpty(charSequence)) {
            return;
        }
        textView.setText(charSequence);
    }

    public static void ycx(View view, int i5, int i11, int i12, int i13) {
        ViewGroup.LayoutParams layoutParams;
        if (view == null || (layoutParams = view.getLayoutParams()) == null || !(layoutParams instanceof ViewGroup.MarginLayoutParams)) {
            return;
        }
        ycx(view, (ViewGroup.MarginLayoutParams) layoutParams, i5, i11, i12, i13);
    }

    private static void ycx(View view, ViewGroup.MarginLayoutParams marginLayoutParams, int i5, int i11, int i12, int i13) {
        if (view == null || marginLayoutParams == null) {
            return;
        }
        if (marginLayoutParams.leftMargin == i5 && marginLayoutParams.topMargin == i11 && marginLayoutParams.rightMargin == i12 && marginLayoutParams.bottomMargin == i13) {
            return;
        }
        if (i5 != -3) {
            marginLayoutParams.leftMargin = i5;
        }
        if (i11 != -3) {
            marginLayoutParams.topMargin = i11;
        }
        if (i12 != -3) {
            marginLayoutParams.rightMargin = i12;
        }
        if (i13 != -3) {
            marginLayoutParams.bottomMargin = i13;
        }
        view.setLayoutParams(marginLayoutParams);
    }

    private static Bitmap ycx(WebView webView) {
        Bitmap bitmapCreateBitmap = null;
        try {
            Picture pictureCapturePicture = webView.capturePicture();
            bitmapCreateBitmap = Bitmap.createBitmap(pictureCapturePicture.getWidth(), pictureCapturePicture.getHeight(), Bitmap.Config.ARGB_8888);
            pictureCapturePicture.draw(new Canvas(bitmapCreateBitmap));
            return bitmapCreateBitmap;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "WO89gRaubPCFSOFUiQY=", 563);
            com.bytedance.sdk.component.utils.htf.sya("UIUtils", th2.getMessage());
            return bitmapCreateBitmap;
        }
    }

    public static float ycx() {
        float f11 = f27124ry;
        if (f11 > 0.0f) {
            return f11;
        }
        Resources resources = com.bytedance.sdk.openadsdk.core.pmi.ycx().getResources();
        int identifier = resources.getIdentifier("status_bar_height", "dimen", "android");
        if (identifier <= 0) {
            return 0.0f;
        }
        float dimensionPixelSize = resources.getDimensionPixelSize(identifier);
        f27124ry = dimensionPixelSize;
        return dimensionPixelSize;
    }

    public static int ycx(String str, Activity activity) throws ClassNotFoundException {
        if (bhi.lt()) {
            try {
                Class<?> clsLoadClass = activity.getClassLoader().loadClass("android.os.SystemProperties");
                return ((Integer) clsLoadClass.getMethod("getInt", String.class, Integer.TYPE).invoke(clsLoadClass, new String(str), 0)).intValue();
            } catch (ClassNotFoundException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5vA2o", 790);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e3.getMessage());
            } catch (IllegalAccessException e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5vA2o", 794);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e11.getMessage());
            } catch (IllegalArgumentException e12) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5vA2o", 796);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e12.getMessage());
            } catch (NoSuchMethodException e13) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5vA2o", 792);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e13.getMessage());
            } catch (InvocationTargetException e14) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e14, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5vA2o", 798);
                com.bytedance.sdk.component.utils.htf.sya("UIUtils", e14.getMessage());
            }
        }
        return 0;
    }

    public static void ycx(View view, View.OnClickListener onClickListener, String str) {
        if (view == null) {
            com.bytedance.sdk.component.utils.htf.sya("OnclickListener ", str + " is null , can not set OnClickListener !!!");
            return;
        }
        view.setOnClickListener(onClickListener);
    }

    public static void ycx(View view, View.OnTouchListener onTouchListener, String str) {
        if (view == null) {
            com.bytedance.sdk.component.utils.htf.sya("OnTouchListener ", str + " is null , can not set OnTouchListener !!!");
            return;
        }
        view.setOnTouchListener(onTouchListener);
    }

    public static void ycx(View view, float f11) {
        if (view == null) {
            return;
        }
        view.setAlpha(f11);
    }

    public static void ycx(TextView textView, com.bytedance.sdk.openadsdk.core.widget.wie wieVar, com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        ycx(textView, wieVar, tnVar, 14);
    }

    public static void ycx(TextView textView, com.bytedance.sdk.openadsdk.core.widget.wie wieVar, com.bytedance.sdk.openadsdk.core.model.tn tnVar, int i5) {
        ycx(textView, wieVar, (tnVar == null || tnVar.znc() == null) ? -1.0d : tnVar.znc().dj(), i5);
    }

    public static void ycx(TextView textView, com.bytedance.sdk.openadsdk.core.widget.wie wieVar, double d5, int i5) {
        if (d5 == -1.0d) {
            if (textView != null) {
                textView.setVisibility(8);
            }
            wieVar.setVisibility(8);
        } else {
            if (textView != null) {
                textView.setText(String.format(Locale.getDefault(), "%.1f", Double.valueOf(d5)));
            }
            ycx(wieVar, d5, i5);
        }
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.widget.wie wieVar, double d5, int i5) {
        if (d5 < 0.0d) {
            wieVar.setVisibility(8);
        } else {
            wieVar.setVisibility(0);
            wieVar.ycx(d5, i5);
        }
    }

    public static Bitmap ycx(com.bytedance.sdk.component.jw.fby fbyVar) {
        WebView webView = fbyVar.getWebView();
        int layerType = webView.getLayerType();
        webView.setLayerType(1, null);
        Bitmap bitmapZb = zb(fbyVar);
        if (bitmapZb == null) {
            bitmapZb = ycx(webView);
        }
        webView.setLayerType(layerType, null);
        if (bitmapZb == null) {
            return null;
        }
        return com.bytedance.sdk.component.utils.dj.ycx(bitmapZb, bitmapZb.getWidth() / 6, bitmapZb.getHeight() / 6);
    }

    public static void ycx(final com.bytedance.sdk.openadsdk.core.model.tn tnVar, final String str, final String str2, final Bitmap bitmap, final String str3, final long j11) {
        yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("startCheckPlayableStatusPercentage") { // from class: com.bytedance.sdk.openadsdk.utils.dc.3
            @Override // java.lang.Runnable
            public void run() {
                dc.sya(tnVar, str, str2, bitmap, str3, j11);
            }
        }, 10);
    }

    public static int ycx(Bitmap bitmap) {
        try {
            ArrayList<Integer> arrayListZb = zb(bitmap);
            if (arrayListZb == null) {
                return -1;
            }
            HashMap map = new HashMap();
            Iterator<Integer> it = arrayListZb.iterator();
            while (it.hasNext()) {
                Integer next = it.next();
                if (map.containsKey(next)) {
                    Integer numValueOf = Integer.valueOf(((Integer) map.get(next)).intValue() + 1);
                    map.remove(next);
                    map.put(next, numValueOf);
                } else {
                    map.put(next, 1);
                }
            }
            int iIntValue = 0;
            int i5 = 0;
            for (Map.Entry entry : map.entrySet()) {
                int iIntValue2 = ((Integer) entry.getValue()).intValue();
                if (i5 < iIntValue2) {
                    iIntValue = ((Integer) entry.getKey()).intValue();
                    i5 = iIntValue2;
                }
            }
            if (iIntValue == 0) {
                return -1;
            }
            return (int) ((i5 / ((bitmap.getWidth() * bitmap.getHeight()) * 1.0f)) * 100.0f);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "bscYgQqweg==", "XOs5tgywZtWwT8VeiR+0", 1107);
            return -1;
        }
    }

    public static boolean ycx(float f11, float f12, Context context) {
        if (f11 != -1.0f && f12 != -1.0f) {
            if (f27119ea == null) {
                f27119ea = ViewConfiguration.get(context);
            }
            if (f27123ok == -1) {
                f27123ok = f27119ea.getScaledTouchSlop();
            }
            if (f11 - f12 > f27123ok) {
                return true;
            }
        }
        return false;
    }

    public static void ycx(boolean z11) {
        xkz = Boolean.valueOf(z11);
    }
}
