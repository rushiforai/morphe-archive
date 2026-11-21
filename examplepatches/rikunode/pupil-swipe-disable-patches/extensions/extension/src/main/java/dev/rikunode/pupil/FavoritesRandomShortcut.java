package dev.rikunode.pupil;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

@SuppressWarnings({"rawtypes", "unchecked"})
public final class FavoritesRandomShortcut {
    private static final String FAVORITES_VIEW_MODEL =
            "xyz.quaver.pupil.ui.viewmodel.FavoritesViewModel";
    private static Object viewModel;
    private static Function1 showDetail;
    private static WeakReference<ImageButton> rightButton = new WeakReference<>(null);
    private static WeakReference<ImageButton> leftButton = new WeakReference<>(null);
    private static boolean openingRandom;
    private static boolean onFavorites;
    private static boolean detailVisible;

    private FavoritesRandomShortcut() {}

    public static void bind(Object currentViewModel, Object onShowDetail) {
        boolean previouslyFavorites = onFavorites;
        onFavorites = currentViewModel != null
                && FAVORITES_VIEW_MODEL.equals(currentViewModel.getClass().getName())
                && onShowDetail instanceof Function1;
        viewModel = onFavorites ? currentViewModel : null;
        showDetail = onFavorites ? (Function1) onShowDetail : null;
        if (!onFavorites || !previouslyFavorites) detailVisible = false;
        refreshVisibility();
    }

    public static void hideForDetail() {
        detailVisible = true;
        refreshVisibility();
    }

    public static Function0 wrapOnDismiss(Function0 onDismiss) {
        if (onDismiss == null) return null;
        return () -> {
            Object result = onDismiss.invoke();
            detailVisible = false;
            refreshVisibility();
            return result;
        };
    }

    public static void install(Activity activity) {
        installButtons(activity, false);
    }

    public static void installWithLeftButton(Activity activity) {
        installButtons(activity, true);
    }

    private static void installButtons(Activity activity, boolean showLeft) {
        FrameLayout root = activity.findViewById(android.R.id.content);
        if (root == null) return;

        if (rightButton.get() == null || rightButton.get().getParent() != root) {
            rightButton = new WeakReference<>(createButton(activity, root, false));
        }
        if (showLeft && (leftButton.get() == null || leftButton.get().getParent() != root)) {
            leftButton = new WeakReference<>(createButton(activity, root, true));
        }
        refreshVisibility();
    }

    private static ImageButton createButton(Activity activity, FrameLayout root, boolean left) {
        int iconId = activity.getResources().getIdentifier(
                "shuffle_variant", "drawable", activity.getPackageName());
        if (iconId == 0) iconId = android.R.drawable.ic_menu_rotate;

        ImageButton button = new ImageButton(activity);
        int size = dp(activity, 54);
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.rgb(68, 68, 91));
        background.setCornerRadius(size / 2f);
        button.setBackground(background);
        button.setImageResource(iconId);
        button.setColorFilter(Color.WHITE);
        button.setScaleType(ImageButton.ScaleType.CENTER_INSIDE);
        button.setPadding(dp(activity, 14), dp(activity, 14), dp(activity, 14), dp(activity, 14));
        button.setElevation(dp(activity, 7));
        button.setContentDescription("お気に入りからランダムに作品を開く");
        button.setOnClickListener(ignored -> openRandom(button));
        button.setVisibility(View.GONE);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size);
        params.gravity = (left ? Gravity.START : Gravity.END) | Gravity.BOTTOM;
        if (left) params.leftMargin = dp(activity, 16);
        else params.rightMargin = dp(activity, 16);
        params.bottomMargin = dp(activity, 146);
        root.addView(button, params);
        button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {}

            @Override
            public void onViewDetachedFromWindow(View view) {
                if (rightButton.get() == view) rightButton.clear();
                if (leftButton.get() == view) leftButton.clear();
                if (rightButton.get() == null && leftButton.get() == null) {
                    viewModel = null;
                    showDetail = null;
                    onFavorites = false;
                    detailVisible = false;
                    openingRandom = false;
                }
            }
        });
        return button;
    }

    private static void openRandom(ImageButton button) {
        Object model = viewModel;
        Function1 detail = showDetail;
        if (!onFavorites || detailVisible || openingRandom || model == null || detail == null) return;

        openingRandom = true;
        button.setEnabled(false);
        try {
            Object galleryId = model.getClass().getMethod("randomGalleryID").invoke(model);
            if (galleryId instanceof Integer) {
                hideForDetail();
                detail.invoke(galleryId);
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            detailVisible = false;
            refreshVisibility();
            Toast.makeText(button.getContext(), "ランダム表示を開けませんでした", Toast.LENGTH_SHORT).show();
        } finally {
            openingRandom = false;
            button.setEnabled(true);
        }
    }

    private static void refreshVisibility() {
        int visibility = onFavorites && !detailVisible && viewModel != null && showDetail != null
                ? View.VISIBLE : View.GONE;
        ImageButton right = rightButton.get();
        ImageButton left = leftButton.get();
        if (right != null) right.setVisibility(visibility);
        if (left != null) left.setVisibility(visibility);
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
