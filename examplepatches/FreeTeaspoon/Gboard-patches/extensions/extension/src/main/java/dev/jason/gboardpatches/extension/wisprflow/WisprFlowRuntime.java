package dev.jason.gboardpatches.extension.wisprflow;

import android.app.Activity;
import android.app.BroadcastOptions;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.inputmethod.InputConnection;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.UUID;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class WisprFlowRuntime {
    public static final String PACKAGE = "com.wispr.flowapp";
    public static final String ACTION = "dev.freeteaspoon.wisprflow.KEYBOARD_COMMAND";
    private static final String TAG = "GboardWisprFlow";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long POLL_INTERVAL_MS = 450;
    private static final long METER_INTERVAL_MS = 90;
    private static final long RESPONSE_TIMEOUT_MS = 5_000;
    private static WeakReference<InputMethodService> input = new WeakReference<>(null);
    private static Session active;
    private static boolean busy;

    private WisprFlowRuntime() {}

    public static void onInputViewStarted(Object receiver) {
        onInputViewEnded();
        if (receiver instanceof InputMethodService service) input = new WeakReference<>(service);
    }

    public static void onInputViewEnded() {
        input.clear();
        if (active != null) active.close(true);
    }

    public static Runnable nativeFinishAction(Object controller) {
        return active == null || active.header == null ? null : active.header.finishAction(controller);
    }

    public static void activate(Context context) {
        if (context == null || active != null || busy) return;
        if (Build.VERSION.SDK_INT < 34) {
            message(context, R.string.gboard_wispr_flow_android_required);
            return;
        }
        InputMethodService service = input.get();
        InputConnection editor = service == null ? null : service.getCurrentInputConnection();
        if (editor != null && service.isInputViewShown()) {
            try {
                active = new Session(service, editor);
                active.start();
                return;
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w(TAG, "Could not open the native voice header", failure);
                if (active != null) active.close(false);
            }
        }
        message(context, R.string.gboard_wispr_flow_header_unavailable);
    }

    public static void send(Context context, String command) {
        if (context == null || busy || active != null) return;
        if (Build.VERSION.SDK_INT < 34) {
            message(context, R.string.gboard_wispr_flow_android_required);
            return;
        }
        busy = true;
        request(context, command, null, (ok, result, payload) -> {
            busy = false;
            message(context, ok ? R.string.gboard_wispr_flow_mode_updated
                    : R.string.gboard_wispr_flow_bridge_unavailable);
        });
    }

    private static void request(Context context, String command, String token, Reply reply) {
        if (Build.VERSION.SDK_INT < 34) {
            reply.complete(false, null, null);
            return;
        }
        try {
            Bundle options = BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle();
            context.sendOrderedBroadcast(new Intent(ACTION).setPackage(PACKAGE)
                            .putExtra("command", command).putExtra("session", token), null, options,
                    new BroadcastReceiver() {
                        @Override public void onReceive(Context owner, Intent intent) {
                            reply.complete(getResultCode() == Activity.RESULT_OK, getResultData(),
                                    getResultExtras(false));
                        }
                    }, MAIN, Activity.RESULT_CANCELED, null, null);
        } catch (RuntimeException failure) {
            reply.complete(false, null, null);
        }
    }

    private interface Reply {
        void complete(boolean ok, String result, Bundle payload);
    }

    private static final class Session {
        final InputMethodService context;
        final InputConnection editor;
        final WisprFlowNativeHeader header;
        final String token = UUID.randomUUID().toString();
        final Runnable poll = () -> send("status");
        final Runnable timeout = () -> fail(R.string.gboard_wispr_flow_bridge_unavailable);
        String state = "starting";
        String pendingAction;
        boolean submitted;
        boolean awaitingReply;

        Session(InputMethodService context, InputConnection editor) throws ReflectiveOperationException {
            this.context = context;
            this.editor = editor;
            header = new WisprFlowNativeHeader(context,
                    () -> act("cancel"), () -> act("finish"));
        }

        void start() throws ReflectiveOperationException {
            header.show();
            send("start_inline_v3");
        }

        void act(String command) {
            if (active != this || pendingAction != null
                    || (!"starting".equals(state) && !"listening".equals(state))) return;
            pendingAction = command;
            if (!awaitingReply && actionReady()) send(command);
        }

        boolean actionReady() {
            return pendingAction != null && (!"finish".equals(pendingAction) || "listening".equals(state));
        }

        void send(String command) {
            MAIN.removeCallbacks(poll);
            if (active != this) return;
            if (!hasEditor()) {
                close(true);
                return;
            }
            if ("finish".equals(command)) submitted = true;
            awaitingReply = true;
            MAIN.postDelayed(timeout, RESPONSE_TIMEOUT_MS);
            request(context, command, token, (ok, result, payload) -> {
                if (active != this) return;
                MAIN.removeCallbacks(timeout);
                awaitingReply = false;
                if (!ok || result == null) {
                    fail(R.string.gboard_wispr_flow_bridge_unavailable);
                    return;
                }
                switch (result) {
                    case "done" -> complete(payload);
                    case "failed" -> fail(R.string.gboard_wispr_flow_dictation_failed);
                    case "starting", "listening", "processing", "canceling" -> {
                        try {
                            if (!state.equals(result)) {
                                state = result;
                                header.update(state);
                            }
                            if ("listening".equals(state) && payload != null) {
                                header.setVoiceLevel(payload.getInt("voice_level"));
                            }
                        } catch (ReflectiveOperationException | RuntimeException failure) {
                            Log.w(TAG, "Could not update the native voice header", failure);
                            fail(R.string.gboard_wispr_flow_header_unavailable);
                            return;
                        }
                        if (command.equals(pendingAction)) pendingAction = null;
                        if (actionReady()) send(pendingAction);
                        else MAIN.postDelayed(poll, "listening".equals(state)
                                ? METER_INTERVAL_MS : POLL_INTERVAL_MS);
                    }
                    default -> fail(R.string.gboard_wispr_flow_bridge_unavailable);
                }
            });
        }

        boolean hasEditor() {
            return context.isInputViewShown() && context.getCurrentInputConnection() == editor;
        }

        void complete(Bundle payload) {
            String text = submitted && payload != null ? payload.getString("transcript") : null;
            close(false);
            if (text == null || text.isEmpty() || !hasEditor()) return;
            try {
                if (editor.commitText(text, 1)) return;
            } catch (RuntimeException failure) {
                Log.w(TAG, "Could not insert the Wispr Flow transcript", failure);
            }
            message(context, R.string.gboard_wispr_flow_insert_failed);
        }

        void fail(int messageId) {
            close(true);
            message(context, messageId);
        }

        void close(boolean detach) {
            active = null;
            MAIN.removeCallbacks(poll);
            MAIN.removeCallbacks(timeout);
            try {
                header.close();
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w(TAG, "Could not release the native voice header", failure);
            }
            if (detach) request(context.getApplicationContext(), "detach", token, (ok, result, payload) -> {});
        }
    }

    private static void message(Context context, int resource) {
        Toast.makeText(context, GboardSettingsText.get(context, resource), Toast.LENGTH_LONG).show();
    }
}
