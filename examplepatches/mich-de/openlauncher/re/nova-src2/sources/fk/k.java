package fk;

import android.widget.EditText;
import com.google.android.material.textfield.TextInputLayout;

/* loaded from: classes3.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f55198a;

    public k(m mVar) {
        this.f55198a = mVar;
    }

    public final void a(TextInputLayout textInputLayout) {
        m mVar = this.f55198a;
        j jVar = mVar.f55219s;
        EditText editText = mVar.f55216p;
        if (editText == textInputLayout.f34369d) {
            return;
        }
        if (editText != null) {
            editText.removeTextChangedListener(jVar);
            if (mVar.f55216p.getOnFocusChangeListener() == mVar.b().e()) {
                mVar.f55216p.setOnFocusChangeListener(null);
            }
        }
        EditText editText2 = textInputLayout.f34369d;
        mVar.f55216p = editText2;
        if (editText2 != null) {
            editText2.addTextChangedListener(jVar);
        }
        mVar.b().l(mVar.f55216p);
        mVar.i(mVar.b());
    }
}
