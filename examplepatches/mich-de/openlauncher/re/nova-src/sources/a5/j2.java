package a5;

import android.view.View;
import android.view.Window;
import android.view.WindowInsetsController;
import com.google.android.gms.internal.measurement.v6;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;

/* loaded from: classes2.dex */
public class j2 extends p10.c0 {

    /* renamed from: d, reason: collision with root package name */
    public final WindowInsetsController f312d;

    /* renamed from: e, reason: collision with root package name */
    public final v6 f313e;

    /* renamed from: f, reason: collision with root package name */
    public final Window f314f;

    public j2(Window window, v6 v6Var) {
        this.f312d = window.getInsetsController();
        this.f313e = v6Var;
        this.f314f = window;
    }

    @Override // p10.c0
    public final void J(int i5) {
        if ((i5 & 8) != 0) {
            ((e0) this.f313e.f33136b).a();
        }
        this.f312d.hide(i5 & (-9));
    }

    @Override // p10.c0
    public boolean K() {
        this.f312d.setSystemBarsAppearance(0, 0);
        return (this.f312d.getSystemBarsAppearance() & 16) != 0;
    }

    @Override // p10.c0
    public boolean L() {
        this.f312d.setSystemBarsAppearance(0, 0);
        return (this.f312d.getSystemBarsAppearance() & 8) != 0;
    }

    @Override // p10.c0
    public final void X(boolean z11) {
        Window window = this.f314f;
        if (z11) {
            if (window != null) {
                h0(16);
            }
            this.f312d.setSystemBarsAppearance(16, 16);
        } else {
            if (window != null) {
                i0(16);
            }
            this.f312d.setSystemBarsAppearance(0, 16);
        }
    }

    @Override // p10.c0
    public final void Y(boolean z11) {
        Window window = this.f314f;
        if (z11) {
            if (window != null) {
                h0(UserMetadata.MAX_INTERNAL_KEY_SIZE);
            }
            this.f312d.setSystemBarsAppearance(8, 8);
        } else {
            if (window != null) {
                i0(UserMetadata.MAX_INTERNAL_KEY_SIZE);
            }
            this.f312d.setSystemBarsAppearance(0, 8);
        }
    }

    @Override // p10.c0
    public void Z() {
        Window window = this.f314f;
        if (window == null) {
            this.f312d.setSystemBarsBehavior(2);
            return;
        }
        window.getDecorView().setTag(356039078, 2);
        i0(2048);
        h0(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
    }

    public final void h0(int i5) {
        View decorView = this.f314f.getDecorView();
        decorView.setSystemUiVisibility(i5 | decorView.getSystemUiVisibility());
    }

    public final void i0(int i5) {
        View decorView = this.f314f.getDecorView();
        decorView.setSystemUiVisibility((~i5) & decorView.getSystemUiVisibility());
    }
}
