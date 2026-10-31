package q60;

import android.view.View;
import android.widget.TextView;

/* loaded from: classes4.dex */
public final class d extends b {

    /* renamed from: b, reason: collision with root package name */
    public final TextView f83758b;

    public d(int i5, View view) {
        TextView textView;
        super(view);
        if (i5 != 0) {
            textView = (TextView) a(i5);
        } else {
            if (!(view instanceof TextView)) {
                throw new IllegalStateException("TextView is not root of layout (specify TextView ID explicitly): " + view);
            }
            textView = (TextView) view;
        }
        this.f83758b = textView;
        int i11 = t60.b.f88760a;
        textView.setSpannableFactory(t60.a.f88759a);
    }
}
