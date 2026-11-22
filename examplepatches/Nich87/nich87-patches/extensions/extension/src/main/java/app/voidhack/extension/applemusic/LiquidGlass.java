package app.voidhack.extension.applemusic;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.RenderNode;
import android.os.Build;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

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

    @SuppressWarnings("unused")
    public static void onPlayerSlide(View sheet, float progress) {
        if (sheet.getId() != View.NO_ID && sheet.getTag(sheet.getId()) instanceof GlassMiniPlayer miniPlayer) {
            miniPlayer.onPlayerSlide(progress);
        }
    }

    @SuppressWarnings("unused")
    public static boolean onPlayerControlTouch(Activity activity, MotionEvent event) {
        return GlassMiniPlayer.onControlTouch(activity.getWindow(), event);
    }

    @SuppressWarnings("unused")
    public static boolean ownsPlayerControlTouch(View sheet) {
        return sheet.getId() != View.NO_ID
                && sheet.getTag(sheet.getId()) instanceof GlassMiniPlayer mini
                && mini.ownsControlTouch();
    }

    @SuppressWarnings("unused")
    public static void layoutPlayerBackground(View view, ViewGroup.LayoutParams params) {
        if (!view.isLaidOut() || view.getWidth() != params.width || view.getHeight() != params.height) {
            view.setLayoutParams(params);
        }
    }

    private static void installWhenReady(View root) {
        View navigation = find(root, "bottom_nav_view");
        View originalBlur = find(root, "bottom_nav_blur");
        View target = find(root, "blur_target");
        if (!(navigation instanceof ViewGroup) || originalBlur == null || target == null
                || navigation.getBackground() instanceof GlassDrawable) return;
        Backdrop backdrop = backdrop(target, navigation);
        GlassController controller = new GlassController((ViewGroup) navigation, backdrop);
        for (ViewParent parent = navigation.getParent();
                parent instanceof ViewGroup && parent != root;
                parent = parent.getParent()) {
            ((ViewGroup) parent).setClipChildren(false);
            ((ViewGroup) parent).setClipToPadding(false);
        }
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

    static View currentPlayerPage(View host) {
        if (host instanceof ViewGroup pages) {
            for (int i = pages.getChildCount() - 1; i >= 0; i--) {
                View page = pages.getChildAt(i);
                if (page instanceof ViewGroup && page.isShown()) return page;
            }
        }
        return null;
    }

    static View findVisible(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        if (id == 0) return null;
        View first = root.findViewById(id);
        return first == null || first.isShown() ? first : findVisible(root, id);
    }

    private static View findVisible(View root, int id) {
        if (!root.isShown()) return null;
        if (root.getId() == id) return root;
        if (root instanceof ViewGroup group) {
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View found = findVisible(group.getChildAt(i), id);
                if (found != null) return found;
            }
        }
        return null;
    }

    interface Backdrop {
        boolean draw(Canvas canvas, RectF bounds, float cornerRadius, boolean dark, float parallax,
                     float engagement, int opacity);
        void drawLens(Canvas canvas, RectF bounds, boolean dark, float press, ViewGroup menu, Paint composite);
        void release();
    }
}
