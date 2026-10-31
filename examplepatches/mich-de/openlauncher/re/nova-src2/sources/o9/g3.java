package o9;

import android.animation.ValueAnimator;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.DeadObjectException;
import android.os.TransactionTooLargeException;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.TtsSpan;
import android.view.View;
import android.view.animation.Interpolator;
import b.i8;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import java.util.Locale;
import java.util.regex.Pattern;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public abstract class g3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f79846a = Pattern.compile("^[\\s|\\p{javaSpaceChar}]*(.*)[\\s|\\p{javaSpaceChar}]*$");

    /* renamed from: b, reason: collision with root package name */
    public static final Matrix f79847b = new Matrix();

    /* renamed from: c, reason: collision with root package name */
    public static final Matrix f79848c = new Matrix();

    /* renamed from: d, reason: collision with root package name */
    public static final String[] f79849d = new String[0];

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f79850e;

    /* renamed from: f, reason: collision with root package name */
    public static final boolean f79851f;

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f79852g;

    /* renamed from: h, reason: collision with root package name */
    public static final boolean f79853h;

    /* renamed from: i, reason: collision with root package name */
    public static final boolean f79854i;

    /* renamed from: j, reason: collision with root package name */
    public static final boolean f79855j;

    static {
        int i5 = Build.VERSION.SDK_INT;
        f79850e = i5 >= 28;
        f79851f = i5 >= 29;
        f79852g = i5 >= 30;
        f79853h = i5 >= 31;
        String str = Build.TYPE;
        Locale locale = Locale.ROOT;
        f79854i = str.toLowerCase(locale).contains("debug") || str.toLowerCase(locale).equals("eng");
        f79855j = ActivityManager.isRunningInTestHarness();
    }

    public static boolean a() {
        e10.y2.f51877a.getClass();
        e10.s2 s2Var = e10.y2.F1;
        KProperty kProperty = e10.y2.f51881b[131];
        s2Var.getClass();
        return !((Boolean) s2Var.l()).booleanValue() && ValueAnimator.areAnimatorsEnabled();
    }

    public static float b(float f11, float f12, float f13) {
        return Math.max(f12, Math.min(f11, f13));
    }

    public static int c(int i5, int i11, int i12) {
        return Math.max(i11, Math.min(i5, i12));
    }

    public static int d(float f11) {
        Paint paint = new Paint();
        paint.setTextSize(f11);
        Paint.FontMetrics fontMetrics = paint.getFontMetrics();
        return (int) Math.ceil(fontMetrics.bottom - fontMetrics.top);
    }

    public static String e(ya.p pVar) {
        Locale locale = Locale.ENGLISH;
        return b.c0.l("_id IN (", pVar.r(), ")");
    }

    public static float f(float f11, int i5) {
        return f11 / (i5 / 160.0f);
    }

    public static boolean g(n1 n1Var) {
        return n1Var.getPackageManager().resolveActivity(new Intent("android.intent.action.SET_WALLPAPER").setComponent(new ComponentName(n1Var.getString(2132020341), "com.android.customization.picker.CustomizationPickerActivity")), 0) != null;
    }

    public static Drawable h(Context context, ga.e eVar, Object obj) {
        t1 t1VarC = t1.c(context);
        int i5 = t1VarC.f80136e.f80270c;
        if (eVar.f57290b != 6) {
            return obj instanceof x9.s ? ((x9.s) obj).r() : context.getPackageManager().getUserBadgedIcon(new f3(i5), eVar.o);
        }
        boolean z11 = (eVar instanceof ga.f) && (((ga.f) eVar).f57305s & EventBridgeChannel.QUEUE_CAPACITY) > 0;
        if ((eVar.f57289a == -1 && !z11) || !(obj instanceof ShortcutInfo)) {
            return new f3(i5);
        }
        Bitmap bitmap = t1.c(t1VarC.f80132a).f80135d.q((ShortcutInfo) obj).f21151a;
        boolean z12 = aa.c.f541k;
        float f11 = i5;
        float f12 = (f11 - ((int) (0.444f * f11))) / f11;
        return new InsetDrawable(new aa.n(bitmap, 0, false), f12, f12, 0.0f, 0.0f);
    }

    public static float i(View view, View view2, float[] fArr, boolean z11, boolean z12) {
        float scaleX = 1.0f;
        View view3 = view;
        while (view3 != view2 && view3 != null) {
            if (view3 != view || z11) {
                float f11 = -view3.getScrollX();
                float f12 = -view3.getScrollY();
                for (int i5 = 0; i5 < fArr.length; i5 += 2) {
                    fArr[i5] = fArr[i5] + f11;
                    int i11 = i5 + 1;
                    fArr[i11] = fArr[i11] + f12;
                }
            }
            if (!z12) {
                view3.getMatrix().mapPoints(fArr);
            }
            float left = view3.getLeft();
            float top = view3.getTop();
            for (int i12 = 0; i12 < fArr.length; i12 += 2) {
                fArr[i12] = fArr[i12] + left;
                int i13 = i12 + 1;
                fArr[i13] = fArr[i13] + top;
            }
            scaleX *= view3.getScaleX();
            view3 = view3.getParent() instanceof View ? (View) view3.getParent() : null;
        }
        return scaleX;
    }

    public static SharedPreferences j(Context context) {
        return context.getApplicationContext().getSharedPreferences("com.android.launcher3.device.prefs", 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v15 */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v2, types: [android.graphics.drawable.Drawable] */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v9 */
    public static Drawable k(Context context, ga.e eVar, int i5, int i11, Object[] objArr) {
        x9.s sVarQ;
        NovaIconSource novaIconSource;
        n1 n1Var = (n1) za.d.p(context);
        t1 t1VarC = t1.c(context);
        ?? D = 0;
        D = 0;
        D = 0;
        D = 0;
        D = 0;
        D = 0;
        if ((eVar.f57303q.a() || lx.a.e(eVar)) && (eVar instanceof ga.f)) {
            NovaIconSource novaIconSource2 = ((ga.f) eVar).f57307u;
            if (novaIconSource2 != null) {
                D = novaIconSource2.d(context);
            }
        } else {
            ga.a aVarB = (!(eVar instanceof iz.a) || eVar.f57289a == -1) ? eVar instanceof ga.a ? (ga.a) eVar : (!(eVar instanceof ga.j) || eVar.i() == null) ? null : n1Var.V.f21025g.b(new ComponentKey(eVar.i(), eVar.o)) : n1Var.V.f21025g.b(new ComponentKey(((iz.a) eVar).i(), eVar.o));
            if (aVarB == null || (novaIconSource = aVarB.f57307u) == null) {
                int i12 = eVar.f57290b;
                if (i12 == 0) {
                    LauncherActivityInfo launcherActivityInfoResolveActivity = ((LauncherApps) context.getSystemService(LauncherApps.class)).resolveActivity(eVar.d(), eVar.o);
                    objArr[0] = launcherActivityInfoResolveActivity;
                    if (launcherActivityInfoResolveActivity != null) {
                        D = ((t1) t1.f80131h.h(context)).f80134c.c(launcherActivityInfoResolveActivity, n1Var.f79934x.f77131a.f80271d);
                    }
                } else if (i12 == 6) {
                    if (eVar instanceof ab.r) {
                        ja.f fVar = ((ab.r) eVar).f759s;
                        objArr[0] = fVar;
                        D = fVar.b(t1VarC.f80135d);
                    } else {
                        qa.b bVarC = ShortcutKey.d(eVar.d(), eVar.o).a(context).c(11);
                        if (!bVarC.isEmpty()) {
                            objArr[0] = bVarC.get(0);
                            D = i8.w(context, (ShortcutInfo) bVarC.get(0), t1VarC.f80136e.f80271d);
                        }
                    }
                } else if (i12 == 2 && ((ga.f) eVar).f57304r.e() && (sVarQ = x9.s.q(n1Var, eVar.f57289a, new Point(i5, i11))) != null) {
                    objArr[0] = sVarQ;
                    D = sVarQ;
                }
            } else {
                D = novaIconSource.d(context);
            }
        }
        return D instanceof aa.e ? ((aa.e) D).e(context) : D;
    }

    public static SharedPreferences l(Context context) {
        return context.getApplicationContext().getSharedPreferences("com.android.launcher3.prefs", 0);
    }

    public static Rect m(View view) {
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        int i5 = iArr[0];
        return new Rect(i5, iArr[1], view.getWidth() + i5, view.getHeight() + iArr[1]);
    }

    public static boolean n(Exception exc) {
        return (exc.getCause() instanceof TransactionTooLargeException) || (exc.getCause() instanceof DeadObjectException);
    }

    public static boolean o() {
        String str;
        try {
            str = (String) Class.forName("android.os.SystemProperties").getDeclaredMethod("get", String.class).invoke(null, "sys.boot_completed");
        } catch (Exception unused) {
        }
        if (TextUtils.isEmpty(str)) {
            str = "1";
        }
        return "1".equals(str);
    }

    public static boolean p(Resources resources) {
        return resources.getConfiguration().getLayoutDirection() == 1;
    }

    public static void q(View view, View view2, float[] fArr) {
        Matrix matrix = f79847b;
        matrix.reset();
        while (view != view2) {
            matrix.postTranslate(-view.getScrollX(), -view.getScrollY());
            matrix.postConcat(view.getMatrix());
            matrix.postTranslate(view.getLeft(), view.getTop());
            view = (View) view.getParent();
        }
        matrix.postTranslate(-view.getScrollX(), -view.getScrollY());
        Matrix matrix2 = f79848c;
        matrix.invert(matrix2);
        matrix2.mapPoints(fArr);
    }

    public static float r(float f11, float f12, float f13, float f14, float f15, Interpolator interpolator) {
        return (f12 == f13 || f14 == f15) ? f14 : a2.c.a(f15, f14, interpolator.getInterpolation(Math.abs(f11 - f12) / Math.abs(f13 - f12)), f14);
    }

    public static void s(float[] fArr, int[] iArr) {
        for (int i5 = 0; i5 < fArr.length; i5++) {
            iArr[i5] = Math.round(fArr[i5]);
        }
    }

    public static void t(float f11, Rect rect) {
        if (f11 != 1.0f) {
            int iCenterX = rect.centerX();
            int iCenterY = rect.centerY();
            rect.offset(-iCenterX, -iCenterY);
            if (f11 != 1.0f) {
                rect.left = (int) ((rect.left * f11) + 0.5f);
                rect.top = (int) ((rect.top * f11) + 0.5f);
                rect.right = (int) ((rect.right * f11) + 0.5f);
                rect.bottom = (int) ((rect.bottom * f11) + 0.5f);
            }
            rect.offset(iCenterX, iCenterY);
        }
    }

    public static void u(RectF rectF, float f11) {
        float fCenterX = rectF.centerX();
        float fCenterY = rectF.centerY();
        if (f11 != 1.0f) {
            rectF.offset(-fCenterX, -fCenterY);
            rectF.left *= f11;
            rectF.top *= f11;
            rectF.right *= f11;
            rectF.bottom *= f11;
            rectF.offset(fCenterX, fCenterY);
        }
    }

    public static float v(float f11, float f12, Rect rect) {
        float fMin = Math.min(Math.min(f11, f12), 1.0f);
        if (fMin < 1.0f) {
            int iWidth = (int) ((f11 - fMin) * rect.width() * 0.5f);
            rect.left += iWidth;
            rect.right -= iWidth;
            int iHeight = (int) ((f12 - fMin) * rect.height() * 0.5f);
            rect.top += iHeight;
            rect.bottom -= iHeight;
        }
        return fMin;
    }

    public static String w(CharSequence charSequence) {
        if (charSequence == null) {
            return null;
        }
        return f79846a.matcher(charSequence).replaceAll("$1");
    }

    public static SpannableString x(String str, CharSequence charSequence) {
        SpannableString spannableString = new SpannableString(charSequence);
        spannableString.setSpan(new TtsSpan.TextBuilder(str).build(), 0, spannableString.length(), 18);
        return spannableString;
    }
}
