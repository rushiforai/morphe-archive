package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.icu.util.ULocale;
import android.media.AudioFormat;
import android.os.Bundle;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.speech.RecognitionSupport;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.view.translation.TranslationCapability;
import android.view.translation.TranslationManager;
import android.view.translation.TranslationSpec;
import android.widget.TextView;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowSpeechRecognizer;
import org.robolectric.shadows.ShadowTextToSpeech;
import org.robolectric.shadows.ShadowTranslationManager;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** The phone's own speech pieces behind live captions: the on-device recognizer, its languages and the voice. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class PhoneCaptionsTest {
    /**
     * The phone's pieces as a call uses them, except that the recognizer is fed from a feed that never runs. The pipe's
     * write end goes straight to Linux's poll and write, which a JVM test doesn't have, so nothing may be written to it.
     */
    private static final class Phone implements CallCaptions.Parts {
        final PhoneCaptions real = new PhoneCaptions();
        final CallCaptions.Feed unplugged = new CallCaptions.Feed();

        @Override public CallCaptions.Listening listen(Context context, CallCaptions.Feed feed, String language) {
            return real.listen(context, unplugged, language);
        }

        @Override public void translator(Context context, String from, String to, Consumer<CallCaptions.Translating> ready) {
            real.translator(context, from, to, ready);
        }

        @Override public CallCaptions.Speaking voice(Context context, String language, boolean duck) {
            return real.voice(context, language, duck);
        }

        @Override public void heardLanguages(Context context, BiConsumer<List<String>, List<String>> ready) {
            real.heardLanguages(context, ready);
        }

        @Override public void shownLanguages(Context context, String from, Consumer<List<String>> ready) {
            real.shownLanguages(context, from, ready);
        }

        @Override public void download(Context context, String language) {
            real.download(context, language);
        }
    }

    private Application context;
    private SettingsText text;
    private ActivityController<Activity> screen;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CallRecording.resetForTests();
        ShadowSpeechRecognizer.reset();
        ShadowSpeechRecognizer.setIsOnDeviceRecognitionAvailable(true);
        ShadowTextToSpeech.reset();
        CallCaptions.parts = new Phone();
        CallRecording.register(context);
        text = new SettingsText(context);
    }

    @After public void tidy() {
        CallRecording.playoutStopped();
        if (screen != null) screen.pause().stop().destroy();
        idle();
        CallRecording.resetForTests();
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static void idleFor(long millis) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    /** A captioned call kept in the language it's spoken in, so nothing is translated. */
    private void callStarts(String heard) {
        Settings.preferences.edit()
            .putBoolean(CallCaptions.KEY, true)
            .putString(CallCaptions.HEARD_LANGUAGE, heard)
            .putString(CallCaptions.SHOWN_LANGUAGE, CallCaptions.UNTRANSLATED)
            .commit();
        screen = Robolectric.buildActivity(Activity.class).setup();
        idle();
        CallRecording.playoutStarted();
        idle();
        assertTrue(CallCaptions.running());
    }

    private static void callEnds() {
        CallRecording.playoutStopped();
        idle();
    }

    private static ShadowSpeechRecognizer recognizer() {
        SpeechRecognizer latest = ShadowSpeechRecognizer.getLatestSpeechRecognizer();
        assertNotNull("No recognizer was made", latest);
        return Shadow.extract(latest);
    }

    private static ShadowTextToSpeech engine() {
        TextToSpeech latest = ShadowTextToSpeech.getLastTextToSpeechInstance();
        assertNotNull("No voice was made", latest);
        return Shadow.extract(latest);
    }

    private static Bundle heard(String... said) {
        Bundle results = new Bundle();
        results.putStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION, new ArrayList<>(Arrays.asList(said)));
        return results;
    }

    private static String shown() {
        TextView box = CallCaptions.box();
        return box == null ? null : box.getText().toString();
    }

    /** A voice whose engine has started and has [language]. */
    private CallCaptions.Speaking readyVoice(String language, boolean duck) {
        ShadowTextToSpeech.addLanguageAvailability(Locale.forLanguageTag(language));
        CallCaptions.Speaking voice = new PhoneCaptions().voice(context, language, duck);
        engine().getOnInitListener().onInit(TextToSpeech.SUCCESS);
        idle();
        return voice;
    }

    @Test public void aCallListensOnThePhoneToTheirSoundInTheirLanguage() {
        callStarts("es-ES");
        ShadowSpeechRecognizer recognizer = recognizer();
        Intent asked = recognizer.getLastRecognizerIntent();
        assertEquals("es-ES", asked.getStringExtra(RecognizerIntent.EXTRA_LANGUAGE));
        assertTrue(asked.getBooleanExtra(RecognizerIntent.EXTRA_PREFER_OFFLINE, false));
        assertTrue(asked.getBooleanExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, false));
        assertNotNull("Fed from the call's sound, never the microphone",
            asked.getParcelableExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE, ParcelFileDescriptor.class));
        assertEquals(CallMix.RATE, asked.getIntExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_SAMPLING_RATE, 0));
        assertEquals(1, asked.getIntExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_CHANNEL_COUNT, 0));
        assertEquals(AudioFormat.ENCODING_PCM_16BIT, asked.getIntExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_ENCODING, 0));
        assertEquals("One long session, cut into segments", RecognizerIntent.EXTRA_AUDIO_SOURCE,
            asked.getStringExtra(RecognizerIntent.EXTRA_SEGMENTED_SESSION));

        recognizer.triggerOnPartialResults(heard("hola qu"));
        idle();
        assertEquals("hola qu", shown());
        recognizer.triggerOnSegmentResults(heard("Hola, ¿qué tal?", "Hola que tal"));
        idle();
        assertEquals("The recognizer's best guess", "Hola, ¿qué tal?", shown());

        recognizer.triggerOnEndOfSegmentedSession();
        idle();
        Intent next = recognizer.getLastRecognizerIntent();
        assertNotSame("The next session starts on its own", asked, next);
        assertNotSame("on a pipe of its own", asked.getParcelableExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE, ParcelFileDescriptor.class),
            next.getParcelableExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE, ParcelFileDescriptor.class));

        callEnds();
        assertTrue("The call's end lets the recognizer go", recognizer.isDestroyed());
    }

    @Test public void nobodyTalkingIsANormalCallAndOtherFailuresRetrySlowerUntilTheSixth() {
        callStarts("en-US");
        ShadowSpeechRecognizer recognizer = recognizer();
        Intent first = recognizer.getLastRecognizerIntent();
        recognizer.triggerOnError(SpeechRecognizer.ERROR_NO_MATCH);
        idle();
        assertNotSame("A quiet stretch starts the next session at once", first, recognizer.getLastRecognizerIntent());
        recognizer.triggerOnError(SpeechRecognizer.ERROR_SPEECH_TIMEOUT);
        idle();
        assertNull("and says nothing", shown());

        for (int failure = 1; failure <= 5; failure++) {
            Intent before = recognizer.getLastRecognizerIntent();
            recognizer.triggerOnError(SpeechRecognizer.ERROR_SERVER);
            idleFor(500L * failure - 1);
            assertSame("Failure " + failure + " waits " + 500 * failure + " ms", before, recognizer.getLastRecognizerIntent());
            idleFor(1);
            assertNotSame(before, recognizer.getLastRecognizerIntent());
        }
        assertFalse(recognizer.isDestroyed());
        recognizer.triggerOnError(SpeechRecognizer.ERROR_SERVER);
        idle();
        assertEquals(text.get("call_captions_stopped"), shown());
        assertTrue("Nothing listens for the rest of the call", recognizer.isDestroyed());
    }

    @Test public void somethingHeardStartsTheFailureCountAgain() {
        callStarts("en-US");
        ShadowSpeechRecognizer recognizer = recognizer();
        for (int failure = 1; failure <= 3; failure++) {
            recognizer.triggerOnError(SpeechRecognizer.ERROR_SERVER);
            idleFor(500L * failure);
        }
        recognizer.triggerOnSegmentResults(heard("Hello."));
        idle();
        Intent before = recognizer.getLastRecognizerIntent();
        recognizer.triggerOnError(SpeechRecognizer.ERROR_SERVER);
        idleFor(500);
        assertNotSame("The first retry's wait again, not the fourth's", before, recognizer.getLastRecognizerIntent());
    }

    @Test public void aLanguageStillToDownloadIsAskedForAndTheBoxSaysSo() {
        callStarts("fr-FR");
        ShadowSpeechRecognizer recognizer = recognizer();
        assertNull(recognizer.getLatestModelDownloadIntent());
        recognizer.triggerOnError(SpeechRecognizer.ERROR_LANGUAGE_UNAVAILABLE);
        idle();
        assertEquals("So a later call has it", "fr-FR",
            recognizer.getLatestModelDownloadIntent().getStringExtra(RecognizerIntent.EXTRA_LANGUAGE));
        assertEquals(text.get("call_captions_downloading"), shown());
        assertTrue(recognizer.isDestroyed());
    }

    @Test public void aLanguageThePhoneCantRecognizeSaysSoAndStops() {
        callStarts("tlh");
        ShadowSpeechRecognizer recognizer = recognizer();
        recognizer.triggerOnError(SpeechRecognizer.ERROR_LANGUAGE_NOT_SUPPORTED);
        idle();
        assertEquals(text.get("call_captions_unavailable"), shown());
        assertNull("Nothing to download", recognizer.getLatestModelDownloadIntent());
        assertTrue(recognizer.isDestroyed());
    }

    @Test public void aPhoneWithoutOnDeviceRecognitionSaysSoAndNothingListens() {
        ShadowSpeechRecognizer.setIsOnDeviceRecognitionAvailable(false);
        callStarts("en-US");
        assertNull(ShadowSpeechRecognizer.getLatestSpeechRecognizer());
        assertEquals(text.get("call_captions_no_recognizer"), shown());
    }

    @Test public void theLanguagesOnThePhoneComeFirstAndTheRestAreTheOnesItCanFetch() {
        List<List<String>> answered = new ArrayList<>();
        new PhoneCaptions().heardLanguages(context, (installed, more) -> {
            answered.add(installed);
            answered.add(more);
        });
        ShadowSpeechRecognizer checker = recognizer();
        checker.triggerSupportResult(new RecognitionSupport.Builder()
            .setInstalledOnDeviceLanguages(Arrays.asList("en-US"))
            .setSupportedOnDeviceLanguages(Arrays.asList("en-US", "fr-FR"))
            .setPendingOnDeviceLanguages(Arrays.asList("de-DE", "fr-FR"))
            .build());
        idle();
        assertEquals(Arrays.asList("en-US"), answered.get(0));
        assertEquals("Each once, and none already on the phone", Arrays.asList("fr-FR", "de-DE"), answered.get(1));
        assertTrue(checker.isDestroyed());

        answered.clear();
        new PhoneCaptions().heardLanguages(context, (installed, more) -> {
            answered.add(installed);
            answered.add(more);
        });
        recognizer().triggerSupportError(SpeechRecognizer.ERROR_CLIENT);
        idle();
        assertEquals("A recognizer that can't say lists nothing", Arrays.asList(null, null), answered);

        answered.clear();
        ShadowSpeechRecognizer.setIsOnDeviceRecognitionAvailable(false);
        new PhoneCaptions().heardLanguages(context, (installed, more) -> {
            answered.add(installed);
            answered.add(more);
        });
        assertEquals(Arrays.asList(null, null), answered);
    }

    @Test public void aDownloadIsAskedForAndTheRecognizerLetGoOfAfterAWhile() {
        new PhoneCaptions().download(context, "it-IT");
        ShadowSpeechRecognizer fetching = recognizer();
        assertEquals("it-IT", fetching.getLatestModelDownloadIntent().getStringExtra(RecognizerIntent.EXTRA_LANGUAGE));
        idleFor(9999);
        assertFalse("Letting go at once can cancel the request", fetching.isDestroyed());
        idleFor(1);
        assertTrue(fetching.isDestroyed());
    }

    @Test public void theTranslationsOfferedAreTheOnesFromTheirLanguageThePhoneCanDo() throws InterruptedException {
        ShadowTranslationManager manager = Shadow.extract(context.getSystemService(TranslationManager.class));
        Set<TranslationCapability> all = new LinkedHashSet<>();
        all.add(capability("en-US", "es", TranslationCapability.STATE_ON_DEVICE));
        all.add(capability("en-GB", "es", TranslationCapability.STATE_AVAILABLE_TO_DOWNLOAD));
        all.add(capability("en", "de", TranslationCapability.STATE_NOT_AVAILABLE));
        all.add(capability("fr-FR", "it", TranslationCapability.STATE_ON_DEVICE));
        all.add(capability("en", "ja", TranslationCapability.STATE_DOWNLOADING));
        manager.setOnDeviceTranslationCapabilities(TranslationSpec.DATA_FORMAT_TEXT, TranslationSpec.DATA_FORMAT_TEXT, all);

        AtomicReference<List<String>> found = new AtomicReference<>();
        new PhoneCaptions().shownLanguages(context, "en-US", found::set);
        // Asked off the main thread, answered on it.
        long until = System.currentTimeMillis() + 5000;
        while (found.get() == null && System.currentTimeMillis() < until) {
            Thread.sleep(10);
            idle();
        }
        assertEquals("From any English, each once, and none it can't do", Arrays.asList("es", "ja"), found.get());
    }

    private static TranslationCapability capability(String from, String to, int state) {
        return ReflectionHelpers.callConstructor(TranslationCapability.class,
            ClassParameter.from(int.class, state),
            ClassParameter.from(TranslationSpec.class, new TranslationSpec(ULocale.forLanguageTag(from), TranslationSpec.DATA_FORMAT_TEXT)),
            ClassParameter.from(TranslationSpec.class, new TranslationSpec(ULocale.forLanguageTag(to), TranslationSpec.DATA_FORMAT_TEXT)),
            ClassParameter.from(boolean.class, true),
            ClassParameter.from(int.class, 0));
    }

    @Test public void captionsSaidBeforeTheVoiceStartsAreReadOnceItHas() {
        ShadowTextToSpeech.addLanguageAvailability(Locale.forLanguageTag("es-ES"));
        CallCaptions.Speaking voice = new PhoneCaptions().voice(context, "es-ES", false);
        voice.say("uno");
        voice.say("");
        voice.say(null);
        ShadowTextToSpeech engine = engine();
        assertTrue(engine.getSpokenTextList().isEmpty());
        engine.getOnInitListener().onInit(TextToSpeech.SUCCESS);
        idle();
        assertEquals(Arrays.asList("uno"), engine.getSpokenTextList());
        assertEquals(Locale.forLanguageTag("es-ES"), engine.getCurrentLanguage());

        voice.close();
        assertTrue(engine.isShutdown());
        voice.say("dos");
        assertEquals("Nothing after close", Arrays.asList("uno"), engine.getSpokenTextList());
    }

    @Test public void aBacklogGivesWayToTheNewestLineAndTheirVoiceIsOnlyLoweredWhileOneIsRead() {
        CallCaptions.Speaking voice = readyVoice("en-US", true);
        ShadowTextToSpeech engine = engine();
        assertFalse(voice.ducking());
        voice.say("one");
        assertEquals(TextToSpeech.QUEUE_ADD, engine.getQueueMode());
        assertTrue("Lowered while a line is read", voice.ducking());
        voice.say("two");
        voice.say("three");
        assertEquals(TextToSpeech.QUEUE_ADD, engine.getQueueMode());
        voice.say("four");
        assertEquals("Three waiting: the newest goes now", TextToSpeech.QUEUE_FLUSH, engine.getQueueMode());

        UtteranceProgressListener progress = engine.getUtteranceProgressListener();
        progress.onDone("hush_caption_0");
        progress.onStop("hush_caption_1", true);
        progress.onError("hush_caption_2");
        assertTrue(voice.ducking());
        progress.onDone("hush_caption_3");
        assertFalse("Back up once nothing's left to read", voice.ducking());
        progress.onDone("hush_caption_3");
        voice.say("five");
        assertEquals("A stray report never makes the count go below nothing", TextToSpeech.QUEUE_ADD, engine.getQueueMode());
        assertTrue(voice.ducking());
        voice.close();
        assertFalse(voice.ducking());

        CallCaptions.Speaking level = readyVoice("en-US", false);
        level.say("one");
        assertFalse("Lowering is its own switch", level.ducking());
        level.close();
    }

    @Test public void withoutAVoiceForTheLanguageTheBoxSaysSoAndNothingIsRead() {
        Settings.preferences.edit().putBoolean(CallCaptions.SPEAK, true).commit();
        callStarts("eo");
        ShadowTextToSpeech engine = engine();
        engine.getOnInitListener().onInit(TextToSpeech.SUCCESS);
        idle();
        assertEquals(text.get("call_captions_no_voice"), shown());
        assertTrue(engine.isShutdown());
        recognizer().triggerOnSegmentResults(heard("Saluton."));
        idle();
        assertTrue("Shown, never read", engine.getSpokenTextList().isEmpty());
    }
}
