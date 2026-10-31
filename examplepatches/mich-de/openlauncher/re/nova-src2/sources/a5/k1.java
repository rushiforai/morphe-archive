package a5;

import android.content.Context;
import android.graphics.drawable.Icon;
import android.location.LocationManager;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.ext.SdkExtensions;
import android.view.View;
import android.view.Window;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public abstract class k1 {
    public static Icon a(Uri uri) {
        return Icon.createWithAdaptiveBitmapContentUri(uri);
    }

    public static String b(Context context) {
        return context.getAttributionTag();
    }

    public static void c(LocationManager locationManager, String str, CancellationSignal cancellationSignal, Executor executor, k30.z zVar) {
        locationManager.getCurrentLocation(str, cancellationSignal, executor, new aa.w(zVar, 8));
    }

    public static void d(int i5) {
        SdkExtensions.getExtensionVersion(i5);
    }

    public static CharSequence e(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getStateDescription();
    }

    public static void f(Window window, boolean z11) {
        View decorView = window.getDecorView();
        int systemUiVisibility = decorView.getSystemUiVisibility();
        decorView.setSystemUiVisibility(z11 ? systemUiVisibility & (-257) : systemUiVisibility | 256);
        window.setDecorFitsSystemWindows(z11);
    }

    public static void g(Window window, boolean z11) {
        window.setDecorFitsSystemWindows(z11);
    }

    public static void h(EditorInfo editorInfo, CharSequence charSequence) {
        editorInfo.setInitialSurroundingSubText(charSequence, 0);
    }

    public static void i(AccessibilityNodeInfo accessibilityNodeInfo, CharSequence charSequence) {
        accessibilityNodeInfo.setStateDescription(charSequence);
    }
}
