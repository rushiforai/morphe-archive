/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-11-20
 */

package app.morphe.extension.youtube.patches.utils;

import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.patches.player.MiniplayerPatch;
import app.morphe.extension.youtube.patches.player.PlayerPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.utils.ExtendedUtils;

@SuppressWarnings("unused")
public class PlayerControlsPatch {

    public static WeakReference<ImageView> fullscreenButtonRef = new WeakReference<>(null);

    // The button's attach listener owns the binding. Neither the map key nor value should keep it alive.
    private static final Map<ImageView, WeakReference<FullscreenButtonBinding>> fullscreenButtonBindings =
            new WeakHashMap<>();

    private static final class FullscreenButtonBinding implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnPreDrawListener {
        private final ImageView button;
        private final boolean hasVisibilityCallbacks = fullscreenButtonVisibilityCallbacksExist();
        private final int rowId;
        private final int timestampsId;
        private final int chapterTitleId;

        @Nullable private ViewTreeObserver observer;
        @Nullable private Drawable styledBackground;
        @Nullable private ViewGroup container;
        @Nullable private View row;
        @Nullable private View timestamps;
        @Nullable private View chapterTitle;

        private int lastVisibility = View.VISIBLE;
        private boolean layoutDirty = true;
        private boolean followFullscreenX;
        private boolean followLegacyRowY;
        private float rowSpacingOffset;
        private float legacyCenterOffset;
        private float fullscreenX;
        private float legacyRowY;

        FullscreenButtonBinding(ImageView button) {
            this.button = button;
            rowId = findResourceId("revanced_overlay_buttons_scroll_view");
            timestampsId = rowId == 0 ? 0 : findResourceId("timestamps_container");
            chapterTitleId = rowId == 0 ? 0 : findResourceId("time_bar_chapter_title_container");
        }

        private int findResourceId(String name) {
            return ResourceUtils.getIdentifier(name, ResourceType.ID, button.getContext());
        }

        @Override
        public void onViewAttachedToWindow(View view) {
            if (observer != null) return;

            ViewTreeObserver tree = view.getViewTreeObserver();
            observer = tree;
            tree.addOnPreDrawListener(this);
            if (rowId != 0 || hasVisibilityCallbacks) {
                tree.addOnGlobalLayoutListener(this);
            }
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            ViewTreeObserver tree = observer;
            observer = null;
            if (tree != null && tree.isAlive()) {
                tree.removeOnPreDrawListener(this);
                if (rowId != 0 || hasVisibilityCallbacks) {
                    tree.removeOnGlobalLayoutListener(this);
                }
            }

            styledBackground = null;
            invalidateLayout();
        }

        void invalidateLayout() {
            container = null;
            row = null;
            timestamps = null;
            chapterTitle = null;
            layoutDirty = true;
        }

        @Override
        public void onGlobalLayout() {
            if (observer == null) return;

            layoutDirty = true;
            if (!hasVisibilityCallbacks) return;

            // View#onVisibilityChanged() is protected; preserve the injected global-layout callbacks.
            try {
                int visibility = button.getVisibility();
                if (lastVisibility != visibility) {
                    lastVisibility = visibility;

                    Logger.printDebug(() -> "fullscreen button visibility: "
                            + (visibility == View.VISIBLE ? "VISIBLE" :
                            visibility == View.GONE ? "GONE" : "INVISIBLE"));

                    fullscreenButtonVisibilityChanged(visibility == View.VISIBLE);
                }
            } catch (Exception ex) {
                Logger.printDebug(() -> "OnGlobalLayoutListener failure", ex);
            }
        }

        @Override
        public boolean onPreDraw() {
            if (observer == null) return true;

            try {
                styleSourceBackground();
                if (rowId != 0) {
                    updateOverlayAlignment();
                }
            } catch (Exception ex) {
                Logger.printDebug(() -> "Could not update fullscreen button styling", ex);
            }
            return true;
        }

