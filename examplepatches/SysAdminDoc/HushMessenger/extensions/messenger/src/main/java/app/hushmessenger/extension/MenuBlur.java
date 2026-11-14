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
import android.view.Window;
import android.view.WindowManager;
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
 * blurs that screen instead, the way an iPhone does, and keeps a light dim so the sheet still stands out.
 * Window blur needs Android 12. Where the phone can't blur behind a window (some Samsung phones never report it, and
 * battery saver turns it off), the Messenger screen under the menu blurs itself until the menu's window goes away. A menu with no
 * Messenger screen under it keeps Messenger's own dim. Public, since the call comes from androidx's DialogFragment in
 * another package.
 */
public final class MenuBlur {
    static final String KEY = "menu_blur";
    /** How far the screen behind blurs, in dp. */
    static final int RADIUS_DP = 24;
    /** The most dim left over the blur. */
    static final float DIM = 0.25f;

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

    /** Blurs the screen behind a dialog that dims it. Anything else, and Off, Pause or safe mode, leave the window as it is. */
    public static void shown(Dialog dialog) {
        try {
            if (dialog == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !dialog.isShowing()) return;
            Window window = dialog.getWindow();
            if (window == null) return;
            WindowManager.LayoutParams attributes = window.getAttributes();
            if ((attributes.flags & WindowManager.LayoutParams.FLAG_DIM_BEHIND) == 0 || attributes.dimAmount <= 0f) return;
            if (!Settings.enabled(KEY)) return;
            if (available.test(window)) blur(window, attributes);
            else blurScreen(dialog, window, attributes);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't blur behind a menu", error);
        }
    }

    @TargetApi(Build.VERSION_CODES.S)
    private static void blur(Window window, WindowManager.LayoutParams attributes) {
        WindowManager.LayoutParams changed = new WindowManager.LayoutParams();
        changed.copyFrom(attributes);
        changed.flags |= WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
        changed.setBlurBehindRadius(radius(window));
        changed.dimAmount = Math.min(attributes.dimAmount, DIM);
        window.setAttributes(changed);
    }

    /** The phone can't blur across windows, so the Messenger screen the menu opened over blurs its own drawing. */
    private static void blurScreen(Dialog dialog, Window window, WindowManager.LayoutParams attributes) {
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
        window.setDimAmount(Math.min(attributes.dimAmount, DIM));
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

    private static Activity activity(Context context) {
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
