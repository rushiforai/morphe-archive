package dev.jason.gboardpatches.extension.websearch;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;

import java.util.List;

public final class GboardFloatingWebSearchLauncher {
    private static final String TAG = "GboardPatches";
    private static final long CONNECTION_TIMEOUT_MS = 2_500L;

    private static final String SERVICE_DESCRIPTOR =
            "android.support.customtabs.ICustomTabsService";
    private static final String CALLBACK_DESCRIPTOR =
            "android.support.customtabs.ICustomTabsCallback";
    private static final int TRANSACTION_WARMUP = 2;
    private static final int TRANSACTION_NEW_SESSION = 3;
    private static final int CALLBACK_EXTRA_WITH_RESULT = 7;
    private static final int CALLBACK_GET_INTERFACE_VERSION = 16_777_215;
    private static final int CALLBACK_INTERFACE_VERSION = 1;

    private static final String EXTRA_SESSION =
            "android.support.customtabs.extra.SESSION";
    private static final String EXTRA_TITLE_VISIBILITY =
            "android.support.customtabs.extra.TITLE_VISIBILITY";
    private static final String EXTRA_ENABLE_INSTANT_APPS =
            "android.support.customtabs.extra.EXTRA_ENABLE_INSTANT_APPS";
    private static final String EXTRA_INITIAL_ACTIVITY_HEIGHT_PX =
            "androidx.browser.customtabs.extra.INITIAL_ACTIVITY_HEIGHT_PX";
    private static final String EXTRA_ACTIVITY_HEIGHT_RESIZE_BEHAVIOR =
            "androidx.browser.customtabs.extra.ACTIVITY_HEIGHT_RESIZE_BEHAVIOR";

    private GboardFloatingWebSearchLauncher() {
    }

    public static boolean open(Context context,
            GboardFloatingWebSearchSettingsSnapshot settings) {
        try {
            if (context == null || settings == null || !settings.isEnabled()) {
                return false;
            }
            Context application = context.getApplicationContext();
            Context launchContext = application != null ? application : context;
            List<String> candidates = GboardCustomTabsProviderResolver.launchCandidates(
                    launchContext, settings.getBrowserProvider(), settings.getStartPageUrl());
            for (String providerPackage : candidates) {
                OneShotLaunch launch = new OneShotLaunch(
                        launchContext, providerPackage, settings);
                if (launch.bind()) {
                    return true;
                }
            }
            return openRegularBrowser(launchContext, settings);
        } catch (Throwable failure) {
            logFailure("Unable to prepare browser launch", failure);
            return openRegularBrowser(context, settings);
        }
    }

    static int initialHeightPx(Context context,
            GboardFloatingWebSearchSettingsSnapshot settings) {
        int screenHeight = context.getResources().getDisplayMetrics().heightPixels;
        return Math.max(1,
                Math.round(screenHeight * settings.getInitialHeightPercent() / 100.0f));
    }

    private static boolean openRegularBrowser(Context context,
            GboardFloatingWebSearchSettingsSnapshot settings) {
        try {
            if (context == null || settings == null) {
                return false;
            }
            Uri uri = Uri.parse(settings.getStartPageUrl());
            String selectedProvider = settings.getBrowserProvider();
            if (!GboardFloatingWebSearchSettings.BROWSER_SYSTEM_DEFAULT.equals(selectedProvider)
                    && startViewIntent(context, uri, selectedProvider, null)) {
                return true;
            }
            return startViewIntent(context, uri, null, null);
        } catch (Throwable failure) {
            logFailure("Unable to prepare regular browser launch", failure);
            return false;
        }
    }

