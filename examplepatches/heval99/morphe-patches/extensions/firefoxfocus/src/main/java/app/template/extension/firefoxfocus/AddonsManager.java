package app.template.extension.firefoxfocus;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.util.Log;
import android.widget.Button;

import org.mozilla.geckoview.WebExtension;
import org.mozilla.geckoview.WebExtensionController;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * The Extensions manager: the installed add-ons (name, version, state) with Open settings,
 * Enable/Disable, Check for update and Remove, plus one-tap installs of uBlock Origin,
 * Violentmonkey, Tampermonkey and Dark Reader from addons.mozilla.org. Nothing is installed unless the user
 * taps Install.
 */
final class AddonsManager {

    private static final class Known {
        final String id;
        final String name;
        final String url;
        // Fallback when GeckoView reports no options page URL (e.g. before the add-on is ready).
        final String optionsPath;

        Known(String id, String name, String slug, String optionsPath) {
            this.id = id;
            this.name = name;
            this.url = "https://addons.mozilla.org/firefox/downloads/latest/" + slug + "/latest.xpi";
            this.optionsPath = optionsPath;
        }
    }

    private static final Known[] KNOWN = {
            new Known("uBlock0@raymondhill.net", "uBlock Origin", "ublock-origin", "dashboard.html"),
            new Known("{aecec67f-0d10-4fa7-b7c7-609a2db280cf}", "Violentmonkey", "violentmonkey", "options/index.html"),
            new Known("firefox@tampermonkey.net", "Tampermonkey", "tampermonkey", null),
            // No options_ui: every setting lives in the browser action popup, so open that.
            new Known("addon@darkreader.org", "Dark Reader", "darkreader", "ui/popup/index.html"),
    };

    /** Ids of installs started here; their install prompt is allowed without a second dialog. */
    private static final Set<String> pendingInstalls = new HashSet<>();

    // TabsUseCases.AddNewTabUseCase.invoke$default(useCase, url, selectTab, parentId, flags,
    // contextId, engineSession, source, searchTerms, private, ..., ..., mask) in Focus 158.0.
    // The mask marks the defaulted parameters: everything except url, selectTab and private
    // (the call AboutFragment makes, with the source left to its default as well).
    private static final int ADD_TAB_DEFAULTS_MASK = 0x1fbfc;

    private AddonsManager() {
    }

    static boolean isPendingInstall(String id) {
        return id != null && pendingInstalls.contains(id);
    }

    static int alertTheme(Context context) {
        return FocusAddons.isNight(context)
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
    }

