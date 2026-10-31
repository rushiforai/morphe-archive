package a5;

import android.view.View;

/* loaded from: classes2.dex */
public abstract class x0 {
    public static CharSequence a(View view) {
        return view.getStateDescription();
    }

    public static void b(View view, CharSequence charSequence) {
        view.setStateDescription(charSequence);
    }
}
