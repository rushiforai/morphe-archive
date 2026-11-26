package de.mobile.archive;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import okhttp3.OkHttpClient;

@SuppressWarnings("unused")
public final class ArchiveExtension {
    private static final String TAG = "MobileArchiveExt";
    private static volatile boolean initialized = false;

    public static void init(Application app) {
        if (app == null || initialized) return;
        synchronized (ArchiveExtension.class) {
            if (initialized) return;
            initialized = true;
            ArchiveManager.init(app);
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                    ArchiveUi.setCurrentActivity(activity);
                }

                @Override
                public void onActivityStarted(Activity activity) {
                    ArchiveUi.setCurrentActivity(activity);
                }

                @Override
                public void onActivityResumed(Activity activity) {
                    ArchiveUi.setCurrentActivity(activity);
                    tryInjectSettingsToolbar(activity);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
            Log.i(TAG, "mobile.de Archive Extension initialized");
        }
    }

    public static OkHttpClient.Builder attachApiInterceptor(OkHttpClient.Builder builder) {
        if (builder == null) return null;
        try {
            builder.addInterceptor(new ApiArchiveInterceptor());
            Log.i(TAG, "Attached ApiArchiveInterceptor");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to attach ApiArchiveInterceptor", t);
        }
        return builder;
    }

    public static OkHttpClient captureApiClient(OkHttpClient client) {
        if (client != null) {
            ArchiveManager mgr = ArchiveManager.get();
            if (mgr != null) {
                mgr.setApiClient(client);
                Log.i(TAG, "Captured mobile.de API OkHttpClient");
            }
        }
        return client;
    }

    public static OkHttpClient attachImageInterceptor(OkHttpClient client) {
        if (client == null) return null;
        try {
            OkHttpClient wrapped = client.newBuilder()
                    .addInterceptor(new ImageArchiveInterceptor())
                    .build();
            Log.i(TAG, "Attached ImageArchiveInterceptor");
            return wrapped;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to attach ImageArchiveInterceptor", t);
            return client;
        }
    }

    public static void injectMenu(Menu menu) {
        ArchiveUi.injectMenu(menu);
    }

    public static void bindParkedListingButton(Object viewHolder, Object parkedListingItem) {
        ArchiveUi.bindParkedListingButton(viewHolder, parkedListingItem);
    }

    public static void bindSrpListingButton(Object viewHolder, Object srpItem) {
        ArchiveUi.bindSrpListingButton(viewHolder, srpItem);
    }

    public static void bindListingCardButton(Object viewHolder, Object uiState) {
        ArchiveUi.bindListingCardButton(viewHolder, uiState);
    }

    private static void tryInjectSettingsToolbar(final Activity activity) {
        if (activity == null) return;
        String name = activity.getClass().getName();
        if (!name.endsWith("SettingsHubActivity")) return;
        try {
            Object toolbar = activity.getClass().getMethod("getToolbar").invoke(activity);
            if (toolbar != null) {
                Object menu = toolbar.getClass().getMethod("getMenu").invoke(toolbar);
                if (menu instanceof Menu) {
                    ArchiveUi.injectMenu((Menu) menu);
                }
            }
        } catch (Throwable ignored) {
        }
    }
}
