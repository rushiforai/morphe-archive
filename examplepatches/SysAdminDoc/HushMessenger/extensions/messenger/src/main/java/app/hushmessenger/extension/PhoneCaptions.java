package app.hushmessenger.extension;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.icu.util.ULocale;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.speech.RecognitionListener;
import android.speech.RecognitionSupport;
import android.speech.RecognitionSupportCallback;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructPollfd;
import android.view.translation.TranslationCapability;
import android.view.translation.TranslationContext;
import android.view.translation.TranslationManager;
import android.view.translation.TranslationRequest;
import android.view.translation.TranslationRequestValue;
import android.view.translation.TranslationResponse;
import android.view.translation.TranslationSpec;
import android.view.translation.Translator;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

/**
 * The phone's own speech pieces for live captions, all on-device: the recognizer Android 13 lets an app feed from a
 * pipe, the system translator and text to speech. Only CallCaptions loads this, and only from Android 13.
 */
@TargetApi(33)
final class PhoneCaptions implements CallCaptions.Parts {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Executor ON_MAIN = MAIN::post;
    /** A translator that hasn't answered by now never will. */
    private static final long TRANSLATOR_WAIT_MILLIS = 15000;

    @Override public CallCaptions.Listening listen(Context context, CallCaptions.Feed feed, String language) {
        if (!SpeechRecognizer.isOnDeviceRecognitionAvailable(context)) {
            CallCaptions.note("call_captions_no_recognizer");
            return null;
        }
        Captioner captioner = new Captioner(context, feed, language);
        captioner.start();
        return captioner;
    }

    @Override public void translator(Context context, String from, String to, Consumer<CallCaptions.Translating> ready) {
        TranslationManager manager = context.getSystemService(TranslationManager.class);
        if (manager == null) {
            ready.accept(null);
            return;
        }
        AtomicBoolean answered = new AtomicBoolean();
        Runnable never = () -> {
            if (answered.compareAndSet(false, true)) ready.accept(null);
        };
        MAIN.postDelayed(never, TRANSLATOR_WAIT_MILLIS);
        TranslationContext wanted = new TranslationContext.Builder(spec(from), spec(to)).build();
        manager.createOnDeviceTranslator(wanted, ON_MAIN, made -> {
            MAIN.removeCallbacks(never);
            if (answered.compareAndSet(false, true)) ready.accept(made == null ? null : new Translation(made));
            else if (made != null) made.destroy();
        });
    }

    @Override public CallCaptions.Speaking voice(Context context, String language, boolean duck) {
        return new Voice(context, language, duck);
    }

    @Override public void heardLanguages(Context context, BiConsumer<List<String>, List<String>> ready) {
        if (!SpeechRecognizer.isOnDeviceRecognitionAvailable(context)) {
            ready.accept(null, null);
            return;
        }
        SpeechRecognizer checker = SpeechRecognizer.createOnDeviceSpeechRecognizer(context);
        Intent asking = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
            .putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
        checker.checkRecognitionSupport(asking, ON_MAIN, new RecognitionSupportCallback() {
            @Override public void onSupportResult(RecognitionSupport support) {
                checker.destroy();
                List<String> more = new ArrayList<>(support.getSupportedOnDeviceLanguages());
                for (String pending : support.getPendingOnDeviceLanguages()) if (!more.contains(pending)) more.add(pending);
                more.removeAll(support.getInstalledOnDeviceLanguages());
                ready.accept(new ArrayList<>(support.getInstalledOnDeviceLanguages()), more);
            }

            @Override public void onError(int error) {
                checker.destroy();
                ready.accept(null, null);
            }
        });
    }

    @Override public void shownLanguages(Context context, String from, Consumer<List<String>> ready) {
        TranslationManager manager = context.getSystemService(TranslationManager.class);
        if (manager == null) {
            ready.accept(Collections.emptyList());
            return;
        }
        // The system service answers this one on the calling thread, and it can take a while.
        new Thread(() -> {
            List<String> found = new ArrayList<>();
            try {
                for (TranslationCapability capability : manager.getOnDeviceTranslationCapabilities(TranslationSpec.DATA_FORMAT_TEXT,
                        TranslationSpec.DATA_FORMAT_TEXT)) {
                    if (capability.getState() == TranslationCapability.STATE_NOT_AVAILABLE) continue;
                    if (!CallCaptions.sameLanguage(capability.getSourceSpec().getLocale().toLanguageTag(), from)) continue;
                    String to = capability.getTargetSpec().getLocale().toLanguageTag();
                    if (!found.contains(to)) found.add(to);
                }
            } catch (RuntimeException error) {
                Settings.hookFailedPrivately(CallCaptions.KEY, "Couldn't list the phone's translations", error);
            }
            MAIN.post(() -> ready.accept(found));
        }, "HushCaptionLanguages").start();
    }

    @Override public void download(Context context, String language) {
        if (!SpeechRecognizer.isOnDeviceRecognitionAvailable(context)) return;
        SpeechRecognizer fetching = SpeechRecognizer.createOnDeviceSpeechRecognizer(context);
        fetching.triggerModelDownload(recognizing(language));
        // Letting go at once can cancel the request before the recognizer has it.
        MAIN.postDelayed(fetching::destroy, 10000);
    }

