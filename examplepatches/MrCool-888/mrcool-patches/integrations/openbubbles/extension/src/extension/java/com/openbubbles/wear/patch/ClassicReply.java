package com.openbubbles.wear.patch;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.focus.FocusManager;
import androidx.compose.ui.focus.FocusRequester;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.platform.SoftwareKeyboardController;
import androidx.compose.ui.viewinterop.AndroidView_androidKt;
import com.localob.messaging.app.messaging.MessagePreviewKt;
import com.localob.messaging.app.messaging.ReactionTarget;
import com.localob.messaging.app.messaging.ReplyThreadingKt;
import com.localob.messaging.app.messaging.composer.MessageComposerState;
import com.localob.messaging.app.theme.BackHandler_androidKt;
import com.localob.messaging.backend.domain.Message;
import com.localob.messaging.backend.domain.MessageRef;
import java.util.WeakHashMap;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/** The native thread selection stays separate from the composer draft. All hooks run on the UI thread. */
public final class ClassicReply {
    private static final WeakHashMap<MutableState<String>, ReplyDraft> threads = new WeakHashMap<>();
    private static final WeakHashMap<MessageComposerState, ReplyDraft> composers = new WeakHashMap<>();

    private ClassicReply() { }

    public static void bindComposer(MutableState<String> thread, MessageComposerState composer) {
        threads.put(thread, composers.computeIfAbsent(composer, key -> new ReplyDraft()));
    }

    public static FocusRequester composerFocusRequester(MessageComposerState composer, FocusRequester stock) {
        ReplyDraft draft = composers.get(composer);
        if (draft == null) return stock;
        if (stock != null) draft.focusRequester = stock;
        return draft.focusRequester;
    }

    public static Function1<MessageRef, Unit> replyCallback(Function1<MessageRef, Unit> stock,
            ReactionTarget target, MutableState<String> thread, Composer composer) {
        if (stock == null) return null;
        ReplyDraft draft = threads.get(thread);
        if (draft == null) return stock;
        Context context = (Context) composer.consume(AndroidCompositionLocals_androidKt.getLocalContext());
        return reference -> {
            if (!PatchSettings.isClassicReplyMenuActive(context)) return stock.invoke(reference);
            draft.select(reference, target.getMessage());
            return Unit.INSTANCE;
        };
    }

    public static Function1<MessageRef, Unit> swipeCallback(Function1<MessageRef, Unit> stock,
            MutableState<String> thread, Composer composer) {
        Context context = (Context) composer.consume(AndroidCompositionLocals_androidKt.getLocalContext());
        return new SwipeCallback(stock, thread, context.getApplicationContext());
    }

    public static void dispatchSwipe(Function1<MessageRef, Unit> callback, Message message, int partIndex) {
        MessageRef reference = ReplyThreadingKt.resolveReplyTarget(message, partIndex);
        if (callback instanceof SwipeCallback && ((SwipeCallback) callback).select(reference, message)) return;
        callback.invoke(reference);
    }

    public static Function0<Unit> swipeAction(Function1<MessageRef, Unit> callback, Function0<Unit> stock) {
        return callback instanceof SwipeCallback && ((SwipeCallback) callback).reversesDirection()
                ? new ReversedSwipe(stock) : stock;
    }

    public static boolean swipeDirection(Function0<Unit> action, boolean fromMe) {
        return action instanceof ReversedSwipe ? !fromMe : fromMe;
    }