        private void styleSourceBackground() {
            // Native binding can replace the circle after layout, including with a drawable sharing its old state.
            Drawable background = button.getBackground();
            if (background == styledBackground) return;

            if (background != null) {
                Drawable styled = PlayerPatch.applyControlButtonsBackgroundOpacity(background);
                if (styled != background) {
                    button.setBackground(styled);
                    layoutDirty = true;
                }
                background = styled;
            }
            styledBackground = background;
        }

        private void updateOverlayAlignment() {
            ViewGroup parent = button.getParent() instanceof ViewGroup group ? group : null;
            if (container != parent) {
                invalidateLayout();
                container = parent;
            }

            boolean layoutChanged = layoutDirty;
            if (layoutChanged) {
                refreshOverlayLayout();
                layoutDirty = false;
            }
            if (row == null) return;

            // Native translations can change without a layout. Follow the inputs without re-scanning the row
            // or overwriting the source button's transform on every draw.
            if (followFullscreenX) {
                float x = button.getX();
                if (layoutChanged || fullscreenX != x) {
                    fullscreenX = x;
                    row.setTranslationX(x + rowSpacingOffset);
                }
            }
            if (followLegacyRowY) {
                float y = row.getY();
                if (layoutChanged || legacyRowY != y) {
                    legacyRowY = y;
                    button.setTranslationY(y + legacyCenterOffset);
                }
            }
        }

        private void refreshOverlayLayout() {
            followFullscreenX = false;
            followLegacyRowY = false;
            if (container == null) return;

            // Check missing/replaced views on layout, not on every draw: some are inflated from native stubs.
            row = resolveLayoutView(container, row, rowId);
            timestamps = resolveLayoutView(container, timestamps, timestampsId);
            chapterTitle = resolveLayoutView(container, chapterTitle, chapterTitleId);

            // In the modern layout keep the full content height and center on the native icon.
            float verticalOffset = (button.getPaddingTop() - button.getPaddingBottom()) / 2f;
            centerModernOverlay(row, verticalOffset);
            centerModernOverlay(timestamps, verticalOffset);
            centerModernOverlay(chapterTitle, verticalOffset);
            if (row == null) return;

            if (Settings.HIDE_PLAYER_FULLSCREEN_BUTTON.get()) {
                // The native view can remain offscreen for visibility callbacks. Leave it there.
                row.setTranslationX(container.getWidth() - container.getPaddingRight() - row.getRight());
                return;
            }

            // YouTube can re-anchor the legacy control. Center its icon on the configured row.
            if ("morphe_legacy_overlay".equals(row.getTag())) {
                followLegacyRowY = true;
                legacyCenterOffset = (row.getHeight() - button.getHeight()) / 2f - button.getTop() - verticalOffset;
            }

            // Use one custom slot between icon centers without changing scrolling or internal spacing.
            int slotWidth = getLastOccupiedSlotWidth(row);
            if (slotWidth > 0) {
                followFullscreenX = true;
                rowSpacingOffset = (button.getWidth() + button.getPaddingLeft() - button.getPaddingRight()
                        - slotWidth) / 2f - row.getRight();
            }
        }

        @Nullable
        private static View resolveLayoutView(ViewGroup container, @Nullable View cached, int id) {
            if (id == 0) return null;

            if (cached != null && cached.getId() == id && cached.isAttachedToWindow()) {
                for (ViewParent parent = cached.getParent(); parent != null; parent = parent.getParent()) {
                    if (parent == container) return cached;
                }
            }
            return container.findViewById(id);
        }

        private static void centerModernOverlay(@Nullable View view, float offset) {
            if (view != null && "morphe_modern_overlay".equals(view.getTag())) {
                view.setTranslationY(offset);
            }
        }

        private static int getLastOccupiedSlotWidth(View row) {
            if (row instanceof ViewGroup scroll && scroll.getChildAt(0) instanceof ViewGroup buttons) {
                for (int i = buttons.getChildCount() - 1; i >= 0; i--) {
                    View slot = buttons.getChildAt(i);
                    if (slot.getVisibility() != View.GONE && slot.getWidth() > 0) {
                        return slot.getWidth();
                    }
                }
            }
            return 0;
        }
    }

