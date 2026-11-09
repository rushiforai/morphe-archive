package app.voidhack.extension.applemusic;

import android.graphics.Canvas;
import android.graphics.RectF;
import android.graphics.RenderNode;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;

public final class LiquidGlass {
    static final String TAG = "AppleMusicLiquidGlass";
    static final int ACTIVE_DARK = 0xffff375f;
    static final int ACTIVE_LIGHT = 0xffd70035;

    private LiquidGlass() {}

    @SuppressWarnings("unused")
    public static void install(View root) {
        root.post(() -> installWhenReady(root));
    }

    private static void installWhenReady(View root) {
        View navigation = find(root, "bottom_nav_view");
        View originalBlur = find(root, "bottom_nav_blur");
        View target = find(root, "blur_target");
        if (!(navigation instanceof ViewGroup) || originalBlur == null || target == null
                || navigation.getBackground() instanceof GlassDrawable) return;
        Backdrop backdrop = backdrop(target, navigation);
        GlassController controller = new GlassController((ViewGroup) navigation, backdrop);
        navigation.setBackground(controller.material);
        if (backdrop != null) originalBlur.setVisibility(View.INVISIBLE);
        navigation.addOnAttachStateChangeListener(controller);
        if (navigation.isAttachedToWindow()) controller.attach();
        GlassMiniPlayer miniPlayer = new GlassMiniPlayer(root, target);
        root.addOnAttachStateChangeListener(miniPlayer);
        if (root.isAttachedToWindow()) miniPlayer.attach();
        Log.i(TAG, backdrop == null ? "Installed glass material with native blur" : "Installed live AGSL glass");
    }

    static Backdrop backdrop(View target, View surface) {
        if (Build.VERSION.SDK_INT >= 33) {
            try {
                RenderNode source = null;
                for (Field field : target.getClass().getDeclaredFields()) {
                    if (field.getType() == RenderNode.class) {
                        source = (RenderNode) field.get(target);
                        break;
                    }
                }
                if (source == null) throw new IllegalStateException("BlurTarget has no RenderNode");
                return new GlassBackdrop(source, target, surface);
            } catch (ReflectiveOperationException | RuntimeException exception) {
                Log.w(TAG, "Using Apple Music blur: refractive backdrop unavailable", exception);
            }
        }
        return null;
    }

    static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    interface Backdrop {
        void draw(Canvas canvas, RectF bounds, boolean dark, float parallax);
        void drawLens(Canvas canvas, RectF bounds, boolean dark, float press, ViewGroup menu);
        void release();
    }
}
