package defpackage;

import android.os.Build;
import android.view.View;
import android.view.ViewStructure;
import android.view.autofill.AutofillId;
import android.view.contentcapture.ContentCaptureSession;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a82 implements b82 {
    public final Object a;
    public final View b;

    public a82(ContentCaptureSession contentCaptureSession, View view) {
        this.a = contentCaptureSession;
        this.b = view;
    }

    public final void a() {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentCaptureSession contentCaptureSessionA = z72.a(this.a);
            sk0 sk0VarI = fo7.I(this.b);
            Objects.requireNonNull(sk0VarI);
            contentCaptureSessionA.notifyViewsDisappeared(z10.e(sk0VarI.a), new long[]{Long.MIN_VALUE});
        }
    }

    public final AutofillId b(long j) {
        if (Build.VERSION.SDK_INT < 29) {
            return null;
        }
        ContentCaptureSession contentCaptureSessionA = z72.a(this.a);
        sk0 sk0VarI = fo7.I(this.b);
        Objects.requireNonNull(sk0VarI);
        return contentCaptureSessionA.newAutofillId(z10.e(sk0VarI.a), j);
    }

    public final qlb c(AutofillId autofillId, long j) {
        if (Build.VERSION.SDK_INT >= 29) {
            return new qlb(z72.a(this.a).newVirtualViewStructure(autofillId, j));
        }
        return null;
    }

    public final void d(ViewStructure viewStructure) {
        if (Build.VERSION.SDK_INT >= 29) {
            z72.a(this.a).notifyViewAppeared(viewStructure);
        }
    }

    public final void e(AutofillId autofillId) {
        if (Build.VERSION.SDK_INT >= 29) {
            z72.a(this.a).notifyViewDisappeared(autofillId);
        }
    }

    public final void f(AutofillId autofillId, String str) {
        if (Build.VERSION.SDK_INT >= 29) {
            ((ContentCaptureSession) this.a).notifyViewTextChanged(autofillId, str);
        }
    }
}
