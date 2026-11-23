package dev.materialtidal.extension.tidal.playlist;

import android.graphics.Paint;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Static hook bridge invoked from patched {@code PlaylistFragment}, {@code PlaylistPresenter},
 * {@code SecondaryActionButton}, {@code DownloadSecondaryActionButton}, and {@code Lj9e;}
 * bytecode to drive the Material 3 Expressive Playlist screen redesign.
 */
@SuppressWarnings("unused")
public final class ExpressivePlaylistBridge {

    private static final WeakHashMap<Object, ExpressivePlaylistController> CONTROLLERS = new WeakHashMap<>();
    private static final WeakHashMap<View, ExpressivePlaylistController> BUTTON_CONTROLLERS = new WeakHashMap<>();
    private static final WeakHashMap<View, Runnable> EXTERNAL_BUTTON_CALLBACKS = new WeakHashMap<>();
    private static volatile WeakReference<ExpressivePlaylistController> activeControllerRef;
    private static volatile WeakReference<AccentProvider> activeAccentProviderRef;

    /** Provides the current download-circle accent color from active media headers. */
    public interface AccentProvider {
        int getPrimaryAccent();
    }

    private ExpressivePlaylistBridge() {
    }

    public static void registerExternalButton(View button, Runnable onStateUpdated) {
        if (button != null && onStateUpdated != null) {
            EXTERNAL_BUTTON_CALLBACKS.put(button, onStateUpdated);
        }
    }

    public static void setActiveAccentProvider(AccentProvider provider) {
        activeAccentProviderRef = provider != null ? new WeakReference<>(provider) : null;
    }

    public static void clearActiveAccentProvider(AccentProvider provider) {
        WeakReference<AccentProvider> ref = activeAccentProviderRef;
        if (ref != null && ref.get() == provider) {
            activeAccentProviderRef = null;
        }
    }

    private static void registerButton(View button, ExpressivePlaylistController controller) {
        if (button != null && controller != null) {
            BUTTON_CONTROLLERS.put(button, controller);
        }
    }

    private static void unregisterButtonIfOwned(View button, ExpressivePlaylistController controller) {
        if (button != null && BUTTON_CONTROLLERS.get(button) == controller) {
            BUTTON_CONTROLLERS.remove(button);
        }
    }

    private static void unregisterButtons(ExpressivePlaylistController controller) {
        if (controller == null) {
            return;
        }
        unregisterButtonIfOwned(controller.getFavoriteButton(), controller);
        unregisterButtonIfOwned(controller.getEditButton(), controller);
        unregisterButtonIfOwned(controller.getDownloadButton(), controller);
        unregisterButtonIfOwned(controller.getPrivacyButton(), controller);
        unregisterButtonIfOwned(controller.getShareButton(), controller);
    }

    private static ExpressivePlaylistController getController(Object fragment) {
        if (fragment == null) {
            return null;
        }
        ExpressivePlaylistController controller = CONTROLLERS.get(fragment);
        if (controller != null) {
            activeControllerRef = new WeakReference<>(controller);
            activeAccentProviderRef = new WeakReference<>(controller);
        }
        return controller;
    }

