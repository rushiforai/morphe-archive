package app.template.extension.firefoxfocus;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.util.TypedValue;

import org.mozilla.geckoview.WebExtension;
import org.mozilla.geckoview.WebExtensionController;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import kotlin.jvm.functions.Function0;

/**
 * The browser menu's add-on entries. Focus 159 builds its menu with Android Components' Compose
 * menu (BrowserMenu.menuGroupsFor), which has no add-on support, so this adds one row before
 * Settings: each enabled add-on's browser action (its popup) and "Extensions" (the manager).
 *
 * <p>A tap is a Focus MenuItemTapped event whose item is a proxy of ToolbarMenu$FocusMenuItem:
 * Focus's MenuMiddleware matches none of its own items and only dismisses the menu, and
 * {@link #onMenuAction} runs ours after that.
 *
 * <p>Focus and Android Components classes are reached by reflection: R8 narrows their
 * constructors per release, so the StandardMenuItem constructor is filled by parameter type. Any
 * mismatch leaves the menu as Focus built it and is logged (a failed Api lookup only once).
 */
final class AddonsMenu {
    private static final String GROUP_ID = "morphe_addons";
    private static final String SETTINGS_GROUP_ID = "settings";
    private static final String MANAGER_KEY = "manager";
    private static final String ADDON_KEY_PREFIX = "addon:";
    private static final String MANAGER_TITLE = "Extensions";
    private static final int ICON_DP = 24;

    private static volatile Api api;
    private static boolean apiFailed;

    // Add-on icons from GeckoView, by add-on id. Loaded once per id; a menu built before an icon
    // arrives shows the entry without it.
    private static final Map<String, Drawable> icons = new ConcurrentHashMap<>();
    private static final Set<String> iconRequests = Collections.newSetFromMap(new ConcurrentHashMap<>());

    private static Drawable managerIcon;
    private static int managerIconColor;

    private AddonsMenu() {
    }

