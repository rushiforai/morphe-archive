package app.template.extension.aare;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * Answering a message by voice, after AARE read it aloud: a "Reply" card shows on the car screen
 * for 15 seconds, and every answerable message in the notification centre gets a "Reply" button.
 * Replying asks for the answer, listens, shows the dictated text live on a card that stays,
 * reads it back and sends it after a spoken "yes" or a tap on "Send".
 *
 * Works on AARE's own objects through reflection (they are not obfuscated): the car UI state of
 * CarRuntime for the cards, and CarNotificationListener for the conversations and the reply.
 * Everything here runs on the main thread.
 */
@SuppressWarnings("unused")
public final class VoiceReply {
    private static final String TAG = "AareVoiceReply";

    private static final Handler main = new Handler(Looper.getMainLooper());

    /** The cards this class put on the car screen: AARE must not close them after 8 seconds. */
    static final Set<Object> sticky = Collections.newSetFromMap(new IdentityHashMap<>());

    private enum State { IDLE, OFFERED, DICTATING, CONFIRMING, SENDING }

    private static WeakReference<Object> runtime = new WeakReference<>(null);
    private static Object listener;
    private static Object conversation;
    private static String title = "";
    private static Bitmap icon;
    private static String draft = "";
    private static State state = State.IDLE;

    private static Object card;
    private static long cardSeq;

    private static SpeechRecognizer recognizer;
    private static CarMic.Handle carMic;
    private static AudioFocusRequest listenFocus;

    private static final Set<String> YES = new HashSet<>(Arrays.asList(
            "si", "invia", "inviala", "invialo", "manda", "mandala", "mandalo", "ok", "okay", "certo", "conferma",
            "yes", "yeah", "send", "sure", "ja", "jawohl", "genau", "klar", "senden", "schick", "schicken", "gerne"));
    private static final Set<String> NO = new HashSet<>(Arrays.asList(
            "no", "annulla", "cancella", "lascia", "stop", "basta", "cancel", "dont", "nein", "abbrechen", "nicht", "stopp"));

    private VoiceReply() {
    }

    // region Hooks

    /** Called at the start of CarRuntime.remember and CarRuntime.notice: the car session's runtime. */
    public static void onRuntime(Object carRuntime) {
        if (carRuntime != null && runtime.get() != carRuntime) runtime = new WeakReference<>(carRuntime);
    }

    /**
     * Called at the start of CarRuntime.remember, which keeps a message in the notification centre:
     * returns its actions with "Reply" added when the message's conversation can be answered.
     */
    public static List<?> withReply(Object carRuntime, String noticeTitle, String noticeText, Bitmap noticeIcon, List<?> actions) {
        onRuntime(carRuntime);
        try {
            Object l = VoiceNotes.listener();
            if (!PatchSettings.isEnabled(VoiceNotes.listener(), PatchSettings.VOICE_REPLY)) return actions;
            if (l == null || findConversation(l, noticeTitle, noticeText) == null) return actions;
            List<Object> withReply = new ArrayList<>(actions == null ? Collections.emptyList() : actions);
            withReply.add(action(phrase("Reply", "Rispondi"), () -> replyFromHistory(noticeTitle, noticeText)));
            return withReply;
        } catch (Throwable t) {
            Log.w(TAG, "withReply", t);
            return actions;
        }
    }

    /**
     * Called at the start of CarRuntime.notice: another card is about to show. An unanswered
     * "Reply" card gives way to it, so the newest message is the one that can be answered.
     */
    public static void onNotice(Object carRuntime) {
        onRuntime(carRuntime);
        if (state == State.OFFERED) {
            removeCard();
            state = State.IDLE;
        }
    }

    /**
     * Replaces the call that closes a card on the car screen 8 seconds after it showed: cards of
     * this class stay until tapped or closed.
     */
    public static void dismissUnlessSticky(Object carActions, Object notice) {
        if (notice != null && sticky.contains(notice)) return;
        try {
            Method dismiss = carActions.getClass().getMethod("dismissNotice", notice.getClass());
            dismiss.setAccessible(true);
            dismiss.invoke(carActions, notice);
        } catch (Throwable t) {
            Log.w(TAG, "dismissNotice", t);
        }
    }

    // endregion

    // region Matching a spoken text to its conversation

