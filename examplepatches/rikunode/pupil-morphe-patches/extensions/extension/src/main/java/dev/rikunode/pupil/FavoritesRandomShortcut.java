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
import android.widget.Button;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

@SuppressWarnings({"rawtypes", "unchecked"})
public final class FavoritesRandomShortcut {
    private static final String FAVORITES_VIEW_MODEL =
            "xyz.quaver.pupil.ui.viewmodel.FavoritesViewModel";
    private static Object viewModel;
    private static Function1 showDetail;
    private static Function1 detailNavigation;
    private static final String PREFS_NAME = "pupil_morphe_shortcut";
    private static final String SIDE_KEY = "random_button_side";
    private static final String DETAIL_KEY = "random_button_on_detail";
    private static final String DOWNLOADS_NAV_KEY = "random_button_in_downloads_slot";
    private static final int DOWNLOAD_ICON_RES = 0x7f0800cd;
    private static final int RANDOM_ICON_RES = 0x7f08015d;
    private static final int DOWNLOAD_LABEL_RES = 0x7f11010b;
    private static final int RANDOM_LABEL_RES = 0x7f110116;
    private static WeakReference<List> detailStack = new WeakReference<>(null);
    private static WeakReference<Object> navController = new WeakReference<>(null);
    private static Boolean lastDownloadsNavEnabled;
    private static WeakReference<ImageButton> shortcutButton = new WeakReference<>(null);
    private static WeakReference<Activity> currentActivity = new WeakReference<>(null);
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
        if ((!onFavorites || !previouslyFavorites) && detailNavigation == null) detailVisible = false;
        refreshVisibility();
    }

    public static void hideForDetail() {
        detailVisible = true;
        refreshVisibility();
    }

    public static void bindDetail(Function1 onOpenGallery) {
        detailNavigation = onOpenGallery;
        detailVisible = true;
        refreshVisibility();
    }

    public static Function0 wrapOnDismiss(Function0 onDismiss) {
        if (onDismiss == null) return null;
        return () -> {
            Object result = onDismiss.invoke();
            detailNavigation = null;
            detailVisible = false;
            refreshVisibility();
            return result;
        };
    }

    public static void install(Activity activity) {
        currentActivity = new WeakReference<>(activity);
        boolean enabled = downloadsNavEnabled(activity);
        if (lastDownloadsNavEnabled == null || lastDownloadsNavEnabled != enabled) {
            boolean needsRefresh = enabled || lastDownloadsNavEnabled != null;
            lastDownloadsNavEnabled = enabled;
            if (needsRefresh) {
                activity.recreate();
                return;
            }
        }
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
        renderDetailPreference(context, composer);
    }

    private static void renderDetailPreference(Context context, Object composer) {
        boolean enabled = showOnDetail(context);
        Function0 onClick = () -> {
            Context owner = context;
            while (owner instanceof ContextWrapper && !(owner instanceof Activity)) {
                owner = ((ContextWrapper) owner).getBaseContext();
            }
            if (owner instanceof Activity) {
                Activity activity = (Activity) owner;
                new AlertDialog.Builder(activity)
                        .setTitle("作品ページにもランダムボタンを表示")
                        .setSingleChoiceItems(new String[]{"ON", "OFF"}, enabled ? 0 : 1,
                                (dialog, which) -> {
                                    context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                                            .edit().putBoolean(DETAIL_KEY, which == 0).apply();
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
            if (preference == null) return;
            preference.invoke(null, "作品ページにもランダムボタンを表示", null,
                    enabled ? "ON" : "OFF", false, false, null, onClick,
                    null, null, composer, 0, 446);
        } catch (ReflectiveOperationException | RuntimeException error) {
            return;
        }
        renderDownloadsNavPreference(context, composer);
    }

    private static boolean downloadsNavEnabled(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .getBoolean(DOWNLOADS_NAV_KEY, false);
    }

    private static void renderDownloadsNavPreference(Context context, Object composer) {
        boolean enabled = downloadsNavEnabled(context);
        Function0 onClick = () -> {
            Context owner = context;
            while (owner instanceof ContextWrapper && !(owner instanceof Activity)) {
                owner = ((ContextWrapper) owner).getBaseContext();
            }
            if (owner instanceof Activity) {
                Activity activity = (Activity) owner;
                new AlertDialog.Builder(activity)
                        .setTitle("ダウンロードタブをランダムに置き換える")
                        .setSingleChoiceItems(new String[]{"ON", "OFF"}, enabled ? 0 : 1,
                                (dialog, which) -> {
                                    context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                                            .edit().putBoolean(DOWNLOADS_NAV_KEY, which == 0).apply();
                                    dialog.dismiss();
                                    activity.recreate();
                                })
                        .setNegativeButton("キャンセル", null).show();
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
            if (preference == null) return;
            preference.invoke(null, "ダウンロードタブをランダムに置き換える", null,
                    enabled ? "ON" : "OFF", false, false, null, onClick,
                    null, null, composer, 0, 446);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return;
        }
    }

    // Register a standalone LazyColumn item after all tag groups, immediately
    // before the thumbnails heading. Neither heading nor thumbnail grid is modified.
    public static void addTypeShortcutItem(Object lazyListScope) {
        Activity activity = currentActivity.get();
        if (activity == null || !showOnDetail(activity)) return;
        try {
            Function3 content = (scope, composer, flags) -> {
                renderTypeShortcut((Context) activity, composer);
                return Unit.INSTANCE;
            };
            Class<?> impl = Class.forName("androidx.compose.runtime.internal.ComposableLambdaImpl");
            Object composable = impl.getConstructor(int.class, Object.class, boolean.class)
                    .newInstance(0x5A4F01, content, true);
            Class<?> scopeClass = Class.forName("androidx.compose.foundation.lazy.LazyListScope");
            Class<?> itemClass = Class.forName("androidx.compose.foundation.lazy.LazyItemScope$-CC");
            itemClass.getMethod("item$default", scopeClass, Function3.class)
                    .invoke(null, lazyListScope, composable);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Fail soft: preserve the original thumbnail pager if internals differ.
        }
    }

    private static void renderTypeShortcut(Context context, Object composer) {
        Function1 factory = value -> createTypeShortcutRow((Context) value);
        Function1 update = value -> Unit.INSTANCE;
        try {
            Class<?> modifierClass = Class.forName("androidx.compose.ui.Modifier");
            Object companion = Class.forName("androidx.compose.ui.Modifier$Companion")
                    .getField("$$INSTANCE").get(null);
            Object modifier = Class.forName("androidx.compose.foundation.layout.SizeKt")
                    .getMethod("fillMaxWidth", modifierClass, float.class)
                    .invoke(null, companion, 1.0f);
            Class<?> composerClass = Class.forName("androidx.compose.runtime.Composer");
            Class.forName("androidx.compose.ui.viewinterop.AndroidView_androidKt")
                    .getMethod("AndroidView", Function1.class, modifierClass, Function1.class,
                            composerClass, int.class)
                    .invoke(null, factory, modifier, update, composer, 0);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Do not crash the gallery when an internal Compose signature differs.
        }
    }

    private static View createTypeShortcutRow(Context context) {
        FrameLayout row = new FrameLayout(context) {
            @Override
            protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                int width = View.MeasureSpec.getSize(widthMeasureSpec);
                // Two equal-width buttons with an 8dp gap, both 48dp tall.
                int buttonHeight = dp(context, 48);
                int gap = dp(context, 8);
                int buttonWidth = Math.max(1, (width - gap) / 2);
                getChildAt(0).measure(
                        View.MeasureSpec.makeMeasureSpec(buttonWidth, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(buttonHeight, View.MeasureSpec.EXACTLY));
                getChildAt(1).measure(
                        View.MeasureSpec.makeMeasureSpec(buttonWidth, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(buttonHeight, View.MeasureSpec.EXACTLY));
                setMeasuredDimension(width, View.resolveSize(buttonHeight, heightMeasureSpec));
            }

            @Override
            protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
                View random = getChildAt(0);
                View bookmarks = getChildAt(1);
                int buttonWidth = random.getMeasuredWidth();
                int gap = dp(getContext(), 8);
                random.layout(0, 0, buttonWidth, random.getMeasuredHeight());
                bookmarks.layout(buttonWidth + gap, 0,
                        buttonWidth + gap + bookmarks.getMeasuredWidth(),
                        bookmarks.getMeasuredHeight());
            }
        };
        ImageButton button = new ImageButton(context);
        int iconId = context.getResources().getIdentifier(
                "shuffle_variant", "drawable", context.getPackageName());
        if (iconId == 0) iconId = android.R.drawable.ic_menu_rotate;
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.rgb(68, 68, 91));
        background.setCornerRadius(dp(context, 6));
        button.setBackground(background);
        button.setImageResource(iconId);
        button.setColorFilter(Color.WHITE);
        button.setScaleType(ImageButton.ScaleType.CENTER_INSIDE);
        button.setPadding(dp(context, 6), dp(context, 6), dp(context, 6), dp(context, 6));
        button.setContentDescription("お気に入りからランダムに作品を開く");
        button.setOnClickListener(ignored -> openRandom(button));
        row.addView(button);
        Button bookmarks = new Button(context);
        bookmarks.setText("ブックマークに戻る");
        bookmarks.setTextColor(Color.WHITE);
        bookmarks.setTextSize(12);
        bookmarks.setAllCaps(false);
        GradientDrawable backBackground = new GradientDrawable();
        backBackground.setColor(Color.rgb(68, 68, 91));
        backBackground.setCornerRadius(dp(context, 6));
        bookmarks.setBackground(backBackground);
        bookmarks.setOnClickListener(ignored -> returnToBookmarks());
        row.addView(bookmarks);
        return row;
    }

    private static boolean showOnDetail(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .getBoolean(DETAIL_KEY, true);
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
                    detailNavigation = null;
                    currentActivity.clear();
                    openingRandom = false;
                }
            }
        });
        return button;
    }

    // Called from PupilApp's existing content lambda. The state list is the
    // detail overlay stack, and the controller is the native top-level navigator.
    public static void bindNavigation(Object stack, Object controller) {
        if (stack instanceof List && controller != null) {
            detailStack = new WeakReference<>((List) stack);
            navController = new WeakReference<>(controller);
        }
    }

    private static List<?> savedFavorites() throws ReflectiveOperationException {
        Object store = Class.forName("xyz.quaver.pupil.PupilKt")
                .getMethod("getFavorites").invoke(null);
        return (List<?>) store.getClass().getMethod("getItems").invoke(store);
    }

    public static boolean onDownloadsNavClick(Object destination) {
        Activity activity = currentActivity.get();
        if (activity == null || !(destination instanceof Enum)
                || !"Downloads".equals(((Enum) destination).name())
                || !downloadsNavEnabled(activity)) return false;
        try {
            List stack = detailStack.get();
            List<?> favorites = savedFavorites();
            if (stack == null) throw new IllegalStateException("Detail navigation unavailable");
            if (favorites.isEmpty()) {
                Toast.makeText(activity, "ブックマークがありません", Toast.LENGTH_SHORT).show();
                return true;
            }
            stack.add(favorites.get(ThreadLocalRandom.current().nextInt(favorites.size())));
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            Toast.makeText(activity, "ランダム表示を開けませんでした", Toast.LENGTH_SHORT).show();
        }
        return true;
    }

    public static int navIconResource(int original) {
        Activity activity = currentActivity.get();
        return original == DOWNLOAD_ICON_RES && activity != null && downloadsNavEnabled(activity)
                ? RANDOM_ICON_RES : original;
    }

    public static int navLabelResource(int original) {
        Activity activity = currentActivity.get();
        return original == DOWNLOAD_LABEL_RES && activity != null && downloadsNavEnabled(activity)
                ? RANDOM_LABEL_RES : original;
    }

    private static void returnToBookmarks() {
        Activity activity = currentActivity.get();
        List stack = detailStack.get();
        Object controller = navController.get();
        if (activity == null || stack == null || controller == null) return;
        try {
            Class<?> destinationClass = Class.forName(
                    "xyz.quaver.pupil.ui.compose.Destination");
            Object favorites = destinationClass.getField("Favorites").get(null);
            Class<?> controllerClass = Class.forName("androidx.navigation.NavHostController");
            Method navigate = Class.forName("xyz.quaver.pupil.ui.compose.PupilAppKt")
                    .getDeclaredMethod("navigateToTopLevel", controllerClass, destinationClass);
            navigate.setAccessible(true);
            stack.clear();
            navigate.invoke(null, controller, favorites);
            detailNavigation = null;
            detailVisible = false;
            refreshVisibility();
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            Toast.makeText(activity, "ブックマークに戻れませんでした", Toast.LENGTH_SHORT).show();
        }
    }

    private static void openRandom(ImageButton button) {
        boolean inDetail = detailVisible && detailNavigation != null;
        Object model = viewModel;
        Function1 destination = inDetail ? detailNavigation : showDetail;
        if (openingRandom || destination == null || (!inDetail && (!onFavorites || model == null))) return;

        openingRandom = true;
        button.setEnabled(false);
        try {
            Object galleryId;
            if (inDetail) {
                // Gallery details can be opened from tabs other than Favorites.
                // Read Pupil's saved Favorites rather than relying on a tab ViewModel.
                List<?> favorites = savedFavorites();
                galleryId = favorites.isEmpty() ? null
                        : favorites.get(ThreadLocalRandom.current().nextInt(favorites.size()));
            } else {
                galleryId = model.getClass().getMethod("randomGalleryID").invoke(model);
            }
            if (galleryId instanceof Integer) {
                if (!inDetail) hideForDetail();
                destination.invoke(galleryId);
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            if (!inDetail) detailVisible = false;
            refreshVisibility();
            Toast.makeText(button.getContext(), "ランダム表示を開けませんでした", Toast.LENGTH_SHORT).show();
        } finally {
            openingRandom = false;
            button.setEnabled(true);
        }
    }

    private static void refreshVisibility() {
        ImageButton button = shortcutButton.get();
        if (button == null) return;
        Activity activity = currentActivity.get();
        boolean downloadsSlotReplaced = activity != null && downloadsNavEnabled(activity);
        boolean visible = !downloadsSlotReplaced && !detailVisible && onFavorites
                && viewModel != null && showDetail != null;
        button.setVisibility(visible ? View.VISIBLE : View.GONE);
    }

    private static int dp(Context activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
