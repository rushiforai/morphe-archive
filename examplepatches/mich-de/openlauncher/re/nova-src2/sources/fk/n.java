package fk;

import android.content.Context;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.widget.EditText;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.textfield.TextInputLayout;

/* loaded from: classes3.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public final TextInputLayout f55220a;

    /* renamed from: b, reason: collision with root package name */
    public final m f55221b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f55222c;

    /* renamed from: d, reason: collision with root package name */
    public final CheckableImageButton f55223d;

    public n(m mVar) {
        this.f55220a = mVar.f55203a;
        this.f55221b = mVar;
        this.f55222c = mVar.getContext();
        this.f55223d = mVar.f55208f;
    }

    public void a() {
    }

    public void b() {
    }

    public int c() {
        return 0;
    }

    public int d() {
        return 0;
    }

    public View.OnFocusChangeListener e() {
        return null;
    }

    public View.OnClickListener f() {
        return null;
    }

    public View.OnFocusChangeListener g() {
        return null;
    }

    public f10.o h() {
        return null;
    }

    public boolean i(int i5) {
        return true;
    }

    public boolean j() {
        return this instanceof i;
    }

    public boolean k() {
        return false;
    }

    public void l(EditText editText) {
    }

    public void m(b5.g gVar) {
    }

    public void n(AccessibilityEvent accessibilityEvent) {
    }

    public void o(boolean z11) {
    }

    public final void p() {
        this.f55221b.f(false);
    }

    public void q() {
    }

    public void r() {
    }
}
