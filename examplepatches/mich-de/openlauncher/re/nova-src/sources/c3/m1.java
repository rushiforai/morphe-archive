package c3;

import android.graphics.Insets;
import android.view.ViewStructure;
import android.view.accessibility.AccessibilityManager;
import android.view.autofill.AutofillId;
import android.view.contentcapture.ContentCaptureSession;

/* loaded from: classes2.dex */
public abstract class m1 {
    public static int a(AccessibilityManager accessibilityManager, int i5, int i11) {
        return accessibilityManager.getRecommendedTimeoutMillis(i5, i11);
    }

    public static AutofillId b(ContentCaptureSession contentCaptureSession, AutofillId autofillId, long j11) {
        return contentCaptureSession.newAutofillId(autofillId, j11);
    }

    public static ViewStructure c(ContentCaptureSession contentCaptureSession, AutofillId autofillId, long j11) {
        return contentCaptureSession.newVirtualViewStructure(autofillId, j11);
    }

    public static void d(ContentCaptureSession contentCaptureSession, ViewStructure viewStructure) {
        contentCaptureSession.notifyViewAppeared(viewStructure);
    }

    public static void e(ContentCaptureSession contentCaptureSession, AutofillId autofillId) {
        contentCaptureSession.notifyViewDisappeared(autofillId);
    }

    public static void f(ContentCaptureSession contentCaptureSession, AutofillId autofillId, String str) {
        contentCaptureSession.notifyViewTextChanged(autofillId, str);
    }

    public static void g(ContentCaptureSession contentCaptureSession, AutofillId autofillId, long[] jArr) {
        contentCaptureSession.notifyViewsDisappeared(autofillId, jArr);
    }

    public static Insets h(int i5, int i11, int i12, int i13) {
        return Insets.of(i5, i11, i12, i13);
    }
}
