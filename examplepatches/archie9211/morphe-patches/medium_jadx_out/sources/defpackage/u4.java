package defpackage;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Insets;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.os.ext.SdkExtensions;
import android.view.DisplayCutout;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class u4 {
    public static Icon a(Uri uri) {
        return Icon.createWithAdaptiveBitmapContentUri(uri);
    }

    public static Rect b(WindowManager windowManager) {
        return windowManager.getCurrentWindowMetrics().getBounds();
    }

    public static void c(int i) {
        SdkExtensions.getExtensionVersion(i);
    }

    public static final String d(Context context) {
        try {
            return Build.VERSION.SDK_INT >= 30 ? context.getPackageManager().getInstallSourceInfo(context.getPackageName()).getInstallingPackageName() : context.getPackageManager().getInstallerPackageName(context.getPackageName());
        } catch (Exception e) {
            wld.a.e(e, "Failed to get installer package name", new Object[0]);
            return null;
        }
    }

    public static CharSequence e(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getStateDescription();
    }

    public static String f(j7 j7Var) {
        if (j7Var instanceof i7) {
            return "image/*";
        }
        if (j7Var instanceof h7) {
            return null;
        }
        ygf.a();
        return null;
    }

    public static Insets g(DisplayCutout displayCutout) {
        return displayCutout.getWaterfallInsets();
    }

    public static boolean h() {
        int i = Build.VERSION.SDK_INT;
        if (i >= 33) {
            return true;
        }
        return i >= 30 && SdkExtensions.getExtensionVersion(30) >= 2;
    }

    public static boolean i(Canvas canvas, float f, float f2, float f3, float f4) {
        return canvas.quickReject(f, f2, f3, f4);
    }

    public static boolean j(Canvas canvas, Path path) {
        return canvas.quickReject(path);
    }

    public static boolean k(Canvas canvas, RectF rectF) {
        return canvas.quickReject(rectF);
    }

    public static void l(Window window, boolean z) {
        View decorView = window.getDecorView();
        int systemUiVisibility = decorView.getSystemUiVisibility();
        decorView.setSystemUiVisibility(z ? systemUiVisibility & (-257) : systemUiVisibility | 256);
        window.setDecorFitsSystemWindows(z);
    }

    public static void m(Window window, boolean z) {
        window.setDecorFitsSystemWindows(z);
    }

    public static void n(View view) {
        view.setImportantForContentCapture(1);
    }

    public static void o(EditorInfo editorInfo, CharSequence charSequence) {
        editorInfo.setInitialSurroundingSubText(charSequence, 0);
    }

    public static void p(Outline outline, br brVar) {
        if (brVar instanceof br) {
            outline.setPath(brVar.a);
        } else {
            ik4.k("Unable to obtain android.graphics.Path");
        }
    }

    public static void q(AccessibilityNodeInfo accessibilityNodeInfo, CharSequence charSequence) {
        accessibilityNodeInfo.setStateDescription(charSequence);
    }
}