    private static TranslationSpec spec(String language) {
        return new TranslationSpec(ULocale.forLanguageTag(language), TranslationSpec.DATA_FORMAT_TEXT);
    }

    private static Intent recognizing(String language) {
        return new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
            .putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            .putExtra(RecognizerIntent.EXTRA_LANGUAGE, language);
    }

    private static void close(ParcelFileDescriptor fd) {
        if (fd == null) return;
        try {
            fd.close();
        } catch (IOException ignored) {
            // Already closed.
        }
    }

    /**
     * One recognizer for the call, fed from the pipe and run as one long segmented session after another. Everything
     * here happens on the main thread, where the recognizer reports.
     */
    private static final class Captioner implements RecognitionListener, CallCaptions.Listening {
        private static final int MOST_FAILURES = 5;
        private static final long RETRY_MILLIS = 500;
        private final Context context;
        private final CallCaptions.Feed feed;
        private final String language;
        private final Runnable again = this::session;
        private SpeechRecognizer recognizer;
        /** This session's read end, ours until the recognizer has its own copy. */
        private ParcelFileDescriptor reading;
        private int failures;
        private boolean ended;

        Captioner(Context context, CallCaptions.Feed feed, String language) {
            this.context = context;
            this.feed = feed;
            this.language = language;
        }

        void start() {
            recognizer = SpeechRecognizer.createOnDeviceSpeechRecognizer(context);
            recognizer.setRecognitionListener(this);
            session();
        }

