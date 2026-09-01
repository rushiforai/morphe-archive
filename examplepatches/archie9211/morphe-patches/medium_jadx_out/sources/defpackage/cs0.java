package defpackage;

import android.graphics.BlendMode;
import android.graphics.BlendModeColorFilter;
import android.graphics.RenderNode;
import android.media.session.MediaSession;
import android.view.WindowInsets;
import com.medium.android.donkey.audio.AudioService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class cs0 {
    public static /* synthetic */ BlendModeColorFilter a(int i, BlendMode blendMode) {
        return new BlendModeColorFilter(i, blendMode);
    }

    public static /* synthetic */ RenderNode b() {
        return new RenderNode("AndroidEdgeEffectOverscrollEffect");
    }

    public static /* synthetic */ MediaSession c(AudioService audioService) {
        return new MediaSession(audioService, "audioservice", null);
    }

    public static /* synthetic */ WindowInsets.Builder d() {
        return new WindowInsets.Builder();
    }

    public static /* synthetic */ WindowInsets.Builder e(WindowInsets windowInsets) {
        return new WindowInsets.Builder(windowInsets);
    }

    public static /* synthetic */ void f() {
    }

    public static /* synthetic */ void g() {
    }
}
