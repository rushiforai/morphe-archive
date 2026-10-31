package fk;

import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.EditText;

/* loaded from: classes3.dex */
public final class u extends n {

    /* renamed from: e, reason: collision with root package name */
    public final int f55267e;

    /* renamed from: f, reason: collision with root package name */
    public EditText f55268f;

    /* renamed from: g, reason: collision with root package name */
    public final t f55269g;

    public u(m mVar, int i5) {
        super(mVar);
        this.f55267e = 2131231253;
        this.f55269g = new t(this, 0);
        if (i5 != 0) {
            this.f55267e = i5;
        }
    }

    @Override // fk.n
    public final void b() {
        p();
    }

    @Override // fk.n
    public final int c() {
        return 2132019043;
    }

    @Override // fk.n
    public final int d() {
        return this.f55267e;
    }

    @Override // fk.n
    public final View.OnClickListener f() {
        return this.f55269g;
    }

    @Override // fk.n
    public final boolean j() {
        return true;
    }

    @Override // fk.n
    public final boolean k() {
        EditText editText = this.f55268f;
        return !(editText != null && (editText.getTransformationMethod() instanceof PasswordTransformationMethod));
    }

    @Override // fk.n
    public final void l(EditText editText) {
        this.f55268f = editText;
        p();
    }

    @Override // fk.n
    public final void q() {
        EditText editText = this.f55268f;
        if (editText != null) {
            if (editText.getInputType() == 16 || editText.getInputType() == 128 || editText.getInputType() == 144 || editText.getInputType() == 224) {
                this.f55268f.setTransformationMethod(PasswordTransformationMethod.getInstance());
            }
        }
    }

    @Override // fk.n
    public final void r() {
        EditText editText = this.f55268f;
        if (editText != null) {
            editText.setTransformationMethod(PasswordTransformationMethod.getInstance());
        }
    }
}
