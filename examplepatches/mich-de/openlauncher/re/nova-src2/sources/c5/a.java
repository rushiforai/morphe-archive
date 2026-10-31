package c5;

import android.view.inputmethod.EditorInfo;
import androidx.core.widget.NestedScrollView;

/* loaded from: classes2.dex */
public abstract class a {
    public static void a(NestedScrollView nestedScrollView, float f11) {
        try {
            nestedScrollView.setFrameContentVelocity(f11);
        } catch (LinkageError unused) {
        }
    }

    public static void b(EditorInfo editorInfo, boolean z11) {
        editorInfo.setStylusHandwritingEnabled(z11);
    }
}