    public static Function2<Composer, Integer, Unit> composerHeader(MessageComposerState composer,
            Function2<Composer, Integer, Unit> stock) {
        ReplyDraft draft = composers.get(composer);
        Selection selection = draft == null ? null : draft.selection.getValue();
        if (selection == null) return stock;
        return (composition, changed) -> {
            composition.startReplaceGroup(0x491f8b11);
            SoftwareKeyboardController keyboard = (SoftwareKeyboardController) composition.consume(
                    CompositionLocalsKt.getLocalSoftwareKeyboardController());
            FocusManager focus = (FocusManager) composition.consume(CompositionLocalsKt.getLocalFocusManager());
            Runnable back = () -> {
                focus.clearFocus(false);
                draft.selection.setValue(null);
                if (keyboard != null) keyboard.hide();
            };
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
                BackHandler_androidKt.BackHandler(true, () -> {
                    back.run();
                    return Unit.INSTANCE;
                }, composition, 6, 0);
            }
            AndroidView_androidKt.AndroidView(context -> createPreview(context, back), Modifier.Companion, row -> {
                ((TextView) row.getChildAt(0)).setText(selection.preview == null || selection.preview.isBlank()
                        ? "Replying to message" : "Replying to · " + selection.preview);
                row.getChildAt(1).setOnClickListener(view -> draft.selection.setValue(null));
                if (selection.focusPending) {
                    selection.focusPending = false;
                    // Let the menu dismiss and the composer finish attaching its focus modifier.
                    row.post(() -> {
                        if (row.isAttachedToWindow() && draft.selection.getValue() == selection) {
                            try {
                                // Compose exposes this synthetic overload to the runtime, but not to javac.
                                FocusRequester.class.getMethod("requestFocus").invoke(draft.focusRequester);
                                if (keyboard != null) keyboard.show();
                            } catch (ReflectiveOperationException error) {
                                Log.w("OBWearPatch", "Unable to focus reply composer", error);
                            }
                        }
                    });
                }
                return Unit.INSTANCE;
            }, composition, 0, 0);
            if (stock != null) stock.invoke(composition, 0);
            composition.endReplaceGroup();
            return Unit.INSTANCE;
        };
    }

    public static MessageRef replyTarget(MessageComposerState composer, MessageRef stock) {
        ReplyDraft draft = composers.get(composer);
        Selection selection = draft == null ? null : draft.selection.getValue();
        return stock != null || selection == null ? stock : selection.reference;
    }

    public static void clearAfterSend(MessageComposerState composer) {
        composer.clear();
        ReplyDraft draft = composers.get(composer);
        if (draft != null) draft.selection.setValue(null);
    }

    public static void setThread(MutableState<String> thread, String id) {
        if (id != null) {
            ReplyDraft draft = threads.get(thread);
            if (draft != null) draft.selection.setValue(null);
        }
        thread.setValue(id);
    }

    private static LinearLayout createPreview(Context context, Runnable back) {
        boolean dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        int color = dark ? 0xffebebee : 0xff36363a;
        int buttonSize = dp(context, 48);
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPaddingRelative(dp(context, 12), 0, dp(context, 4), 0);
        TextView label = new TextView(context);
        label.setTextColor(color);
        label.setTextSize(14);
        label.setMaxLines(1);
        label.setEllipsize(TextUtils.TruncateAt.END);
        row.addView(label, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1));
        ImageButton cancel = new ImageButton(context);
        cancel.setImageResource(android.R.drawable.ic_menu_close_clear_cancel);
        cancel.setColorFilter(color);
        cancel.setContentDescription("Cancel reply");
        TypedValue ripple = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true)) {
            cancel.setBackgroundResource(ripple.resourceId);
        }
        row.addView(cancel, buttonSize, buttonSize);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            row.addOnAttachStateChangeListener(new ReplyBackCallback(back));
        }
        return row;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static final class ReplyDraft {
        final MutableState<Selection> selection =
                SnapshotStateKt.mutableStateOf(null, SnapshotStateKt.structuralEqualityPolicy());
        FocusRequester focusRequester = new FocusRequester();

        void select(MessageRef reference, Message message) {
            selection.setValue(new Selection(reference, MessagePreviewKt.messagePreviewTextSync(message)));
        }
    }

    private static final class ReversedSwipe implements Function0<Unit> {
        private final Function0<Unit> stock;

        ReversedSwipe(Function0<Unit> stock) {
            this.stock = stock;
        }

        @Override public Unit invoke() {
            return stock.invoke();
        }
    }

    private static final class SwipeCallback implements Function1<MessageRef, Unit> {
        private final Function1<MessageRef, Unit> stock;
        private final MutableState<String> thread;
        private final Context context;

        SwipeCallback(Function1<MessageRef, Unit> stock, MutableState<String> thread, Context context) {
            this.stock = stock;
            this.thread = thread;
            this.context = context;
        }

        boolean select(MessageRef reference, Message message) {
            ReplyDraft draft = threads.get(thread);
            if (draft == null || !PatchSettings.isClassicReplyMenuActive(context)) return false;
            draft.select(reference, message);
            return true;
        }

        boolean reversesDirection() {
            return PatchSettings.isReverseSwipeToReplyActive(context);
        }

        @Override public Unit invoke(MessageRef reference) {
            return stock.invoke(reference);
        }
    }

    private static final class ReplyBackCallback implements View.OnAttachStateChangeListener {
        private final OnBackInvokedCallback callback;
        private OnBackInvokedDispatcher dispatcher;

        ReplyBackCallback(Runnable back) {
            callback = back::run;
        }

        @Override public void onViewAttachedToWindow(View view) {
            dispatcher = view.findOnBackInvokedDispatcher();
            if (dispatcher != null) {
                // Handle this Back before the IME so one press cancels the reply.
                dispatcher.registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_OVERLAY, callback);
            }
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (dispatcher != null) {
                dispatcher.unregisterOnBackInvokedCallback(callback);
                dispatcher = null;
            }
        }
    }

    private static final class Selection {
        final MessageRef reference;
        final String preview;
        boolean focusPending = true;

        Selection(MessageRef reference, String preview) {
            this.reference = reference;
            this.preview = preview;
        }
    }
}