    /**
     * The conversation AARE is reading aloud with [spoken], if it can be answered: [spoken] is
     * either "Sender. text" of its newest message or the whole conversation (Conversation.spoken()).
     */
    static Object conversationFor(Object notificationListener, String spoken) {
        // Only with the "Voice reply" patch, which hands over the car session's runtime.
        if (runtime.get() == null) return null;
        if (!PatchSettings.isEnabled(notificationListener instanceof android.content.Context ? (android.content.Context) notificationListener : null, PatchSettings.VOICE_REPLY)) return null;
        try {
            Method conversations = notificationListener.getClass().getMethod("conversations", String.class);
            List<?> list = (List<?>) conversations.invoke(notificationListener, (Object) null);
            if (list == null) return null;
            for (Object c : list) {
                if (!(Boolean) call(c, "getCanReply")) continue;
                if (spoken.equals(call(c, "spoken"))) return c;
                List<?> lines = (List<?>) call(c, "getMessages");
                if (lines == null || lines.isEmpty()) continue;
                Object last = lines.get(lines.size() - 1);
                String text = (String) call(last, "getText");
                if (text != null && !text.isEmpty() && spoken.endsWith(text)) return c;
            }
        } catch (Throwable t) {
            Log.w(TAG, "conversations", t);
        }
        return null;
    }

    /**
     * The conversation of a message kept in the notification centre: AARE titles it with the
     * conversation's name ("Group · Sender" for groups) and shows the message's text.
     */
    private static Object findConversation(Object notificationListener, String noticeTitle, String noticeText) throws Exception {
        Method conversations = notificationListener.getClass().getMethod("conversations", String.class);
        List<?> list = (List<?>) conversations.invoke(notificationListener, (Object) null);
        if (list == null) return null;
        Object byText = null;
        for (Object c : list) {
            if (!(Boolean) call(c, "getCanReply")) continue;
            List<?> lines = (List<?>) call(c, "getMessages");
            if (lines == null) continue;
            boolean hasText = false;
            for (Object line : lines) {
                if (noticeText != null && noticeText.equals(call(line, "getText"))) hasText = true;
            }
            if (!hasText) continue;
            String name = String.valueOf(call(c, "getTitle"));
            if (noticeTitle != null && !name.isEmpty() && noticeTitle.startsWith(name)) return c;
            if (byText == null) byText = c;
        }
        return byText;
    }

    // endregion

    // region Flow

    /** After a message was read aloud: offers to answer it with a card that stays. */
    static void offer(Object notificationListener, Object c) {
        main.post(() -> {
            if (state == State.DICTATING || state == State.CONFIRMING || state == State.SENDING) return;
            try {
                listener = notificationListener;
                conversation = c;
                title = String.valueOf(call(c, "getTitle"));
                icon = (Bitmap) call(c, "getIcon");
                draft = "";
                if (!showCard(title, phrase("Answer by voice?", "Vuoi rispondere?"),
                        action(phrase("Reply", "Rispondi"), VoiceReply::startDictation))) return;
                state = State.OFFERED;
                expireOffer();
            } catch (Throwable t) {
                Log.w(TAG, "offer", t);
            }
        });
    }

    /** "Reply" tapped in the notification centre: dictation straight away. */
    private static void replyFromHistory(String noticeTitle, String noticeText) {
        if (state == State.DICTATING || state == State.CONFIRMING || state == State.SENDING) return;
        try {
            Object l = VoiceNotes.listener();
            Object c = l == null ? null : findConversation(l, noticeTitle, noticeText);
            if (c == null) {
                if (l != null) {
                    listener = l;
                    speaker().say(phrase("This message can't be answered any more.", "Non si può più rispondere a questo messaggio."), null);
                }
                return;
            }
            listener = l;
            conversation = c;
            title = String.valueOf(call(c, "getTitle"));
            icon = (Bitmap) call(c, "getIcon");
            removeCard();
            startDictation();
        } catch (Throwable t) {
            Log.w(TAG, "replyFromHistory", t);
        }
    }

    private static void startDictation() {
        state = State.DICTATING;
        draft = "";
        showCard(replyTitle(), phrase("Speak now…", "Parla ora…"), action(phrase("Cancel", "Annulla"), VoiceReply::cancel));
        speaker().say(phrase("What's your answer to " + title + "?", "Cosa vuoi rispondere a " + title + "?"),
                () -> listen(false));
    }

    private static void onDictated(String text) {
        if (state != State.DICTATING) return;
        if (text == null || text.trim().isEmpty()) {
            speaker().say(phrase("I didn't catch that.", "Non ho capito."), null);
            offerAgain();
            return;
        }
        draft = capitalize(text.trim());
        state = State.CONFIRMING;
        showCard(replyTitle(), draft,
                action(phrase("Send", "Invia"), VoiceReply::send),
                action(phrase("Cancel", "Annulla"), VoiceReply::cancel));
        speaker().say(phrase("You said: " + draft + ". Send it?", "Ho scritto: " + draft + ". Lo invio?"),
                () -> listen(true));
    }

    private static void onConfirmation(String text) {
        if (state != State.CONFIRMING) return;
        Boolean answer = yesOrNo(text);
        if (Boolean.TRUE.equals(answer)) send();
        else if (Boolean.FALSE.equals(answer)) cancel();
        // Not understood: the card with Send and Cancel stays until one is tapped.
    }

