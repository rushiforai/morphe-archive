package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.media.AudioAttributes;
import android.media.AudioTrack;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.util.*;
import java.util.concurrent.TimeUnit;
import nl.johninnl.navigation.alerts.PlaybackGrant;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE) @LooperMode(LooperMode.Mode.PAUSED)
public class MapsWarningToneTest {
    FakeTrack track;MapsWarningTone tone;List<String> outcomes;long deadline;
    @Before public void setup(){
        track=new FakeTrack();outcomes=new ArrayList<>();deadline=SystemClock.elapsedRealtime()+5000;
        tone=new MapsWarningTone(new Handler(Looper.getMainLooper()),SystemClock::elapsedRealtime,(pcm,attributes,handler,marker)->{track.frames=pcm.length;return track;});
    }
    void play(){tone.play(deadline,new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE).build(),new MapsWarningTone.Events(){public void started(){outcomes.add("STARTED");}public void finished(PlaybackGrant.Outcome value,boolean quiet){outcomes.add(value+":"+quiet);}});}
    void tick(long ms){Shadows.shadowOf(Looper.getMainLooper()).idleFor(ms,TimeUnit.MILLISECONDS);}
    @Test public void playReturnDoesNotMeanStartedAndElapsedDurationDoesNotMeanCompleted(){
        play();assertTrue(outcomes.isEmpty());tick(800);assertTrue(outcomes.isEmpty());
        track.head=100;tick(10);assertEquals(Collections.singletonList("STARTED"),outcomes);
        track.head=track.frames;tick(10);assertEquals(Arrays.asList("STARTED","COMPLETED:true"),outcomes);assertEquals(1,track.releases);assertEquals(1,track.stops);
    }
    @Test public void partialStaticBufferNeverPlays(){
        track.partial=true;play();assertEquals(Collections.singletonList("NOT_STARTED:true"),outcomes);assertEquals(0,track.plays);assertEquals(1,track.releases);
    }
    @Test public void cancelBeforeRenderedFrameIsPositiveNotStarted(){
        play();tone.cancel();assertEquals(Collections.singletonList("NOT_STARTED:true"),outcomes);assertEquals(1,track.stops);assertEquals(1,track.releases);
    }
    @Test public void cancellationObservesUnreportedProgressBeforeStopResetsHead(){
        play();track.head=500;tone.cancel();assertEquals(Arrays.asList("STARTED","INTERRUPTED:true"),outcomes);assertEquals(0,track.head);
    }
    @Test public void failedReleaseKeepsSameOutputUncertainUntilNativeReleaseSucceeds(){
        play();track.head=100;track.releaseFailures=1;tone.cancel();assertEquals(Arrays.asList("STARTED","UNCERTAIN:false"),outcomes);
        tick(100);assertEquals(Arrays.asList("STARTED","UNCERTAIN:false","INTERRUPTED:true"),outcomes);assertEquals(1,track.plays);assertEquals(1,track.stops);assertEquals(2,track.releases);
    }
    @Test public void missingPlaybackHeadExpiresWithoutInventingCompletion(){
        play();tick(5001);assertEquals(Collections.singletonList("NOT_STARTED:true"),outcomes);assertEquals(1,track.releases);
    }
    private static final class FakeTrack implements MapsWarningTone.Track {
        int state=AudioTrack.STATE_NO_STATIC_DATA,playState=AudioTrack.PLAYSTATE_STOPPED,frames,plays,stops,releases,releaseFailures;long head;boolean partial;
        public int write(short[] pcm){state=AudioTrack.STATE_INITIALIZED;return partial?pcm.length/2:pcm.length;}
        public void play(){plays++;playState=AudioTrack.PLAYSTATE_PLAYING;}
        public long head(){return head;}
        public void pause(){playState=AudioTrack.PLAYSTATE_PAUSED;}
        public void stop(){stops++;playState=AudioTrack.PLAYSTATE_STOPPED;head=0;}
        public void release(){releases++;if(releaseFailures-->0)throw new IllegalStateException("release failed");state=AudioTrack.STATE_UNINITIALIZED;}
        public int state(){return state;}
        public int playState(){return playState;}
    }
}
