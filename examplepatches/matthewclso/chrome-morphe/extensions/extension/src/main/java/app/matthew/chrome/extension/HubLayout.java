package app.matthew.chrome.extension;

import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

public final class HubLayout {
    private HubLayout() {}
    public static void install(View toolbar) {
        toolbar.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View v) { arrange(v); }
            @Override public void onViewDetachedFromWindow(View v) {}
        });
        // Chrome changes toolbar height as search and pane controls appear. Reserve its actual height.
        toolbar.getViewTreeObserver().addOnGlobalLayoutListener(() -> arrange(toolbar));
        toolbar.post(() -> arrange(toolbar));
    }
    private static void arrange(View toolbar) {
        if (!PatchSettings.trueBottom() || !(toolbar.getParent() instanceof View)) return;
        View wrapper = (View) toolbar.getParent();
        if (!(wrapper.getParent() instanceof ViewGroup) || !(wrapper.getLayoutParams() instanceof FrameLayout.LayoutParams)) return;
        ViewGroup main = (ViewGroup) wrapper.getParent();
        int paneId = toolbar.getResources().getIdentifier("hub_pane_host_container", "id", toolbar.getContext().getPackageName());
        View pane = main.findViewById(paneId);
        if (pane == null || !(pane.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        FrameLayout.LayoutParams bar = (FrameLayout.LayoutParams) wrapper.getLayoutParams();
        if (bar.gravity != Gravity.BOTTOM) { bar.gravity = Gravity.BOTTOM; wrapper.setLayoutParams(bar); }
        int height = wrapper.getHeight();
        ViewGroup.MarginLayoutParams content = (ViewGroup.MarginLayoutParams) pane.getLayoutParams();
        if (height > 0 && (content.topMargin != 0 || content.bottomMargin != height)) {
            content.topMargin = 0; content.bottomMargin = height; pane.setLayoutParams(content);
        }
    }
}
