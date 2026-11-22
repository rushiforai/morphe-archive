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
import android.os.SystemClock;
import android.util.Log;
import android.view.inputmethod.InputConnection;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.UUID;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;
import dev.jason.gboardpatches.extension.wisprflow.WisprFlowNativeHeader.Dismissal;
import dev.jason.gboardpatches.extension.wisprflow.WisprFlowSessionState.Action;
import dev.jason.gboardpatches.extension.wisprflow.WisprFlowSessionState.Phase;

public final class WisprFlowRuntime {
    public static final String PACKAGE = "com.wispr.flowapp";
    public static final String ACTION = "dev.freeteaspoon.wisprflow.KEYBOARD_COMMAND";
    private static final String TAG = "GboardWisprFlow";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long POLL_INTERVAL_MS = 450;
    private static final long METER_INTERVAL_MS = 90;
    private static final long HEADER_RETRY_INTERVAL_MS = 100;
    private static final long HEADER_ATTACH_TIMEOUT_MS = 1_000;
    private static final long RESPONSE_TIMEOUT_MS = 5_000;
    private static WeakReference<InputMethodService> input = new WeakReference<>(null);
    private static Session active;
    private static boolean busy;

    private WisprFlowRuntime() {}

    public static void onInputViewStarted(Object receiver) {
        onInputViewEnded();
        if (receiver instanceof InputMethodService service) {
            input = new WeakReference<>(service);
            if (active != null && active.context == service) active.scheduleHeaderRestore();
        }
    }

    public static void onInputViewEnded() {
        input.clear();
        if (active != null) active.dismissHeader(Dismissal.IMMEDIATE);
    }

    public static void onEditorChanged() {
        if (active != null) active.submittedEditor = null;
        onInputViewEnded();
    }