    public static void onPlaylistViewCreated(Object fragment, View rootView) {
        try {
            if (fragment == null || rootView == null || !MaterialYouConfig.isExpressivePlaylistEnabled()) {
                return;
            }
            ExpressivePlaylistController prev = CONTROLLERS.remove(fragment);
            if (prev != null) {
                unregisterButtons(prev);
                prev.onDestroy();
            }

            ExpressivePlaylistController controller = new ExpressivePlaylistController(rootView);
            CONTROLLERS.put(fragment, controller);
            activeControllerRef = new WeakReference<>(controller);
            activeAccentProviderRef = new WeakReference<>(controller);

            registerButton(controller.getFavoriteButton(), controller);
            registerButton(controller.getEditButton(), controller);
            registerButton(controller.getDownloadButton(), controller);
            registerButton(controller.getPrivacyButton(), controller);
            registerButton(controller.getShareButton(), controller);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlaylistDestroyView(Object fragment) {
        try {
            if (fragment == null) {
                return;
            }
            ExpressivePlaylistController controller = CONTROLLERS.remove(fragment);
            if (controller != null) {
                unregisterButtons(controller);
                controller.onDestroy();
                clearActiveAccentProvider(controller);
                WeakReference<ExpressivePlaylistController> ref = activeControllerRef;
                if (ref != null && ref.get() == controller) {
                    activeControllerRef = null;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onPlaylistButtonsUpdated(Object fragment) {
        try {
            ExpressivePlaylistController controller = getController(fragment);
            if (controller != null) {
                controller.onButtonsUpdated();
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onPlaylistHeaderDataUpdated(Object fragment) {
        try {
            ExpressivePlaylistController controller = getController(fragment);
            if (controller != null) {
                controller.onHeaderDataUpdated();
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onPlaylistMenuCreated(Object fragment) {
        try {
            ExpressivePlaylistController controller = getController(fragment);
            if (controller != null) {
                controller.onMenuCreated();
            }
        } catch (Throwable ignored) {
        }
    }

    public static boolean onPlaylistArtworkLoading(Object fragment) {
        try {
            ExpressivePlaylistController controller = getController(fragment);
            if (controller != null) {
                return controller.onArtworkLoading();
            }
            return MaterialYouConfig.isExpressivePlaylistEnabled()
                    && MaterialYouConfig.isPlaylistHeroCoverFadeEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean onPlaylistOffsetChanged(Object fragment, View titleView, View appBar, int verticalOffset) {
        try {
            ExpressivePlaylistController controller = getController(fragment);
            return controller != null && controller.onOffsetChanged(titleView, appBar, verticalOffset);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void onSecondaryButtonStateUpdated(View button) {
        try {
            if (button == null) {
                return;
            }
            ExpressivePlaylistController controller = BUTTON_CONTROLLERS.get(button);
            if (controller != null) {
                controller.onSecondaryButtonStateUpdated();
                return;
            }
            Runnable externalCallback = EXTERNAL_BUTTON_CALLBACKS.get(button);
            if (externalCallback != null) {
                externalCallback.run();
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onDownloadButtonStateUpdated(View button) {
        try {
            if (button == null) {
                return;
            }
            ExpressivePlaylistController controller = BUTTON_CONTROLLERS.get(button);
            if (controller != null) {
                controller.onDownloadButtonStateUpdated();
                return;
            }
            Runnable externalCallback = EXTERNAL_BUTTON_CALLBACKS.get(button);
            if (externalCallback != null) {
                externalCallback.run();
            }
        } catch (Throwable ignored) {
        }
    }

    public static void tintDownloadCirclePaint(Paint paint) {
        try {
            if (paint == null) {
                return;
            }
            WeakReference<AccentProvider> extRef = activeAccentProviderRef;
            AccentProvider ext = extRef != null ? extRef.get() : null;
            if (ext != null) {
                paint.setColor(ext.getPrimaryAccent());
                return;
            }
            WeakReference<ExpressivePlaylistController> ref = activeControllerRef;
            ExpressivePlaylistController controller = ref != null ? ref.get() : null;
            if (controller != null) {
                controller.tintDownloadCirclePaint(paint);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void stylePlaylistTrackRow(View itemView, boolean isActive) {
        try {
            if (itemView == null || !MaterialYouConfig.isPlaylistTrackRowPolishEnabled()) {
                return;
            }
            WeakReference<ExpressivePlaylistController> ref = activeControllerRef;
            ExpressivePlaylistController controller = ref != null ? ref.get() : null;
            if (controller != null) {
                controller.styleTrackRow(itemView, isActive);
            }
        } catch (Throwable ignored) {
        }
    }
}
