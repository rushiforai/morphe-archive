package r;

import android.text.StaticLayout;
import android.widget.TextView;

/* loaded from: classes2.dex */
public final class t0 extends s0 {
    @Override // r.s0, r.u0
    public void a(StaticLayout.Builder builder, TextView textView) {
        builder.setTextDirection(textView.getTextDirectionHeuristic());
    }

    @Override // r.u0
    public boolean b(TextView textView) {
        return textView.isHorizontallyScrollable();
    }
}
