package dev.freeteaspoon.wisprflowbridge;

import android.app.Activity;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage;

public final class WisprFlowHooks implements IXposedHookLoadPackage {
    private static final String PACKAGE = "com.wispr.flowapp";
    private static final String ACTION = "dev.freeteaspoon.wisprflow.KEYBOARD_COMMAND";
    private static final String PREFS = "gboard_keyboard_bridge";
    private static final Map<Service, Session> sessions = new WeakHashMap<>();

    @Override public void handleLoadPackage(XC_LoadPackage.LoadPackageParam load) throws Throwable {
        if (!PACKAGE.equals(load.packageName) || !PACKAGE.equals(load.processName)) return;
        Class<?> serviceType = XposedHelpers.findClass(
                "com.wispr.flowapp.service.FlowService", load.classLoader);
        XposedBridge.hookAllMethods(serviceType, "onCreate", new XC_MethodHook() {
            @Override protected void afterHookedMethod(MethodHookParam param) {
                ensureSession((Service) param.thisObject);
            }
        });
        XposedBridge.hookAllMethods(serviceType, "setupUI", new XC_MethodHook() {
            @Override protected void afterHookedMethod(MethodHookParam param) {
                Session session = ensureSession((Service) param.thisObject);
                if (session != null) session.attachState();
            }
        });
        XposedBridge.hookAllMethods(serviceType, "onDestroy", new XC_MethodHook() {
            @Override protected void beforeHookedMethod(MethodHookParam param) {
                Session session = sessions.remove((Service) param.thisObject);
                if (session != null) session.close();
            }
        });
        Class<?> screen = XposedHelpers.findClass("com.wispr.ui.bubble.FlowScreenKt", load.classLoader);
        XposedBridge.hookAllMethods(screen, "FlowScreen", new XC_MethodHook() {
            @Override protected void afterHookedMethod(MethodHookParam param) {
                if (param.args.length != 24) return;
                for (Session session : sessions.values()) {
                    session.capture(param.args);
                }
            }
        });
    }

    private static Session ensureSession(Service service) {
        try {
            // Fail open to the original UI when Wispr updates its private implementation.
            if (!"2.8.5".equals(service.getPackageManager()
                    .getPackageInfo(PACKAGE, 0).versionName)) return null;
            Session session = sessions.get(service);
            if (session == null) {
                session = new Session(service);
                sessions.put(service, session);
            }
            return session;
        } catch (Throwable failure) {
            log(failure);
            return null;
        }
    }

    private static void log(Throwable failure) {
        XposedBridge.log("Wispr Flow keyboard bridge: " + failure.getClass().getSimpleName());
    }

    private static final class Session {
        final WeakReference<Service> owner;
        final Handler main = new Handler(Looper.getMainLooper());
        final BroadcastReceiver receiver;
        Object mutableState;
        Object toggle;
        Object permissionGate;
        Object eventSink;
        XC_MethodHook.Unhook stateHook;
        boolean keyboardMode;
        boolean closed;

        Session(Service service) {
            owner = new WeakReference<>(service);
            keyboardMode = service.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getBoolean("keyboard_mode", false);
            receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context context, Intent intent) {
                    if (!ACTION.equals(intent.getAction()) || closed) return;
                    try {
                        ComponentName ime = ComponentName.unflattenFromString(
                                Settings.Secure.getString(context.getContentResolver(),
                                        Settings.Secure.DEFAULT_INPUT_METHOD));
                        if (ime == null || !BridgePolicy.acceptsSender(getSentFromUid(),
                                context.getPackageManager().getApplicationInfo(
                                        ime.getPackageName(), 0).uid)) return;
                        String command = intent.getStringExtra("command");
                        if ("floating".equals(command)) {
                            setKeyboardMode(false);
                        } else if ("keyboard".equals(command) || "toggle".equals(command)) {
                            if (!ready()) return;
                            if ("toggle".equals(command)) {
                                NativeTap.run(permissionGate, toggle, eventSink);
                            }
                            setKeyboardMode(true);
                        } else {
                            return;
                        }
                        setResultCode(Activity.RESULT_OK);
                    } catch (Throwable failure) {
                        log(failure);
                    }
                }
            };
            service.registerReceiver(receiver, new IntentFilter(ACTION), Context.RECEIVER_EXPORTED);
        }

        void attachState() {
            if (closed || stateHook != null) return;
            try {
                Service service = owner.get();
                if (service == null) return;
                Object useCase = XposedHelpers.callMethod(service, "getFlowBubbleUseCase");
                mutableState = XposedHelpers.getObjectField(useCase, "_flowStateFlow");
                stateHook = XposedHelpers.findAndHookMethod(mutableState.getClass(), "setValue",
                        Object.class, new XC_MethodHook() {
                            @Override protected void afterHookedMethod(MethodHookParam param) {
                                if (param.thisObject == mutableState) refreshVisibility();
                            }
                        });
                refreshVisibility();
            } catch (Throwable failure) {
                log(failure);
            }
        }

        void capture(Object[] args) {
            Service service = owner.get();
            if (service == null || closed) return;
            try {
                if (args[1] != XposedHelpers.callMethod(service, "getFlowBubbleUseCase")) return;
                toggle = args[11];
                permissionGate = args[12];
                eventSink = args[19];
                attachState();
                refreshVisibility();
            } catch (Throwable failure) {
                log(failure);
            }
        }

        boolean ready() {
            return !closed && stateHook != null && toggle != null
                    && permissionGate != null && eventSink != null;
        }

        void setKeyboardMode(boolean enabled) {
            keyboardMode = enabled;
            Service service = owner.get();
            if (service != null) service.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putBoolean("keyboard_mode", enabled).apply();
            refreshVisibility();
        }

        void refreshVisibility() {
            if (Looper.myLooper() != Looper.getMainLooper()) {
                main.post(this::refreshVisibility);
                return;
            }
            Service service = owner.get();
            if (service == null || closed) return;
            try {
                View overlay = (View) XposedHelpers.getObjectField(service, "flowScreen");
                if (overlay == null) return;
                Object state = mutableState == null ? null
                        : XposedHelpers.callMethod(mutableState, "getValue");
                boolean visible = !ready() || state == null || BridgePolicy.showOverlay(
                        keyboardMode, state.getClass().getSimpleName());
                overlay.setVisibility(visible ? View.VISIBLE : View.INVISIBLE);
            } catch (Throwable failure) {
                log(failure);
            }
        }

        void close() {
            closed = true;
            main.removeCallbacksAndMessages(null);
            Service service = owner.get();
            if (stateHook != null) stateHook.unhook();
            if (service != null) {
                service.unregisterReceiver(receiver);
                try {
                    View overlay = (View) XposedHelpers.getObjectField(service, "flowScreen");
                    if (overlay != null) overlay.setVisibility(View.VISIBLE);
                } catch (Throwable failure) { log(failure); }
            }
            toggle = permissionGate = eventSink = mutableState = null;
        }
    }
}