    /**
     * Shows [builder] and colours its buttons. Some system themes resolve the dialog button colour
     * to white on the light dialog background (seen on API 35), which hides "Close" and "Cancel".
     */
    static AlertDialog show(AlertDialog.Builder builder, Context context) {
        AlertDialog dialog = builder.show();
        int color = FocusAddons.isNight(context) ? 0xFFCBB8FF : 0xFF592ACB;
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            Button button = dialog.getButton(which);
            if (button != null) button.setTextColor(color);
        }
        return dialog;
    }

    static void dismissQuietly(Dialog dialog) {
        if (dialog == null) return;
        try {
            if (dialog.isShowing()) dialog.dismiss();
        } catch (Throwable t) {
            Log.w(FocusAddons.TAG, "dismiss", t);
        }
    }

    /** The menu entry point. */
    static void open() {
        Activity activity = FocusAddons.foregroundActivity();
        if (activity == null) return;
        WebExtensionController controller = FocusAddons.controller;
        if (controller == null) {
            FocusAddons.toast("Add-ons are not ready yet. Try again in a moment.");
            return;
        }
        controller.list().accept(
                extensions -> showList(activity, controller, extensions),
                error -> FocusAddons.toast("Could not list add-ons: " + FocusAddons.describe(error)));
    }

    private static void showList(Activity activity, WebExtensionController controller, List<WebExtension> all) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        List<WebExtension> installed = new ArrayList<>();
        Set<String> installedIds = new HashSet<>();
        if (all != null) {
            for (WebExtension extension : all) {
                if (extension == null || extension.isBuiltIn) continue;
                installed.add(extension);
                installedIds.add(extension.id);
            }
        }
        Collections.sort(installed, (a, b) -> FocusAddons.nameOf(a).compareToIgnoreCase(FocusAddons.nameOf(b)));

        List<CharSequence> labels = new ArrayList<>();
        List<Runnable> actions = new ArrayList<>();
        for (WebExtension extension : installed) {
            labels.add(label(extension));
            actions.add(() -> showActions(activity, controller, extension));
        }
        for (Known known : KNOWN) {
            if (installedIds.contains(known.id)) continue;
            labels.add("Install " + known.name);
            actions.add(() -> install(controller, known));
        }

        try {
            show(new AlertDialog.Builder(activity, alertTheme(activity))
                    .setTitle("Extensions")
                    .setItems(labels.toArray(new CharSequence[0]), (dialog, which) -> actions.get(which).run())
                    .setNegativeButton("Close", null), activity);
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "showList", t);
        }
    }

    private static String label(WebExtension extension) {
        StringBuilder label = new StringBuilder(FocusAddons.nameOf(extension));
        WebExtension.MetaData metaData = extension.metaData;
        if (metaData != null) {
            if (metaData.version != null) label.append(' ').append(metaData.version);
            if (!metaData.enabled) label.append(" (disabled)");
        }
        return label.toString();
    }

    private static void showActions(Activity activity, WebExtensionController controller, WebExtension extension) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        String name = FocusAddons.nameOf(extension);
        boolean enabled = extension.metaData == null || extension.metaData.enabled;
        CharSequence[] labels = {
                "Open settings",
                enabled ? "Disable" : "Enable",
                "Check for update",
                "Remove",
        };
        try {
            show(new AlertDialog.Builder(activity, alertTheme(activity))
                    .setTitle(label(extension))
                    .setItems(labels, (dialog, which) -> {
                        if (which == 0) {
                            openSettings(activity, extension);
                        } else if (which == 1) {
                            setEnabled(controller, extension, !enabled);
                        } else if (which == 2) {
                            checkForUpdate(controller, extension);
                        } else {
                            AddonPromptDelegate.confirm(activity, "Remove " + name + "?",
                                    "Its settings and data are deleted.", "Remove",
                                    remove -> {
                                        if (remove) uninstall(controller, extension);
                                    });
                        }
                    })
                    .setNegativeButton("Close", null), activity);
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "showActions", t);
        }
    }

    private static void install(WebExtensionController controller, Known known) {
        if (!pendingInstalls.add(known.id)) {
            FocusAddons.toast(known.name + " is already being installed.");
            return;
        }
        FocusAddons.toast("Installing " + known.name + "…");
        try {
            controller.install(known.url, WebExtensionController.INSTALLATION_METHOD_MANAGER).accept(extension -> {
                pendingInstalls.remove(known.id);
                FocusAddons.toast(known.name + " installed.");
                // The install prompt granted private browsing; make sure of it, since every Focus
                // tab is private and the add-on does nothing without it.
                if (FocusAddons.needsPrivateBrowsing(extension)) {
                    controller.setAllowedInPrivateBrowsing(extension, true).accept(
                            updated -> FocusAddons.refreshAndroidComponents(),
                            error -> Log.w(FocusAddons.TAG, "setAllowedInPrivateBrowsing", error));
                }
            }, error -> {
                pendingInstalls.remove(known.id);
                FocusAddons.toast("Could not install " + known.name + ": " + FocusAddons.describe(error));
            });
        } catch (Throwable t) {
            pendingInstalls.remove(known.id);
            Log.e(FocusAddons.TAG, "install", t);
            FocusAddons.toast("Could not install " + known.name + ": " + FocusAddons.describe(t));
        }
    }

    private static void setEnabled(WebExtensionController controller, WebExtension extension, boolean enable) {
        String name = FocusAddons.nameOf(extension);
        int source = WebExtensionController.EnableSource.USER;
        (enable ? controller.enable(extension, source) : controller.disable(extension, source)).accept(
                updated -> FocusAddons.toast(name + (enable ? " enabled." : " disabled.")),
                error -> FocusAddons.toast("Could not change " + name + ": " + FocusAddons.describe(error)));
    }

    private static void checkForUpdate(WebExtensionController controller, WebExtension extension) {
        String name = FocusAddons.nameOf(extension);
        FocusAddons.toast("Checking " + name + " for updates…");
        controller.update(extension).accept(updated -> {
            if (updated == null) {
                FocusAddons.toast(name + " is up to date.");
                return;
            }
            String version = updated.metaData != null ? updated.metaData.version : null;
            FocusAddons.toast(name + " updated" + (version != null ? " to " + version : "") + ".");
            FocusAddons.refreshAndroidComponents();
        }, error -> FocusAddons.toast("Update check failed: " + FocusAddons.describe(error)));
    }

    private static void uninstall(WebExtensionController controller, WebExtension extension) {
        String name = FocusAddons.nameOf(extension);
        controller.uninstall(extension).accept(
                done -> FocusAddons.toast(name + " removed."),
                error -> FocusAddons.toast("Could not remove " + name + ": " + FocusAddons.describe(error)));
    }

    // ---------------------------------------------------------------------------------------

    private static void openSettings(Activity activity, WebExtension extension) {
        String name = FocusAddons.nameOf(extension);
        WebExtension.MetaData metaData = extension.metaData;
        if (metaData != null && !metaData.enabled) {
            FocusAddons.toast("Enable " + name + " first.");
            return;
        }
        String url = metaData != null ? metaData.optionsPageUrl : null;
        if (url == null && metaData != null && metaData.baseUrl != null) {
            for (Known known : KNOWN) {
                if (known.id.equals(extension.id) && known.optionsPath != null) {
                    url = metaData.baseUrl + (metaData.baseUrl.endsWith("/") ? "" : "/") + known.optionsPath;
                }
            }
        }
        if (url == null) {
            FocusAddons.toast(name + " has no settings page.");
            return;
        }
        // A real private Focus tab, opened from inside the app (an Intent would load the page
        // with a NullPrincipal and moz-extension pages refuse that). If Focus's tab API has
        // changed, show the page in a full-screen GeckoView instead.
        if (!openPrivateTab(url)) GeckoViewDialog.showPage(activity, name, url);
    }

    /**
     * components.tabsUseCases.addTab(url, selectTab = true, private = true), then
     * appStore.dispatch(AppAction.OpenTab(tabId)) so Focus shows it, all by reflection on Focus's
     * unobfuscated names. Returns false (nothing opened) if any of them is missing.
     */
    private static boolean openPrivateTab(String url) {
        Application application = FocusAddons.app;
        if (application == null) return false;
        Object components;
        Object tabId;
        try {
            components = application.getClass().getMethod("getComponents").invoke(application);
            Object tabsUseCases = components.getClass().getMethod("getTabsUseCases").invoke(components);
            Object addTab = tabsUseCases.getClass().getMethod("getAddTab").invoke(tabsUseCases);
            Method invoke = null;
            for (Method method : addTab.getClass().getDeclaredMethods()) {
                Class<?>[] types = method.getParameterTypes();
                if (method.getName().equals("invoke$default") && Modifier.isStatic(method.getModifiers())
                        && types.length == 13 && types[1] == String.class && types[2] == boolean.class
                        && types[9] == boolean.class && types[12] == int.class
                        && method.getReturnType() == String.class) {
                    invoke = method;
                }
            }
            if (invoke == null) {
                Log.w(FocusAddons.TAG, "AddNewTabUseCase.invoke$default not found");
                return false;
            }
            tabId = invoke.invoke(null, addTab, url, true, null, null, null, null, null, null, true, null, null,
                    ADD_TAB_DEFAULTS_MASK);
            if (!(tabId instanceof String)) return false;
        } catch (Throwable t) {
            Log.w(FocusAddons.TAG, "openPrivateTab", t);
            return false;
        }
        // The tab exists from here on: report success even if Focus does not switch to it.
        try {
            ClassLoader loader = application.getClassLoader();
            Object appStore = components.getClass().getMethod("getAppStore").invoke(components);
            Object openTab = Class.forName("org.mozilla.focus.state.AppAction$OpenTab", true, loader)
                    .getConstructor(String.class).newInstance(tabId);
            Class<?> action = Class.forName("mozilla.components.lib.state.Action", true, loader);
            appStore.getClass().getMethod("dispatch", action).invoke(appStore, openTab);
        } catch (Throwable t) {
            Log.w(FocusAddons.TAG, "AppAction.OpenTab " + tabId, t);
        }
        return true;
    }
}
