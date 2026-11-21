package dev.freeteaspoon.wisprflowbridge;

import android.app.Activity;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage;

public final class WisprFlowHooks implements IXposedHookLoadPackage {
    private static final String PACKAGE = "com.wispr.flowapp";
    private static final String ACTION = "dev.freeteaspoon.wisprflow.KEYBOARD_COMMAND";
    private static final String PREFS = "gboard_keyboard_bridge";
    private static final long SESSION_LEASE_MS = 8_000;
    private static final long START_TIMEOUT_MS = 3_000;
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
            if (!BridgePolicy.supportsVersion(service.getPackageManager()
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
        final Runnable expire = this::expireSession;
        Object mutableState;
        Object audioLevel;
        Object toggle;
        Object permissionGate;
        Object eventSink;
        XC_MethodHook.Unhook stateHook;
        XC_MethodHook.Unhook insertionHook;
        boolean keyboardMode;
        boolean inlineMode;
        boolean closed;
        String token;
        long startedAt;
        boolean observedActive;
        boolean canRecoverInOverlay;
        String stopping;
        volatile AtomicReference<String> submission;

        Session(Service service) {
            owner = new WeakReference<>(service);
            keyboardMode = service.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getBoolean("keyboard_mode", false);
            inlineMode = service.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getBoolean("inline_mode", false);
            receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context context, Intent intent) {
                    if (!ACTION.equals(intent.getAction()) || closed) return;
                    try {
                        Service service = owner.get();
                        if (service == null) return;
                        ComponentName ime = ComponentName.unflattenFromString(
                                Settings.Secure.getString(context.getContentResolver(),
                                        Settings.Secure.DEFAULT_INPUT_METHOD));
                        if (ime == null || !BridgePolicy.acceptsSender(getSentFromUid(),
                                context.getPackageManager().getApplicationInfo(
                                        ime.getPackageName(), 0).uid)) return;
                        String command = intent.getStringExtra("command");
                        if (command == null) return;
                        if ("floating".equals(command)) {
                            expireSession();
                            setKeyboardMode(false, false);
                        } else if ("keyboard".equals(command) || "toggle".equals(command)) {
                            if (!ready() || token != null) return;
                            if ("toggle".equals(command)) {
                                NativeTap.run(permissionGate, toggle, eventSink);
                            }
                            setKeyboardMode(true, false);
                        } else if ("inline".equals(command)) {
                            if (!ready() || insertionHook == null) return;
                            setKeyboardMode(true, true);
                        } else {
                            Bundle payload = new Bundle();
                            String status = inlineCommand(service, command,
                                    intent.getStringExtra("session"), payload);
                            if (status == null) return;
                            setResultData(status);
                            if (!payload.isEmpty()) setResultExtras(payload);
                        }
                        setResultCode(Activity.RESULT_OK);
                    } catch (Throwable failure) {
                        log(failure);
                    }
                }
            };
            service.registerReceiver(receiver, new IntentFilter(ACTION), Context.RECEIVER_EXPORTED);
        }

        void attachInsertion(Object useCase) {
            for (Method method : useCase.getClass().getDeclaredMethods()) {
                if (!"handleTranscribeResult".equals(method.getName())) continue;
                Class<?>[] parameters = method.getParameterTypes();
                int insertion = parameters.length - 2;
                if (insertion < 1 || parameters[0] != String.class) continue;
                Class<?> callback = parameters[insertion];
                if (!"kotlin.jvm.functions.Function2".equals(callback.getName())) continue;
                insertionHook = XposedBridge.hookMethod(method, new XC_MethodHook() {
                    @Override protected void beforeHookedMethod(MethodHookParam param) {
                        AtomicReference<String> recording = submission;
                        Object original = param.args[insertion];
                        if (recording == null || param.thisObject != useCase || original == null) return;
                        param.args[insertion] = Proxy.newProxyInstance(callback.getClassLoader(),
                                new Class<?>[]{callback}, (proxy, called, args) -> {
                                    if (!"invoke".equals(called.getName())) return called.invoke(original, args);
                                    if (recording == submission && args[0] instanceof String text) {
                                        recording.compareAndSet(null, text);
                                        return true;
                                    }
                                    return false;
                                });
                    }
                });
                return;
            }
        }

