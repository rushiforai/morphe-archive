package app.fakh.extension.jira;

import android.app.Activity;
import android.content.Context;
import android.graphics.Path;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.PathShape;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.activity.ComponentActivity;

import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RestartBar;

/**
 * The Fakh Patches page, opened from its card in Jira's Account screen: the switches of the patches, in sections by
 * where they act. The cards and rows are Jira's own composables (the card of the Account screen, the switch row of
 * Settings), called by reflection, so the fonts, sizes, switches and colors are the app's own.
 */
public final class FakhPatchesActivity extends ComponentActivity {
    /** The row that opens the sheet of the bottom bar's tabs, in place of a switch number. */
    private static final int TABS = -1;

    private float density;
    private int textPrimary;
    private int textSecondary;
    private LinearLayout content;

    /**
     * Jira's activities create themselves in onMAMCreate, because the Intune wrapper above ComponentActivity makes
     * onCreate final; the call to the superclass's own is a special call by method handle, as its stub has no such method.
     */
    public void onMAMCreate(Bundle savedInstanceState) {
        try {
            MethodHandles.lookup().findSpecial(ComponentActivity.class, "onMAMCreate",
                    MethodType.methodType(void.class, Bundle.class), FakhPatchesActivity.class).invoke(this, savedInstanceState);
        } catch (Throwable error) {
            throw new IllegalStateException(error);
        }
        FakhSettings.remember(this);
        density = getResources().getDisplayMetrics().density;
        boolean night = app.fakh.extension.shared.MaterialYou.night(this);
        int canvas = MaterialYou.canvas(this);
        textPrimary = night ? 0xFFE2E3E5 : 0xFF292A2E;
        textSecondary = night ? 0xFFA9ABAF : 0xFF505258;

        Window window = getWindow();
        window.setStatusBarColor(canvas);
        window.setNavigationBarColor(canvas);
        window.getDecorView().setSystemUiVisibility(
                night ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(canvas);
        page.setFitsSystemWindows(true);
        page.addView(toolbar());

        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(16), 0, dp(16), dp(24));
        ScrollView scroll = new ScrollView(this);
        scroll.addView(content);
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(page);
        // Like the notification settings: the page opens and closes with no transition.
        overridePendingTransition(0, 0);

        if (MaterialYou.isMaterialYouIncluded()) section("Appearance", new int[] {0, 1});
        section("Navigation bar", MaterialYou.isGlassNavigationBarIncluded() ? new int[] {4, 5, 3} : new int[] {3});
        section("Navigation bar tabs", new int[] {TABS});
        section("Other", new int[] {2});
    }

    /** A section title and the card of its switch rows, by their number in {@link MaterialYou#KEYS}. */
    private void section(String title, int[] switches) {
        TextView header = text(I18n.tr(title), 12, textSecondary);
        header.setPadding(dp(4), dp(20), dp(4), dp(8));
        content.addView(header);
        try {
            content.addView(card(switches));
        } catch (Throwable error) {
            android.util.Log.w("FakhPatches", "Card " + title, error);
        }
    }

