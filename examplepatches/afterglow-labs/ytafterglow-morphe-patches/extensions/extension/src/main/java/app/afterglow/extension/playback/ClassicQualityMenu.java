/* Native Advanced-row behavior and the collection binder boundary adapted from Morphe
 * patches v2.2.0 (GPLv3), https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Rewritten for Afterglow: identify each sheet from its own root element, preserve native
 * visibility and callbacks, and reject detached or replaced sheets. No global menu flag.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.playback;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import app.afterglow.extension.Afterglow;

/** Opens the native resolution list through the current quality sheet's Advanced action. */
public final class ClassicQualityMenu {
    public interface ClickAction {
        Object afterglow_clickTarget();
    }
    public interface ClickTarget { java.util.List<?> afterglow_clickCommands(); }
    public interface ClickCommand { byte[] afterglow_commandBytes(); }
    public interface ClickHost { Object afterglow_clickAction(); }
    public interface Element { byte[] afterglow_elementBytes(); }
    public interface Items {
        int afterglow_itemCount();
        Object afterglow_firstItem();
    }

    private ClassicQualityMenu() {}

    public static void attach(ViewGroup view, Object adapter) {
        if (view == null || !(adapter instanceof Items)) return;
        try {
            Binding binding = new Binding(view, (Items) adapter);
            view.addOnAttachStateChangeListener(binding);
            if (view.isAttachedToWindow()) binding.onViewAttachedToWindow(view);
        } catch (Throwable error) { Afterglow.error("ClassicQualityMenu.attach", error); }
    }

    private static final class Binding implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnDrawListener {
        final ViewGroup view;
        final Items items;
        ViewTreeObserver observer;
        Object handled;
        Runnable pending;
        boolean disabled;

        Binding(ViewGroup view, Items items) { this.view = view; this.items = items; }

        @Override public void onViewAttachedToWindow(View ignored) {
            try {
                if (view.getId() == View.NO_ID || !"bottom_sheet_list".equals(
                        view.getResources().getResourceEntryName(view.getId()))) return;
                observer = view.getViewTreeObserver();
                observer.addOnDrawListener(this);
            } catch (android.content.res.Resources.NotFoundException ignoredId) {
                // Other native collections do not participate.
            }
        }

        @Override public void onViewDetachedFromWindow(View ignored) {
            if (observer != null && observer.isAlive()) observer.removeOnDrawListener(this);
            observer = null;
            if (pending != null) view.removeCallbacks(pending);
            pending = null;
            handled = null;
        }

        @Override public void onDraw() {
            if (disabled || pending != null || !PlayerBehavior.useClassicQualityMenu(false) || !view.isShown()) return;
            try {
                if (items.afterglow_itemCount() != 1) return;
                Object item = items.afterglow_firstItem();
                if (item == null || item == handled) return;
                if (!(item instanceof Element) || !QualitySheetIdentity.isQuick(((Element) item).afterglow_elementBytes())) {
                    handled = item;
                    return;
                }
                if (view.getChildCount() != 1 || !(view.getChildAt(0) instanceof ViewGroup)) return;
                ViewGroup options = (ViewGroup) view.getChildAt(0);
                if (options.getChildCount() < 4) return;
                // Confirm the native four-option shape before using its Advanced row.
                for (int i = 0; i < 4; i++) if (!options.getChildAt(i).isClickable()) return;
                View advanced = options.getChildAt(3);
                if (!advanced.isEnabled() || !advanced.hasOnClickListeners()) return;
                if (!hasResolutions(advanced)) return;
                pending = () -> {
                    try {
                        if (view.isAttachedToWindow() && view.isShown() && advanced.getParent() == options
                                && PlayerBehavior.useClassicQualityMenu(false)
                                && items.afterglow_itemCount() == 1 && items.afterglow_firstItem() == item
                                && hasResolutions(advanced)) {
                            handled = item;
                            advanced.callOnClick();
                        }
                    } catch (Throwable error) { Afterglow.error("ClassicQualityMenu.open", error); }
                    finally { pending = null; view.invalidate(); }
                };
                // Leave the draw traversal before the native action replaces its sheet.
                // Readiness comes from the mounted command data, never elapsed time.
                view.postOnAnimation(pending);
            } catch (Throwable error) {
                Afterglow.error("ClassicQualityMenu.bind", error);
                disabled = true;
            }
        }
    }

    private static boolean hasResolutions(View advanced) {
        if (!(advanced instanceof ClickHost)) return false;
        Object action = ((ClickHost) advanced).afterglow_clickAction();
        if (!(action instanceof ClickAction)) return false;
        Object target = ((ClickAction) action).afterglow_clickTarget();
        if (!(target instanceof ClickTarget)) return false;
        java.util.List<?> commands = ((ClickTarget) target).afterglow_clickCommands();
        if (commands == null || commands.size() > 32) return false;
        for (Object command : commands) {
            if (command instanceof ClickCommand && QualitySheetIdentity.hasResolutions(
                    ((ClickCommand) command).afterglow_commandBytes())) return true;
        }
        return false;
    }

}
