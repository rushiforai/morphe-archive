package ab;

import android.util.IntProperty;
import android.view.View;

/* loaded from: classes2.dex */
public final class g0 extends IntProperty {
    @Override // android.util.Property
    public final Integer get(Object obj) {
        return Integer.valueOf(((View) obj).getPaddingBottom());
    }

    @Override // android.util.IntProperty
    public final void setValue(Object obj, int i5) {
        View view = (View) obj;
        view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), i5);
    }
}
