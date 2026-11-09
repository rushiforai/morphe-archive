package org.ungoogled.ui;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTrack;
import android.os.Handler;
import android.os.SystemClock;
import java.util.function.LongSupplier;
import nl.johninnl.navigation.alerts.PlaybackGrant;

/** One owned static track. Playback head, drain and successful native teardown determine outcomes. */
final class MapsWarningTone {
    interface Events { void started();void finished(PlaybackGrant.Outcome outcome,boolean quiescent); }
    interface Track {
        int write(short[] pcm);void play();long head();void pause();void stop();void release();int state();int playState();
    }
    interface Factory { Track create(short[] pcm,AudioAttributes attributes,Handler handler,Runnable marker); }
    static final int RATE=44100;
    private final Handler handler;
    private final LongSupplier clock;
    private final Factory factory;
    private Session active;
    private volatile boolean fault;
    MapsWarningTone(Handler handler){this(handler,SystemClock::elapsedRealtime,NativeTrack::new);}
    MapsWarningTone(Handler handler,LongSupplier clock,Factory factory){this.handler=handler;this.clock=clock;this.factory=factory;}
    boolean ready(){return !fault && AudioTrack.getMinBufferSize(RATE,AudioFormat.CHANNEL_OUT_MONO,AudioFormat.ENCODING_PCM_16BIT)>0;}
    void play(long deadline,AudioAttributes attributes,Events events) {
        if(active!=null || fault || clock.getAsLong()>=deadline){events.finished(PlaybackGrant.Outcome.NOT_STARTED,true);return;}
        short[] pcm=Chime.warningPcm();Session session=new Session(deadline,pcm.length,events);active=session;
        try {
            session.track=factory.create(pcm,attributes,handler,()->poll(session));
            if(session.track.write(pcm)!=pcm.length || session.track.state()!=AudioTrack.STATE_INITIALIZED)throw new IllegalStateException("TONE_BUFFER");
            session.playRequested=true;session.track.play();poll(session);
        }catch(RuntimeException failure){fault=true;terminate(session,PlaybackGrant.Outcome.FAILED);}
    }
    void cancel(){Session session=active;if(session!=null)terminate(session,PlaybackGrant.Outcome.CANCELLED);}
    private void poll(Session session) {
        if(active!=session || session.terminal)return;
        try {
            observe(session);
            if(session.head>=session.frames){terminate(session,PlaybackGrant.Outcome.COMPLETED);return;}
            long now=clock.getAsLong();
            if(!session.started && now>=session.deadline){terminate(session,PlaybackGrant.Outcome.NOT_STARTED);return;}
            if(session.started && now-session.lastProgress>=3000){terminate(session,PlaybackGrant.Outcome.INTERRUPTED);return;}
            handler.postDelayed(()->poll(session),10);
        }catch(RuntimeException failure){fault=true;terminate(session,PlaybackGrant.Outcome.FAILED);}
    }
    private void observe(Session session) {
        long head=session.track.head();
        if(head<session.head || head>session.frames)throw new IllegalStateException("TONE_HEAD");
        session.observed=true;
        if(head>session.head){session.head=head;session.lastProgress=clock.getAsLong();}
        if(head>0 && !session.started){session.started=true;session.events.started();}
    }
    private void terminate(Session session,PlaybackGrant.Outcome requested) {
        if(active!=session || session.terminal)return;
        boolean quiet=false;
        try {
            if(session.track!=null) {
                if(session.playRequested && !session.stopped) {
                    // Pause freezes the head before stop resets it. A returned play() is never STARTED.
                    if(session.track.playState()!=AudioTrack.PLAYSTATE_STOPPED) {
                        session.track.pause();
                        if(session.track.playState()!=AudioTrack.PLAYSTATE_PAUSED && session.track.playState()!=AudioTrack.PLAYSTATE_STOPPED)throw new IllegalStateException("TONE_PAUSE");
                        observe(session);session.track.stop();
                    }
                    if(session.track.playState()!=AudioTrack.PLAYSTATE_STOPPED)throw new IllegalStateException("TONE_STOP");
                    session.stopped=true;
                }
            }
        }catch(RuntimeException error){fault=true;}
        // A successful release of this sole owned static track also proves teardown if pause/stop failed.
        try { if(session.track!=null){session.track.release();quiet=session.track.state()==AudioTrack.STATE_UNINITIALIZED;}else quiet=true; }
        catch(RuntimeException error){fault=true;}
        if(!quiet) {
            if(!session.uncertain){session.uncertain=true;session.events.finished(PlaybackGrant.Outcome.UNCERTAIN,false);}
            // Retain the same track and output identity. No replacement output is opened.
            handler.postDelayed(()->terminate(session,requested),100);return;
        }
        PlaybackGrant.Outcome outcome=requested;
        if(requested==PlaybackGrant.Outcome.COMPLETED && session.head<session.frames)outcome=PlaybackGrant.Outcome.INTERRUPTED;
        if(requested!=PlaybackGrant.Outcome.COMPLETED && !session.started && (!session.playRequested || session.observed && session.head==0))outcome=PlaybackGrant.Outcome.NOT_STARTED;
        else if(requested!=PlaybackGrant.Outcome.COMPLETED && session.started)outcome=PlaybackGrant.Outcome.INTERRUPTED;
        session.terminal=true;active=null;session.events.finished(outcome,true);
    }
    private static final class Session {
        final long deadline;final int frames;final Events events;
        Track track;long head,lastProgress;boolean playRequested,observed,started,terminal,uncertain,stopped;
        Session(long deadline,int frames,Events events){this.deadline=deadline;this.frames=frames;this.events=events;}
    }
    private static final class NativeTrack implements Track {
        final AudioTrack track;
        NativeTrack(short[] pcm,AudioAttributes attributes,Handler handler,Runnable marker) {
            track=new AudioTrack.Builder().setAudioAttributes(attributes)
                    .setAudioFormat(new AudioFormat.Builder().setSampleRate(RATE).setEncoding(AudioFormat.ENCODING_PCM_16BIT).setChannelMask(AudioFormat.CHANNEL_OUT_MONO).build())
                    .setBufferSizeInBytes(pcm.length*2).setTransferMode(AudioTrack.MODE_STATIC).build();
            track.setPlaybackPositionUpdateListener(new AudioTrack.OnPlaybackPositionUpdateListener(){
                @Override public void onMarkerReached(AudioTrack ignored){marker.run();}
                @Override public void onPeriodicNotification(AudioTrack ignored){}
            },handler);
            if(track.setNotificationMarkerPosition(pcm.length)!=AudioTrack.SUCCESS){track.release();throw new IllegalStateException("TONE_MARKER");}
        }
        public int write(short[] pcm){return track.write(pcm,0,pcm.length);}
        public void play(){track.play();}
        public long head(){return Integer.toUnsignedLong(track.getPlaybackHeadPosition());}
        public void pause(){track.pause();}
        public void stop(){track.stop();}
        public void release(){track.release();}
        public int state(){return track.getState();}
        public int playState(){return track.getPlayState();}
    }
}
