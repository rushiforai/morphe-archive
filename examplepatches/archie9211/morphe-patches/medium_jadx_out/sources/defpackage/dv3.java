package defpackage;

import android.app.PictureInPictureUiState;
import android.os.Build;
import android.text.StaticLayout;
import android.view.inputmethod.EditorInfo;
import androidx.core.widget.NestedScrollView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class dv3 {
    public static final void a(StaticLayout.Builder builder) {
        builder.setUseBoundsForWidth(false);
    }

    public static wz7 b(PictureInPictureUiState pictureInPictureUiState) {
        int i = Build.VERSION.SDK_INT;
        int i2 = 21;
        if (i >= 35) {
            pictureInPictureUiState.isStashed();
            pictureInPictureUiState.isTransitioningToPip();
            return new wz7(i2);
        }
        if (i < 31) {
            return new wz7(i2);
        }
        pictureInPictureUiState.isStashed();
        return new wz7(i2);
    }

    public static void c(NestedScrollView nestedScrollView, float f) {
        try {
            nestedScrollView.setFrameContentVelocity(f);
        } catch (LinkageError unused) {
        }
    }

    public static void d(EditorInfo editorInfo, boolean z) {
        editorInfo.setStylusHandwritingEnabled(z);
    }
}
