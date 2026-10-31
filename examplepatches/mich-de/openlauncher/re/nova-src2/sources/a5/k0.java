package a5;

import android.app.ActivityOptions;
import android.content.Intent;
import android.credentials.Credential;
import android.credentials.GetCredentialResponse;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import androidx.credentials.exceptions.GetCredentialException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class k0 {
    public static GetCredentialException a(Intent intent) {
        Intrinsics.g(intent, "intent");
        android.credentials.GetCredentialException getCredentialException = (android.credentials.GetCredentialException) intent.getSerializableExtra("android.service.credentials.extra.GET_CREDENTIAL_EXCEPTION", android.credentials.GetCredentialException.class);
        if (getCredentialException == null) {
            return null;
        }
        String type = getCredentialException.getType();
        Intrinsics.f(type, "getType(...)");
        return p10.c0.f0(type, getCredentialException.getMessage());
    }

    public static f5.m b(Intent intent) {
        Intrinsics.g(intent, "intent");
        GetCredentialResponse getCredentialResponse = (GetCredentialResponse) intent.getParcelableExtra("android.service.credentials.extra.GET_CREDENTIAL_RESPONSE", GetCredentialResponse.class);
        if (getCredentialResponse == null) {
            return null;
        }
        Credential credential = getCredentialResponse.getCredential();
        Intrinsics.f(credential, "getCredential(...)");
        String type = credential.getType();
        Intrinsics.f(type, "getType(...)");
        Bundle data = credential.getData();
        Intrinsics.f(data, "getData(...)");
        return new f5.m(jk.b.w(type, data));
    }

    public static AccessibilityNodeInfo.AccessibilityAction c() {
        return AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_IN_DIRECTION;
    }

    public static float d(VelocityTracker velocityTracker, int i5) {
        return velocityTracker.getAxisVelocity(i5);
    }

    public static void e(AccessibilityNodeInfo accessibilityNodeInfo, Rect rect) {
        accessibilityNodeInfo.getBoundsInWindow(rect);
    }

    public static CharSequence f(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getContainerTitle();
    }

    public static int g(ViewConfiguration viewConfiguration, int i5, int i11, int i12) {
        return viewConfiguration.getScaledMaximumFlingVelocity(i5, i11, i12);
    }

    public static int h(ViewConfiguration viewConfiguration, int i5, int i11, int i12) {
        return viewConfiguration.getScaledMinimumFlingVelocity(i5, i11, i12);
    }

    public static boolean i(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.isAccessibilityDataSensitive();
    }

    public static boolean j(AccessibilityManager accessibilityManager) {
        return accessibilityManager.isRequestFromAccessibilityTool();
    }

    public static void k(AccessibilityEvent accessibilityEvent, boolean z11) {
        accessibilityEvent.setAccessibilityDataSensitive(z11);
    }

    public static void l(AccessibilityNodeInfo accessibilityNodeInfo, boolean z11) {
        accessibilityNodeInfo.setAccessibilityDataSensitive(z11);
    }

    public static void m(TextView textView, int i5, float f11) {
        textView.setLineHeight(i5, f11);
    }

    public static void n(ActivityOptions activityOptions) {
        activityOptions.setShareIdentityEnabled(false);
    }
}
