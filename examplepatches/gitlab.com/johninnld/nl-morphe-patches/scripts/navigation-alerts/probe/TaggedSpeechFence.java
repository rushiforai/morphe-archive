package nl.johninnl.warningprobe;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/** PRIVATE TEST SPIKE. Hooks only the original Vela system-TTS pn1 closure.
 * No scheduler, active playback cancellation, neural/audio routing or production acceptance.
 * Keep rejected/dispatched tombstones while their closure lives: never evict live tokens
 * because an evicted tagged closure would otherwise become an allowed untagged closure.
 */
public final class TaggedSpeechFence {
    private static final Object LOCK = new Object();
    private static final int MAX_VOICES = 128;
    private static final int MAX_CLOSURES = 4096;
    private static final ReferenceQueue<Object> VOICE_QUEUE = new ReferenceQueue<>();
    private static final ReferenceQueue<Object> CLOSURE_QUEUE = new ReferenceQueue<>();
    private static final Map<IdentityReference, VoiceState> VOICES = new HashMap<>();
    private static final Map<IdentityReference, Token> TOKENS = new HashMap<>();
    private static final ThreadLocal<Scope> SCOPE = new ThreadLocal<>();
    private static long captured, allowed, rejected, duplicateAllows, sourceCancelled,
            nativeInvalidated, muted, focusReleaseAttempts, focusReleaseSuccesses,
            untaggedAllows, ignoredUiCaptures, ignoredOtherVoiceCaptures, duplicateCaptures;
    private static int activeScopes;

    private TaggedSpeechFence() { }

    /** Scope only the synchronous external j() call. Never scope native route dispatch. */
    public static void begin(Object voice) {
        synchronized (LOCK) {
            reap();
            if (SCOPE.get() != null) throw new IllegalStateException("Nested tagged-speech scope is forbidden");
            if (voice == null) throw abi("begin requires a native voice", null);
            VoiceState state = VOICES.get(lookup(voice));
            if (state == null) {
                if (VOICES.size() >= MAX_VOICES) throw bound("live voices", MAX_VOICES);
                state = new VoiceState(voice);
                VOICES.put(state.voice, state);
            }
            // Validate the native boolean ABI before acquiring any speech focus.
            readMuted(state, voice);
            SCOPE.set(new Scope(voice, state));
            activeScopes++;
        }
    }

    public static void end() {
        synchronized (LOCK) {
            if (SCOPE.get() == null) throw new IllegalStateException("No tagged-speech scope to end on this thread");
            SCOPE.remove();
            activeScopes--;
        }
    }

    /** Original pn1 constructor RETURN hook. Selector zero is unrelated UI behavior. */
    public static void capture(Object closure) {
        synchronized (LOCK) {
            reap();
            Scope scope = SCOPE.get();
            if (scope == null) return;
            if (closure == null) throw abi("capture received a null closure inside external scope", null);
            try {
                Field selector = closure.getClass().getDeclaredField("f");
                selector.setAccessible(true);
                if (selector.getType() != byte.class) throw abi("pn1.f must be a byte selector", null);
                if (selector.getByte(closure) == 0) { ignoredUiCaptures++; return; }
                Field owner = closure.getClass().getDeclaredField("h");
                owner.setAccessible(true);
                if (owner.get(closure) != scope.voice) { ignoredOtherVoiceCaptures++; return; }
                IdentityReference key = lookup(closure);
                Token existing = TOKENS.get(key);
                if (existing != null) {
                    if (existing.voice != scope.state) throw abi("existing closure changed its native voice identity", null);
                    duplicateCaptures++;
                    return; // Never refresh generations or resurrect a cancelled closure.
                }
                if (TOKENS.size() >= MAX_CLOSURES) throw bound("live closure tombstones", MAX_CLOSURES);
                TOKENS.put(new IdentityReference(closure, CLOSURE_QUEUE), new Token(scope));
                captured++;
            } catch (ReflectiveOperationException failure) {
                throw abi("pn1 constructor fields f/h do not match the original contract", failure);
            }
        }
    }