    private static boolean launchCustomTab(Context context, String providerPackage,
            GboardFloatingWebSearchSettingsSnapshot settings, IBinder sessionBinder) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(settings.getStartPageUrl()));
        intent.setPackage(providerPackage);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_ANIMATION);
        Bundle session = new Bundle();
        session.putBinder(EXTRA_SESSION, sessionBinder);
        intent.putExtras(session);
        intent.putExtra(EXTRA_TITLE_VISIBILITY, 1);
        intent.putExtra(EXTRA_ENABLE_INSTANT_APPS, true);
        intent.putExtra(EXTRA_INITIAL_ACTIVITY_HEIGHT_PX,
                initialHeightPx(context, settings));
        intent.putExtra(EXTRA_ACTIVITY_HEIGHT_RESIZE_BEHAVIOR, 0);
        return startViewIntent(context, intent.getData(), providerPackage, intent);
    }

    private static boolean startViewIntent(Context context, Uri uri, String packageName,
            Intent preparedIntent) {
        Intent intent = preparedIntent != null
                ? preparedIntent
                : new Intent(Intent.ACTION_VIEW, uri);
        if (preparedIntent == null) {
            intent.addCategory(Intent.CATEGORY_BROWSABLE);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            if (packageName != null) {
                intent.setPackage(packageName);
            }
        }
        try {
            context.startActivity(intent);
            return true;
        } catch (Throwable failure) {
            logFailure("Unable to launch browser package=" + packageName, failure);
            return false;
        }
    }

    private static boolean transactWarmup(IBinder service) {
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(SERVICE_DESCRIPTOR);
            data.writeLong(0L);
            if (!service.transact(TRANSACTION_WARMUP, data, reply, 0)) {
                return false;
            }
            reply.readException();
            return reply.readInt() != 0;
        } catch (Throwable ignored) {
            return false;
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    private static boolean transactNewSession(IBinder service, IBinder callback) {
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(SERVICE_DESCRIPTOR);
            data.writeStrongBinder(callback);
            if (!service.transact(TRANSACTION_NEW_SESSION, data, reply, 0)) {
                return false;
            }
            reply.readException();
            return reply.readInt() != 0;
        } catch (Throwable ignored) {
            return false;
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    private static void logFailure(String message, Throwable failure) {
        try {
            Log.w(TAG, message, failure);
        } catch (Throwable ignored) {
            // Diagnostics cannot affect browser launch or cleanup.
        }
    }

    private static final class OneShotLaunch implements ServiceConnection {
        private final Context context;
        private final String providerPackage;
        private final GboardFloatingWebSearchSettingsSnapshot settings;
        private final Handler mainHandler = new Handler(Looper.getMainLooper());
        private final Runnable timeout = this::fallback;
        private final IBinder sessionCallback = new SessionCallbackBinder();

        private boolean bound;
        private boolean finished;

        OneShotLaunch(Context context, String providerPackage,
                GboardFloatingWebSearchSettingsSnapshot settings) {
            this.context = context;
            this.providerPackage = providerPackage;
            this.settings = settings;
        }

        boolean bind() {
            try {
                if (providerPackage == null) {
                    return false;
                }
                Intent serviceIntent = new Intent(
                        GboardCustomTabsProviderResolver.CUSTOM_TABS_SERVICE_ACTION);
                serviceIntent.setPackage(providerPackage);
                bound = context.bindService(serviceIntent, this, Context.BIND_AUTO_CREATE);
                if (!bound) {
                    return false;
                }
                if (!mainHandler.postDelayed(timeout, CONNECTION_TIMEOUT_MS)) {
                    complete();
                    return false;
                }
                return true;
            } catch (Throwable failure) {
                logFailure("Unable to bind Custom Tabs provider=" + providerPackage, failure);
                complete();
                return false;
            }
        }

        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            try {
                if (isFinished()) {
                    return;
                }
                transactWarmup(service);
                if (!transactNewSession(service, sessionCallback)
                        || !launchCustomTab(context, providerPackage, settings,
                                sessionCallback)) {
                    fallback();
                    return;
                }
                complete();
            } catch (Throwable failure) {
                logFailure("Unable to launch Custom Tab provider=" + providerPackage, failure);
                fallback();
            }
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            try {
                fallback();
            } catch (Throwable failure) {
                logFailure("Custom Tabs disconnect fallback failed", failure);
                complete();
            }
        }

        private void fallback() {
            if (!complete()) {
                return;
            }
            try {
                openRegularBrowser(context, settings);
            } catch (Throwable failure) {
                logFailure("Regular browser fallback failed", failure);
            }
        }

        private synchronized boolean isFinished() {
            return finished;
        }

        private boolean complete() {
            boolean shouldUnbind;
            synchronized (this) {
                if (finished) {
                    return false;
                }
                finished = true;
                shouldUnbind = bound;
                bound = false;
            }
            try {
                mainHandler.removeCallbacks(timeout);
            } catch (Throwable failure) {
                logFailure("Unable to remove Custom Tabs timeout", failure);
            }
            if (shouldUnbind) {
                try {
                    context.unbindService(this);
                } catch (Throwable failure) {
                    logFailure("Unable to unbind Custom Tabs provider=" + providerPackage,
                            failure);
                }
            }
            return true;
        }
    }

    private static final class SessionCallbackBinder extends Binder {
        @Override
        protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            if (code == INTERFACE_TRANSACTION) {
                if (reply != null) {
                    reply.writeString(CALLBACK_DESCRIPTOR);
                }
                return true;
            }
            if (code == CALLBACK_GET_INTERFACE_VERSION) {
                if (reply != null) {
                    reply.writeNoException();
                    reply.writeInt(CALLBACK_INTERFACE_VERSION);
                }
                return true;
            }
            if (code >= 2 && code <= 12) {
                data.enforceInterface(CALLBACK_DESCRIPTOR);
                if (reply != null) {
                    reply.writeNoException();
                    if (code == CALLBACK_EXTRA_WITH_RESULT) {
                        reply.writeInt(0);
                    }
                }
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }
    }
}
