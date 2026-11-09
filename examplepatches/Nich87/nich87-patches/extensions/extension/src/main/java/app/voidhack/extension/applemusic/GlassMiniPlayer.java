package app.voidhack.extension.applemusic;

import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

final class GlassMiniPlayer implements View.OnAttachStateChangeListener,
        ViewTreeObserver.OnPreDrawListener {
    private final View root;
    private final View target;
    private final View blur;
    private final int contentId;
    private final int[] location = new int[2];
    private int screenX = Integer.MIN_VALUE;
    private int screenY = Integer.MIN_VALUE;
    private ViewTreeObserver observer;
    private View content;
    private TextView title;
    private GlassDrawable material;
    private GlassSurfaceMotion motion;
    private GlassMiniTouch touch;
    private View play;
    private View next;

    GlassMiniPlayer(View root, View target) {
        this.root = root;
        this.target = target;
        blur = LiquidGlass.find(root, "mini_player_blur");
        contentId = root.getResources().getIdentifier("mini_player_content", "id", root.getContext().getPackageName());
    }

    void attach() {
        if (observer != null) return;
        observer = root.getViewTreeObserver();
        observer.addOnPreDrawListener(this);
        onPreDraw();
    }

    @Override public void onViewAttachedToWindow(View view) { attach(); }

    @Override public void onViewDetachedFromWindow(View view) {
        if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
        observer = null;
        release();
    }

    @Override public boolean onPreDraw() {
        View current = contentId == 0 ? null : root.findViewById(contentId);
        if (current != content) {
            release();
            content = current;
            if (content != null) {
                for (ViewParent parent = content.getParent(); parent instanceof ViewGroup && parent != root; parent = parent.getParent()) {
                    ((ViewGroup) parent).setClipChildren(false);
                    ((ViewGroup) parent).setClipToPadding(false);
                }
                material = new GlassDrawable(content, LiquidGlass.backdrop(target, content));
                content.setBackground(material);
                motion = new GlassSurfaceMotion(content, material);
                touch = new GlassMiniTouch(content, motion);
                content.setOnTouchListener(touch);
                play = LiquidGlass.find(content, "mini_player_play_btn");
                next = LiquidGlass.find(content, "mini_player_next_btn");
                if (play != null) play.setOnTouchListener(touch);
                if (next != null) next.setOnTouchListener(touch);
                View label = LiquidGlass.find(content, "mini_player_title");
                title = label instanceof TextView ? (TextView) label : null;
            }
        }
        if (material != null) {
            content.getLocationOnScreen(location);
            if (screenX != location[0] || screenY != location[1]) {
                screenX = location[0];
                screenY = location[1];
                material.invalidateSelf();
            }
            motion.hover(content.isShown() && (content.isHovered() || (play != null && play.isHovered()) || (next != null && next.isHovered())));
            if (!content.isShown()) touch.cancel();
            if (title != null) {
                boolean dark = Color.luminance(title.getCurrentTextColor()) > 0.5f;
                if (material.dark != dark) {
                    material.dark = dark;
                    material.invalidateSelf();
                }
            }
            if (material.backdrop != null && blur != null) blur.setAlpha(0f);
        }
        return true;
    }

    private void release() {
        if (touch != null) touch.cancel();
        if (motion != null) motion.stop();
        if (material != null && material.backdrop != null) material.backdrop.release();
        content = null;
        title = null;
        material = null;
        motion = null;
        touch = null;
        play = next = null;
        screenX = screenY = Integer.MIN_VALUE;
    }
}