    /** Original wy4.n ENTRY hook: increment before native stop resets its focus count. */
    public static void invalidate(Object voice) {
        synchronized (LOCK) {
            reap();
            VoiceState state = VOICES.get(lookup(voice));
            if (state != null) {
                state.stopGeneration = Math.addExact(state.stopGeneration, 1);
                nativeInvalidated++;
            }
            // Native guides which have never hosted tagged work remain completely unregistered.
        }
    }

    /** Cancel pending external tokens only. Never call native stop or change native mode. */
    public static void cancel(Object voice) {
        synchronized (LOCK) {
            reap();
            VoiceState state = VOICES.get(lookup(voice));
            if (state != null) {
                state.cancelGeneration = Math.addExact(state.cancelGeneration, 1);
                sourceCancelled++;
            }
        }
    }

    /** Original pn1.invoke ENTRY hook. False must return original er4.a without body execution. */
    public static boolean allow(Object closure) {
        synchronized (LOCK) {
            reap();
            Token token = TOKENS.get(lookup(closure));
            if (token == null) { untaggedAllows++; return true; }
            if (token.state != Token.PENDING) {
                duplicateAllows++;
                return false;
            }
            Object voice = token.voice.voice.get();
            if (voice == null) throw abi("tagged live closure lost its native voice reference", null);
            boolean nativeStopped = token.stopGeneration != token.voice.stopGeneration;
            boolean cancelled = token.cancelGeneration != token.voice.cancelGeneration;
            boolean isMuted = readMuted(token.voice, voice);
            if (!nativeStopped && !cancelled && !isMuted) {
                token.state = Token.DISPATCHED;
                allowed++;
                // Native speak failure or original vy4 callback now owns its focus decrement.
                return true;
            }
            token.state = Token.REJECTED;
            rejected++;
            token.reason = nativeStopped ? "native_stop_generation" : cancelled ? "source_cancel_generation" : "native_mute";
            if (isMuted) muted++;
            if (!nativeStopped) {
                // Serialize the generation check + f() with invalidate(). Native n() calls
                // invalidate at ENTRY before touching its count. If stop won first, never f().
                // If this release wins first, the subsequent native stop resets afterward.
                token.releaseAttempted = true;
                focusReleaseAttempts++;
                try {
                    token.voice.release.invoke(voice);
                    focusReleaseSuccesses++;
                } catch (InvocationTargetException failure) {
                    throw abi("original wy4.f() threw while balancing one rejected pending closure", failure.getCause());
                } catch (ReflectiveOperationException failure) {
                    throw abi("cannot invoke original wy4.f() for rejected pending closure", failure);
                }
            }
            return false;
        }
    }

    public static Map<String, Object> snapshot() {
        synchronized (LOCK) {
            reap();
            Map<String, Object> result = new LinkedHashMap<>();
            result.put("scope", "private original-system-TTS closure fence spike");
            result.put("max_live_voices", MAX_VOICES);
            result.put("max_live_closures", MAX_CLOSURES);
            result.put("bound_behavior", "explicit exception; never evict a live closure tombstone");
            result.put("live_voices", VOICES.size());
            result.put("live_closures", TOKENS.size());
            result.put("active_scopes", activeScopes);
            result.put("captured", captured);
            result.put("allowed", allowed);
            result.put("rejected", rejected);
            result.put("duplicate_allows", duplicateAllows);
            result.put("source_cancellations", sourceCancelled);
            result.put("native_invalidations", nativeInvalidated);
            result.put("muted_rejections", muted);
            result.put("focus_release_attempts", focusReleaseAttempts);
            result.put("focus_release_successes", focusReleaseSuccesses);
            result.put("untagged_allows", untaggedAllows);
            result.put("ignored_ui_captures", ignoredUiCaptures);
            result.put("ignored_other_voice_captures", ignoredOtherVoiceCaptures);
            result.put("duplicate_captures", duplicateCaptures);
            int pending = 0, dispatched = 0, blocked = 0;
            for (Token token : TOKENS.values()) {
                if (token.state == Token.PENDING) pending++;
                else if (token.state == Token.DISPATCHED) dispatched++;
                else blocked++;
            }
            result.put("pending_live_tokens", pending);
            result.put("dispatched_live_tombstones", dispatched);
            result.put("rejected_live_tombstones", blocked);
            return result;
        }
    }

