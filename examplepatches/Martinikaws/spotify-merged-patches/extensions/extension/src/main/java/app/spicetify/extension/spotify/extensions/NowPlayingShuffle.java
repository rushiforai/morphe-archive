package app.spicetify.extension.spotify.extensions;

import android.annotation.SuppressLint;
import android.content.res.ColorStateList;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/**
 * Replaces Now Playing's shuffle button while Shuffle+ is on: a tap toggles between Shuffle+ (true
 * Fisher-Yates random order) and standard preset order (no mixing or shuffling of the playlist),
 * and a long-press always shuffles a fresh Shuffle+ order. While Shuffle+ is off, taps pass through
 * to Spotify's own shuffle listener.
 */
public final class NowPlayingShuffle {
    private static final int SPOTIFY_GREEN = 0xFF1ED760;
    private static volatile WeakReference<View> activeButton;
    private static Field listenerInfoField;
    private static Field onClickListenerField;

    static {
        ShufflePlus.setStateObserver(NowPlayingShuffle::refreshActiveButton);
    }

    private NowPlayingShuffle() {}

    /** Hook N1. Never throws into Spotify. */
    @SuppressLint("ClickableViewAccessibility")
    public static void onButton(View button) {
        try {
            activeButton = new WeakReference<>(button);
            ensureClickWrapped(button);
            button.setOnTouchListener((v, event) -> {
                ensureClickWrapped(v);
                return false;
            });
            button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                    activeButton = new WeakReference<>(v);
                    ensureClickWrapped(v);
                    updateButtonState(v);
                }

                @Override
                public void onViewDetachedFromWindow(View v) {}
            });
            button.setOnLongClickListener(NowPlayingShuffle::onLongPress);
            // TalkBack long-presses with performLongClick, so it would get nothing from a long-press
            // offered while Shuffle+ is off. The framework asks this each time it describes the
            // button, so the switch is read fresh.
            button.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    try {
                        boolean on = Extensions.isOn(host.getContext(), Extensions.SHUFFLE_PLUS);
                        info.setLongClickable(on);
                        if (on) {
                            info.addAction(new AccessibilityNodeInfo.AccessibilityAction(
                                    AccessibilityNodeInfo.ACTION_CLICK,
                                    ShufflePlus.isShuffled() ? "Standard preset order" : "Shuffle+"));
                            info.addAction(new AccessibilityNodeInfo.AccessibilityAction(
                                    AccessibilityNodeInfo.ACTION_LONG_CLICK, "Shuffle+"));
                        } else {
                            info.removeAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK);
                        }
                    } catch (Throwable e) {
                        Log.w("Spicetify", "Couldn't describe Shuffle+ to accessibility services", e);
                    }
                }

                @Override
                public boolean performAccessibilityAction(View host, int action, Bundle args) {
                    ensureClickWrapped(host);
                    return super.performAccessibilityAction(host, action, args);
                }
            });
            updateButtonState(button);
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't add Shuffle+ to Now Playing's shuffle button", e);
        }
    }

    /**
     * Wraps {@code button}'s current {@link View.OnClickListener} in {@link ShuffleClickListener} if
     * it isn't already wrapped, so both listeners set before {@link #onButton} and listeners Spotify
     * attaches later in {@code Lp/aes;->c} are intercepted while Shuffle+ is on.
     */
    static void ensureClickWrapped(View button) {
        if (button == null) return;
        try {
            View.OnClickListener current = currentClickListener(button);
            if (current instanceof ShuffleClickListener) return;
            button.setOnClickListener(new ShuffleClickListener(current));
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't wrap Now Playing's shuffle click listener", e);
        }
    }

    private static View.OnClickListener currentClickListener(View button) throws ReflectiveOperationException {
        if (listenerInfoField == null) {
            Field info = View.class.getDeclaredField("mListenerInfo");
            info.setAccessible(true);
            listenerInfoField = info;
        }
        Object listenerInfo = listenerInfoField.get(button);
        if (listenerInfo == null) return null;
        if (onClickListenerField == null) {
            Field click = listenerInfo.getClass().getDeclaredField("mOnClickListener");
            click.setAccessible(true);
            onClickListenerField = click;
        }
        return (View.OnClickListener) onClickListenerField.get(listenerInfo);
    }

    private static void refreshActiveButton() {
        WeakReference<View> ref = activeButton;
        View button = ref != null ? ref.get() : null;
        if (button != null) {
            button.post(() -> updateButtonState(button));
        }
    }

    private static void updateButtonState(View button) {
        try {
            boolean on = Extensions.isOn(button.getContext(), Extensions.SHUFFLE_PLUS);
            boolean shuffled = on && ShufflePlus.isShuffled();
            if (on) {
                button.setActivated(shuffled);
            }
            if (button instanceof ImageView) {
                ((ImageView) button).setImageTintList(shuffled ? ColorStateList.valueOf(SPOTIFY_GREEN) : null);
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * On the main thread. Off, or on a throw, false lets the press end as a tap. On, Shuffle+ only
     * posts its run to the bridge thread, and true makes Android skip the tap and give haptic feedback.
     */
    private static boolean onLongPress(View button) {
        try {
            if (!Extensions.isOn(button.getContext(), Extensions.SHUFFLE_PLUS)) return false;
            ShufflePlus.shuffleWhatsPlaying(button.getContext());
            return true;
        } catch (Throwable e) {
            Log.w("Spicetify", "Shuffle+ from Now Playing failed", e);
            return false;
        }
    }

    private static final class ShuffleClickListener implements View.OnClickListener {
        private final View.OnClickListener fallback;

        ShuffleClickListener(View.OnClickListener fallback) {
            this.fallback = fallback;
        }

        @Override
        public void onClick(View button) {
            boolean shufflePlusOn = false;
            try {
                shufflePlusOn = Extensions.isOn(button.getContext(), Extensions.SHUFFLE_PLUS);
            } catch (Throwable e) {
                Log.w("Spicetify", "Couldn't read Shuffle+ switch on tap", e);
            }
            if (shufflePlusOn) {
                try {
                    ShufflePlus.toggleWhatsPlaying(button.getContext());
                    return;
                } catch (Throwable e) {
                    Log.w("Spicetify", "Shuffle+ toggle from Now Playing failed", e);
                }
            }
            if (fallback != null) {
                fallback.onClick(button);
            }
        }
    }
}