        void attachState() {
            if (closed || stateHook != null) return;
            try {
                Service service = owner.get();
                if (service == null) return;
                Object useCase = XposedHelpers.callMethod(service, "getFlowBubbleUseCase");
                audioLevel = XposedHelpers.callMethod(useCase, "getAudioLevelFlow");
                attachInsertion(useCase);
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

        String inlineCommand(Service service, String command, String sessionToken, Bundle payload)
                throws Exception {
            if (!ready() || sessionToken == null || sessionToken.length() != 36) return null;
            if ("start_inline_v3".equals(command)) {
                if (insertionHook == null || token != null
                        || !BridgePolicy.canStart(nativeStatus(service))) return null;
                token = sessionToken;
                startedAt = SystemClock.uptimeMillis();
                observedActive = false;
                stopping = null;
                setKeyboardMode(true, true);
                renewLease();
                try {
                    if (!NativeTap.run(permissionGate, toggle, eventSink)) {
                        clearSession();
                        return "failed";
                    }
                } catch (Exception failure) {
                    expireSession();
                    throw failure;
                }
                return sessionStatus(service, payload);
            }
            if (!sessionToken.equals(token)) return null;
            if ("detach".equals(command)) {
                expireSession();
                return "done";
            }
            if ("status".equals(command)) {
                renewLease();
                return sessionStatus(service, payload);
            }
            boolean submit = "finish".equals(command);
            if (!submit && !"cancel".equals(command)) return null;
            String status = nativeStatus(service);
            if (stopping == null && !submit && !observedActive && BridgePolicy.canStart(status)) {
                XposedHelpers.callMethod(service, "cancelStreamSession");
                clearSession();
                return "done";
            }
            if (stopping == null && BridgePolicy.canStop(status, submit)) {
                if (submit) submission = new AtomicReference<>();
                try {
                    NativeTap.toggle(toggle, eventSink, submit);
                } catch (Exception failure) {
                    submission = null;
                    throw failure;
                }
                stopping = submit ? "processing" : "canceling";
                observedActive = true;
            }
            renewLease();
            return sessionStatus(service, payload);
        }

        String nativeStatus(Service service) {
            Object manager = XposedHelpers.callMethod(service, "getDictationStateManager");
            return XposedHelpers.callMethod(manager, "currentStatus").getClass().getSimpleName();
        }

        String sessionStatus(Service service, Bundle payload) {
            String status = nativeStatus(service);
            switch (status) {
                case "Initializing", "Listening", "Processing" -> {
                    observedActive = true;
                    if ("Processing".equals(status)) return "processing";
                    if (stopping != null) return stopping;
                    if (!"Listening".equals(status)) return "starting";
                    Object level = XposedHelpers.callMethod(audioLevel, "getValue");
                    if (level instanceof Number value) {
                        payload.putInt("voice_level", BridgePolicy.voiceLevel(value.floatValue()));
                    }
                    return "listening";
                }
                default -> {
                    if (!observedActive && SystemClock.uptimeMillis() - startedAt < START_TIMEOUT_MS) {
                        return "starting";
                    }
                    String state = overlayState();
                    AtomicReference<String> recording = submission;
                    String transcript = recording == null ? null : recording.get();
                    if (transcript != null) payload.putString("transcript", transcript);
                    boolean failed = !observedActive || "Error".equals(status)
                            || "Error".equals(state) || "Repair".equals(state);
                    clearSession();
                    return failed && transcript == null ? "failed" : "done";
                }
            }
        }

        void renewLease() {
            main.removeCallbacks(expire);
            main.postDelayed(expire, SESSION_LEASE_MS);
        }

        void expireSession() {
            if (token == null) return;
            try {
                Service service = owner.get();
                if (service != null && stopping == null) {
                    String status = nativeStatus(service);
                    if (BridgePolicy.canStop(status, false)) {
                        NativeTap.toggle(toggle, eventSink, false);
                    } else if (!observedActive && BridgePolicy.canStart(status)) {
                        XposedHelpers.callMethod(service, "cancelStreamSession");
                    }
                }
            } catch (Throwable failure) {
                canRecoverInOverlay = true;
                log(failure);
            } finally {
                clearSession();
            }
        }

        void clearSession() {
            main.removeCallbacks(expire);
            token = null;
            stopping = null;
            submission = null;
            refreshVisibility();
        }

        void setKeyboardMode(boolean enabled, boolean inline) {
            keyboardMode = enabled;
            inlineMode = inline;
            canRecoverInOverlay = false;
            Service service = owner.get();
            if (service != null) service.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putBoolean("keyboard_mode", enabled).putBoolean("inline_mode", inline).apply();
            refreshVisibility();
        }

        String overlayState() {
            Object state = mutableState == null ? null
                    : XposedHelpers.callMethod(mutableState, "getValue");
            return state == null ? null : state.getClass().getSimpleName();
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
                String state = overlayState();
                boolean visible = !ready() || (!inlineMode || canRecoverInOverlay)
                        && (state == null || BridgePolicy.showOverlay(keyboardMode, state));
                overlay.setVisibility(visible ? View.VISIBLE : View.INVISIBLE);
            } catch (Throwable failure) {
                log(failure);
            }
        }

        void close() {
            expireSession();
            closed = true;
            main.removeCallbacksAndMessages(null);
            Service service = owner.get();
            if (stateHook != null) stateHook.unhook();
            if (insertionHook != null) insertionHook.unhook();
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