    /**
     * A ComposeView whose content is Jira's card with one of its switch rows per switch. A change is saved at once and
     * applies after a restart; the content is set again so that the rows show it.
     */
    private View card(int[] switches) throws Exception {
        ClassLoader loader = getClassLoader();
        Class<?> items = Class.forName("com.atlassian.jira.infrastructure.compose.ui.SpacedItemsKt", true, loader);
        Class<?> rows = Class.forName("com.atlassian.jira.feature.settings.impl.SettingsKt", true, loader);
        Class<?> function1 = Class.forName("kotlin.jvm.functions.Function1", true, loader);
        Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2", true, loader);
        Method card = null;
        Method wrapper = null;
        Method switchRow = null;
        Method selectableRow = null;
        Class<?> selectable = Class.forName("com.atlassian.jira.feature.settings.impl.SelectableRowKt", true, loader);
        for (Method method : selectable.getDeclaredMethods()) {
            if (method.getName().equals("a") && method.getParameterTypes().length == 8) selectableRow = method;
        }
        for (Method method : items.getDeclaredMethods()) {
            if (method.getName().equals("a") && method.getParameterTypes().length == 7) card = method;
            if (method.getName().equals("b") && method.getParameterTypes().length == 5) wrapper = method;
        }
        for (Method method : rows.getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (method.getName().equals("e") && types.length == 8 && types[0] == String.class) switchRow = method;
        }
        if (card == null || wrapper == null || switchRow == null || selectableRow == null) throw new IllegalStateException("Jira composables");
        Class<?> theme = Class.forName("com.atlassian.jira.infrastructure.designsystem.foundation.JiraTheme", true, loader);
        final Object themeInstance = theme.getField("INSTANCE").get(null);
        Method themed = null;
        for (Method method : theme.getDeclaredMethods()) {
            if (method.getName().equals("e") && method.getParameterTypes().length == 10) themed = method;
        }
        if (themed == null) throw new IllegalStateException("JiraTheme");
        final Method themeMethod = themed;
        final Method cardMethod = card;
        final Method wrapperMethod = wrapper;
        final Method switchMethod = switchRow;
        final Method selectableMethod = selectableRow;

        Class<?> viewClass = Class.forName("androidx.compose.ui.platform.ComposeView", true, loader);
        final View view = (View) viewClass.getConstructor(Context.class).newInstance(this);
        final Method setContent = viewClass.getMethod("setContent", function2);
        final Object[] render = new Object[1];
        final Object[] lambda = new Object[1];
        // The first frame shows every switch off; the next one turns on the ones that are, so they slide on.
        final boolean[] settled = {false};
        Runnable show = () -> {
            try {
                final Object inner = Proxy.newProxyInstance(loader, new Class<?>[] {function2}, new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        if (args == null || args.length != 2) return MaterialYou.objectMethod(proxy, method, args);
                        Object builder = Proxy.newProxyInstance(loader, new Class<?>[] {function1}, new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] scope) throws Throwable {
                                if (scope == null || scope.length != 1) return MaterialYou.objectMethod(proxy, method, scope);
                                for (int which : switches) {
                                    Object row = Proxy.newProxyInstance(loader, new Class<?>[] {function2}, new InvocationHandler() {
                                        @Override
                                        public Object invoke(Object proxy, Method method, Object[] composer) throws Throwable {
                                            if (composer == null || composer.length != 2) {
                                                return MaterialYou.objectMethod(proxy, method, composer);
                                            }
                                            if (which == TABS) {
                                                Object open = Proxy.newProxyInstance(loader,
                                                        new Class<?>[] {selectableMethod.getParameterTypes()[2]}, new InvocationHandler() {
                                                            @Override
                                                            public Object invoke(Object proxy, Method method, Object[] none) {
                                                                if (method.getDeclaringClass() == Object.class) {
                                                                    return MaterialYou.objectMethod(proxy, method, none);
                                                                }
                                                                FakhSettings.showSheet(FakhPatchesActivity.this, (Runnable) render[0]);
                                                                return null;
                                                            }
                                                        });
                                                // The row's modifier is its own default.
                                                selectableMethod.invoke(null, I18n.tr("Navigation bar tabs"), false, open, null,
                                                        FakhSettings.tabsSummary(FakhPatchesActivity.this), composer[0], 0, 8);
                                                return null;
                                            }
                                            Object change = Proxy.newProxyInstance(loader, new Class<?>[] {function1}, new InvocationHandler() {
                                                @Override
                                                public Object invoke(Object proxy, Method method, Object[] value) throws Throwable {
                                                    if (value == null || value.length != 1) {
                                                        return MaterialYou.objectMethod(proxy, method, value);
                                                    }
                                                    MaterialYou.prefs(FakhPatchesActivity.this).edit()
                                                            .putBoolean(MaterialYou.KEYS[which], (Boolean) value[0]).commit();
                                                    RestartBar.show(FakhPatchesActivity.this, 0, MaterialYou.materialYou(FakhPatchesActivity.this));
                                                    // Redrawn in place, so the switch slides instead of starting in its new state.
                                                    if (lambda[0] != null) FakhSettings.invalidate(lambda[0]);
                                                    else view.post((Runnable) render[0]);
                                                    return null;
                                                }
                                            });
                                            String subtitle = MaterialYou.SUBTITLES[which];
                                            switchMethod.invoke(null, I18n.tr(MaterialYou.LABELS[which]),
                                                    settled[0] && MaterialYou.prefs(FakhPatchesActivity.this)
                                                            .getBoolean(MaterialYou.KEYS[which], MaterialYou.DEFAULTS[which]),
                                                    change, subtitle == null ? null : I18n.tr(subtitle), true, composer[0], 0, 0);
                                            return null;
                                        }
                                    });
                                    // Modifier and click are the row's own defaults.
                                    wrapperMethod.invoke(null, scope[0], null, null, row, 1 | 4);
                                }
                                return null;
                            }
                        });
                        // Modifier, gap and shape are the card's own defaults.
                        cardMethod.invoke(null, null, 0f, null, builder, args[0], 0, 1 | 2 | 4);
                        return null;
                    }
                });
                // The theme's content is a composable lambda of its own, so a change can redraw just it.
                lambda[0] = Class.forName("ta4", true, loader).getConstructor(int.class, boolean.class, Object.class)
                        .newInstance(0x5fa7, true, inner);
                // The screens of the app sit in its theme; every color, shape and size of it is the default.
                setContent.invoke(view, Proxy.newProxyInstance(loader, new Class<?>[] {function2}, new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        if (args == null || args.length != 2) return MaterialYou.objectMethod(proxy, method, args);
                        themeMethod.invoke(themeInstance, null, false, null, null, null, null, lambda[0], args[0], 0, 0x3f);
                        return null;
                    }
                }));
            } catch (Exception error) {
                android.util.Log.w("FakhPatches", "Card content", error);
            }
        };
        render[0] = show;
        show.run();
        // Counted from when the card is on screen, so its first frame is the off one.
        view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View attached) {
                attached.removeOnAttachStateChangeListener(this);
                attached.postDelayed(() -> {
                    settled[0] = true;
                    if (lambda[0] != null) FakhSettings.invalidate(lambda[0]);
                }, 60);
            }

            @Override
            public void onViewDetachedFromWindow(View detached) {}
        });
        return view;
    }

    @Override
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    /** The back arrow and the page title, like the top of Jira's Account screen. */
    private View toolbar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(4), 0, dp(16), 0);
        bar.setMinimumHeight(dp(64));
        ImageView back = new ImageView(this);
        back.setImageDrawable(icon(new float[] {20, 11, 7.83f, 11, 13.42f, 5.41f, 12, 4, 4, 12, 12, 20, 13.41f, 18.59f,
                7.83f, 13, 20, 13}, textPrimary));
        back.setPadding(dp(12), dp(12), dp(12), dp(12));
        back.setContentDescription(I18n.tr("Back"));
        TypedValue ripple = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true);
        back.setBackgroundResource(ripple.resourceId);
        back.setOnClickListener(view -> finish());
        bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        TextView title = text("Fakh Patches", 20, textPrimary);
        title.setPadding(dp(16), 0, 0, 0);
        bar.addView(title);
        return bar;
    }

    /** A 24 by 24 icon from the points of one closed polygon. */
    private ShapeDrawable icon(float[] points, int color) {
        Path path = new Path();
        path.moveTo(points[0], points[1]);
        for (int i = 2; i < points.length; i += 2) path.lineTo(points[i], points[i + 1]);
        path.close();
        ShapeDrawable icon = new ShapeDrawable(new PathShape(path, 24, 24));
        icon.getPaint().setColor(color);
        icon.setIntrinsicWidth(dp(24));
        icon.setIntrinsicHeight(dp(24));
        return icon;
    }

    private TextView text(String value, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        return view;
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    /** Opens the page; called from the Fakh Patches card. */
    static void open(Context context) {
        android.content.Intent intent = new android.content.Intent(context, FakhPatchesActivity.class);
        if (!(context instanceof Activity)) intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
}