    /** BrowserMenu.menuGroupsFor(state, icon) result: adds the add-on row to [groups] in place. */
    static void addItems(List<Object> groups, Object browserState) {
        if (groups == null || browserState == null) return;
        Api a = api();
        if (a == null) return;
        try {
            for (Object group : groups) {
                if (GROUP_ID.equals(a.groupId.invoke(group))) return;
            }
            List<Object> items = new ArrayList<>();
            boolean missingIcons = false;
            for (BrowserAction action : browserActions(a, browserState)) {
                Drawable icon = icons.get(action.id);
                if (icon == null && !iconRequests.contains(action.id)) missingIcons = true;
                items.add(a.item(action.title, icon, action.enabled ? a.stateDefault : a.stateDisabled,
                        new Tap(ADDON_KEY_PREFIX + action.id, action.onClick)));
            }
            items.add(a.item(MANAGER_TITLE, managerIcon(), a.stateDefault, new Tap(MANAGER_KEY, null)));
            if (missingIcons) FocusAddons.MAIN.post(FocusAddons.safely("requestIcons", AddonsMenu::requestIcons));

            int at = groups.size();
            for (int i = 0; i < groups.size(); i++) {
                if (SETTINGS_GROUP_ID.equals(a.groupId.invoke(groups.get(i)))) {
                    at = i;
                    break;
                }
            }
            groups.add(at, a.row.newInstance(GROUP_ID, items));
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "addMenuItems", t);
        }
    }

    /** MenuMiddleware.invoke(store, next, action) entry: runs our entries' taps. */
    static void onMenuAction(Object action) {
        Api a = api;
        if (action == null || a == null || !a.tapped.isInstance(action)) return;
        try {
            Object item = a.tappedItem.get(action);
            if (item == null || !Proxy.isProxyClass(item.getClass())) return;
            InvocationHandler handler = Proxy.getInvocationHandler(item);
            if (!(handler instanceof Tap)) return;
            Tap tap = (Tap) handler;
            // Focus dismisses the menu after this returns; the entry runs after that.
            FocusAddons.MAIN.post(FocusAddons.safely("menu " + tap.key, tap::run));
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "onMenuAction", t);
        }
    }

    /** Loads the icon of every installed add-on that has none yet (main thread). */
    static void requestIcons() {
        WebExtensionController controller = FocusAddons.controller;
        Application app = FocusAddons.app;
        if (controller == null || app == null) return;
        int size = px(app, ICON_DP);
        controller.list().accept(extensions -> {
            if (extensions == null) return;
            for (WebExtension extension : extensions) {
                if (extension == null || extension.isBuiltIn || extension.metaData == null) continue;
                String id = extension.id;
                if (id == null || extension.metaData.icon == null || icons.containsKey(id) || !iconRequests.add(id)) continue;
                try {
                    // A failed load stays in iconRequests: the entry goes on without an icon.
                    extension.metaData.icon.getBitmap(size).accept(bitmap -> {
                        if (bitmap instanceof Bitmap) {
                            icons.put(id, new BitmapDrawable(app.getResources(), (Bitmap) bitmap));
                        }
                    }, error -> Log.w(FocusAddons.TAG, "icon " + id, error));
                } catch (Throwable t) {
                    Log.w(FocusAddons.TAG, "icon " + id, t);
                }
            }
        }, error -> Log.w(FocusAddons.TAG, "list", error));
    }

    // ---------------------------------------------------------------------------------------

    private static final class BrowserAction {
        final String id;
        final String title;
        final boolean enabled;
        final Object onClick;

        BrowserAction(String id, String title, boolean enabled, Object onClick) {
            this.id = id;
            this.title = title;
            this.enabled = enabled;
            this.onClick = onClick;
        }
    }

    /**
     * The browser action of every enabled, user-installed add-on, with the selected tab's
     * overrides applied the way Focus's own webCompatReporterAction does: the tab's title and
     * enabled state win when set, and the tab's action (with its own onClick) replaces the global one.
     */
    private static List<BrowserAction> browserActions(Api a, Object browserState) throws Exception {
        List<BrowserAction> actions = new ArrayList<>();
        Map<?, ?> extensions = (Map<?, ?>) a.extensions.get(browserState);
        if (extensions == null) return actions;
        Object tab = a.selectedTab.invoke(null, browserState);
        Map<?, ?> tabStates = null;
        if (tab != null) {
            Method getExtensionState = tab.getClass().getMethod("getExtensionState");
            tabStates = (Map<?, ?>) getExtensionState.invoke(tab);
        }
        for (Object state : extensions.values()) {
            if (state == null || !a.extensionEnabled.getBoolean(state) || a.extensionBuiltIn.getBoolean(state)) continue;
            Object action = a.browserAction.get(state);
            if (action == null) continue;
            String id = (String) a.extensionId.get(state);
            Object tabState = tabStates == null || id == null ? null : tabStates.get(id);
            Object tabAction = tabState == null ? null : a.browserAction.get(tabState);

            String title = tabAction == null ? null : (String) a.actionTitle.get(tabAction);
            if (title == null) title = (String) a.actionTitle.get(action);
            if (title == null) title = (String) a.extensionName.get(state);
            if (title == null) title = id;
            Boolean enabled = tabAction == null ? null : (Boolean) a.actionEnabled.get(tabAction);
            if (enabled == null) enabled = (Boolean) a.actionEnabled.get(action);
            Object onClick = a.actionOnClick.get(tabAction != null ? tabAction : action);
            actions.add(new BrowserAction(id, title, !Boolean.FALSE.equals(enabled), onClick));
        }
        Collections.sort(actions, (x, y) -> x.title.compareToIgnoreCase(y.title));
        return actions;
    }

    /** The menu's tap target: a ToolbarMenu$FocusMenuItem proxy, equal for the same key and click. */
    private static final class Tap implements InvocationHandler {
        final String key;
        final Object onClick;

        Tap(String key, Object onClick) {
            this.key = key;
            this.onClick = onClick;
        }

        void run() {
            if (MANAGER_KEY.equals(key)) {
                AddonsManager.open();
            } else if (onClick instanceof Function0) {
                // Android Components' Action.onClick: WebExtension.Action.click(), whose popup
                // reaches FocusAddons.onOpenPopup.
                ((Function0<?>) onClick).invoke();
            }
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            switch (method.getName()) {
                case "equals":
                    Object other = args == null || args.length != 1 ? null : args[0];
                    if (other == null || !Proxy.isProxyClass(other.getClass())) return false;
                    InvocationHandler handler = Proxy.getInvocationHandler(other);
                    return handler instanceof Tap && key.equals(((Tap) handler).key) && onClick == ((Tap) handler).onClick;
                case "hashCode":
                    return key.hashCode();
                case "toString":
                    return "MorpheAddonMenuItem(" + key + ")";
                default:
                    return null;
            }
        }
    }

    // ---------------------------------------------------------------------------------------

    private static synchronized Api api() {
        if (api == null && !apiFailed) {
            try {
                api = new Api();
            } catch (Throwable t) {
                apiFailed = true;
                Log.e(FocusAddons.TAG, "the Focus menu classes changed; no add-on menu entries", t);
            }
        }
        return api;
    }

    /** The Focus 159 / Android Components members the menu entries use, resolved once. */
    private static final class Api {
        final Class<?> text = cls("mozilla.components.compose.base.text.Text");
        final Constructor<?> textString = cls("mozilla.components.compose.base.text.Text$String").getConstructor(String.class);
        final Class<?> menuEvent = cls("mozilla.components.compose.menu.store.MenuEvent");
        final Class<?> menuItemIcon = cls("mozilla.components.compose.menu.ui.MenuItemIcon");
        final Constructor<?> iconDrawable = cls("mozilla.components.compose.menu.ui.MenuItemIconDrawable").getConstructor(Drawable.class);
        final Class<?> menuItemState = cls("mozilla.components.compose.menu.ui.MenuItemState");
        final Object stateDefault = menuItemState.getField("DEFAULT").get(null);
        final Object stateDisabled = menuItemState.getField("DISABLED").get(null);
        final Method groupId = cls("mozilla.components.compose.menu.data.MenuItemsGroup").getMethod("getId");
        final Constructor<?> row = cls("mozilla.components.compose.menu.data.MenuItemsGroup$Row").getConstructor(String.class, List.class);
        final Constructor<?> standardItem = standardItemConstructor();

        final Class<?> focusMenuItem = cls("org.mozilla.focus.menu.ToolbarMenu$FocusMenuItem");
        final Class<?> tapped = cls("org.mozilla.focus.menu.MenuItemTapped");
        final Constructor<?> tappedConstructor = tapped.getConstructor(focusMenuItem);
        final Field tappedItem = tapped.getField("item");

        final Class<?> browserState = cls("mozilla.components.browser.state.state.BrowserState");
        final Field extensions = browserState.getField("extensions");
        final Method selectedTab = cls("mozilla.components.browser.state.selector.SelectorsKt").getMethod("getSelectedTab", browserState);
        final Class<?> extensionState = cls("mozilla.components.browser.state.state.WebExtensionState");
        final Field extensionId = extensionState.getField("id");
        final Field extensionName = extensionState.getField("name");
        final Field extensionEnabled = extensionState.getField("enabled");
        final Field extensionBuiltIn = extensionState.getField("isBuiltIn");
        final Field browserAction = extensionState.getField("browserAction");
        final Class<?> action = cls("mozilla.components.concept.engine.webextension.Action");
        final Field actionTitle = action.getField("title");
        final Field actionEnabled = action.getField("enabled");
        final Field actionOnClick = action.getField("onClick");

        Api() throws Exception {
            if (!Function0.class.isAssignableFrom(actionOnClick.getType())) {
                throw new IllegalStateException("Action.onClick is " + actionOnClick.getType() + ", not a Function0");
            }
        }

        private static Class<?> cls(String name) throws ClassNotFoundException {
            return Class.forName(name, false, AddonsMenu.class.getClassLoader());
        }

        /** The widest public StandardMenuItem constructor naming title, event, icon and state. */
        private Constructor<?> standardItemConstructor() throws ClassNotFoundException {
            Constructor<?> best = null;
            for (Constructor<?> candidate : cls("mozilla.components.compose.menu.data.StandardMenuItem").getConstructors()) {
                List<Class<?>> types = Arrays.asList(candidate.getParameterTypes());
                if (!types.contains(text) || !types.contains(menuEvent) || !types.contains(menuItemIcon)
                        || !types.contains(menuItemState)) continue;
                if (best == null || candidate.getParameterCount() > best.getParameterCount()) best = candidate;
            }
            if (best == null) throw new IllegalStateException("no StandardMenuItem(Text, MenuEvent, MenuItemIcon, MenuItemState) constructor");
            return best;
        }

        /**
         * new StandardMenuItem(...): the first Text is the title, then the event, icon and state;
         * every other reference is null (content description, badge) and every int is 0, so R8's
         * default mask marks nothing as defaulted.
         */
        Object item(String title, Drawable icon, Object state, Tap tap) throws Exception {
            Object item = Proxy.newProxyInstance(focusMenuItem.getClassLoader(), new Class<?>[]{focusMenuItem}, tap);
            Object event = tappedConstructor.newInstance(item);
            Object menuIcon = icon == null ? null : iconDrawable.newInstance(icon);
            Class<?>[] types = standardItem.getParameterTypes();
            Object[] args = new Object[types.length];
            boolean titleSet = false;
            for (int i = 0; i < types.length; i++) {
                Class<?> type = types[i];
                if (type == int.class) args[i] = 0;
                else if (type == boolean.class) args[i] = false;
                else if (type == long.class) args[i] = 0L;
                else if (type == text && !titleSet) {
                    args[i] = textString.newInstance(title);
                    titleSet = true;
                } else if (type == menuEvent) args[i] = event;
                else if (type == menuItemIcon) args[i] = menuIcon;
                else if (type == menuItemState) args[i] = state;
            }
            return standardItem.newInstance(args);
        }
    }

    // ---------------------------------------------------------------------------------------

    private static int px(Context context, int dp) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics()));
    }

    /** A puzzle-piece outline in Focus's primary text colour (Focus ships no add-on icon). */
    private static Drawable managerIcon() {
        Activity activity = FocusAddons.foregroundActivity();
        Context context = activity != null ? activity : FocusAddons.app;
        if (context == null) return null;
        int color = FocusAddons.isNight(context) ? 0xFFFBFBFE : 0xFF15141A;
        try {
            Resources resources = context.getResources();
            int id = resources.getIdentifier("primaryText", "color", context.getPackageName());
            if (id != 0) color = context.getColor(id);
        } catch (Throwable ignored) {
        }
        if (managerIcon == null || managerIconColor != color) {
            managerIcon = new PuzzleDrawable(color, px(context, ICON_DP));
            managerIconColor = color;
        }
        return managerIcon;
    }

    private static final class PuzzleDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int size;

        PuzzleDrawable(int color, int size) {
            this.size = size;
            paint.setColor(color);
            paint.setStyle(Paint.Style.FILL);
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            // A 24-unit grid: a rounded square body with a knob on top and one on the right. The
            // shapes overlap and are filled, so they read as one piece.
            float unit = Math.min(bounds.width(), bounds.height()) / 24f;
            float left = bounds.left + 3 * unit;
            float top = bounds.top + 7 * unit;
            float side = 14 * unit;
            path.reset();
            path.addRoundRect(new RectF(left, top, left + side, top + side), 2 * unit, 2 * unit, Path.Direction.CW);
            path.addCircle(left + side / 2, top - unit, 3 * unit, Path.Direction.CW);
            path.addCircle(left + side + unit, top + side / 2, 3 * unit, Path.Direction.CW);
        }

        @Override
        public void draw(Canvas canvas) {
            canvas.drawPath(path, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
