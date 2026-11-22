package dev.rikunode.pupil;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

@SuppressWarnings({"rawtypes", "unchecked"})
public final class FavoritesRandomShortcut {
    private static final String FAVORITES_VIEW_MODEL =
            "xyz.quaver.pupil.ui.viewmodel.FavoritesViewModel";
    private static Object viewModel;
    private static Function1 showDetail;
    private static final String PREFS_NAME = "pupil_morphe_shortcut";
    private static final String SIDE_KEY = "random_button_side";
    private static WeakReference<ImageButton> shortcutButton = new WeakReference<>(null);
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
        FrameLayout root = activity.findViewById(android.R.id.content);
        if (root == null) return;

        boolean left = isLeft(activity);
        ImageButton button = shortcutButton.get();
        if (button == null || button.getParent() != root) {
            button = createButton(activity, root, left);
            shortcutButton = new WeakReference<>(button);
        } else {
            button.setLayoutParams(buttonParams(activity, left));
        }
        refreshVisibility();
    }

    // Called inside the original settings ColumnScope composition, immediately after
    // the existing Favorites-management Preference. Reuse Pupil's own Preference UI.
    public static void renderPositionPreference(Context context, Object composer) {
        String current = isLeft(context) ? "左" : "右";
        Function0 onClick = () -> {
            Context owner = context;
            while (owner instanceof ContextWrapper && !(owner instanceof Activity)) {
                owner = ((ContextWrapper) owner).getBaseContext();
            }
            if (owner instanceof Activity) {
                Activity activity = (Activity) owner;
                new AlertDialog.Builder(activity)
                        .setTitle("ランダムボタンの位置")
                        .setSingleChoiceItems(new String[]{"右", "左"}, isLeft(context) ? 1 : 0,
                                (dialog, which) -> {
                                    context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                                            .edit().putString(SIDE_KEY, which == 1 ? "left" : "right")
                                            .apply();
                                    dialog.dismiss();
                                    activity.recreate();
                                })
                        .setNegativeButton("キャンセル", null)
                        .show();
            }
            return Unit.INSTANCE;
        };
        try {
            Class<?> preferences = Class.forName(
                    "xyz.quaver.pupil.ui.compose.settings.PreferenceKt");
            Method preference = null;
            for (Method candidate : preferences.getDeclaredMethods()) {
                if ("Preference".equals(candidate.getName())
                        && candidate.getParameterTypes().length == 12) {
                    preference = candidate;
                    break;
                }
            }
            if (preference == null) throw new NoSuchMethodException("Preference/12");
            preference.invoke(null, "ランダムボタンの位置", null, current,
                    false, false, null, onClick, null, null, composer, 0, 446);
        } catch (ReflectiveOperationException | RuntimeException error) {
            return;
        }
    }

    private static boolean isLeft(Context context) {
        return "left".equals(context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .getString(SIDE_KEY, "right"));
    }

    private static FrameLayout.LayoutParams buttonParams(Activity activity, boolean left) {
        int size = dp(activity, 54);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size);
        params.gravity = (left ? Gravity.START : Gravity.END) | Gravity.BOTTOM;
        if (left) params.leftMargin = dp(activity, 16);
        else params.rightMargin = dp(activity, 16);
        params.bottomMargin = dp(activity, 146);
        return params;
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

        root.addView(button, buttonParams(activity, left));
        button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {}

            @Override
            public void onViewDetachedFromWindow(View view) {
                if (shortcutButton.get() == view) {
                    shortcutButton.clear();
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
        ImageButton button = shortcutButton.get();
        if (button != null) button.setVisibility(visibility);
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
