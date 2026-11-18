package app.hushmessenger.extension;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.BiConsumer;
import java.util.function.Predicate;

/**
 * Blur behind menus (#162). Every sheet, menu and dialog Messenger opens from a DialogFragment comes through shown()
 * right after it's shown, the long-press menu on a chat included. When its window dims the screen behind it, the switch
 * blurs that screen instead, the way an iPhone does, and keeps a light dim so the sheet still stands out. The menu a long
 * press on a message opens draws its own dim, so it's found by its view and blurs the chat under its dim.
 * Window blur needs Android 12. Where the phone can't blur behind a window (some Samsung phones never report it, and
 * battery saver turns it off), the Messenger screen under the menu blurs itself until the menu's window goes away. A menu with no
 * Messenger screen under it keeps Messenger's own dim. On 587 the menu on a pressed message is drawn inside the chat
 * with no window of its own, and comes through inChat() instead (see InChatMenu). Public, since the calls come from
 * androidx's DialogFragment and Messenger's ReactionsBarFragment in other packages.
 */
public final class MenuBlur {
    static final String KEY = "menu_blur";
    /** How far the screen behind blurs, in dp. */
    static final int RADIUS_DP = 24;
    /** The most dim left over the blur. */
    static final float DIM = 0.25f;
    /** The view a long press on a message fills its menu's window with. */
    static final String MESSAGE_MENU = "com.facebook.messaging.reactions.MessageReactionsOverlayView";
    /** How many views of a dialog to look through for that menu before giving up. */
    static final int MENU_SEARCH_LIMIT = 64;

    /** Whether this window can blur what's behind it right now. Tests swap it. */
    static Predicate<Window> available = MenuBlur::crossWindowBlur;
    /** Blurs a Messenger screen by the radius in pixels, or clears its blur at 0. Tests swap it. */
    static BiConsumer<View, Float> screenEffect = MenuBlur::renderEffect;

    /** Messenger screens blurred under an open menu, with how many open menus hold each. Main thread only, like dialogs. */
    static final Map<View, Integer> blurredScreens = new WeakHashMap<>();
    /** The screen each open menu blurred, so a menu shown again after a trip to the background isn't counted twice. */
    private static final Map<Dialog, View> holders = new WeakHashMap<>();
    /** Menus whose window already lifts their blur when it goes away. */
    private static final Set<Dialog> watched = Collections.newSetFromMap(new WeakHashMap<>());

    private MenuBlur() {}

    /**
     * Blurs the screen behind a dialog that dims it, or behind the menu a long press on a message opens. Anything else,
     * and Off, Pause or safe mode, leave the window as it is.
     */
    public static void shown(Dialog dialog) {
        // The long-press menu's own card (#176) rides along, since this is where every menu Messenger opens turns up.
        FloatingMenu.shown(dialog);
        try {
            if (dialog == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !dialog.isShowing()) return;
            Window window = dialog.getWindow();
            if (window == null) return;
            WindowManager.LayoutParams attributes = window.getAttributes();
            boolean dims = (attributes.flags & WindowManager.LayoutParams.FLAG_DIM_BEHIND) != 0 && attributes.dimAmount > 0f;
            if (!dims && !holdsMessageMenu(window.peekDecorView())) return;
            if (!Settings.enabled(KEY)) return;
            if (available.test(window)) blur(window, attributes, dims);
            else blurScreen(dialog, window, attributes, dims);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't blur behind a menu", error);
        }
    }

    /**
     * The menu a long press on a message opens, handed over as Messenger puts its view into the chat (#162, #176). The
     * chat around it blurs and the actions can float under the message; see InChatMenu. Never throws.
     */
    public static void inChat(View menu) {
        InChatMenu.shown(menu);
    }

    /**
     * Whether this window holds the menu a long press on a message opens. That menu covers the chat with a window
     * that draws its own dim, so the system never dims behind it. Every supported 587 build keeps the class name.
     */
    static boolean holdsMessageMenu(View root) {
        return messageMenu(root) != null;
    }

    /** That menu's own view inside a dialog, or null when the dialog is anything else. */
    static View messageMenu(View root) {
        if (root == null) return null;
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(root);
        for (int looked = 0; !queue.isEmpty() && looked < MENU_SEARCH_LIMIT; looked++) {
            View view = queue.poll();
            if (MESSAGE_MENU.equals(view.getClass().getName())) return view;
            if (!(view instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
        }
        return null;
    }

    @TargetApi(Build.VERSION_CODES.S)
    private static void blur(Window window, WindowManager.LayoutParams attributes, boolean dims) {
        WindowManager.LayoutParams changed = new WindowManager.LayoutParams();
        changed.copyFrom(attributes);
        changed.flags |= WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
        changed.setBlurBehindRadius(radius(window));
        if (dims) changed.dimAmount = Math.min(attributes.dimAmount, DIM);
        window.setAttributes(changed);
    }

    /** The phone can't blur across windows, so the Messenger screen the menu opened over blurs its own drawing. */
    private static void blurScreen(Dialog dialog, Window window, WindowManager.LayoutParams attributes, boolean dims) {
        // A menu dismissed before its window ever attached never says it's gone; let go of those first.
        for (Dialog held : new ArrayList<>(holders.keySet())) if (held != dialog && !held.isShowing()) release(held);
        if (holders.containsKey(dialog)) return;
        Activity activity = activity(dialog.getContext());
        Window behind = activity == null ? null : activity.getWindow();
        if (behind == null || activity.isFinishing()) return;
        View screen = behind.getDecorView();
        Integer held = blurredScreens.get(screen);
        if (held == null) screenEffect.accept(screen, (float) radius(window));
        blurredScreens.put(screen, held == null ? 1 : held + 1);
        holders.put(dialog, screen);
        if (dims) window.setDimAmount(Math.min(attributes.dimAmount, DIM));
        if (watched.add(dialog)) window.getDecorView().addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View view) {}

            @Override public void onViewDetachedFromWindow(View view) {
                view.removeOnAttachStateChangeListener(this);
                watched.remove(dialog);
                release(dialog);
            }
        });
    }

    /** Lifts the blur a menu put on its screen, once no other open menu holds that screen. */
    static void release(Dialog dialog) {
        try {
            View screen = holders.remove(dialog);
            if (screen == null) return;
            Integer held = blurredScreens.get(screen);
            if (held != null && held > 1) {
                blurredScreens.put(screen, held - 1);
                return;
            }
            blurredScreens.remove(screen);
            screenEffect.accept(screen, 0f);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't clear the blur behind a menu", error);
        }
    }

    private static int radius(Window window) {
        return Math.round(RADIUS_DP * window.getContext().getResources().getDisplayMetrics().density);
    }

    static Activity activity(Context context) {
        for (int depth = 0; context != null && depth < 16; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    @TargetApi(Build.VERSION_CODES.S)
    private static void renderEffect(View screen, Float radius) {
        screen.setRenderEffect(radius > 0f ? RenderEffect.createBlurEffect(radius, radius, Shader.TileMode.CLAMP) : null);
    }

    @TargetApi(Build.VERSION_CODES.S)
    private static boolean crossWindowBlur(Window window) {
        WindowManager manager = window.getWindowManager();
        return manager != null && manager.isCrossWindowBlurEnabled();
    }

    /** Forgets every held screen, for tests. */
    static void resetForTests() {
        holders.clear();
        blurredScreens.clear();
        watched.clear();
    }
}
