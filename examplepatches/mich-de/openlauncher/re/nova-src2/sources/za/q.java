package za;

import android.view.View;
import com.android.launcher3.BubbleTextView;

/* loaded from: classes.dex */
public interface q {
    /* JADX WARN: Multi-variable type inference failed */
    static void g(View view, boolean z11) {
        if (!(view instanceof q)) {
            view.setVisibility(z11 ? 0 : 4);
            return;
        }
        q qVar = (q) view;
        qVar.a(z11);
        ((BubbleTextView) qVar).N(!z11);
    }

    void a(boolean z11);
}