    private static void send() {
        if (state != State.CONFIRMING || draft.isEmpty()) return;
        state = State.SENDING;
        stopListening();
        boolean sent = false;
        try {
            Method reply = listener.getClass().getMethod("reply", conversation.getClass(), String.class);
            sent = (Boolean) reply.invoke(listener, conversation, draft);
        } catch (Throwable t) {
            Log.w(TAG, "reply", t);
        }
        removeCard();
        state = State.IDLE;
        speaker().say(sent ? phrase("Message sent.", "Messaggio inviato.")
                : phrase("The message could not be sent.", "Non sono riuscito a inviare il messaggio."), null);
    }

    private static void cancel() {
        stopListening();
        removeCard();
        boolean wasActive = state == State.DICTATING || state == State.CONFIRMING;
        state = State.IDLE;
        draft = "";
        if (wasActive) speaker().say(phrase("Cancelled.", "Annullato."), null);
    }

    /** After a failed dictation: the "Reply" card again, to try once more. */
    private static void offerAgain() {
        stopListening();
        state = State.OFFERED;
        showCard(title, phrase("Answer by voice?", "Vuoi rispondere?"),
                action(phrase("Reply", "Rispondi"), VoiceReply::startDictation));
        expireOffer();
    }

    /** How long an unused "Reply" card stays: the message can still be answered from the notification centre. */
    private static final long OFFER_MS = 15_000L;

    private static void expireOffer() {
        Object offered = card;
        main.postDelayed(() -> {
            if (state == State.OFFERED && card == offered) {
                removeCard();
                state = State.IDLE;
            }
        }, OFFER_MS);
    }

    private static String replyTitle() {
        return phrase("Reply to ", "Risposta a ") + title;
    }

    // endregion

    // region Speech recognition

