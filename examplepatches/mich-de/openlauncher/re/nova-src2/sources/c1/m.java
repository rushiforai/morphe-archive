package c1;

import android.os.Build;
import android.view.View;
import android.view.autofill.AutofillId;
import android.view.contentcapture.ContentCaptureSession;
import android.view.inputmethod.InputMethodManager;
import c3.m1;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Object f19098a;

    /* renamed from: b, reason: collision with root package name */
    public final View f19099b;

    public m(View view) {
        this.f19099b = view;
        this.f19098a = LazyKt.b(LazyThreadSafetyMode.f71681c, new as.c(this, 11));
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    public InputMethodManager a() {
        return (InputMethodManager) this.f19098a.getValue();
    }

    public AutofillId b(long j11) {
        if (Build.VERSION.SDK_INT >= 29) {
            return m1.b(ez.a.j(this.f19098a), this.f19099b.getAutofillId(), j11);
        }
        return null;
    }

    public m(ContentCaptureSession contentCaptureSession, View view) {
        this.f19098a = contentCaptureSession;
        this.f19099b = view;
    }
}
