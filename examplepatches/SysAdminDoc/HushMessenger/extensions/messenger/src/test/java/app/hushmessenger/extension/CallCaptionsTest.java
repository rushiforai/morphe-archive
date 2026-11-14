package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
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
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class CallCaptionsTest {
    /** What the recognizer's end of the pipe was handed. */
    private static final class Taken implements CallCaptions.Sink {
        final List<byte[]> offers = new ArrayList<>();
        boolean closed, fails;

        @Override public int offer(byte[] data, int count) throws IOException {
            if (fails) throw new IOException("Broken pipe");
            offers.add(Arrays.copyOf(data, count));
            return count;
        }

        @Override public void close() {
            closed = true;
        }

        int bytes() {
            int all = 0;
            for (byte[] offer : offers) all += offer.length;
            return all;
        }
    }

    /** The phone's speech pieces, as a call would use them. */
    private static final class Phone implements CallCaptions.Parts {
        String listenedFor, translatedFrom, translatedTo, voiceFor, downloaded;
        CallCaptions.Feed feed;
        boolean ended, translatorClosed, voiceClosed, ducking, translates = true;
        final List<String> said = new ArrayList<>();
        List<String> installed = Arrays.asList("en-US", "es-ES"), more = Collections.singletonList("fr-FR"), targets = Arrays.asList("es", "de");

        @Override public CallCaptions.Listening listen(Context context, CallCaptions.Feed feed, String language) {
            this.feed = feed;
            listenedFor = language;
            return () -> ended = true;
        }

        @Override public void translator(Context context, String from, String to, Consumer<CallCaptions.Translating> ready) {
            translatedFrom = from;
            translatedTo = to;
            ready.accept(!translates ? null : new CallCaptions.Translating() {
                @Override public void translate(String text, Consumer<String> done) {
                    done.accept("[" + to + "] " + text);
                }

                @Override public void close() {
                    translatorClosed = true;
                }
            });
        }

        @Override public CallCaptions.Speaking voice(Context context, String language, boolean duck) {
            voiceFor = language;
            return new CallCaptions.Speaking() {
                @Override public void say(String text) {
                    said.add(text);
                }

                @Override public boolean ducking() {
                    return duck && ducking;
                }

                @Override public void close() {
                    voiceClosed = true;
                }
            };
        }

        @Override public void heardLanguages(Context context, BiConsumer<List<String>, List<String>> ready) {
            ready.accept(installed, installed == null ? null : more);
        }

        @Override public void shownLanguages(Context context, String from, Consumer<List<String>> ready) {
            ready.accept(targets);
        }

        @Override public void download(Context context, String language) {
            downloaded = language;
        }
    }

    private Phone phone;
    private ActivityController<Activity> screen;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CallRecording.resetForTests();
        phone = new Phone();
        CallCaptions.parts = phone;
        CallRecording.register(RuntimeEnvironment.getApplication());
    }

    @After public void tidy() {
        if (screen != null) screen.pause().stop().destroy();
        idle();
        CallRecording.resetForTests();
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private void on(String key) {
        Settings.preferences.edit().putBoolean(key, true).commit();
    }

    private void choose(String key, String language) {
        Settings.preferences.edit().putString(key, language).commit();
    }

    private void callStarts() {
        if (screen == null) {
            screen = Robolectric.buildActivity(Activity.class).setup();
            idle();
        }
        CallRecording.playoutStarted();
        idle();
    }

    private void callEnds() {
        CallRecording.playoutStopped();
        idle();
    }

    private static String shown() {
        TextView box = CallCaptions.box();
        return box == null ? null : box.getText().toString();
    }

    private static short[] tone(short value, int count) {
        short[] sound = new short[count];
        Arrays.fill(sound, value);
        return sound;
    }

    @Test public void theFeedHandsOverTheirSoundLittleEndianALittleBehind() {
        CallCaptions.Feed feed = new CallCaptions.Feed();
        Taken taken = new Taken();
        feed.into(taken);
        // 100 ms of them at 0x1234, ending 100 ms into the call.
        feed.side.offer(tone((short) 0x1234, 1600), 1600, 1, CallMix.RATE, 100);
        feed.pump(CallMix.LAG_MILLIS);
        assertEquals("Nothing is due until the lag has passed", 0, taken.bytes());
        feed.pump(CallMix.LAG_MILLIS + 100);
        assertEquals(3200, taken.bytes());
        byte[] first = taken.offers.get(0);
        assertEquals(0x34, first[0]);
        assertEquals(0x12, first[1]);
        assertEquals(0x34, first[3198]);
        assertEquals(0x12, first[3199]);
        feed.pump(CallMix.LAG_MILLIS + 100);
        assertEquals("What's handed over isn't handed over again", 3200, taken.bytes());
    }

    @Test public void withNowhereToGoTheSoundIsDroppedNotSavedUp() {
        CallCaptions.Feed feed = new CallCaptions.Feed();
        feed.pump(CallMix.LAG_MILLIS + 1000);
        Taken taken = new Taken();
        feed.into(taken);
        feed.pump(CallMix.LAG_MILLIS + 1100);
        assertEquals("Only the 100 ms since there was somewhere to go", 3200, taken.bytes());
        Taken next = new Taken();
        feed.into(next);
        assertTrue("A new session's pipe closes the last one", taken.closed);
        feed.finishUp();
        assertTrue(next.closed);
    }

    @Test public void aPipeTheRecognizerLetGoOfIsClosedAndLeftAlone() {
        CallCaptions.Feed feed = new CallCaptions.Feed();
        Taken taken = new Taken();
        taken.fails = true;
        feed.into(taken);
        feed.pump(CallMix.LAG_MILLIS + 100);
        assertTrue(taken.closed);
        taken.fails = false;
        feed.pump(CallMix.LAG_MILLIS + 200);
        assertTrue(taken.offers.isEmpty());
    }

    @Test public void theBoxKeepsTheLastTwoLinesAndWhatsStillBeingSaid() {
        CallCaptions.Lines lines = new CallCaptions.Lines();
        assertTrue(lines.isEmpty());
        assertNull("Nothing said is no line", lines.finish("  "));
        lines.partial("one");
        assertEquals("one", lines.text());
        lines.finish("One.");
        lines.finish("Two.");
        lines.partial("thr");
        lines.note("A note");
        assertEquals("A note keeps what's still being heard", "Two.\nA note\nthr", lines.text());
        lines.finish("Three.");
        assertEquals("A note\nThree.", lines.text());
        lines.clear();
        assertTrue(lines.isEmpty());

        StringBuilder long_ = new StringBuilder();
        for (int i = 0; i < 60; i++) long_.append("word").append(i).append(' ');
        lines.finish(long_.toString());
        String cut = lines.text();
        assertTrue(cut.length() <= CallCaptions.Lines.MOST_CHARACTERS);
        assertTrue("Cut at a word, newest kept", cut.startsWith("word") && cut.endsWith("word59"));
    }

    @Test public void theirVoiceIsTurnedDownInPlaceInThePhonesByteOrder() {
        ByteBuffer frame = ByteBuffer.allocateDirect(320).order(ByteOrder.nativeOrder());
        for (int i = 0; i < 160; i++) frame.putShort(i * 2, (short) 1000);
        frame.order(ByteOrder.BIG_ENDIAN).position(320);
        CallCaptions.duck(frame, 320, CallCaptions.DUCKED);
        ByteBuffer read = frame.duplicate().order(ByteOrder.nativeOrder());
        for (int i = 0; i < 160; i++) assertEquals(250, read.getShort(i * 2));
        assertEquals("The audio thread's own position is left alone", 320, frame.position());
    }

    @Test public void offNoCaptionsRun() {
        callStarts();
        assertFalse(CallCaptions.running());
        assertNull(phone.listenedFor);
    }

    @Config(sdk = 32)
    @Test public void android12CantRunThemAndCallsStayAsTheyAre() {
        on(CallCaptions.KEY);
        assertFalse(Settings.available(CallCaptions.KEY));
        callStarts();
        assertFalse(CallCaptions.running());
    }

    @Test public void aCallListensInTheirLanguageAndTheBoxShowsWhatsSaid() {
        on(CallCaptions.KEY);
        choose(CallCaptions.HEARD_LANGUAGE, "es-ES");
        choose(CallCaptions.SHOWN_LANGUAGE, CallCaptions.UNTRANSLATED);
        callStarts();
        assertTrue(CallCaptions.running());
        assertEquals("es-ES", phone.listenedFor);
        assertNull("Kept as spoken, so nothing's translated", phone.translatedTo);
        assertNull("Nothing's said yet", shown());

        CallCaptions.partial("hola qu");
        assertEquals("hola qu", shown());
        CallCaptions.finished("Hola, ¿qué tal?");
        assertEquals("Hola, ¿qué tal?", shown());
        View box = CallCaptions.box();
        assertSame(screen.get().findViewById(android.R.id.content), box.getParent());
        assertFalse("Taps go through to the call's buttons", box.isClickable());

        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(CallCaptions.IDLE_MILLIS));
        assertNull("A quiet stretch clears the box", shown());
        CallCaptions.partial("y tú");
        assertEquals("y tú", shown());

        callEnds();
        assertFalse(CallCaptions.running());
        assertTrue(phone.ended);
        assertNull(shown());
    }

    @Test public void aTranslatedLineReplacesWhatWasHeardAndIsReadAloud() {
        on(CallCaptions.KEY);
        on(CallCaptions.SPEAK);
        choose(CallCaptions.HEARD_LANGUAGE, "es-ES");
        choose(CallCaptions.SHOWN_LANGUAGE, "en-US");
        callStarts();
        assertEquals("es-ES", phone.translatedFrom);
        assertEquals("en-US", phone.translatedTo);
        assertEquals("The voice speaks the shown language", "en-US", phone.voiceFor);

        CallCaptions.finished("Hola");
        assertEquals("[en-US] Hola", shown());
        assertEquals(Collections.singletonList("[en-US] Hola"), phone.said);

        callEnds();
        assertTrue(phone.translatorClosed);
        assertTrue(phone.voiceClosed);
    }

    @Test public void withoutATranslatorTheBoxSaysSoAndTheVoiceStaysQuiet() {
        on(CallCaptions.KEY);
        on(CallCaptions.SPEAK);
        phone.translates = false;
        choose(CallCaptions.HEARD_LANGUAGE, "es-ES");
        choose(CallCaptions.SHOWN_LANGUAGE, "en-US");
        callStarts();
        String note = new SettingsText(screen.get()).get("call_captions_untranslated");
        assertEquals(note, shown());
        CallCaptions.finished("Hola");
        assertEquals(note + "\nHola", shown());
        assertTrue("A Spanish line isn't read in an English voice", phone.said.isEmpty());
    }

    @Test public void theSameLanguageIsNeverTranslatedButIsReadAloud() {
        on(CallCaptions.KEY);
        on(CallCaptions.SPEAK);
        choose(CallCaptions.HEARD_LANGUAGE, "en-GB");
        choose(CallCaptions.SHOWN_LANGUAGE, "en-US");
        callStarts();
        assertNull(phone.translatedTo);
        CallCaptions.finished("Cheers");
        assertEquals(Collections.singletonList("Cheers"), phone.said);
    }

    @Test public void theirVoiceIsOnlyLoweredWhileACaptionIsReadAndThatsOn() {
        on(CallCaptions.KEY);
        on(CallCaptions.SPEAK);
        callStarts();
        AudioTrack speaker = new AudioTrack(AudioManager.STREAM_VOICE_CALL, 16000, AudioFormat.CHANNEL_OUT_MONO,
            AudioFormat.ENCODING_PCM_16BIT, 640, AudioTrack.MODE_STREAM);
        ByteBuffer frame = ByteBuffer.allocateDirect(320).order(ByteOrder.nativeOrder());
        for (int i = 0; i < 160; i++) frame.putShort(i * 2, (short) 1000);
        phone.ducking = true;
        CallRecording.heard(speaker, frame, 320);
        assertEquals("Lowering is its own switch", 1000, frame.getShort(0));
        callEnds();

        on(CallCaptions.DUCK);
        callStarts();
        phone.ducking = false;
        CallRecording.heard(speaker, frame, 320);
        assertEquals("Nothing's being read", 1000, frame.getShort(0));
        phone.ducking = true;
        CallRecording.heard(speaker, frame, 320);
        assertEquals(250, frame.getShort(0));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aRecognizerThatGivesUpSaysWhyOnceAndEndsThere() {
        on(CallCaptions.KEY);
        callStarts();
        CallCaptions.stopped("call_captions_stopped", null);
        CallCaptions.stopped("call_captions_stopped", null);
        assertEquals(new SettingsText(screen.get()).get("call_captions_stopped"), shown());
        assertTrue(phone.ended);
    }

    @Test public void settingsListsThePhonesLanguagesAndAPickSaves() {
        on(CallCaptions.KEY);
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = page.get().getWindow().getDecorView();
            Button heard = root.findViewWithTag("call_captions_heard");
            assertNotNull(heard);
            String phoneLanguage = CallCaptions.name(java.util.Locale.getDefault().toLanguageTag());
            assertEquals(new SettingsText(page.get()).get("call_captions_heard", phoneLanguage), heard.getText().toString());

            heard.performClick();
            idle();
            View sheet = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNotNull(sheet.findViewWithTag("call_captions_language_phone"));
            assertNotNull(sheet.findViewWithTag("call_captions_language_en-US"));
            TextView later = sheet.findViewWithTag("call_captions_language_fr-FR");
            assertEquals(new SettingsText(page.get()).get("call_captions_download", CallCaptions.name("fr-FR")), later.getText().toString());
            sheet.findViewWithTag("call_captions_language_es-ES").performClick();
            idle();
            assertEquals("es-ES", Settings.preferences.getString(CallCaptions.HEARD_LANGUAGE, null));
            assertFalse(ShadowDialog.getLatestDialog().isShowing());
            assertEquals(new SettingsText(page.get()).get("call_captions_heard", CallCaptions.name("es-ES")), heard.getText().toString());

            heard.performClick();
            idle();
            ShadowDialog.getLatestDialog().getWindow().getDecorView().findViewWithTag("call_captions_language_fr-FR").performClick();
            idle();
            assertEquals("fr-FR", phone.downloaded);
            assertEquals("fr-FR", Settings.preferences.getString(CallCaptions.HEARD_LANGUAGE, null));

            Button shownButton = root.findViewWithTag("call_captions_shown");
            shownButton.performClick();
            idle();
            Dialog shownSheet = ShadowDialog.getLatestDialog();
            assertNotNull(shownSheet.getWindow().getDecorView().findViewWithTag("call_captions_language_de"));
            shownSheet.getWindow().getDecorView().findViewWithTag("call_captions_language_" + CallCaptions.UNTRANSLATED).performClick();
            idle();
            assertTrue(CallCaptions.untranslated());
            assertEquals(new SettingsText(page.get()).get("call_captions_shown", new SettingsText(page.get()).get("call_captions_untranslated_choice")),
                shownButton.getText().toString());
        }
    }

    @Test public void aPhoneWithoutOnDeviceRecognitionSaysSoInTheSheet() {
        phone.installed = null;
        phone.targets = Collections.emptyList();
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = page.get().getWindow().getDecorView();
            root.findViewWithTag("call_captions_heard").performClick();
            idle();
            View sheet = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNotNull(sheet.findViewWithTag("call_captions_no_recognizer"));
            assertNull(sheet.findViewWithTag("call_captions_heard_choices"));
            sheet.findViewWithTag("call_captions_cancel").performClick();
            idle();

            root.findViewWithTag("call_captions_shown").performClick();
            idle();
            sheet = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNotNull(sheet.findViewWithTag("call_captions_no_translator"));
            assertNotNull("As spoken stays a choice", sheet.findViewWithTag("call_captions_language_" + CallCaptions.UNTRANSLATED));
        }
    }
}
