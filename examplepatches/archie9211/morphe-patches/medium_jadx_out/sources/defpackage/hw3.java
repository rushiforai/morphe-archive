package defpackage;

import android.text.Editable;
import android.text.TextWatcher;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hw3 implements TextWatcher {
    public final d55 a;
    public final m45 b;
    public nu3 c;
    public boolean d;

    public hw3(d55 d55Var, m45 m45Var) {
        this.a = d55Var;
        this.b = m45Var;
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        if (editable == null || this.d) {
            return;
        }
        this.d = true;
        try {
            nu3 nu3Var = this.c;
            if (nu3Var != null) {
                this.c = null;
                nu3Var.run();
                return;
            }
            if (((Boolean) this.b.invoke()).booleanValue()) {
                int spanStart = editable.getSpanStart("marker");
                if (spanStart >= 0) {
                    editable.removeSpan("marker");
                    char cCharAt = editable.charAt(spanStart);
                    wq8.Companion.getClass();
                    wq8 wq8Var = (wq8) wq8.b.get(Character.valueOf(cCharAt));
                    if (wq8Var != null) {
                        wq8Var.onCharacterAdded(editable, spanStart);
                    }
                }
                Iterator<E> it2 = uc.getEntries().iterator();
                while (it2.hasNext()) {
                    ((uc) it2.next()).afterTextChanged(editable);
                }
            }
        } finally {
            this.d = false;
        }
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        if (charSequence != null && ((Boolean) this.b.invoke()).booleanValue() && i2 == 0 && i3 == 1 && charSequence.length() > i) {
            this.a.k("marker", Integer.valueOf(i), Integer.valueOf(i + 1), 0);
        }
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}