    public static void onServiceDestroyed() {
        input.clear();
        if (active != null) active.close(true, Dismissal.IMMEDIATE);
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
                active = new Session(service);
                active.start();
                return;
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w(TAG, "Could not open the native voice header", failure);
                if (active != null) active.close(false, Dismissal.IMMEDIATE);
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
        final String token = UUID.randomUUID().toString();
        final WisprFlowSessionState state = new WisprFlowSessionState(SystemClock.uptimeMillis());
        final Runnable poll = () -> send("status");
        final Runnable responseTimeout = () -> fail(R.string.gboard_wispr_flow_bridge_unavailable);
        final Runnable phaseTimeout = () -> fail(R.string.gboard_wispr_flow_dictation_failed);
        final Runnable restoreHeader = this::restoreHeader;
        WisprFlowNativeHeader header;
        InputConnection submittedEditor;
        long headerAttachDeadline;
        long headerGeneration;
        boolean awaitingReply;

        Session(InputMethodService context) {
            this.context = context;
        }

        void start() throws ReflectiveOperationException {
            attachHeader();
            schedulePhaseTimeout();
            send("start_inline_v3");
        }

        void attachHeader() throws ReflectiveOperationException {
            long generation = ++headerGeneration;
            header = new WisprFlowNativeHeader(context, () -> act(Action.CANCEL, generation),
                    () -> act(Action.FINISH, generation));
            header.show();
            renderHeader(null, null);
        }

        void scheduleHeaderRestore() {
            headerAttachDeadline = SystemClock.uptimeMillis() + HEADER_ATTACH_TIMEOUT_MS;
            MAIN.post(restoreHeader);
        }

        void restoreHeader() {
            if (active != this || input.get() != context || header != null || !state.canShowHeader()) return;
            try {
                if (context.isInputViewShown() && context.getCurrentInputConnection() != null) {
                    attachHeader();
                    return;
                }
            } catch (ReflectiveOperationException | RuntimeException failure) {
                dismissHeader(Dismissal.IMMEDIATE);
                if (SystemClock.uptimeMillis() >= headerAttachDeadline) {
                    Log.w(TAG, "Could not restore the native voice header", failure);
                    message(context, R.string.gboard_wispr_flow_header_unavailable);
                    return;
                }
            }
            if (SystemClock.uptimeMillis() < headerAttachDeadline) {
                MAIN.postDelayed(restoreHeader, HEADER_RETRY_INTERVAL_MS);
            }
        }

        void act(Action action, long generation) {
            if (active != this || header == null || generation != headerGeneration) return;
            InputConnection editor = context.getCurrentInputConnection();
            if (action == Action.FINISH && editor == null) return;
            if (!state.queue(action, SystemClock.uptimeMillis())) return;
            if (action == Action.CANCEL) {
                submittedEditor = null;
                dismissHeader(Dismissal.NATIVE);
            } else {
                submittedEditor = editor;
            }
            schedulePhaseTimeout();
            if (!awaitingReply) dispatchAction();
        }

        boolean dispatchAction() {
            Action action = state.takeReadyAction(SystemClock.uptimeMillis());
            if (action == null) return false;
            schedulePhaseTimeout();
            updateHeader(null, null);
            send(action.command);
            return true;
        }

        void schedulePhaseTimeout() {
            MAIN.removeCallbacks(phaseTimeout);
            if (state.deadline() != 0) MAIN.postAtTime(phaseTimeout, state.deadline());
        }

        void send(String command) {
            MAIN.removeCallbacks(poll);
            if (active != this) return;
            awaitingReply = true;
            MAIN.postDelayed(responseTimeout, RESPONSE_TIMEOUT_MS);
            request(context, command, token, (ok, result, payload) -> {
                if (active != this) return;
                MAIN.removeCallbacks(responseTimeout);
                awaitingReply = false;
                if (!ok || result == null) {
                    fail(R.string.gboard_wispr_flow_bridge_unavailable);
                    return;
                }
                switch (result) {
                    case "done" -> complete(payload);
                    case "failed" -> fail(R.string.gboard_wispr_flow_dictation_failed);
                    case "starting" -> ongoing(command, Phase.STARTING, payload);
                    case "listening" -> ongoing(command, Phase.LISTENING, payload);
                    case "processing" -> ongoing(command, Phase.PROCESSING, payload);
                    case "canceling" -> ongoing(command, Phase.CANCELING, payload);
                    default -> fail(R.string.gboard_wispr_flow_bridge_unavailable);
                }
            });
        }

        void ongoing(String command, Phase reported, Bundle payload) {
            state.update(reported, Action.FINISH.command.equals(command), SystemClock.uptimeMillis());
            if (!state.canShowHeader()) dismissHeader(Dismissal.NATIVE);
            schedulePhaseTimeout();
            updateHeader(reported, payload);
            if (!dispatchAction()) MAIN.postDelayed(poll, header != null && state.phase() == Phase.LISTENING
                    ? METER_INTERVAL_MS : POLL_INTERVAL_MS);
        }

        void updateHeader(Phase reported, Bundle payload) {
            if (header == null) return;
            try {
                renderHeader(reported, payload);
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w(TAG, "Could not update the native voice header", failure);
                dismissHeader(Dismissal.IMMEDIATE);
                scheduleHeaderRestore();
            }
        }

        void renderHeader(Phase reported, Bundle payload) throws ReflectiveOperationException {
            header.update(state.phase());
            header.setCancelVisible(state.canCancel());
            if (reported == Phase.LISTENING && state.phase() == Phase.LISTENING && payload != null) {
                header.setVoiceLevel(payload.getInt("voice_level"));
            }
        }

        void complete(Bundle payload) {
            String text = state.submitted() && payload != null ? payload.getString("transcript") : null;
            close(false, Dismissal.NATIVE);
            if (text == null || text.isEmpty()) return;
            try {
                if (submittedEditor != null && context.getCurrentInputConnection() == submittedEditor
                        && submittedEditor.commitText(text, 1)) return;
            } catch (RuntimeException failure) {
                Log.w(TAG, "Could not insert the Wispr Flow transcript", failure);
            }
            message(context, R.string.gboard_wispr_flow_insert_failed);
        }

        void fail(int messageId) {
            close(true, header != null ? Dismissal.CENTER : Dismissal.IMMEDIATE);
            message(context, messageId);
        }

        void close(boolean detach, Dismissal dismissal) {
            active = null;
            MAIN.removeCallbacks(poll);
            MAIN.removeCallbacks(responseTimeout);
            MAIN.removeCallbacks(phaseTimeout);
            dismissHeader(dismissal);
            if (detach) request(context.getApplicationContext(), "detach", token, (ok, result, payload) -> {});
        }

        void dismissHeader(Dismissal dismissal) {
            MAIN.removeCallbacks(restoreHeader);
            WisprFlowNativeHeader previous = header;
            if (previous == null) return;
            headerGeneration++;
            try {
                previous.close(dismissal);
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w(TAG, "Could not release the native voice header", failure);
            } finally {
                header = null;
            }
        }
    }

    private static void message(Context context, int resource) {
        Toast.makeText(context, GboardSettingsText.get(context, resource), Toast.LENGTH_LONG).show();
    }
}
