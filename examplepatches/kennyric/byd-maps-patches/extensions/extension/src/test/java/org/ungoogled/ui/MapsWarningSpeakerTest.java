package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import android.speech.tts.UtteranceProgressListener;
import android.speech.tts.TextToSpeech;
import android.speech.tts.Voice;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.TimeUnit;
import nl.johninnl.navigation.alerts.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowTextToSpeech;

/** Callback reducer tests. Runtime speech/focus/route acceptance needs the original patched app. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE) @LooperMode(LooperMode.Mode.PAUSED)
public class MapsWarningSpeakerTest {
    MapsWarningSpeaker speaker;PlaybackGrant grant;Object attempt;String id;UtteranceProgressListener progress;
    List<String> outcomes=new ArrayList<>();
    static Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
    @Before public void setup()throws Exception{
        speaker=new MapsWarningSpeaker(RuntimeEnvironment.getApplication());
        Constructor<?> g=PlaybackGrant.class.getDeclaredConstructors()[0];g.setAccessible(true);String uuid=UUID.randomUUID().toString();char[] key=new char[64];Arrays.fill(key,'a');
        grant=(PlaybackGrant)g.newInstance("boot-count:7",uuid,uuid,uuid,new String(key),uuid,uuid,10001,1L,1L,WarningAudioOwner.Mode.VOICE,PlaybackGrant.Outcome.GRANTED,true,false);
        Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",uuid);b.putLong("sequence",1);b.putString("warning_id","road-a");b.putLong("revision",1);b.putLong("announcement_index",1);b.putString("operation","ANNOUNCE");b.putString("phase","notice");b.putInt("priority",0);b.putString("native_type","Incident");b.putString("category","road_danger");b.putString("relevance","notice");b.putString("relationship","unknown");b.putString("message","Person on road");b.putString("language_tag","en");b.putString("message_origin","native_text");long now=SystemClock.elapsedRealtime();b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("state_until_elapsed_ms",now+30000);b.putLong("announce_until_elapsed_ms",now+5000);
        WarningEvent event=WarningCodec.decode(b,now);
        MapsWarningSpeaker.Listener listener=new MapsWarningSpeaker.Listener(){public void started(PlaybackGrant value){assertSame(grant,value);outcomes.add("STARTED");}public void finished(PlaybackGrant value,PlaybackGrant.Outcome outcome,boolean quiet){assertSame(grant,value);outcomes.add(outcome+":"+quiet);}};
        Class<?> type=Class.forName("org.ungoogled.ui.MapsWarningSpeaker$Attempt");Constructor<?> a=type.getDeclaredConstructors()[0];a.setAccessible(true);attempt=a.newInstance(event,grant,now+5000,listener);
        id=(String)field(type,"id").get(attempt);field(MapsWarningSpeaker.class,"active").set(speaker,attempt);progress=(UtteranceProgressListener)field(MapsWarningSpeaker.class,"progress").get(speaker);
    }
    @After public void close(){speaker.close();Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private void readyEnglishWhileAttemptActive()throws Exception{
        field(MapsWarningSpeaker.class,"active").set(speaker,null);
        ShadowTextToSpeech.addVoice(new Voice("offline-en",Locale.US,Voice.QUALITY_NORMAL,Voice.LATENCY_NORMAL,false,Collections.emptySet()));
        ShadowTextToSpeech.addVoice(new Voice("offline-nl",Locale.forLanguageTag("nl-NL"),Voice.QUALITY_NORMAL,Voice.LATENCY_NORMAL,false,Collections.emptySet()));
        speaker.prepare("en-US");Shadows.shadowOf(Looper.getMainLooper()).idle();
        Shadows.shadowOf(ShadowTextToSpeech.getLastTextToSpeechInstance()).getOnInitListener().onInit(TextToSpeech.SUCCESS);Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("en-US",field(MapsWarningSpeaker.class,"preparedLanguage").get(speaker));field(MapsWarningSpeaker.class,"active").set(speaker,attempt);
    }
    @Test public void queuedLanguageIsPreparedAfterPositiveCompletion()throws Exception{
        readyEnglishWhileAttemptActive();speaker.prepare("nl-NL");Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("en-US",field(MapsWarningSpeaker.class,"preparedLanguage").get(speaker));
        progress.onDone(id);Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("nl-NL",field(MapsWarningSpeaker.class,"preparedLanguage").get(speaker));
    }
    @Test public void latestQueuedLanguageIsPreparedAfterPositiveStop()throws Exception{
        readyEnglishWhileAttemptActive();speaker.prepare("en-US");speaker.prepare("nl-NL");Shadows.shadowOf(Looper.getMainLooper()).idle();
        progress.onStop(id,false);Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("nl-NL",field(MapsWarningSpeaker.class,"preparedLanguage").get(speaker));
    }
    @Test public void queuedAttemptAndForeignUtteranceCannotReportPlayback()throws Exception{
        assertTrue(outcomes.isEmpty());progress.onStart("native-route");progress.onDone("native-route");Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(outcomes.isEmpty());
    }
    @Test public void actualStartIsReportedOnceAndLateMutedStartEndsInterrupted()throws Exception{
        progress.onStart(id);progress.onStart(id);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList("STARTED"),outcomes);
        // No verified native mode is available in this fixture, so the adapter immediately cancels.
        progress.onDone(id);progress.onDone(id);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Arrays.asList("STARTED","INTERRUPTED:true"),outcomes);
    }
    @Test public void neverSubmittedCancellationIsPositiveNotStarted()throws Exception{
        speaker.cancel(grant);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList("NOT_STARTED:true"),outcomes);
    }
    @Test public void submittedStopWithoutCallbackRemainsUncertainUntilPositiveTerminal()throws Exception{
        field(attempt.getClass(),"submitted").setBoolean(attempt,true);speaker.cancel(grant);Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(outcomes.isEmpty());
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(1001,TimeUnit.MILLISECONDS);assertEquals(Collections.singletonList("UNCERTAIN:false"),outcomes);
        progress.onStop(id,true);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Arrays.asList("UNCERTAIN:false","UNCERTAIN:true"),outcomes);
    }
    @Test public void engineFailureWithoutObservedStartIsNotProofOfNoAudio()throws Exception{
        field(attempt.getClass(),"submitted").setBoolean(attempt,true);progress.onError(id);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList("UNCERTAIN:false"),outcomes);
        progress.onStop(id,false);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Arrays.asList("UNCERTAIN:false","UNCERTAIN:true"),outcomes);
    }
    @Test public void confirmedFlushBeforeSynthesisWithNoStartIsPositiveNotStarted()throws Exception{
        field(attempt.getClass(),"submitted").setBoolean(attempt,true);progress.onStop(id,false);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList("NOT_STARTED:true"),outcomes);
    }
    @Test public void interruptedSynthesisWithoutStartIsConsumedUncertainNotRetryable()throws Exception{
        field(attempt.getClass(),"submitted").setBoolean(attempt,true);progress.onStop(id,true);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList("UNCERTAIN:true"),outcomes);
    }
}