    /** Test boundary only: caller must have drained/shut down all probe-owned guides first. */
    public static void reset() {
        synchronized (LOCK) {
            if (activeScopes != 0) throw new IllegalStateException("Cannot reset while a tagged-speech scope is active");
            VOICES.clear(); TOKENS.clear();
            while (VOICE_QUEUE.poll() != null) { }
            while (CLOSURE_QUEUE.poll() != null) { }
            captured = allowed = rejected = duplicateAllows = sourceCancelled = nativeInvalidated = muted = 0;
            focusReleaseAttempts = focusReleaseSuccesses = untaggedAllows = ignoredUiCaptures = 0;
            ignoredOtherVoiceCaptures = duplicateCaptures = 0;
            SCOPE.remove();
        }
    }

    private static final class VoiceState {
        final IdentityReference voice;
        final Field muted;
        final Method release;
        long stopGeneration, cancelGeneration;
        VoiceState(Object instance) {
            voice = new IdentityReference(instance, VOICE_QUEUE);
            try {
                muted = instance.getClass().getDeclaredField("n");
                if (muted.getType() != boolean.class) throw abi("wy4.n must be a boolean mute flag", null);
                muted.setAccessible(true);
                release = instance.getClass().getDeclaredMethod("f");
                if (release.getReturnType() != void.class) throw abi("wy4.f() must return void", null);
                release.setAccessible(true);
            } catch (ReflectiveOperationException failure) {
                throw abi("native voice requires boolean n and void f()", failure);
            }
        }
    }
    private static final class Scope {
        final Object voice;
        final VoiceState state;
        final long stopGeneration, cancelGeneration;
        Scope(Object voice, VoiceState state) {
            this.voice = voice; this.state = state;
            stopGeneration = state.stopGeneration; cancelGeneration = state.cancelGeneration;
        }
    }
    private static final class Token {
        static final int PENDING = 0, DISPATCHED = 1, REJECTED = 2;
        final VoiceState voice;
        final long stopGeneration, cancelGeneration;
        int state = PENDING;
        String reason;
        boolean releaseAttempted;
        Token(Scope scope) {
            voice = scope.state;
            stopGeneration = scope.stopGeneration; cancelGeneration = scope.cancelGeneration;
        }
    }
    private static final class IdentityReference extends WeakReference<Object> {
        final int identityHash;
        IdentityReference(Object object, ReferenceQueue<Object> queue) {
            super(object, queue); identityHash = System.identityHashCode(object);
        }
        @Override public int hashCode() { return identityHash; }
        @Override public boolean equals(Object other) {
            if (this == other) return true;
            if (!(other instanceof IdentityReference)) return false;
            Object object = get();
            return object != null && object == ((IdentityReference) other).get();
        }
    }
    private static IdentityReference lookup(Object object) { return new IdentityReference(object, null); }
    private static boolean readMuted(VoiceState state, Object voice) {
        try { return state.muted.getBoolean(voice); }
        catch (IllegalAccessException failure) { throw abi("cannot read original wy4.n mute flag", failure); }
    }
    private static void reap() {
        IdentityReference reference;
        while ((reference = (IdentityReference) CLOSURE_QUEUE.poll()) != null) TOKENS.remove(reference);
        while ((reference = (IdentityReference) VOICE_QUEUE.poll()) != null) VOICES.remove(reference);
    }
    private static IllegalStateException abi(String message, Throwable failure) {
        return new IllegalStateException("TaggedSpeechFence ABI failure: " + message, failure);
    }
    private static IllegalStateException bound(String resource, int maximum) {
        return new IllegalStateException("TaggedSpeechFence test bound exceeded: " + resource + " maximum=" + maximum + "; drain probe work instead of evicting live tombstones");
    }
}
