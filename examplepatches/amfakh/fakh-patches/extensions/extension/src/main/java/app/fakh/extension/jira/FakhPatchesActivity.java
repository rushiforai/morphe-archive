/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

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

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RestartBar;

/**
 * The Fakh Patches page, opened from its card in Jira's Account screen: the switches of the patches, in sections by
 * where they act. The cards and rows are Jira's own composables (the section card of the Account screen, its list
 * item and switch), called by reflection, so the fonts, sizes, switches and colors are the app's own.
 */
public final class FakhPatchesActivity extends ComponentActivity {
    /**
     * The arguments of JiraListItemKt.a that take their defaults, as the bits of its last argument: the modifier, the
     * leading slot, the line under the title, and the title's style and the leading size. Settings' own rows pass the same.
     */
    private static final int LIST_ITEM_DEFAULTS = 2 | 4 | 8 | 128 | 512 | 1024;

    private float density;
    private int textPrimary;
    private int textSecondary;
    private LinearLayout content;

    /**
     * Jira's activities create themselves in onMAMCreate, because the Intune wrapper above ComponentActivity makes
     * onCreate final. The compile-time ComponentActivity has no such method, so the patch puts the call to the
     * superclass's own at the start of this one.
     */
    public void onMAMCreate(Bundle savedInstanceState) {
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

        // One card per section; the tabs section is one row, null here, that opens the picker sheet.
        String title = null;
        List<Features.Feature> rows = new ArrayList<>();
        for (Features.Feature feature : Features.all()) {
            if (!feature.section.equals(title)) {
                if (title != null) section(title, rows);
                title = feature.section;
                rows = new ArrayList<>();
                if (title.equals(MaterialYou.TABS_SECTION)) rows.add(null);
            }
            if (!title.equals(MaterialYou.TABS_SECTION)) rows.add(feature);
        }
        if (title != null) section(title, rows);
    }

