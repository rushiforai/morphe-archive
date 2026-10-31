package b6;

import android.text.InputFilter;
import android.text.Spanned;
import android.widget.TextView;

/* loaded from: classes2.dex */
public final class d implements InputFilter {

    /* renamed from: a, reason: collision with root package name */
    public final TextView f17566a;

    public d(TextView textView) {
        this.f17566a = textView;
    }

    @Override // android.text.InputFilter
    public final CharSequence filter(CharSequence charSequence, int i5, int i11, Spanned spanned, int i12, int i13) {
        if (this.f17566a.isInEditMode()) {
            return charSequence;
        }
        a6.a.a();
        throw null;
    }
}
