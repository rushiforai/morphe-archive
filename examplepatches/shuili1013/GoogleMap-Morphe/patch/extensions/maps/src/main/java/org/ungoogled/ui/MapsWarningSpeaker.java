package org.ungoogled.ui;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.speech.tts.Voice;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import nl.johninnl.navigation.alerts.PlaybackGrant;
import nl.johninnl.navigation.alerts.WarningAudioOwner;
import nl.johninnl.navigation.alerts.WarningEvent;

/** Receiver-owned offline TTS, serialized with the verified native Maps guidance hold. */
public final class MapsWarningSpeaker implements AutoCloseable {
    public interface Listener {
        void started(PlaybackGrant grant);
        void finished(PlaybackGrant grant,PlaybackGrant.Outcome outcome,boolean quiescent);
    }
    private final Context app;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final MapsGuidanceCoordinator guidance;
    private final AudioManager audio;
    private final MapsWarningTone tone=new MapsWarningTone(main);
    private TextToSpeech tts;
    private AudioFocusRequest focus;
    private volatile boolean initialized,closed;
    private boolean initializing;
    private long initializationGeneration;
    private volatile String preparedLanguage="";
    private String requestedLanguage="";
    private Attempt active;
    private final AudioAttributes attributes=new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE).setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build();
    private final AudioAttributes toneAttributes=new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE).setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION).build();

    public MapsWarningSpeaker(Context context) {
        app=context.getApplicationContext();audio=(AudioManager)app.getSystemService(Context.AUDIO_SERVICE);
        guidance=new MapsGuidanceCoordinator(app);
    }
    public void prepare(String language) {
        prepare(language,WarningAudioOwner.Mode.VOICE);
    }
    public void prepare(String language,WarningAudioOwner.Mode mode) {
        if(mode!=WarningAudioOwner.Mode.VOICE)return;
        main.post(()-> {
            if(closed)return;
            requestedLanguage=language==null?"":language;
            if(tts!=null&&!initialized&&!initializing&&active==null){tts.shutdown();tts=null;}
            if(tts==null) {
                initializing=true;long initialization=++initializationGeneration;
                tts=new TextToSpeech(app,result->main.post(()-> {
                    if(closed||initialization!=initializationGeneration)return;
                    initializing=false;
                    initialized=result==TextToSpeech.SUCCESS;
                    if(initialized && !closed) { tts.setAudioAttributes(attributes);tts.setOnUtteranceProgressListener(progress);selectVoice(requestedLanguage); }
                }));
            }else if(initialized && active==null)selectVoice(requestedLanguage);
        });
    }
    private boolean selectVoice(String language) {
        preparedLanguage="";
        if(!initialized || language==null || language.equals("und"))return false;
        Locale locale=Locale.forLanguageTag(language);if(locale.getLanguage().isEmpty())return false;
        Set<Voice> voices=tts.getVoices();if(voices==null)return false;
        Voice selected=null;
        for(Voice voice:voices)if(!voice.isNetworkConnectionRequired() && voice.getLocale().getLanguage().equals(locale.getLanguage())) {
            if(selected==null || voice.getLocale().equals(locale) || voice.getLocale().getCountry().equals(locale.getCountry()))selected=voice;
            if(voice.getLocale().equals(locale))break;
        }
        if(selected==null || tts.setVoice(selected)!=TextToSpeech.SUCCESS)return false;
        preparedLanguage=language;return true;
    }
    public WarningAudioOwner.Mode effectiveMode(WarningAudioOwner.Mode requested){return guidance.effectiveMode(requested);}
    public boolean isReady(String language){return isReady(language,WarningAudioOwner.Mode.VOICE);}
    public boolean isReady(String language,WarningAudioOwner.Mode mode) {
        if(mode==WarningAudioOwner.Mode.SILENT)return true;
        // An initialized engine with no selected voice is not a usable voice
        // capability. In particular, two empty language strings must not match.
        if(mode==WarningAudioOwner.Mode.VOICE&&(language==null||language.isEmpty()||language.equals("und")))return false;
        WarningAudioOwner.Mode effective=effectiveMode(mode);
        if(closed || !guidance.isReady() || effective!=mode)return false;
        if(mode==WarningAudioOwner.Mode.TONE)return audio!=null&&tone.ready();
        return mode==WarningAudioOwner.Mode.VOICE && initialized && language!=null && language.equals(preparedLanguage);
    }
    /** Updated UPSERT payloads must use the original ANNOUNCE deadline through the overload below. */
    public boolean speak(WarningEvent payload,PlaybackGrant grant,Listener listener) {
        if(payload==null || payload.operation!=WarningEvent.Operation.ANNOUNCE)return false;
        return speak(payload,grant,payload.announceUntil,listener);
    }
    public synchronized boolean speak(WarningEvent payload,PlaybackGrant grant,long announceUntil,Listener listener) {
        if(payload==null || grant==null || listener==null || closed || active!=null || !grant.granted || grant.mode==WarningAudioOwner.Mode.SILENT
                || !isReady(payload.languageTag,grant.mode) || SystemClock.elapsedRealtime()>=announceUntil)return false;
        Attempt attempt=new Attempt(payload,grant,announceUntil,listener);active=attempt;main.post(()->begin(attempt));return true;
    }
    private void begin(Attempt attempt) {
        if(active!=attempt)return;
        if(closed || attempt.cancelled || !isReady(attempt.payload.languageTag,attempt.grant.mode) || SystemClock.elapsedRealtime()>=attempt.until) { finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return; }
        guidance.acquire(attempt.id,attempt.payload.priority,attempt.until,(quiet,reason)-> {
            if(active!=attempt)return;
            if(!quiet || closed || attempt.cancelled || !isReady(attempt.payload.languageTag,attempt.grant.mode) || SystemClock.elapsedRealtime()>=attempt.until) { finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return; }
            if(audio==null) { finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return; }
            focus=new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT).setAudioAttributes(attempt.grant.mode==WarningAudioOwner.Mode.TONE?toneAttributes:attributes).setAcceptsDelayedFocusGain(false)
                    .setOnAudioFocusChangeListener(change->{if(change!=AudioManager.AUDIOFOCUS_GAIN && active==attempt)cancel(attempt.grant);},main).build();
            if(audio.requestAudioFocus(focus)!=AudioManager.AUDIOFOCUS_REQUEST_GRANTED) { finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return; }
            if(attempt.grant.mode==WarningAudioOwner.Mode.TONE) {
                attempt.submitted=true;tone.play(attempt.until,toneAttributes,new MapsWarningTone.Events(){
                    public void started(){if(active==attempt&&!attempt.started){attempt.started=true;attempt.listener.started(attempt.grant);}}
                    public void finished(PlaybackGrant.Outcome outcome,boolean quiescent){if(active!=attempt)return;if(quiescent)finish(attempt,outcome,true);else if(!attempt.uncertain){attempt.uncertain=true;attempt.listener.finished(attempt.grant,outcome,false);}}
                });return;
            }
            if(!selectVoice(attempt.payload.languageTag)) { finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return; }
            int result=tts.speak(attempt.payload.message,TextToSpeech.QUEUE_ADD,new Bundle(),attempt.id);
            if(result!=TextToSpeech.SUCCESS) { finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return; }
            attempt.submitted=true;
            main.postDelayed(()->{if(active==attempt && !attempt.started)cancel(attempt.grant);},Math.max(1,attempt.until-SystemClock.elapsedRealtime()));
        });
    }
    private final UtteranceProgressListener progress=new UtteranceProgressListener() {
        @Override public void onStart(String id){main.post(()-> {
            Attempt attempt=matching(id);if(attempt==null || attempt.started)return;attempt.started=true;attempt.listener.started(attempt.grant);
            if(attempt.cancelled || closed || SystemClock.elapsedRealtime()>=attempt.until || !isReady(attempt.payload.languageTag,attempt.grant.mode)){attempt.cancelled=true;stop(attempt);}
        });}
        @Override public void onDone(String id){main.post(()->{Attempt attempt=matching(id);if(attempt!=null)finish(attempt,attempt.cancelled?PlaybackGrant.Outcome.INTERRUPTED:PlaybackGrant.Outcome.COMPLETED,true);});}
        @Override public void onError(String id){main.post(()->{Attempt attempt=matching(id);if(attempt!=null){
            // An error may occur during any synthesis phase, even without an observed onStart.
            attempt.cancelled=true;attempt.ambiguousHistory=true;
            if(!attempt.uncertain){attempt.uncertain=true;attempt.listener.finished(attempt.grant,PlaybackGrant.Outcome.UNCERTAIN,false);}
            stop(attempt);
        }});}
        @Override public void onStop(String id,boolean interrupted){main.post(()->{Attempt attempt=matching(id);if(attempt!=null){
            // Only false proves a pre-synthesis flush. True can include already-generated audio.
            PlaybackGrant.Outcome outcome=attempt.started?PlaybackGrant.Outcome.INTERRUPTED:
                    interrupted||attempt.ambiguousHistory?PlaybackGrant.Outcome.UNCERTAIN:PlaybackGrant.Outcome.NOT_STARTED;
            finish(attempt,outcome,true);
        }});}
    };
    private Attempt matching(String id){Attempt attempt=active;return attempt!=null && attempt.id.equals(id)?attempt:null;}
    public void cancel(PlaybackGrant grant) {
        main.post(()-> {
            Attempt attempt=active;if(attempt==null || grant==null || !attempt.grant.attemptId.equals(grant.attemptId))return;
            attempt.cancelled=true;if(!attempt.submitted)finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);else stop(attempt);
        });
    }
    private void stop(Attempt attempt) {
        if(active!=attempt)return;
        if(attempt.grant.mode==WarningAudioOwner.Mode.TONE){tone.cancel();return;}
        try { tts.stop(); }catch(RuntimeException ignored) { }
        // stop() success is an enqueue/engine API result; only the utterance callback proves quiescence.
        main.postDelayed(()-> {
            if(active==attempt && !attempt.uncertain) { attempt.uncertain=true;attempt.listener.finished(attempt.grant,PlaybackGrant.Outcome.UNCERTAIN,false); }
        },1000);
    }
    private synchronized void finish(Attempt attempt,PlaybackGrant.Outcome outcome,boolean quiescent) {
        if(active!=attempt)return;
        active=null;if(focus!=null && audio!=null)audio.abandonAudioFocusRequest(focus);focus=null;
        guidance.release(attempt.id);
        // The scheduler may have requested another language while this utterance was active.
        // Apply it only after the positive terminal, before the listener advances queued work.
        if(!closed && quiescent && initialized && tts!=null && !requestedLanguage.equals(preparedLanguage))selectVoice(requestedLanguage);
        attempt.listener.finished(attempt.grant,outcome,quiescent);
        if(closed){if(tts!=null)tts.shutdown();tts=null;guidance.close();}
    }
    @Override public void close() {
        closed=true;main.post(()-> {
            Attempt attempt=active;if(attempt!=null){attempt.cancelled=true;if(attempt.submitted)stop(attempt);else finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);}
            else {if(tts!=null)tts.shutdown();tts=null;guidance.close();}
        });
    }
    private static final class Attempt {
        final WarningEvent payload;final PlaybackGrant grant;final long until;final Listener listener;final String id="morphe-warning-"+UUID.randomUUID();
        boolean submitted,started,cancelled,uncertain,ambiguousHistory;
        Attempt(WarningEvent payload,PlaybackGrant grant,long until,Listener listener){this.payload=payload;this.grant=grant;this.until=until;this.listener=listener;}
    }
}