        private void session() {
            if (ended) return;
            ParcelFileDescriptor[] pipe;
            try {
                pipe = ParcelFileDescriptor.createPipe();
            } catch (IOException error) {
                CallCaptions.stopped("call_captions_stopped", error);
                return;
            }
            close(reading);
            reading = pipe[0];
            feed.into(new PipeSink(pipe[1]));
            Intent intent = recognizing(language)
                .putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true)
                .putExtra(RecognizerIntent.EXTRA_PREFER_OFFLINE, true)
                .putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE, pipe[0])
                .putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_CHANNEL_COUNT, 1)
                .putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_ENCODING, AudioFormat.ENCODING_PCM_16BIT)
                .putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_SAMPLING_RATE, CallMix.RATE)
                .putExtra(RecognizerIntent.EXTRA_SEGMENTED_SESSION, RecognizerIntent.EXTRA_AUDIO_SOURCE);
            try {
                recognizer.startListening(intent);
            } catch (RuntimeException error) {
                failed(SpeechRecognizer.ERROR_CLIENT, error);
            }
        }

        private void later(long millis) {
            MAIN.removeCallbacks(again);
            if (!ended) MAIN.postDelayed(again, millis);
        }

        private void failed(int error, Throwable cause) {
            close(reading);
            reading = null;
            feed.into(null);
            if (ended) return;
            switch (error) {
                case SpeechRecognizer.ERROR_LANGUAGE_UNAVAILABLE:
                    // Not on the phone yet. Ask for it so a later call has it.
                    try {
                        recognizer.triggerModelDownload(recognizing(language));
                    } catch (RuntimeException ignored) {
                        // Settings can still download it.
                    }
                    CallCaptions.stopped("call_captions_downloading", null);
                    return;
                case SpeechRecognizer.ERROR_LANGUAGE_NOT_SUPPORTED:
                    CallCaptions.stopped("call_captions_unavailable", null);
                    return;
                case SpeechRecognizer.ERROR_NO_MATCH:
                case SpeechRecognizer.ERROR_SPEECH_TIMEOUT:
                    // Nobody talked for a while. That's a normal call.
                    later(0);
                    return;
                default:
                    if (++failures > MOST_FAILURES) {
                        CallCaptions.stopped("call_captions_stopped",
                            cause != null ? cause : new IllegalStateException("The recognizer failed " + failures + " times in a row, last error " + error));
                        return;
                    }
                    later(RETRY_MILLIS * failures);
            }
        }

        @Override public void end() {
            ended = true;
            MAIN.removeCallbacks(again);
            feed.into(null);
            close(reading);
            reading = null;
            if (recognizer == null) return;
            try {
                recognizer.cancel();
            } catch (RuntimeException ignored) {
                // Going anyway.
            }
            recognizer.destroy();
            recognizer = null;
        }

        @Override public void onReadyForSpeech(Bundle params) {
            // The recognizer holds its own copy now. Closing ours lets a write fail once it lets go.
            close(reading);
            reading = null;
        }

        @Override public void onBeginningOfSpeech() {}

        @Override public void onRmsChanged(float rms) {}

        @Override public void onBufferReceived(byte[] buffer) {}

        @Override public void onEndOfSpeech() {}

        @Override public void onError(int error) {
            failed(error, null);
        }

        @Override public void onPartialResults(Bundle results) {
            if (!ended) CallCaptions.partial(first(results));
        }

        @Override public void onSegmentResults(Bundle results) {
            if (ended) return;
            failures = 0;
            CallCaptions.finished(first(results));
        }

        @Override public void onResults(Bundle results) {
            if (ended) return;
            failures = 0;
            CallCaptions.finished(first(results));
            later(0);
        }

        @Override public void onEndOfSegmentedSession() {
            feed.into(null);
            later(0);
        }

        @Override public void onEvent(int type, Bundle params) {}

        private static String first(Bundle results) {
            List<String> heard = results == null ? null : results.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
            return heard == null || heard.isEmpty() ? "" : heard.get(0);
        }
    }

    /** The pipe's write end. A full pipe takes nothing, so the call's audio thread never waits on the recognizer. */
    static final class PipeSink implements CallCaptions.Sink {
        private final ParcelFileDescriptor writing;
        private final StructPollfd[] ready;

        PipeSink(ParcelFileDescriptor writing) {
            this.writing = writing;
            StructPollfd fd = new StructPollfd();
            fd.fd = writing.getFileDescriptor();
            fd.events = (short) OsConstants.POLLOUT;
            ready = new StructPollfd[] {fd};
        }

        @Override public int offer(byte[] data, int count) throws IOException {
            try {
                ready[0].revents = 0;
                if (Os.poll(ready, 0) <= 0) return 0;
                if ((ready[0].revents & (OsConstants.POLLERR | OsConstants.POLLHUP)) != 0) throw new IOException("The recognizer closed its end");
                return Os.write(writing.getFileDescriptor(), data, 0, count);
            } catch (ErrnoException error) {
                throw new IOException(error);
            }
        }

        @Override public void close() throws IOException {
            writing.close();
        }
    }

    private static final class Translation implements CallCaptions.Translating {
        private final Translator translator;

        Translation(Translator translator) {
            this.translator = translator;
        }

        @Override public void translate(String said, Consumer<String> done) {
            try {
                if (translator.isDestroyed()) {
                    done.accept(null);
                    return;
                }
                TranslationRequest request = new TranslationRequest.Builder()
                    .setTranslationRequestValues(Collections.singletonList(TranslationRequestValue.forText(said))).build();
                translator.translate(request, new CancellationSignal(), ON_MAIN, response -> done.accept(text(response)));
            } catch (RuntimeException error) {
                Settings.hookFailedPrivately(CallCaptions.KEY, "Couldn't translate a caption", error);
                done.accept(null);
            }
        }

        private static String text(TranslationResponse response) {
            if (response == null || response.getTranslationStatus() != TranslationResponse.TRANSLATION_STATUS_SUCCESS) return null;
            if (response.getTranslationResponseValues().size() == 0) return null;
            CharSequence text = response.getTranslationResponseValues().valueAt(0).getText();
            return text == null ? null : text.toString();
        }

        @Override public void close() {
            try {
                translator.destroy();
            } catch (RuntimeException ignored) {
                // Already gone.
            }
        }
    }

    /** Reads finished captions aloud on the call's audio path. A backlog is dropped for the newest line. */
    private static final class Voice implements CallCaptions.Speaking {
        private static final int MOST_WAITING = 3;
        private final boolean duck;
        private final String language;
        private final AtomicInteger pending = new AtomicInteger();
        private final List<String> early = new ArrayList<>();
        private final TextToSpeech speech;
        private boolean ready, closed;
        private int said;

        Voice(Context context, String language, boolean duck) {
            this.duck = duck;
            this.language = language;
            speech = new TextToSpeech(context, status -> MAIN.post(() -> started(status)));
        }

        private void started(int status) {
            if (closed) return;
            int language = status == TextToSpeech.SUCCESS ? speech.setLanguage(Locale.forLanguageTag(this.language)) : TextToSpeech.ERROR;
            if (language < TextToSpeech.LANG_AVAILABLE) {
                CallCaptions.note("call_captions_no_voice");
                close();
                return;
            }
            speech.setAudioAttributes(new AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION)
                .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build());
            speech.setOnUtteranceProgressListener(new UtteranceProgressListener() {
                @Override public void onStart(String id) {}

                @Override public void onDone(String id) {
                    finished();
                }

                @Override public void onError(String id) {
                    finished();
                }

                @Override public void onStop(String id, boolean interrupted) {
                    finished();
                }
            });
            ready = true;
            for (String waiting : early) say(waiting);
            early.clear();
        }

        private void finished() {
            pending.updateAndGet(count -> Math.max(0, count - 1));
        }

        @Override public void say(String text) {
            if (closed || text == null || text.isEmpty()) return;
            if (!ready) {
                early.add(text);
                return;
            }
            int queue = pending.get() >= MOST_WAITING ? TextToSpeech.QUEUE_FLUSH : TextToSpeech.QUEUE_ADD;
            pending.incrementAndGet();
            if (speech.speak(text, queue, null, "hush_caption_" + said++) != TextToSpeech.SUCCESS) finished();
        }

        @Override public boolean ducking() {
            return duck && pending.get() > 0;
        }

        @Override public void close() {
            if (closed) return;
            closed = true;
            pending.set(0);
            early.clear();
            try {
                speech.stop();
                speech.shutdown();
            } catch (RuntimeException ignored) {
                // The engine went first.
            }
        }
    }
}
