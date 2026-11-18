package nl.johninnl.vela;

import android.content.Context;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.Voice;
import java.util.Set;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Collections;
import java.lang.reflect.Constructor;
import java.util.Locale;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;
import nl.johninnl.navigation.alerts.PlaybackGrant;
import nl.johninnl.navigation.alerts.ProviderSound;
import nl.johninnl.navigation.alerts.WarningAudioOwner;
import nl.johninnl.navigation.alerts.WarningEvent;

/** Uses the selected, initialized native system engine and its ORIGINAL listener/focus owner.
 * Neural jobs retain the selected native model/executor and own only their external output track.
 * Untagged route guidance keeps its native listener path. No text or coordinates enter IDs/logs.
 */
public final class VelaWarningSpeaker {
    public interface Listener {
        void started(PlaybackGrant grant);
        void finished(PlaybackGrant grant, PlaybackGrant.Outcome outcome, boolean quiescent);
    }
    private static final Object LOCK = new Object();
    private static final Map<Object, WeakReference<VelaWarningSpeaker>> GUIDES = new WeakHashMap<>();
    private static final Map<Object, Attempt> CLOSURES = new WeakHashMap<>();
    private static final Map<Object, NativeClosure> NATIVE_CLOSURES = new WeakHashMap<>();
    private static final Map<String, Attempt> UTTERANCES = new HashMap<>();
    private static final ThreadLocal<Attempt> SCOPE = new ThreadLocal<>();
    private final Handler callbacks = new Handler(Looper.getMainLooper());
    private final ExecutorService tones;
    private static final ExecutorService SOUNDS=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"VelaWarningSound");t.setDaemon(true);return t;});
    /** Decode the provider's alert sound when its announcement arrives, before any grant needs it. */
    public static void prefetch(Context context,WarningEvent event) {
        // Prefetch the uniform alert sound the scheduler will actually hand to this speaker.
        String name=ProviderSound.name(nl.johninnl.navigation.alerts.UniformAlerts.localize(event));
        if(context==null || name==null || ProviderSound.cached(ProviderSound.FLITSMEISTER,name)!=null)return;
        Context app=context.getApplicationContext();
        SOUNDS.execute(()->ProviderSound.load(app,ProviderSound.FLITSMEISTER,name));
    }
    public VelaWarningSpeaker(){this(Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"VelaWarningOutput");t.setDaemon(true);return t;}));}
    VelaWarningSpeaker(ExecutorService output){if(output==null)throw new IllegalArgumentException("Output executor");tones=output;}
    private Object guide;
    private WeakReference<Object> session=new WeakReference<>(null);
    private boolean regenerateRequested;
    private Attempt active;
    private final Map<String,Long> used = new HashMap<>();
    private long generation;
    private int focusResult;
    private Object focusIdentity,engineFocusIdentity;
    private long focusSerial,focusCounterEpoch,engineFocusSerial,engineFocusEpoch;
    private boolean closed;

    public void bind(Object actualGuide) {
        synchronized (LOCK) {
            if (guide == actualGuide && !closed) return;
            close();
            guide = actualGuide; session=new WeakReference<>(null);regenerateRequested=false; closed = false; generation++;
            if (guide != null) GUIDES.put(guide, new WeakReference<>(this));
        }
    }
    public void bindSession(Object actualSession) {
        synchronized(LOCK) {
            try { if(actualSession==null || read(actualSession,"b")==guide)session=new WeakReference<>(actualSession); }
            catch(ReflectiveOperationException failure){session=new WeakReference<>(null);}
        }
    }
    /** Only the native location update invokes this hook. Regenerate through its CURRENT route
     * projection and prompt bands, preserving every other immutable navigation-state field.
     */
    public static Object regenerateInput(Object route,Object state) {
        synchronized(LOCK) {
            for(WeakReference<VelaWarningSpeaker> ref:GUIDES.values()) {
                VelaWarningSpeaker owner=ref.get();
                if(owner==null || !owner.regenerateRequested || owner.active!=null || owner.closed)continue;
                try {
                    Object navSession=owner.session.get();if(navSession==null || flag(owner.guide,"n"))continue;
                    Object flow=read(navSession,"f");Object snapshot=method(flow,"getValue").invoke(flow);
                    if(read(snapshot,"d")!=route || !flag(snapshot,"a") || flag(snapshot,"b") || flag(snapshot,"c"))continue;
                    if(flag(state,"e") || flag(state,"g"))continue;
                    Constructor<?> copy=state.getClass().getDeclaredConstructor(int.class,double.class,double.class,double.class,
                            boolean.class,int.class,boolean.class,Set.class,double.class,int.class,int.class,boolean.class,double.class,int.class);
                    copy.setAccessible(true);
                    Object regenerated=copy.newInstance(read(state,"a"),read(state,"b"),read(state,"c"),read(state,"d"),read(state,"e"),read(state,"f"),
                            read(state,"g"),Collections.emptySet(),read(state,"i"),read(state,"j"),read(state,"k"),read(state,"l"),read(state,"m"),read(state,"n"));
                    owner.regenerateRequested=false;return regenerated;
                } catch(ReflectiveOperationException|RuntimeException failure) { return state; }
            }
            return state;
        }
    }
    /** Use the actual bound native guide and persisted native engine choice in car-only sessions. */
    public void prepare(String language){prepare(language,WarningAudioOwner.Mode.VOICE);}
    public void prepare(String language,WarningAudioOwner.Mode mode) {
        synchronized(LOCK) {
            if(mode!=WarningAudioOwner.Mode.VOICE || effectiveMode(mode)!=mode || closed || guide==null || active!=null)return;
            try {
                Context context=(Context)read(guide,"a");String selected=context.getSharedPreferences("vela_settings",0).getString("voice_engine",null);
                boolean neural=selected!=null&&selected.startsWith("vela.");
                if(selected==null) {
                    try {Class<?> registry=Class.forName("os1",true,guide.getClass().getClassLoader());neural=Boolean.TRUE.equals(registry.getMethod("w",Context.class).invoke(null,context));}
                    catch(ClassNotFoundException absent){neural=false;}
                }
                if(neural)selected="vela.piper";
                else if(selected!=null && !context.getPackageManager().getApplicationInfo(selected,0).enabled)return;
                String current=(String)read(guide,"f");boolean same=current==null?selected==null:current.equals(selected);
                if(same && neural && flag(guide,"m") && flag(guide,"e"))return;
                if(same && !neural && !flag(guide,"m") && read(guide,"b")!=null && (flag(guide,"h") || !flag(guide,"i")))return;
                if(neural && read(guide,"l")==null) {
                    Object application=context.getApplicationContext();Object component=method(read(application,"g"),"b").invoke(read(application,"g"));
                    Object provider=read(component,"p");Object backend=method(provider,"get").invoke(provider);
                    if(backend==null || !backend.getClass().getName().equals("y43"))return;
                    field(guide,"l").set(guide,backend);
                }
                method(guide,"d",String.class).invoke(guide,selected);
                // Only native callbacks/model loading establish readiness; requesting init is not ready.
            } catch(ReflectiveOperationException|RuntimeException|android.content.pm.PackageManager.NameNotFoundException unavailable) { }
        }
    }
    public boolean isReady(String language) {
        synchronized(LOCK) { return active==null && (systemReady(language,true)||neuralReady(language,true)); }
    }
    private boolean nativeIdle() throws ReflectiveOperationException {
        if(integer(guide,"s")!=0 || !((Collection<?>)read(guide,"g")).isEmpty())return false;
        TextToSpeech system=(TextToSpeech)read(guide,"b");if(system!=null && system.isSpeaking())return false;
        Object backend=read(guide,"l");AudioTrack nativeTrack=backend==null?null:(AudioTrack)read(backend,"e");
        return nativeTrack==null || nativeTrack.getPlayState()!=AudioTrack.PLAYSTATE_PLAYING;
    }
    private boolean canStopNative() {
        try{return read(guide,"b")!=null || read(guide,"l")!=null;}catch(ReflectiveOperationException|RuntimeException failure){return false;}
    }
    private boolean stopNativeForWarning(Attempt attempt) throws ReflectiveOperationException {
        boolean stopped=false;TextToSpeech system=(TextToSpeech)read(guide,"b");
        if(system!=null){if(system.stop()!=TextToSpeech.SUCCESS)return false;stopped=true;}
        Object backend=read(guide,"l");if(backend!=null){method(backend,"h").invoke(backend);stopped=true;}
        return stopped;
    }
    private boolean systemReady(String language,boolean idle) {
        try {
            if(closed || guide==null || flag(guide,"m") || !flag(guide,"e") || !flag(guide,"h") || flag(guide,"i")
                    || !((Collection<?>)read(guide,"g")).isEmpty())return false;
            TextToSpeech engine=(TextToSpeech)read(guide,"b");Locale locale=locale(language);
            return engine!=null && locale!=null && (!idle || nativeIdle())
                    && engine.isLanguageAvailable(locale)>=TextToSpeech.LANG_AVAILABLE && installedVoice(engine,locale)!=null;
        } catch(ReflectiveOperationException|RuntimeException failure){return false;}
    }
    private boolean neuralReady(String language,boolean idle) {
        try {
            if(closed || guide==null || !flag(guide,"m") || !flag(guide,"e") || !((Collection<?>)read(guide,"g")).isEmpty())return false;
            Object backend=read(guide,"l");Locale wanted=locale(language);
            if(backend==null || wanted==null || flag(backend,"f") || read(backend,"d")==null || !(read(backend,"c") instanceof ExecutorService))return false;
            Object id=read(backend,"h");if(!(id instanceof String) || ((String)id).isEmpty())return false;
            String nativeLanguage=(String)method(backend,"b").invoke(backend);
            if(nativeLanguage==null || !wanted.getLanguage().equals(locale(nativeLanguage).getLanguage()))return false;
            return !idle || nativeIdle();
        } catch(ReflectiveOperationException|RuntimeException failure){return false;}
    }
    /** Urgent warnings may interrupt native system guidance, then wait for its real queue to drain.
     * A bound native session is required so held guidance can regenerate from the next current fix.
     */
    public boolean canSpeak(WarningEvent event,WarningAudioOwner.Mode mode) {
        synchronized(LOCK) {
            if(event==null || active!=null || effectiveMode(mode)!=mode)return false;
            if(isReady(event.languageTag,mode))return true;
            return event.priority==WarningEvent.Priority.P0 && session.get()!=null && canStopNative()
                    && (mode==WarningAudioOwner.Mode.TONE || mode==WarningAudioOwner.Mode.VOICE
                    && (systemReady(event.languageTag,false)||neuralReady(event.languageTag,false)));
        }
    }
    /** Tones do not initialize or depend on either speech engine. */
    public boolean isReady(String language, WarningAudioOwner.Mode mode) {
        if(mode==WarningAudioOwner.Mode.SILENT)return true;
        if(mode==WarningAudioOwner.Mode.VOICE)return isReady(language);
        synchronized(LOCK) {
            try { return !closed && guide!=null && active==null && nativeIdle() && read(guide,"p")!=null
                    && effectiveMode(mode)==mode; }
            catch(ReflectiveOperationException|RuntimeException failure){return false;}
        }
    }
    public WarningAudioOwner.Mode effectiveMode(WarningAudioOwner.Mode requested) {
        synchronized (LOCK) {
            try {
                if (requested == null || guide == null || closed) return requested;
                if (!flag(guide, "n")) return requested;
                return flag(guide, "o") && requested != WarningAudioOwner.Mode.SILENT
                        ? WarningAudioOwner.Mode.TONE : WarningAudioOwner.Mode.SILENT;
            } catch (ReflectiveOperationException | RuntimeException failure) { return requested; }
        }
    }
    public boolean speak(WarningEvent payload, PlaybackGrant grant, Listener listener) {
        return payload!=null && payload.operation==WarningEvent.Operation.ANNOUNCE
                && speak(payload,grant,payload.announceUntil,listener);
    }
    /** A revised UPSERT carries text, while the original ANNOUNCE retains playback authority/deadline. */
    public boolean speak(WarningEvent payload, PlaybackGrant grant, long originalAnnounceUntil, Listener listener) {
        synchronized (LOCK) {
            long now=SystemClock.elapsedRealtime();
            used.entrySet().removeIf(entry->entry.getValue()<=now);
            if (Looper.myLooper()!=Looper.getMainLooper() || payload == null || grant == null || listener == null || !grant.granted
                    || grant.started || grant.outcome!=PlaybackGrant.Outcome.GRANTED || payload.operation==WarningEvent.Operation.CLEAR || payload.message.isEmpty()
                    || !grant.providerSession.equals(payload.providerSession) || grant.revision!=payload.revision
                    || used.containsKey(grant.attemptId) || used.size()>=128
                    || grant.mode == WarningAudioOwner.Mode.SILENT
                    || effectiveMode(grant.mode) != grant.mode
                    || now>=originalAnnounceUntil || originalAnnounceUntil<=0 || !canSpeak(payload,grant.mode)
                    || SCOPE.get() != null || UTTERANCES.size() >= 128) return false;
            boolean interruptNative=!isReady(payload.languageTag,grant.mode);
            Attempt attempt = new Attempt(this, payload, grant, listener, generation,originalAnnounceUntil);
            used.put(grant.attemptId,Math.max(originalAnnounceUntil,now+30000));
            active = attempt;attempt.holding=true;
            String sound=ProviderSound.name(payload);
            attempt.sound=sound==null?null:ProviderSound.cached(ProviderSound.FLITSMEISTER,sound);
            // Voice: the provider's own alert sound plays first on the tone path, then the speech.
            attempt.preroll=grant.mode==WarningAudioOwner.Mode.VOICE && attempt.sound!=null;
            if(grant.mode!=WarningAudioOwner.Mode.TONE)UTTERANCES.put("vela-"+attempt.id,attempt);
            if(interruptNative) {
                attempt.heldNative=true;regenerateRequested=true;
                try {
                    if(!stopNativeForWarning(attempt)){finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return false;}
                    callbacks.post(()->awaitNative(attempt));return true;
                } catch(ReflectiveOperationException|RuntimeException failure){finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return false;}
            }
            return grant.mode==WarningAudioOwner.Mode.TONE || attempt.preroll?submitTone(attempt):submitSystem(attempt);
        }
    }
    /** After the provider sound, the same attempt continues with the spoken text. */
    private void speakAfterSound(Attempt attempt) {
        synchronized(LOCK) {
            if(active!=attempt)return;
            PlaybackGrant.Outcome blocked=eligibility(attempt,false);
            if(blocked!=null){finish(attempt,attempt.started?PlaybackGrant.Outcome.INTERRUPTED:blocked,true);return;}
            if(systemReady(attempt.event.languageTag,true)||neuralReady(attempt.event.languageTag,true)){submitSystem(attempt);return;}
            callbacks.postDelayed(()->speakAfterSound(attempt),20);
        }
    }
    private boolean submitSystem(Attempt attempt) {
        SCOPE.set(attempt);
        try {
            method(guide,"j",String.class,boolean.class,boolean.class).invoke(guide,attempt.event.message,false,false);
            if(!attempt.captured){finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return false;}
            return true;
        } catch(ReflectiveOperationException|RuntimeException failure) {
            finish(attempt,attempt.submitted?PlaybackGrant.Outcome.UNCERTAIN:PlaybackGrant.Outcome.FAILED,!attempt.submitted);
            return attempt.submitted;
        } finally {SCOPE.remove();}
    }
    private void awaitNative(Attempt attempt) {
        synchronized(LOCK) {
            if(active!=attempt)return;
            PlaybackGrant.Outcome blocked=eligibility(attempt,false);
            if(blocked!=null){finish(attempt,blocked,true);return;}
            if(attempt.grant.mode==WarningAudioOwner.Mode.TONE || attempt.preroll) {
                try {if(nativeIdle()){submitTone(attempt);return;}}catch(ReflectiveOperationException|RuntimeException failure){finish(attempt,PlaybackGrant.Outcome.FAILED,true);return;}
            } else if(systemReady(attempt.event.languageTag,true)||neuralReady(attempt.event.languageTag,true)){submitSystem(attempt);return;}
            callbacks.postDelayed(()->awaitNative(attempt),20);
        }
    }
    public void cancel(PlaybackGrant grant) {
        synchronized (LOCK) {
            Attempt attempt = active;
            if (attempt == null || !same(attempt.grant, grant)) return;
            attempt.cancelled = true;
            if(attempt.grant.mode==WarningAudioOwner.Mode.TONE || attempt.neural!=null || attempt.preroll) {
                boolean quiet=stopTone(attempt);releaseRejected(attempt);
                finish(attempt,quiet?PlaybackGrant.Outcome.CANCELLED:PlaybackGrant.Outcome.UNCERTAIN,quiet);return;
            }
            // Native dispatch is held while our attempt is active. Its fresh route prompt is
            // regenerated on the next native fix, never by replaying held text.
            if(attempt.heldNative)regenerateRequested=true;
            attempt.holding=false;
            if(attempt.submitted && attempt.engine!=null) {
                try { if(attempt.engine.stop()==TextToSpeech.SUCCESS)releaseRejected(attempt); }
                catch(RuntimeException failure){ /* Outcome remains fenced until an actual terminal callback. */ }
            }
            finish(attempt, attempt.submitted ? PlaybackGrant.Outcome.UNCERTAIN : PlaybackGrant.Outcome.CANCELLED,!attempt.submitted);
        }
    }
    public void close() {
        synchronized (LOCK) {
            if (active != null) cancel(active.grant);
            if (guide != null) GUIDES.remove(guide);
            closed = true; generation++;
            // Submitted attempts remain reachable from their closure/listener until terminal proof.
        }
    }

    /** Scope the native pre-dispatch language checks to this warning without changing app locale. */
    public static String language(Object nativeGuide,String nativeTag) {
        Attempt attempt=SCOPE.get();
        if(attempt==null || attempt.nativeGuide!=nativeGuide)return nativeTag;
        Locale locale=locale(attempt.event.languageTag);return locale==null?nativeTag:locale.getLanguage();
    }
    /** Constructor hook runs before the native delayed closure leaves the synchronous scope. */
    public static void capture(Object closure) {
        synchronized (LOCK) {
            Attempt attempt = SCOPE.get();
            try {
                if (((Number)read(closure,"f")).byteValue() == 0)return;
                Object nativeGuide=read(closure,"h");
                if(attempt==null) {
                    VelaWarningSpeaker owner=owner(nativeGuide);
                    if(owner!=null && NATIVE_CLOSURES.size()<4096)NATIVE_CLOSURES.put(closure,new NativeClosure(owner,nativeGuide,owner.focusCounterEpoch));
                    return;
                }
                if(nativeGuide != attempt.owner.guide)return;
                if (CLOSURES.containsKey(closure)) return;
                if (CLOSURES.size() >= 4096) throw new IllegalStateException("Vela warning closure bound");
                attempt.engine = (TextToSpeech) read(closure,"i");
                attempt.captured = true;
                CLOSURES.put(closure,attempt);
            } catch (ReflectiveOperationException failure) { throw new IllegalStateException("Vela warning closure ABI",failure); }
        }
    }
    /** External interruption holds native pending closures for fresh-route regeneration. */
    public static boolean dispatch(Object closure) {
        synchronized (LOCK) {
            Attempt attempt = CLOSURES.get(closure);
            if (attempt == null) {
                NativeClosure nativeClosure=NATIVE_CLOSURES.get(closure);
                if(nativeClosure==null)return false;
                if(nativeClosure.consumed)return true;
                VelaWarningSpeaker owner=nativeClosure.owner;Attempt current=owner.active;
                if(current==null || !current.holding || current.cancelled)return false;
                nativeClosure.consumed=true;current.heldNative=true;owner.regenerateRequested=true;
                if(nativeClosure.counterEpoch==owner.focusCounterEpoch && nativeClosure.guide==owner.guide)try{method(nativeClosure.guide,"f").invoke(nativeClosure.guide);}catch(ReflectiveOperationException ignored){}
                return true;
            }
            if (attempt.dispatched) return true;
            attempt.dispatched = true;
            VelaWarningSpeaker owner = attempt.owner;
            PlaybackGrant.Outcome blocked = rejection(attempt);
            if (blocked != null) { releaseRejected(attempt); finish(attempt,blocked,true); return true; }
            try {
                TextToSpeech engine = attempt.engine;
                if (engine == null || engine != read(owner.guide,"b") || flag(owner.guide,"m")
                        || engine.setLanguage(locale(attempt.event.languageTag)) < TextToSpeech.LANG_AVAILABLE) {
                    releaseRejected(attempt); finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true); return true;
                }
                Voice voice=installedVoice(engine,locale(attempt.event.languageTag));
                if(voice==null || engine.setVoice(voice)==TextToSpeech.ERROR) {
                    releaseRejected(attempt); finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true); return true;
                }
                // Keep native last-language cache honest: the NEXT route prompt must restore its language.
                field(owner.guide,"j").set(owner.guide,attempt.event.languageTag);
                Bundle parameters = new Bundle();
                parameters.putFloat(TextToSpeech.Engine.KEY_PARAM_VOLUME,
                        Math.min(1f,((Number)read(owner.guide,"d")).floatValue()));
                int lead=attempt.event.priority==WarningEvent.Priority.P0?TextToSpeech.SUCCESS:
                        engine.playSilentUtterance(300L,TextToSpeech.QUEUE_ADD,"vela-lead-"+attempt.id);
                if (lead == TextToSpeech.ERROR) {
                    releaseRejected(attempt); finish(attempt,PlaybackGrant.Outcome.FAILED,true); return true;
                }
                blocked = rejection(attempt);
                if (blocked != null) { releaseRejected(attempt); finish(attempt,blocked,true); return true; }
                // Preserve external native text verbatim; Vela's current NavLocale expansion is unrelated.
                attempt.submitted = true;
                if (engine.speak(attempt.event.message,TextToSpeech.QUEUE_ADD,parameters,"vela-"+attempt.id) == TextToSpeech.ERROR) {
                    attempt.submitted = false; releaseRejected(attempt); finish(attempt,PlaybackGrant.Outcome.FAILED,true);
                }
            } catch (ReflectiveOperationException | RuntimeException failure) {
                if (!attempt.submitted) releaseRejected(attempt);
                finish(attempt,attempt.submitted ? PlaybackGrant.Outcome.UNCERTAIN : PlaybackGrant.Outcome.FAILED,!attempt.submitted);
            }
            return true;
        }
    }
    public static void focusRequest(Object nativeGuide) {
        synchronized (LOCK) { VelaWarningSpeaker owner=owner(nativeGuide); if(owner!=null){owner.focusSerial++;owner.focusResult=0;owner.focusIdentity=null;} }
    }
    /** Exact raw request result, before native code collapses DELAYED and GRANTED to boolean. */
    public static void focusResult(Object nativeGuide,int result) {
        synchronized (LOCK) {
            VelaWarningSpeaker owner = owner(nativeGuide);
            if (owner != null) {
                owner.focusResult=result;owner.focusIdentity=null;
                if(result==AudioManager.AUDIOFOCUS_REQUEST_GRANTED)try{owner.focusIdentity=read(nativeGuide,"q");}catch(ReflectiveOperationException failure){owner.focusResult=0;}
            }
        }
    }
    /** Engine selection does not necessarily abandon its native focus request. Preserve only an
     * observed grant for the exact retained request after the original method returns.
     */
    public static void engineChanging(Object nativeGuide) {
        synchronized(LOCK) {
            VelaWarningSpeaker owner=owner(nativeGuide);if(owner==null)return;
            owner.engineFocusIdentity=owner.focusResult==AudioManager.AUDIOFOCUS_REQUEST_GRANTED?owner.focusIdentity:null;
            owner.engineFocusSerial=owner.focusSerial;owner.engineFocusEpoch=owner.focusCounterEpoch;
            Attempt active=owner.active;
            if(active!=null){owner.cancel(active.grant);if(!active.submitted)releaseRejected(active);}
            owner.generation++;owner.focusResult=0;owner.focusIdentity=null;
        }
    }
    public static void engineChanged(Object nativeGuide) {
        synchronized(LOCK) {
            VelaWarningSpeaker owner=owner(nativeGuide);if(owner==null)return;
            try {
                if(owner.focusSerial==owner.engineFocusSerial && owner.focusCounterEpoch==owner.engineFocusEpoch
                        && owner.engineFocusIdentity!=null && read(nativeGuide,"q")==owner.engineFocusIdentity && flag(nativeGuide,"t")) {
                    owner.focusResult=AudioManager.AUDIOFOCUS_REQUEST_GRANTED;owner.focusIdentity=owner.engineFocusIdentity;
                }
            } catch(ReflectiveOperationException|RuntimeException failure){owner.focusResult=0;owner.focusIdentity=null;}
            owner.engineFocusIdentity=null;
        }
    }
    /** Native stop ENTRY invalidates delayed tags before the host resets its focus count. */
    public static void nativeStop(Object nativeGuide) {
        synchronized (LOCK) {
            VelaWarningSpeaker owner = owner(nativeGuide);
            if (owner == null) return;
            owner.generation++;owner.focusCounterEpoch++;owner.focusResult=0;owner.focusIdentity=null;owner.engineFocusIdentity=null;
            if (owner.active != null) {
                Attempt attempt=owner.active; attempt.nativeStopped=true; attempt.cancelled=true;
                boolean quiet=attempt.grant.mode==WarningAudioOwner.Mode.TONE || attempt.neural!=null?stopTone(attempt):!attempt.submitted;
                finish(attempt,quiet?PlaybackGrant.Outcome.CANCELLED:PlaybackGrant.Outcome.UNCERTAIN,quiet);
            }
        }
    }
    /** Hold newly requested native guidance while the external system utterance owns the queue.
     * An interrupting native prompt wins immediately; it is submitted after stop on the same engine.
     */
    public static boolean beforeSpeech(Object nativeGuide,boolean interrupt) {
        synchronized(LOCK) {
            VelaWarningSpeaker owner=owner(nativeGuide);if(owner==null)return false;
            Attempt attempt=owner.active;
            if(attempt==null || SCOPE.get()==attempt || !attempt.holding || attempt.cancelled)return false;
            attempt.heldNative=true;owner.regenerateRequested=true;
            if(interrupt){owner.cancel(attempt.grant);return false;}
            return true;
        }
    }
    /** Native route speech wins over an external tone; stop only the extension's track. */
    public static void nativeSpeech(Object nativeGuide) {
        synchronized(LOCK) {
            VelaWarningSpeaker owner=owner(nativeGuide);
            if(owner!=null && owner.active!=null && owner.active.grant.mode==WarningAudioOwner.Mode.TONE
                    && owner.active.event.priority!=WarningEvent.Priority.P0)owner.cancel(owner.active.grant);
        }
    }
    public static void focusChanged(Object nativeListener,int change) {
        if (change != AudioManager.AUDIOFOCUS_LOSS && change != AudioManager.AUDIOFOCUS_LOSS_TRANSIENT) return;
        try { nativeStop(read(nativeListener,"a")); }
        catch (ReflectiveOperationException failure) { throw new IllegalStateException("Vela focus listener ABI",failure); }
    }
    public static void utteranceStart(Object listener,String id) { utterance(listener,id,0); }
    public static boolean utteranceDone(Object listener,String id) { return utterance(listener,id,1); }
    public static boolean utteranceError(Object listener,String id) { return utterance(listener,id,2); }
    public static boolean utteranceStopped(Object listener,String id,boolean interrupted) { return utterance(listener,id,3,interrupted); }
    /** Observe inside the original listener. Tagged terminals balance its original f() once;
     * after native stop reset the count, a late tagged callback must not decrement a new route.
     * Untagged callbacks execute the complete original method.
     */
    public static boolean utterance(Object nativeListener,String id,int event) {return utterance(nativeListener,id,event,true);}
    private static boolean utterance(Object nativeListener,String id,int event,boolean interrupted) {
        if (id == null || !id.startsWith("vela-warning-")) return false;
        synchronized (LOCK) {
            Attempt attempt = UTTERANCES.get(id);
            // Native route IDs are vela-<integer>. Unknown/duplicate external IDs are inert.
            if (attempt == null) return true;
            try { if (read(nativeListener,"a") != attempt.nativeGuide) return true; }
            catch (ReflectiveOperationException failure) { return true; }
            if (event == 0) {
                if (!attempt.started && !attempt.quiescent) {
                    boolean stop=rejection(attempt)!=null || SystemClock.elapsedRealtime()>=attempt.announceUntil;
                    // An observed native start is a fact even after cancellation. Forward only
                    // this immutable OLD grant, so the common scheduler/source durably fence it.
                    attempt.started=true;
                    attempt.owner.callbacks.post(() -> attempt.listener.started(attempt.grant));
                    if(stop){attempt.cancelled=true;finish(attempt,PlaybackGrant.Outcome.UNCERTAIN,false);
                        attempt.owner.callbacks.post(() -> attempt.owner.cancel(attempt.grant));}
                }
            } else {
                releaseRejected(attempt);
                PlaybackGrant.Outcome outcome;
                if(!attempt.started && (event==2 || event==3 && interrupted))outcome=PlaybackGrant.Outcome.UNCERTAIN;
                else if(attempt.cancelled)outcome=PlaybackGrant.Outcome.CANCELLED;
                else if(event==1)outcome=PlaybackGrant.Outcome.COMPLETED;
                else if(event==3)outcome=attempt.started?PlaybackGrant.Outcome.INTERRUPTED:PlaybackGrant.Outcome.NOT_STARTED;
                else outcome=PlaybackGrant.Outcome.FAILED;
                finish(attempt,outcome,true);
            }
            return true;
        }
    }
    private static PlaybackGrant.Outcome rejection(Attempt a) { return eligibility(a,true); }
    private static PlaybackGrant.Outcome eligibility(Attempt a,boolean focus) {
        if (a.cancelled || a.owner.closed || a.generation != a.owner.generation) return PlaybackGrant.Outcome.CANCELLED;
        if (!a.started && SystemClock.elapsedRealtime()>=a.announceUntil) return PlaybackGrant.Outcome.EXPIRED;
        if (a.owner.effectiveMode(a.grant.mode) != a.grant.mode) return PlaybackGrant.Outcome.USER_MUTED;
        if (focus && a.owner.focusResult != AudioManager.AUDIOFOCUS_REQUEST_GRANTED) return PlaybackGrant.Outcome.NOT_STARTED;
        return null;
    }
    private static void releaseRejected(Attempt attempt) {
        if (!attempt.captured || attempt.released || attempt.nativeStopped || attempt.focusCounterEpoch!=attempt.owner.focusCounterEpoch || attempt.nativeGuide!=attempt.owner.guide) return;
        attempt.released=true;
        try { method(attempt.nativeGuide,"f").invoke(attempt.nativeGuide); }
        catch (ReflectiveOperationException | RuntimeException failure) { attempt.releaseFailed=true; }
    }
    private static void finish(Attempt attempt,PlaybackGrant.Outcome outcome,boolean quiescent) {
        if (attempt.terminal && (!quiescent || attempt.quiescent)) return;
        attempt.terminal=true; attempt.quiescent=quiescent;
        if(quiescent && attempt.releaseFailed)outcome=PlaybackGrant.Outcome.FAILED;
        final PlaybackGrant.Outcome reported=outcome;
        if (quiescent) {
            attempt.holding=false;
            UTTERANCES.remove("vela-"+attempt.id);
            if (attempt.owner.active==attempt) attempt.owner.active=null;
        }
        attempt.owner.callbacks.post(() -> attempt.listener.finished(attempt.grant,reported,quiescent));
    }
    private static VelaWarningSpeaker owner(Object guide) {
        WeakReference<VelaWarningSpeaker> ref=GUIDES.get(guide); return ref==null?null:ref.get();
    }
    private static Locale locale(String tag) {
        if (tag==null || tag.isEmpty()) return null;
        try { Locale locale=new Locale.Builder().setLanguageTag(tag).build(); return locale.getLanguage().isEmpty()?null:locale; }
        catch (RuntimeException failure) { return null; }
    }
    /** Intercept only scoped external speech; native trip/prompt callbacks have already run. */
    public static boolean neuralSpeech(Object nativeGuide) {
        synchronized(LOCK) {
            Attempt attempt=SCOPE.get();if(attempt==null || attempt.nativeGuide!=nativeGuide)return false;
            try {
                if(!flag(nativeGuide,"m"))return false;
                Object backend=read(nativeGuide,"l");
                if(!attempt.owner.neuralReady(attempt.event.languageTag,true)) {
                    attempt.captured=true;finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return true;
                }
                NeuralJob job=new NeuralJob(attempt,backend,read(backend,"d"),(String)read(backend,"h"),integer(backend,"g"));
                attempt.neural=job;attempt.captured=true;method(nativeGuide,"b").invoke(nativeGuide);
                PlaybackGrant.Outcome blocked=neuralEligibility(job);
                if(blocked!=null){releaseRejected(attempt);finish(attempt,blocked,true);return true;}
                ((ExecutorService)read(backend,"c")).execute(()->renderNeural(job));
            } catch(ReflectiveOperationException|RuntimeException failure) {
                attempt.captured=true;releaseRejected(attempt);finish(attempt,PlaybackGrant.Outcome.FAILED,true);
            }
            return true;
        }
    }
    private static PlaybackGrant.Outcome neuralEligibility(NeuralJob job) {
        PlaybackGrant.Outcome blocked=rejection(job.attempt);if(blocked!=null)return blocked;
        try {
            if(!flag(job.attempt.nativeGuide,"m") || read(job.attempt.nativeGuide,"l")!=job.backend
                    || read(job.backend,"d")!=job.model || !job.modelId.equals(read(job.backend,"h"))
                    || integer(job.backend,"g")!=job.nativeGeneration || flag(job.backend,"f"))
                return job.attempt.started?PlaybackGrant.Outcome.INTERRUPTED:job.attempt.submitted?PlaybackGrant.Outcome.UNCERTAIN:PlaybackGrant.Outcome.NOT_STARTED;
        } catch(ReflectiveOperationException|RuntimeException failure){return PlaybackGrant.Outcome.FAILED;}
        return null;
    }
    private static void renderNeural(NeuralJob job) {
        Attempt attempt=job.attempt;
        try {
            synchronized(LOCK){PlaybackGrant.Outcome blocked=neuralEligibility(job);if(blocked!=null){releaseRejected(attempt);finish(attempt,blocked,true);return;}}
            // a() validates the current selected model on its ORIGINAL serialized synthesis worker.
            Object selected=method(job.backend,"a").invoke(job.backend);
            synchronized(LOCK){if(selected!=job.model || neuralEligibility(job)!=null){releaseRejected(attempt);finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return;}}
            Context context=(Context)read(job.backend,"a");int speaker=((Number)method(job.backend,"g").invoke(job.backend)).intValue();
            float fallback=((Number)read(attempt.nativeGuide,"c")).floatValue();
            float speed=Math.max(.5f,Math.min(2f,context.getSharedPreferences("vela_settings",0).getFloat("voice_speed",fallback)));
            Method synthesis=job.backend.getClass().getDeclaredMethod("e",job.model.getClass(),String.class,int.class,float.class);synthesis.setAccessible(true);
            Object audio=synthesis.invoke(null,job.model,attempt.event.message,speaker,speed);
            float[] samples=(float[])read(audio,"f");int rate=((Number)read(audio,"g")).intValue();
            if(samples.length==0 || samples.length>8000000 || rate<8000 || rate>192000)throw new IllegalStateException("Vela neural audio size");
            float volume=Math.max(.2f,Math.min(3f,context.getSharedPreferences("vela_settings",0).getFloat("voice_volume",1f)));
            Object level=method(job.backend,"c",String.class).invoke(job.backend,job.modelId+"|"+speaker);
            normalizeNeural(samples,volume,level);
            synchronized(LOCK){PlaybackGrant.Outcome blocked=neuralEligibility(job);if(blocked!=null){releaseRejected(attempt);finish(attempt,blocked,true);return;}}
            attempt.owner.tones.execute(()->playNeural(job,samples,rate));
        } catch(ReflectiveOperationException|RuntimeException failure) {
            synchronized(LOCK){releaseRejected(attempt);finish(attempt,PlaybackGrant.Outcome.FAILED,true);}
        }
    }
    /** Same native accumulated RMS target, volume cap and soft limiter; never normalize silence into speech. */
    private static void normalizeNeural(float[] samples,float volume,Object level) throws ReflectiveOperationException {
        double energy=0;float peak=0;for(float value:samples){if(!Float.isFinite(value))throw new IllegalArgumentException("Vela neural PCM");energy+=(double)value*value;peak=Math.max(peak,Math.abs(value));}
        if(peak<.000001f)throw new IllegalArgumentException("Vela neural silence");
        float gain;
        synchronized(level) {
            double sum=((Number)read(level,"a")).doubleValue();long frames=((Number)read(level,"b")).longValue();
            if(peak>=.02f){sum+=energy;frames+=samples.length;field(level,"a").setDouble(level,sum);field(level,"b").setLong(level,frames);}
            double rms=frames>0?Math.sqrt(sum/frames):0;gain=(rms>0?(float)Math.max(1d,Math.min(4d,.13d/rms)):1f)*volume;
        }
        for(int i=0;i<samples.length;i++){float value=samples[i]*gain,abs=Math.abs(value);if(abs>.8f)value=Math.copySign(.8f+(float)Math.tanh((abs-.8f)/.19999999f)*.19999999f,value);samples[i]=value;}
    }
    private static void playNeural(NeuralJob job,float[] samples,int rate) {
        Attempt attempt=job.attempt;AudioTrack track=null;PlaybackGrant.Outcome outcome=PlaybackGrant.Outcome.FAILED;
        try {
            synchronized(LOCK){PlaybackGrant.Outcome blocked=neuralEligibility(job);if(blocked!=null){outcome=blocked;return;}}
            track=new AudioTrack.Builder().setAudioAttributes(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build()).setAudioFormat(new AudioFormat.Builder().setSampleRate(rate)
                    .setEncoding(AudioFormat.ENCODING_PCM_FLOAT).setChannelMask(AudioFormat.CHANNEL_OUT_MONO).build())
                    .setTransferMode(AudioTrack.MODE_STREAM).setBufferSizeInBytes(Math.max(AudioTrack.getMinBufferSize(rate,AudioFormat.CHANNEL_OUT_MONO,AudioFormat.ENCODING_PCM_FLOAT),rate*4)).build();
            int lead=attempt.event.priority==WarningEvent.Priority.P0?0:rate*300/1000,first=0;while(first<samples.length && Math.abs(samples[first])<.000001f)first++;
            synchronized(LOCK){PlaybackGrant.Outcome blocked=neuralEligibility(job);if(blocked!=null){outcome=blocked;return;}
                attempt.ownedTrack=track;if(track.getState()!=AudioTrack.STATE_INITIALIZED)return;attempt.submitted=true;track.play();}
            long written=writeNeural(job,track,new float[lead],0,0,false);if(written!=lead){outcome=attempt.outputRejected==null?PlaybackGrant.Outcome.FAILED:attempt.outputRejected;return;}
            long content=writeNeural(job,track,samples,lead,lead+first,true);if(content!=samples.length){outcome=attempt.outputRejected==null?PlaybackGrant.Outcome.FAILED:attempt.outputRejected;return;}
            long deadline=System.nanoTime()+((long)samples.length*1000/rate+1500)*1000000L;
            while(System.nanoTime()<deadline) {
                synchronized(LOCK){PlaybackGrant.Outcome blocked=neuralEligibility(job);if(blocked!=null){outcome=blocked;return;}
                    long played=Integer.toUnsignedLong(track.getPlaybackHeadPosition());notifyNeuralStart(attempt,track,played,lead+first);
                    if(played>=written+content){outcome=PlaybackGrant.Outcome.COMPLETED;return;}}
                Thread.sleep(10);
            }
        } catch(InterruptedException interrupted){Thread.currentThread().interrupt();outcome=PlaybackGrant.Outcome.INTERRUPTED;}
        catch(RuntimeException failure){outcome=PlaybackGrant.Outcome.FAILED;}
        finally {
            synchronized(LOCK){boolean published=attempt.ownedTrack==track,quiet=stopTone(attempt);
                if(track!=null && !published && !attempt.ownedReleased)try{track.release();attempt.ownedReleased=true;}catch(RuntimeException ignored){}
                releaseRejected(attempt);if(attempt.submitted && !attempt.started && outcome==PlaybackGrant.Outcome.FAILED)outcome=PlaybackGrant.Outcome.UNCERTAIN;
                finish(attempt,quiet?outcome:PlaybackGrant.Outcome.UNCERTAIN,quiet);}
        }
    }
    private static long writeNeural(NeuralJob job,AudioTrack track,float[] samples,long base,long contentStart,boolean content) throws InterruptedException {
        int offset=0;long progress=System.nanoTime();
        while(offset<samples.length) {
            synchronized(LOCK){PlaybackGrant.Outcome blocked=neuralEligibility(job);if(blocked!=null){job.attempt.outputRejected=blocked;return -1;}
                int count=track.write(samples,offset,Math.min(1024,samples.length-offset),AudioTrack.WRITE_NON_BLOCKING);
                if(count<0 || count>Math.min(1024,samples.length-offset))return -1;if(count>0){offset+=count;progress=System.nanoTime();}
                if(content)notifyNeuralStart(job.attempt,track,Integer.toUnsignedLong(track.getPlaybackHeadPosition()),contentStart);
            }
            if(System.nanoTime()-progress>250000000L)return -1;
            if(offset<samples.length)Thread.sleep(5);
        }
        return offset;
    }
    private static void notifyNeuralStart(Attempt attempt,AudioTrack track,long played,long contentStart) {
        if(!attempt.started && played>contentStart && track.getPlayState()==AudioTrack.PLAYSTATE_PLAYING) {
            attempt.started=true;attempt.owner.callbacks.post(()->attempt.listener.started(attempt.grant));
        }
    }
    private boolean submitTone(Attempt attempt) {
        try {
            // Native acquisition/result hook owns focus; the adapter never creates a competing request.
            method(guide,"b").invoke(guide);attempt.captured=true;
            PlaybackGrant.Outcome blocked=rejection(attempt);
            if(blocked!=null){releaseRejected(attempt);finish(attempt,blocked,true);return false;}
            tones.execute(()->runTone(attempt));return true;
        } catch(ReflectiveOperationException|RuntimeException failure) {
            releaseRejected(attempt);finish(attempt,PlaybackGrant.Outcome.FAILED,true);return false;
        }
    }
    /** Same 22,050 Hz PCM envelope, 30 ms gap and notes used by the existing native alerts-only chime. */
    static short[] tonePcm() {
        int frames=22050*110/1000,gap=661;short[] pcm=new short[frames*2+gap];
        for(int note=0;note<2;note++)for(int i=0;i<frames;i++)
            pcm[note*(frames+gap)+i]=(short)(Math.sin(2*Math.PI*1046.5*i/22050d)*9500d
                    *Math.min(1d,Math.min(i/264.6d,(frames-1-i)/264.6d)));
        return pcm;
    }
    /** MODE_STATIC is NO_STATIC_DATA until its first complete data write. */
    static boolean loadTone(AudioTrack track,short[] pcm) {
        int before=track.getState();
        if(before!=AudioTrack.STATE_INITIALIZED && before!=AudioTrack.STATE_NO_STATIC_DATA)return false;
        return track.write(pcm,0,pcm.length)==pcm.length && track.getState()==AudioTrack.STATE_INITIALIZED;
    }
    private static void runTone(Attempt attempt) {
        AudioTrack track=null;PlaybackGrant.Outcome outcome=PlaybackGrant.Outcome.FAILED;long frames=0;
        try {
            synchronized(LOCK){PlaybackGrant.Outcome blocked=rejection(attempt);if(blocked!=null){outcome=blocked;return;}}
            ProviderSound.Pcm provider=attempt.sound;
            short[] pcm=provider==null?tonePcm():provider.samples;
            int rate=provider==null?22050:provider.rate,channels=provider==null?1:provider.channels;
            frames=pcm.length/channels;
            track=new AudioTrack.Builder().setAudioAttributes(new AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE).setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION).build())
                    .setAudioFormat(new AudioFormat.Builder().setSampleRate(rate).setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                            .setChannelMask(channels==2?AudioFormat.CHANNEL_OUT_STEREO:AudioFormat.CHANNEL_OUT_MONO).build()).setTransferMode(AudioTrack.MODE_STATIC)
                    .setBufferSizeInBytes(pcm.length*2).build();
            synchronized(LOCK) {
                PlaybackGrant.Outcome blocked=rejection(attempt);
                if(blocked!=null){outcome=blocked;return;}
                attempt.ownedTrack=track;
                if(!loadTone(track,pcm))return;
                blocked=rejection(attempt);if(blocked!=null){outcome=blocked;return;}
                attempt.submitted=true;track.play();
            }
            long playMs=frames*1000L/Math.max(1,attempt.sound==null?22050:attempt.sound.rate)+1000;
            long timeout=SystemClock.elapsedRealtime()+playMs,wallDeadline=System.nanoTime()+playMs*1000000L;
            while(SystemClock.elapsedRealtime()<timeout && System.nanoTime()<wallDeadline) {
                synchronized(LOCK) {
                    PlaybackGrant.Outcome blocked=rejection(attempt);if(blocked!=null){outcome=blocked;return;}
                    long played=Integer.toUnsignedLong(track.getPlaybackHeadPosition());
                    if(!attempt.started && played>64 && track.getPlayState()==AudioTrack.PLAYSTATE_PLAYING) {
                        attempt.started=true;attempt.owner.callbacks.post(()->attempt.listener.started(attempt.grant));
                    }
                    if(played>=frames){outcome=PlaybackGrant.Outcome.COMPLETED;return;}
                }
                Thread.sleep(10);
            }
        } catch(InterruptedException interrupted){Thread.currentThread().interrupt();outcome=PlaybackGrant.Outcome.INTERRUPTED;}
        catch(RuntimeException failure){outcome=PlaybackGrant.Outcome.FAILED;}
        finally {
            synchronized(LOCK) {
                boolean published=attempt.ownedTrack==track;
                boolean quiet=stopTone(attempt);
                // A track constructed after a pending cancellation was never published or played.
                if(track!=null && !published && !attempt.ownedReleased)try{track.release();attempt.ownedReleased=true;}catch(RuntimeException ignored){}
                releaseRejected(attempt);
                if(attempt.preroll && quiet && !attempt.cancelled && attempt.owner.active==attempt) {
                    // The sound is optional: continue to speech whether or not it played.
                    attempt.preroll=false;attempt.captured=false;attempt.released=false;attempt.submitted=false;
                    attempt.ownedTrack=null;attempt.ownedReleased=false;attempt.quiescent=false;
                    attempt.owner.callbacks.post(()->attempt.owner.speakAfterSound(attempt));
                } else finish(attempt,quiet?outcome:PlaybackGrant.Outcome.UNCERTAIN,quiet);
            }
        }
    }
    private static boolean stopTone(Attempt attempt) {
        AudioTrack track=attempt.ownedTrack;
        if(track==null)return attempt.ownedReleased || !attempt.submitted || attempt.quiescent;
        try {
            if(track.getPlayState()!=AudioTrack.PLAYSTATE_STOPPED){track.pause();track.flush();track.stop();}
            track.release();attempt.ownedReleased=true;attempt.ownedTrack=null;return true;
        } catch(RuntimeException failure) { return false; }
    }
    private static Voice installedVoice(TextToSpeech engine,Locale locale) {
        if(locale==null)return null;
        Set<Voice> voices=engine.getVoices(); if(voices==null)return null;
        Voice current=engine.getVoice(),best=null;
        for(Voice voice:voices) {
            if(voice==null || voice.isNetworkConnectionRequired() || !voice.getLocale().getLanguage().equals(locale.getLanguage())
                    || voice.getFeatures()!=null && voice.getFeatures().contains("notInstalled"))continue;
            if(voice.equals(current) && (locale.getCountry().isEmpty() || voice.getLocale().getCountry().equals(locale.getCountry())))return voice;
            if(best==null || voice.getLocale().equals(locale) && !best.getLocale().equals(locale)
                    || voice.getLocale().equals(best.getLocale()) && voice.getQuality()>best.getQuality())best=voice;
        }
        return best;
    }
    private static boolean same(PlaybackGrant a,PlaybackGrant b) {
        return b!=null && a.attemptId.equals(b.attemptId) && a.attemptNonce.equals(b.attemptNonce)
                && a.ownerToken.equals(b.ownerToken) && a.ownerEpoch==b.ownerEpoch
                && a.consumerNonce.equals(b.consumerNonce) && a.providerSession.equals(b.providerSession)
                && a.bootIdentity.equals(b.bootIdentity) && a.ownerUid==b.ownerUid && a.eventKey.equals(b.eventKey)
                && a.revision==b.revision && a.mode==b.mode;
    }
    private static Field field(Object target,String name) throws NoSuchFieldException {
        Field field=target.getClass().getDeclaredField(name); field.setAccessible(true); return field;
    }
    private static Object read(Object target,String name) throws ReflectiveOperationException { return field(target,name).get(target); }
    private static boolean flag(Object target,String name) throws ReflectiveOperationException { return field(target,name).getBoolean(target); }
    private static int integer(Object target,String name) throws ReflectiveOperationException { return field(target,name).getInt(target); }
    private static Method method(Object target,String name,Class<?>... types) throws NoSuchMethodException {
        Method method;
        try {method=target.getClass().getMethod(name,types);}
        catch(NoSuchMethodException missing){method=target.getClass().getDeclaredMethod(name,types);}
        method.setAccessible(true);return method;
    }
    private static final class NeuralJob {
        final Attempt attempt;final Object backend,model;final String modelId;final int nativeGeneration;
        NeuralJob(Attempt attempt,Object backend,Object model,String modelId,int generation){this.attempt=attempt;this.backend=backend;this.model=model;this.modelId=modelId;this.nativeGeneration=generation;}
    }
    private static final class NativeClosure {
        final VelaWarningSpeaker owner;final Object guide;final long counterEpoch;boolean consumed;
        NativeClosure(VelaWarningSpeaker owner,Object guide,long epoch){this.owner=owner;this.guide=guide;this.counterEpoch=epoch;}
    }
    private static final class Attempt {
        final VelaWarningSpeaker owner;
        final Object nativeGuide;
        final WarningEvent event;
        final PlaybackGrant grant;
        final Listener listener;
        final long generation,announceUntil,focusCounterEpoch;
        final String id="warning-"+UUID.randomUUID();
        TextToSpeech engine;
        AudioTrack ownedTrack;
        ProviderSound.Pcm sound;
        boolean preroll;
        NeuralJob neural;
        PlaybackGrant.Outcome outputRejected;
        boolean captured,dispatched,submitted,started,cancelled,nativeStopped,released,terminal,quiescent,ownedReleased,releaseFailed,holding,heldNative;
        Attempt(VelaWarningSpeaker owner,WarningEvent event,PlaybackGrant grant,Listener listener,long generation,long announceUntil) {
            this.owner=owner;this.nativeGuide=owner.guide;this.event=event;this.grant=grant;this.listener=listener;this.generation=generation;this.announceUntil=announceUntil;this.focusCounterEpoch=owner.focusCounterEpoch;
        }
    }
}