    private static void listen(boolean confirming) {
        State expected = confirming ? State.CONFIRMING : State.DICTATING;
        if (state != expected) return;
        if (cardClosed()) {
            cancel();
            return;
        }
        Context context = context();
        if (context == null) return;
        try {
            if (recognizer == null) {
                boolean onDevice = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                        && SpeechRecognizer.isOnDeviceRecognitionAvailable(context);
                recognizer = onDevice ? SpeechRecognizer.createOnDeviceSpeechRecognizer(context)
                        : SpeechRecognizer.createSpeechRecognizer(context);
            }
            recognizer.setRecognitionListener(new Listener(expected));
            Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
                    .putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
                    .putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault().toLanguageTag())
                    .putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true)
                    .putExtra(RecognizerIntent.EXTRA_PREFER_OFFLINE, true)
                    .putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1);
            if (!confirming) {
                // Let the user pause between words while dictating.
                intent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_COMPLETE_SILENCE_LENGTH_MILLIS, 2000L)
                        .putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS, 2000L);
            }
            requestListenFocus(context);
            closeCarMic();
            if (CarMic.enabled(context)) carMic = CarMic.attach(runtime.get(), intent, confirming ? 1000 : 2000);
            recognizer.startListening(intent);
        } catch (Throwable t) {
            Log.w(TAG, "listen", t);
            releaseListenFocus();
            if (!confirming) {
                speaker().say(phrase("Voice input isn't available.", "Il riconoscimento vocale non è disponibile."), null);
                offerAgain();
            }
        }
    }

    private static void stopListening() {
        try {
            if (recognizer != null) recognizer.cancel();
        } catch (Throwable ignored) {
        }
        releaseListenFocus();
    }

    private static void closeCarMic() {
        if (carMic != null) {
            carMic.close();
            carMic = null;
        }
    }

    private static final class Listener implements RecognitionListener {
        private final State expected;

        Listener(State expected) {
            this.expected = expected;
        }

        private boolean current() {
            return state == expected;
        }

        @Override
        public void onReadyForSpeech(Bundle params) {
        }

        @Override
        public void onBeginningOfSpeech() {
        }

        @Override
        public void onRmsChanged(float rmsdB) {
        }

        @Override
        public void onBufferReceived(byte[] buffer) {
        }

        @Override
        public void onEndOfSpeech() {
        }

        @Override
        public void onError(int error) {
            releaseListenFocus();
            if (!current()) return;
            Log.i(TAG, "recognition error " + error);
            if (expected == State.DICTATING) {
                if (error == SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS) {
                    speaker().say(phrase("Allow AARE to use the microphone.", "Concedi ad AARE il microfono."), null);
                } else {
                    speaker().say(phrase("I didn't catch that.", "Non ho capito."), null);
                }
                offerAgain();
            }
            // While confirming, the Send and Cancel buttons stay.
        }

        @Override
        public void onResults(Bundle results) {
            releaseListenFocus();
            if (!current()) return;
            String text = first(results);
            if (expected == State.DICTATING) onDictated(text);
            else onConfirmation(text);
        }

        @Override
        public void onPartialResults(Bundle partialResults) {
            if (!current() || expected != State.DICTATING) return;
            if (cardClosed()) {
                cancel();
                return;
            }
            String text = first(partialResults);
            if (text != null && !text.trim().isEmpty()) {
                showCard(replyTitle(), capitalize(text.trim()) + " …", action(phrase("Cancel", "Annulla"), VoiceReply::cancel));
            }
        }

        @Override
        public void onEvent(int eventType, Bundle params) {
        }

        private static String first(Bundle b) {
            if (b == null) return null;
            ArrayList<String> list = b.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
            return list == null || list.isEmpty() ? null : list.get(0);
        }
    }

    /** True for a yes, false for a no, null if neither or both were heard. */
    static Boolean yesOrNo(String text) {
        if (text == null) return null;
        String plain = Normalizer.normalize(text.toLowerCase(Locale.ROOT), Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "").replaceAll("[^a-z ]", " ");
        boolean yes = false;
        boolean no = false;
        for (String word : plain.split("\\s+")) {
            if (YES.contains(word)) yes = true;
            if (NO.contains(word)) no = true;
        }
        if (yes == no) return null;
        return yes;
    }

    /** Pauses the music while the microphone listens. */
    private static void requestListenFocus(Context context) {
        if (listenFocus != null) return;
        AudioManager audio = context.getSystemService(AudioManager.class);
        if (audio == null) return;
        listenFocus = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE)
                .setAudioAttributes(new AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ASSISTANT)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                        .build())
                .build();
        audio.requestAudioFocus(listenFocus);
    }

    private static void releaseListenFocus() {
        closeCarMic();
        if (listenFocus == null) return;
        Context context = context();
        AudioManager audio = context == null ? null : context.getSystemService(AudioManager.class);
        if (audio != null) audio.abandonAudioFocusRequest(listenFocus);
        listenFocus = null;
    }

    // endregion

    // region Car screen cards

    private static Pair<String, Function0<Unit>> action(String label, Runnable run) {
        return new Pair<>(label, () -> {
            main.post(run);
            return Unit.INSTANCE;
        });
    }

    @SafeVarargs
    private static boolean showCard(String cardTitle, String text, Pair<String, Function0<Unit>>... actions) {
        try {
            List<Object> notices = notices();
            if (notices == null) return false;
            Object old = card;
            String key = old != null && notices.contains(old) ? (String) call(old, "getKey") : "aare-reply-" + (++cardSeq);
            Class<?> noticeClass = Class.forName("net.prototux.aare.ui.car.CarNotice", false, VoiceReply.class.getClassLoader());
            Constructor<?> make = noticeClass.getConstructor(String.class, String.class, String.class, Bitmap.class,
                    List.class, long.class, boolean.class);
            Object n = make.newInstance(key, cardTitle, text, icon, Arrays.asList(actions), System.currentTimeMillis(), false);
            sticky.add(n);
            int at = old == null ? -1 : notices.indexOf(old);
            if (at >= 0) notices.set(at, n);
            else notices.add(0, n);
            if (old != null) sticky.remove(old);
            card = n;
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "showCard", t);
            return false;
        }
    }

    private static void removeCard() {
        Object old = card;
        card = null;
        if (old == null) return;
        sticky.remove(old);
        try {
            List<Object> notices = notices();
            if (notices != null) notices.remove(old);
        } catch (Throwable t) {
            Log.w(TAG, "removeCard", t);
        }
    }

    /** The card was closed on the car screen (its X), or the car session ended. */
    private static boolean cardClosed() {
        List<Object> notices = notices();
        return card == null || notices == null || !notices.contains(card);
    }

    @SuppressWarnings("unchecked")
    private static List<Object> notices() {
        Object r = runtime.get();
        if (r == null) return null;
        try {
            Object ui = call(r, "getUi");
            return (List<Object>) call(ui, "getNotices");
        } catch (Throwable t) {
            Log.w(TAG, "notices", t);
            return null;
        }
    }

    // endregion

    // region Helpers

    private static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method);
        return m.invoke(target);
    }

    private static Context context() {
        return listener instanceof Context ? ((Context) listener).getApplicationContext() : null;
    }

    private static VoiceNotes.Player speaker() {
        return VoiceNotes.Player.get(context());
    }

    private static String capitalize(String s) {
        return s.isEmpty() ? s : s.substring(0, 1).toUpperCase(Locale.getDefault()) + s.substring(1);
    }

    private static String phrase(String english, String italian) {
        return "it".equals(Locale.getDefault().getLanguage()) ? italian : english;
    }

    // endregion
}