    /** A section title and the card of its rows. */
    private void section(String title, List<Features.Feature> switches) {
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
    private View card(List<Features.Feature> switches) throws Exception {
        ClassLoader loader = getClassLoader();
        String components = "com.atlassian.jira.infrastructure.designsystem.components.";
        Class<?> items = Class.forName(components + "molecules.listitem.JiraSectionColumnKt", true, loader);
        Class<?> scopeClass = Class.forName(components + "molecules.listitem.JiraColumnSectionScope", true, loader);
        Class<?> listItems = Class.forName(components + "layouts.listitem.JiraListItemKt", true, loader);
        Class<?> switchClass = Class.forName(components + "atoms.JiraSwitchKt", true, loader);
        Class<?> function1 = Class.forName("kotlin.jvm.functions.Function1", true, loader);
        Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2", true, loader);
        Method card = null;
        Method wrapper = null;
        Method listItem = null;
        Method jiraSwitch = null;
        for (Method method : items.getDeclaredMethods()) {
            if (method.getName().equals("a") && method.getParameterTypes().length == 7) card = method;
        }
        for (Method method : scopeClass.getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (types.length == 5 && types[0] == scopeClass && types[4] == function2) wrapper = method;
        }
        for (Method method : listItems.getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (method.getName().equals("a") && types.length == 15 && types[0] == String.class) listItem = method;
        }
        for (Method method : switchClass.getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (types.length == 8 && types[0] == boolean.class && types[1] == function1) jiraSwitch = method;
        }
        if (card == null || wrapper == null || listItem == null || jiraSwitch == null) throw new IllegalStateException("Jira composables");
        Class<?> theme = Class.forName("com.atlassian.jira.infrastructure.designsystem.foundation.JiraTheme", true, loader);
        final Object themeInstance = theme.getField("INSTANCE").get(null);
        final Method themeMethod = FakhSettings.themeMethod(theme);
        final java.lang.reflect.Constructor<?> makeLambda = FakhSettings.lambdaConstructor(loader);
        final Method cardMethod = card;
        final Method wrapperMethod = wrapper;
        final Method listItemMethod = listItem;
        final Method switchMethod = jiraSwitch;

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
                                for (Features.Feature feature : switches) {
                                    // The row of the tabs opens the sheet when tapped; a switch row is changed by its switch.
                                    Object click = feature != null ? null : Proxy.newProxyInstance(loader,
                                            new Class<?>[] {wrapperMethod.getParameterTypes()[2]}, new InvocationHandler() {
                                                @Override
                                                public Object invoke(Object proxy, Method method, Object[] none) {
                                                    if (method.getDeclaringClass() == Object.class) {
                                                        return MaterialYou.objectMethod(proxy, method, none);
                                                    }
                                                    FakhSettings.showSheet(FakhPatchesActivity.this, (Runnable) render[0]);
                                                    return null;
                                                }
                                            });
                                    Object row = Proxy.newProxyInstance(loader, new Class<?>[] {function2}, new InvocationHandler() {
                                        @Override
                                        public Object invoke(Object proxy, Method method, Object[] composer) throws Throwable {
                                            if (composer == null || composer.length != 2) {
                                                return MaterialYou.objectMethod(proxy, method, composer);
                                            }
                                            if (feature == null) {
                                                // Modifier, leading slot and the trailing slot are the row's own defaults.
                                                listItemMethod.invoke(null, I18n.tr("Navigation bar tabs"), null, null, null,
                                                        FakhSettings.tabsSummary(FakhPatchesActivity.this), null,
                                                        Integer.MAX_VALUE, 0, Integer.MAX_VALUE, null, null, composer[0], 0, 0, LIST_ITEM_DEFAULTS | 32);
                                                return null;
                                            }
                                            Object change = Proxy.newProxyInstance(loader, new Class<?>[] {function1}, new InvocationHandler() {
                                                @Override
                                                public Object invoke(Object proxy, Method method, Object[] value) throws Throwable {
                                                    if (value == null || value.length != 1) {
                                                        return MaterialYou.objectMethod(proxy, method, value);
                                                    }
                                                    Features.set(feature.id, (Boolean) value[0]);
                                                    if (feature.restart) {
                                                        RestartBar.show(FakhPatchesActivity.this, 0, MaterialYou.materialYou(FakhPatchesActivity.this));
                                                    }
                                                    // Redrawn in place, so the switch slides instead of starting in its new state.
                                                    if (lambda[0] != null) FakhSettings.invalidate(lambda[0]);
                                                    else view.post((Runnable) render[0]);
                                                    return null;
                                                }
                                            });
                                            final boolean checked = settled[0] && Features.saved(feature.id);
                                            Object trailing = Proxy.newProxyInstance(loader, new Class<?>[] {function2}, new InvocationHandler() {
                                                @Override
                                                public Object invoke(Object proxy, Method method, Object[] inner) throws Throwable {
                                                    if (inner == null || inner.length != 2) return MaterialYou.objectMethod(proxy, method, inner);
                                                    // Modifier, enabled and colors are the switch's own defaults.
                                                    switchMethod.invoke(null, checked, change, null, false, null, inner[0], 0, 4 | 8 | 16);
                                                    return null;
                                                }
                                            });
                                            listItemMethod.invoke(null, I18n.tr(feature.title), null, null, null,
                                                    feature.description.isEmpty() ? null : I18n.tr(feature.description), trailing,
                                                    Integer.MAX_VALUE, 0, Integer.MAX_VALUE, null, null, composer[0], 0, 0, LIST_ITEM_DEFAULTS);
                                            return null;
                                        }
                                    });
                                    // The entry's key and enabled state are its own defaults.
                                    wrapperMethod.invoke(null, scope[0], null, click, null, row);
                                }
                                return null;
                            }
                        });
                        // Title, modifier and gap are the card's own defaults.
                        cardMethod.invoke(null, null, null, 0f, builder, args[0], 0, 1 | 2 | 4);
                        return null;
                    }
                });
                // The theme's content is a composable lambda of its own, so a change can redraw just it.
                lambda[0] = makeLambda.newInstance(0x5fa7, true, inner);
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