    private static boolean fullscreenButtonVisibilityCallbacksExist() {
        return false; // Modified during patching if needed.
    }

    /**
     * Injection point.
     */
    public static void setFullscreenCloseButton(ImageView imageButton) {
        if (fullscreenButtonRef.get() != imageButton) {
            fullscreenButtonRef = new WeakReference<>(imageButton);
        }
        if (!ExtendedUtils.IS_21_29_OR_GREATER) {
            MiniplayerPatch.fixMinimalMiniplayerFullscreenButtonTint(imageButton);
        }
        Logger.printDebug(() -> "Fullscreen button set");

        WeakReference<FullscreenButtonBinding> bindingRef = fullscreenButtonBindings.get(imageButton);
        FullscreenButtonBinding binding = bindingRef == null ? null : bindingRef.get();
        if (binding != null) {
            binding.invalidateLayout();
            return;
        }

        binding = new FullscreenButtonBinding(imageButton);
        fullscreenButtonBindings.put(imageButton, new WeakReference<>(binding));
        imageButton.addOnAttachStateChangeListener(binding);
        if (imageButton.isAttachedToWindow()) {
            binding.onViewAttachedToWindow(imageButton);
        }
    }

    // noinspection EmptyMethod
    private static void fullscreenButtonVisibilityChanged(boolean isVisible) {
        // Code added during patching.
    }

    /**
     * Injection point.
     */
    public static String getPlayerTopControlsLayoutResourceName(String original) {
        return "default";
    }

    /**
     * Injection point.
     */
    public static boolean forcePlayerSeekbar(boolean original) {
        if (!original) {
            Logger.printDebug(() -> "Player seekbar feature flag is off");
        }
        return true;
    }

    // Ported from Morphe c3431a3 (#3649).
    /**
     * The value the app has for the new player overlays flag, before it is forced off.
     */
    private static volatile boolean newPlayerOverlaysOriginal;

    /**
     * Injection point.
     */
    public static boolean disableNewPlayerOverlays(boolean original) {
        newPlayerOverlaysOriginal = original;
        return false;
    }

    /**
     * Injection point.
     * Called right after the flag is read, so the value is the one just stored.
     */
    public static boolean getOriginalNewPlayerOverlays(boolean overridden) {
        return newPlayerOverlaysOriginal;
    }

    /**
     * Injection point for player feature flags that select the modern layout.
     *
     * <p>The setting is only exposed by the patch on supported YouTube versions, but keeping the
     * method safe on every version lets the same extension code be shared by all patched builds.</p>
     */
    public static boolean useModernPlayerLayout(boolean original) {
        return !restoreOldPlayerButtons() && original;
    }

    /** Injection point for modern top-control layout feature flags. */
    public static boolean useModernPlayerTopControls(boolean original) {
        return !restoreOldPlayerButtons() && original;
    }

    /** Injection point for layout flags that are incompatible with the old player controls. */
    public static boolean allowModernPlayerLayoutFlags(boolean original) {
        return !restoreOldPlayerButtons() && original;
    }

    /**
     * Injection point for feature flags selecting YouTube's alternate bottom-controls layout.
     *
     * <p>The alternate layout is required for bold player controls. When bold icons are disabled,
     * or the user explicitly requests the old player buttons, keep the legacy layout.</p>
     */
    public static boolean usePlayerBottomControlsExploderLayout(boolean original) {
        return !restoreOldPlayerButtons();
    }

    /**
     * @return If the player shows the old thin buttons instead of the bold ones.
     */
    @SuppressWarnings("BooleanMethodIsAlwaysInverted")
    public static boolean restoreOldPlayerButtons() {
        return Settings.RESTORE_OLD_PLAYER_BUTTONS.get()
                || !ExtendedUtils.IS_20_31_OR_GREATER
                || ExtendedUtils.isSpoofingToLessThan("20.31.00");
    }
}
