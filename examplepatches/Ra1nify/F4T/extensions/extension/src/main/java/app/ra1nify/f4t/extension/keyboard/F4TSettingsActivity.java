package app.ra1nify.f4t.extension.keyboard;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Method;

/**
 * F4T settings page (route E).
 *
 * The activity reuses the official COUI app bar layout, the official COUI RecyclerView, the official
 * preference adapter and item decoration, and the official COUI preference widgets. The page content is
 * built by {@link SettingsHost}, which is shared with the previous hosting routes.
 */
public final class F4TSettingsActivity extends Activity {
    private static final String TAG = "F4T";
    private static final int LIST_CONTAINER_ID = 0x0102003f; // android.R.id.list_container
    private static final String PAGE_MAIN = "main";

    private String page = PAGE_MAIN;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        applyCouiStatusBar();
        String requested = getIntent() == null
                ? null : getIntent().getStringExtra(SettingsHost.EXTRA_PAGE);
        showPage(requested == null ? PAGE_MAIN : requested);
    }

    /** Same status bar treatment the stock COUI settings activity applies. */
    private void applyCouiStatusBar() {
        try {
            Class.forName("com.coui.appcompat.baseview.util.SystemBarUtil")
                    .getMethod("setStatusBarTransparentAndBlackFont", Activity.class)
                    .invoke(null, this);
            Log.i(TAG, "COUI status bar applied");
        } catch (Throwable error) {
            Log.w(TAG, "COUI status bar unavailable", error);
        }
    }

    /** Called from {@link CouiUi#openPage(Context, String)} when the page is already open. */
    public void openPage(String nextPage) {
        showPage(nextPage == null ? PAGE_MAIN : nextPage);
    }

    private void showPage(String nextPage) {
        page = nextPage;
        try {
            setContentView(buildPage());
            Log.i(TAG, "F4T page ready: " + page);
        } catch (Throwable error) {
            Log.e(TAG, "F4T page failed: " + page, error);
            setContentView(errorView(error));
        }
    }

    private View buildPage() throws Exception {
        LayoutInflater inflater = LayoutInflater.from(this);

        int layoutId = id("coui_preference_list_with_appbar_fragment", "layout");
        if (layoutId == 0) throw new IllegalStateException("missing layout coui_preference_list_with_appbar_fragment");
        View root = inflater.inflate(layoutId, null);

        View containerView = root.findViewById(LIST_CONTAINER_ID);
        if (!(containerView instanceof ViewGroup)) throw new IllegalStateException("list_container not found");
        ViewGroup listContainer = (ViewGroup) containerView;

        int recyclerLayoutId = id("coui_preference_recyclerview", "layout");
        if (recyclerLayoutId == 0) throw new IllegalStateException("missing layout coui_preference_recyclerview");
        View recycler = inflater.inflate(recyclerLayoutId, listContainer, false);
        listContainer.addView(recycler, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        Object layoutManager = Class.forName("androidx.recyclerview.widget.LinearLayoutManager")
                .getConstructor(Context.class).newInstance(this);
        invokeOne(recycler, "setLayoutManager", layoutManager);
        try {
            invokeOne(recycler, "setEnablePointerDownAction", false);
        } catch (Throwable ignored) {
        }

        Object screen = createScreen();
        invokeNoArgs(screen, "removeAll");
        SettingsHost.fill(this, screen, page);

        Class<?> screenClass = Class.forName("androidx.preference.PreferenceScreen");
        Object adapter = Class.forName("androidx.preference.G").getConstructor(screenClass).newInstance(screen);
        invokeOne(recycler, "setAdapter", adapter);
        Object decoration = Class.forName("com.coui.appcompat.preference.COUIPreferenceItemDecoration")
                .getConstructor(Context.class, screenClass).newInstance(this, screen);
        invokeOne(recycler, "addItemDecoration", decoration);

        int toolbarId = id("toolbar", "id");
        View toolbar = toolbarId == 0 ? null : root.findViewById(toolbarId);
        if (toolbar != null) {
            invokeOne(toolbar, "setTitle", SettingsHost.title(page));
            int backIcon = id("coui_back_arrow", "drawable");
            if (backIcon != 0) {
                try {
                    invokeOne(toolbar, "setNavigationIcon", getDrawable(backIcon));
                } catch (Throwable ignored) {
                }
            }
            invokeOne(toolbar, "setNavigationOnClickListener", (View.OnClickListener) view -> {
                if (PAGE_MAIN.equals(page)) {
                    finish();
                } else {
                    openPage(PAGE_MAIN);
                }
            });
        }
        polishAppBar(root);
        return root;
    }

    /** Applies the same app bar treatment the stock COUI preference fragment uses. */
    private void polishAppBar(View root) {
        try {
            int statusBar = 0;
            int resourceId = getResources().getIdentifier("status_bar_height", "dimen", "android");
            if (resourceId != 0) statusBar = getResources().getDimensionPixelSize(resourceId);
            if (statusBar > 0) {
                root.setPadding(root.getPaddingLeft(), statusBar,
                        root.getPaddingRight(), root.getPaddingBottom());
            }
            int appBarId = id("appbar_layout", "id");
            View appBar = appBarId == 0 ? null : root.findViewById(appBarId);
            if (appBar != null) {
                try {
                    invokeOne(appBar, "setGradientBlurEnabled", true);
                } catch (Throwable ignored) {
                }
                try {
                    invokeOne(appBar, "setTouchscreenBlocksFocus", false);
                } catch (Throwable ignored) {
                }
            }
            int dividerId = id("divider_line", "id");
            View divider = dividerId == 0 ? null : root.findViewById(dividerId);
            if (divider != null) divider.setVisibility(View.GONE);
        } catch (Throwable error) {
            Log.w(TAG, "app bar polish failed", error);
        }
    }

    /** Builds the preference screen from a stock preference XML through the stock PreferenceManager. */
    private Object createScreen() throws Exception {
        Class<?> screenClass = Class.forName("androidx.preference.PreferenceScreen");
        Class<?> managerClass = Class.forName("androidx.preference.L");
        Object manager = managerClass.getConstructor(Context.class).newInstance(this);
        int xmlId = id("settings_home", "xml");
        if (xmlId == 0) throw new IllegalStateException("missing xml settings_home");
        Method inflate = managerClass.getMethod("d", Context.class, int.class, screenClass);
        Object screen = inflate.invoke(manager, this, xmlId, null);
        if (screen == null) throw new IllegalStateException("screen inflate returned null");
        return screen;
    }

    private int id(String name, String type) {
        return getResources().getIdentifier(name, type, getPackageName());
    }

    private static void invokeOne(Object target, String name, Object argument) throws Exception {
        for (Method method : target.getClass().getMethods()) {
            if (!method.getName().equals(name) || method.getParameterTypes().length != 1) continue;
            Class<?> parameter = method.getParameterTypes()[0];
            if (argument == null) continue;
            if (parameter.isPrimitive()) {
                if (parameter == boolean.class && argument instanceof Boolean) {
                    method.invoke(target, argument);
                    return;
                }
            } else if (parameter.isAssignableFrom(argument.getClass())) {
                method.invoke(target, argument);
                return;
            }
        }
        throw new IllegalStateException("no " + name + " for " + argument.getClass().getName()
                + " on " + target.getClass().getName());
    }

    private static void invokeNoArgs(Object target, String name) throws Exception {
        for (Method method : target.getClass().getMethods()) {
            if (method.getName().equals(name) && method.getParameterTypes().length == 0) {
                method.invoke(target);
                return;
            }
        }
    }

    private View errorView(Throwable error) {
        ScrollView scroll = new ScrollView(this);
        TextView text = new TextView(this);
        int padding = (int) (16 * getResources().getDisplayMetrics().density);
        text.setPadding(padding, padding, padding, padding);
        text.setTextSize(13f);
        text.setTypeface(Typeface.MONOSPACE);
        StringBuilder builder = new StringBuilder("F4T 页面初始化失败\n\n");
        builder.append(error.getClass().getName()).append(": ").append(error.getMessage()).append("\n\n");
        Throwable cause = error.getCause();
        if (cause != null) {
            builder.append("caused by: ").append(cause.getClass().getName())
                    .append(": ").append(cause.getMessage()).append("\n\n");
        }
        StackTraceElement[] stack = error.getStackTrace();
        for (int i = 0; i < Math.min(stack.length, 25); i++) {
            builder.append("  at ").append(stack[i]).append('\n');
        }
        text.setText(builder.toString());
        scroll.addView(text);
        return scroll;
    }
}
