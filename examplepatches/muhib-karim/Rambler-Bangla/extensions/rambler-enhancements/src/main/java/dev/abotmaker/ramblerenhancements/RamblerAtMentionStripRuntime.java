/*
 * Rambler Bangla - Native Gboard suggestion-strip @mention & email runtime.
 *
 * Integrates personalized @handle (e.g. @grok, @claude) and email domain suggestions
 * directly into Gboard's own native suggestion strip (InputBundle / CandidateViewBuilder /
 * LatinFixedCountCandidatesHolderView) — zero floating overlays, zero mismatched backgrounds,
 * full AMOLED / Material You / Frosted Glass / Custom Theme native styling, and native
 * drag-up-to-remove ("Remove suggestion") support.
 */
package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Feeds personalized {@code @} handle &amp; email domain candidates straight into Gboard's
 * native suggestion strip while keeping password and incognito fields strictly fail-closed.
 */
public final class RamblerAtMentionStripRuntime {
    private static final int TEXT_LOOKBACK = 256;
    private static final int MAX_CANDIDATES = 10;
    static final int KEYCODE_SELECT_TEXT_CANDIDATE = -10002;
    static final int KEYCODE_DELETE_CANDIDATE = -10031;

    static final class NativeMentionTag {
        final String token;
        final boolean emailDomainContext;
        final boolean isShortcut;
        final String shortcutTrigger;
        final boolean noTrailingSpace;

        NativeMentionTag(String token, boolean emailDomainContext) {
            this(token, emailDomainContext, false, null, emailDomainContext);
        }

        NativeMentionTag(
                String token,
                boolean emailDomainContext,
                boolean isShortcut,
                String shortcutTrigger,
                boolean noTrailingSpace) {
            this.token = token;
            this.emailDomainContext = emailDomainContext;
            this.isShortcut = isShortcut;
            this.shortcutTrigger = shortcutTrigger;
            this.noTrailingSpace = noTrailingSpace;
        }
    }

    private static final class ResolvedCandidates {
        final String renderKey;
        final int deleteCount;
        final List<CandidateSpec> specs;

        ResolvedCandidates(String renderKey, int deleteCount, List<CandidateSpec> specs) {
            this.renderKey = renderKey;
            this.deleteCount = deleteCount;
            this.specs = specs;
        }
    }

    private static final class CandidateSpec {
        final String text;
        final NativeMentionTag tag;
        final boolean deletable;

        CandidateSpec(String text, NativeMentionTag tag, boolean deletable) {
            this.text = text;
            this.tag = tag;
            this.deletable = deletable;
        }
    }

    private static final Object LOCK = new Object();
    private static WeakReference<InputMethodService> activeService = new WeakReference<>(null);
    private static WeakReference<Object> activeInputBundle = new WeakReference<>(null);
    private static boolean sensitiveSession;
    private static boolean nativeSuggestionsActive;
    private static String lastNativeRenderKey;
    private static final Set<String> sessionLearnedKeys = new HashSet<String>();
    private static String pendingToken;
    private static boolean pendingEmailContext;
    private static int pendingBeforeLen = -1;

    // Cached reflection handles (resolved once per Gboard process)
    private static volatile NativeBridgeHandles cachedHandles;
    private static volatile Field cachedEventKeyDataField;
    private static volatile Field cachedKeyDataCodeField;
    private static volatile Field cachedKeyDataPayloadField;
    private static volatile Field cachedWrapperCandidateField;
    private static volatile Field cachedDelegateBundleField;

    private RamblerAtMentionStripRuntime() {
    }

    public static void onInputViewStarted(Object receiver, EditorInfo info) {
        try {
            if (!RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS) {
                return;
            }
            if (!(receiver instanceof InputMethodService service)) {
                return;
            }
            flushPendingToken(service);
            boolean sensitive = RamblerTextPipeline.isSensitiveOrIncognitoField(info)
                    || isNumericOnlyField(info);
            synchronized (LOCK) {
                activeService = new WeakReference<>(service);
                sensitiveSession = sensitive;
                nativeSuggestionsActive = false;
                lastNativeRenderKey = null;
                sessionLearnedKeys.clear();
                clearPendingLocked();
            }
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    public static void onSelectionUpdated(
            Object receiver, View inputView, int selectionStart, int selectionEnd) {
        try {
            if (!RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS) {
                return;
            }
            if (!(receiver instanceof InputMethodService service)) {
                return;
            }
            boolean collapsed = selectionStart >= 0 && selectionStart == selectionEnd;
            synchronized (LOCK) {
                activeService = new WeakReference<>(service);
                if (sensitiveSession || !collapsed) {
                    boolean wasShowing = nativeSuggestionsActive;
                    nativeSuggestionsActive = false;
                    lastNativeRenderKey = null;
                    if (wasShowing) {
                        postToMain(() -> triggerNativeStripUpdate(service, false));
                    }
                    return;
                }
            }
            if (!isStripFeatureActive(service)) {
                synchronized (LOCK) {
                    if (nativeSuggestionsActive) {
                        nativeSuggestionsActive = false;
                        lastNativeRenderKey = null;
                        postToMain(() -> triggerNativeStripUpdate(service, false));
                    }
                }
                return;
            }
            postToMain(() -> refreshNativeStrip(service));
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    public static void onInputWindowHidden() {
        try {
            InputMethodService prevService;
            synchronized (LOCK) {
                prevService = activeService.get();
            }
            flushPendingToken(prevService);
            synchronized (LOCK) {
                activeService.clear();
                activeInputBundle.clear();
                sensitiveSession = false;
                nativeSuggestionsActive = false;
                lastNativeRenderKey = null;
                sessionLearnedKeys.clear();
                clearPendingLocked();
            }
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    /**
     * Hook at entry of {@code InputBundle.textCandidatesUpdated(boolean)} ({@code pbh.K(Z)V}).
     * Remembers the active {@code InputBundle} and prevents async decoder updates from wiping
     * active personalized {@code @} suggestions.
     */
    public static boolean onTextCandidatesUpdated(Object inputBundle, boolean hasCandidates) {
        try {
            if (!RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS || inputBundle == null) {
                return hasCandidates;
            }
            InputMethodService service;
            boolean sensitive;
            synchronized (LOCK) {
                activeInputBundle = new WeakReference<>(inputBundle);
                service = activeService.get();
                sensitive = sensitiveSession;
            }
            if (hasCandidates || sensitive || service == null
                    || !isStripFeatureActive(service)) {
                return hasCandidates;
            }
            if (hasActiveSuggestionsNow(service)) {
                return true;
            }
            return false;
        } catch (Throwable ignored) {
            return hasCandidates;
        }
    }

    /**
     * Hook at entry of {@code IKeyboardDelegate.requestCandidates(int, boolean)}
     * ({@code pbo.aa(IZ)V}). Feeds native Gboard {@code Candidate} ({@code owu}) objects
     * directly into Gboard's own suggestion strip when an active {@code @prefix}, digit prefix,
     * email prefix, or SwiftKey text-expansion shortcut matches.
     */
    public static boolean trySupplyNativeCandidatesFromDelegate(
            Object keyboardDelegate, int maxCount) {
        try {
            if (!RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS || keyboardDelegate == null) {
                return false;
            }
            Object inputBundle = resolveBundleFromDelegate(keyboardDelegate);
            if (inputBundle == null) {
                return false;
            }
            InputMethodService service;
            boolean sensitive;
            synchronized (LOCK) {
                activeInputBundle = new WeakReference<>(inputBundle);
                service = activeService.get();
                sensitive = sensitiveSession;
            }
            if (sensitive || service == null || !isStripFeatureActive(service)) {
                return false;
            }
            InputConnection ic = service.getCurrentInputConnection();
            if (ic == null) {
                return false;
            }
            CharSequence before = ic.getTextBeforeCursor(TEXT_LOOKBACK, 0);
            int limit = Math.max(3, Math.min(maxCount > 0 ? maxCount : MAX_CANDIDATES, MAX_CANDIDATES));
            ResolvedCandidates resolved = resolveCandidates(service, before, limit);
            if (resolved == null || resolved.specs.isEmpty()) {
                synchronized (LOCK) {
                    nativeSuggestionsActive = false;
                    lastNativeRenderKey = null;
                }
                return false;
            }

            NativeBridgeHandles handles = resolveHandles(inputBundle.getClass().getClassLoader());
            if (handles == null) {
                return false;
            }
            Object wrapper = handles.bundleWrapperField.get(inputBundle);
            if (wrapper == null) {
                return false;
            }
            if (handles.wrapperActiveMethod != null
                    && !Boolean.TRUE.equals(handles.wrapperActiveMethod.invoke(wrapper))) {
                return false;
            }
            Object controller = handles.wrapperControllerField.get(wrapper);
            if (controller == null) {
                return false;
            }

            List<Object> nativeCandidates = new ArrayList<Object>(resolved.specs.size());
            for (int i = 0; i < resolved.specs.size(); i++) {
                CandidateSpec spec = resolved.specs.get(i);
                Object candidate = buildNativeCandidate(handles, spec, i);
                if (candidate != null) {
                    nativeCandidates.add(candidate);
                }
            }
            if (nativeCandidates.isEmpty()) {
                return false;
            }

            handles.controllerAppendMethod.invoke(controller, nativeCandidates, null, Boolean.FALSE);
            synchronized (LOCK) {
                nativeSuggestionsActive = true;
                lastNativeRenderKey = resolved.renderKey;
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Hook at entry of {@code GoogleInputMethodService.handleEvent(Event)} ({@code phr.aw(Lohe;)Z}).
     * Intercepts native suggestion-strip tap ({@code -10002}) and long-press/drag remove
     * ({@code -10031}) ONLY for candidates tagged with {@link NativeMentionTag}.
     */
    public static boolean tryHandleNativeCandidateEvent(Object receiver, Object event) {
        try {
            if (!RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS
                    || !(receiver instanceof InputMethodService service)
                    || event == null) {
                return false;
            }
            Object keyDataArray = readEventKeyDataArray(event);
            if (keyDataArray == null || !keyDataArray.getClass().isArray()) {
                return false;
            }
            int len = Array.getLength(keyDataArray);
            for (int i = 0; i < len; i++) {
                Object keyData = Array.get(keyDataArray, i);
                if (keyData == null) {
                    continue;
                }
                int keyCode = readKeyDataCode(keyData);
                if (keyCode != KEYCODE_SELECT_TEXT_CANDIDATE
                        && keyCode != KEYCODE_DELETE_CANDIDATE) {
                    continue;
                }
                Object payload = readKeyDataPayload(keyData);
                NativeMentionTag tag = extractMentionTag(payload, service.getClassLoader());
                if (tag == null) {
                    continue;
                }
                if (keyCode == KEYCODE_DELETE_CANDIDATE) {
                    handleNativeDelete(service, tag);
                } else {
                    handleNativeSelect(service, tag);
                }
                return true;
            }
            return false;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void handleNativeSelect(InputMethodService service, NativeMentionTag tag) {
        try {
            InputConnection ic = service.getCurrentInputConnection();
            if (ic != null) {
                CharSequence beforeCursor = ic.getTextBeforeCursor(TEXT_LOOKBACK, 0);
                int deleteCount = -1;
                if (tag.isShortcut) {
                    RamblerSwiftKeyShortcutsStore.ActiveMatch m =
                            RamblerSwiftKeyShortcutsStore.matchBeforeCursor(service, beforeCursor, 1);
                    if (m != null) {
                        deleteCount = m.deleteCount;
                    }
                } else {
                    RamblerAtMentionStore.ActivePrefix current =
                            RamblerAtMentionStore.extractActivePrefix(beforeCursor);
                    if (current != null) {
                        deleteCount = current.deleteCount;
                    }
                }
                if (deleteCount > 0) {
                    String commit = tag.noTrailingSpace ? tag.token : (tag.token + " ");
                    ic.beginBatchEdit();
                    try {
                        if (ic.deleteSurroundingText(deleteCount, 0)) {
                            ic.commitText(commit, 1);
                        }
                    } finally {
                        ic.endBatchEdit();
                    }
                }
            }
            if (!tag.isShortcut) {
                RamblerAtMentionStore.recordToken(service, tag.token);
            }
        } finally {
            synchronized (LOCK) {
                clearPendingLocked();
                nativeSuggestionsActive = false;
                lastNativeRenderKey = null;
            }
            triggerNativeStripUpdate(service, false);
        }
    }

    private static void handleNativeDelete(InputMethodService service, NativeMentionTag tag) {
        if (tag.isShortcut) {
            return;
        }
        if (RamblerAtMentionStore.forgetToken(service, tag.token)) {
            try {
                Toast.makeText(service, "Removed " + tag.token, Toast.LENGTH_SHORT).show();
            } catch (Throwable ignored) {
                // Best-effort toast.
            }
        }
        synchronized (LOCK) {
            lastNativeRenderKey = null;
        }
        boolean stillHas = hasActiveSuggestionsNow(service);
        synchronized (LOCK) {
            nativeSuggestionsActive = stillHas;
        }
        triggerNativeStripUpdate(service, stillHas);
    }

    private static void refreshNativeStrip(InputMethodService service) {
        try {
            synchronized (LOCK) {
                if (sensitiveSession || activeService.get() != service) {
                    return;
                }
            }
            if (!isStripFeatureActive(service)) {
                return;
            }
            InputConnection ic = service.getCurrentInputConnection();
            if (ic == null) {
                return;
            }
            CharSequence beforeCursor = ic.getTextBeforeCursor(TEXT_LOOKBACK, 0);
            String beforeStr = beforeCursor == null ? "" : beforeCursor.toString();

            // Field cleared (e.g. Send/Enter right after "@grok" or "11muhib.karim@gmail.com"): flush pending token.
            if (beforeStr.isEmpty()) {
                boolean shouldFlush;
                boolean wasShowing;
                synchronized (LOCK) {
                    shouldFlush = pendingToken != null && pendingBeforeLen > 1;
                    wasShowing = nativeSuggestionsActive;
                    nativeSuggestionsActive = false;
                    lastNativeRenderKey = null;
                    sessionLearnedKeys.clear();
                }
                if (shouldFlush) {
                    flushPendingToken(service);
                } else {
                    synchronized (LOCK) {
                        clearPendingLocked();
                    }
                }
                if (wasShowing) {
                    triggerNativeStripUpdate(service, false);
                }
                return;
            }

            // 1. Learn all newly completed @handles, @domains, full emails, and digit-starting IDs.
            if (RamblerAtMentionStore.isEnabled(service)) {
                List<String> completed = RamblerAtMentionStore.extractCompletedTokens(beforeStr);
                if (!completed.isEmpty()) {
                    int searchFrom = 0;
                    for (String token : completed) {
                        int pos = beforeStr.indexOf(token, searchFrom);
                        if (pos >= 0) {
                            searchFrom = pos + token.length();
                        }
                        String learnedKey = token.toLowerCase(Locale.US) + "#" + pos;
                        boolean isNew;
                        synchronized (LOCK) {
                            isNew = sessionLearnedKeys.add(learnedKey);
                        }
                        if (isNew) {
                            RamblerAtMentionStore.recordToken(service, token);
                        }
                    }
                }
                RamblerAtMentionStore.ActivePrefix pending =
                        RamblerAtMentionStore.extractActivePrefix(beforeStr);
                synchronized (LOCK) {
                    if (pending != null) {
                        pendingToken = pending.prefix;
                        pendingEmailContext = pending.emailDomainContext;
                        pendingBeforeLen = beforeStr.length();
                    } else {
                        clearPendingLocked();
                    }
                }
            }

            // 2. Resolve SwiftKey text-expansion shortcuts + personalized @/email/digit candidates.
            ResolvedCandidates resolved = resolveCandidates(service, beforeStr, MAX_CANDIDATES);
            if (resolved == null || resolved.specs.isEmpty()) {
                boolean wasShowing;
                synchronized (LOCK) {
                    wasShowing = nativeSuggestionsActive;
                    nativeSuggestionsActive = false;
                    lastNativeRenderKey = null;
                }
                if (wasShowing) {
                    triggerNativeStripUpdate(service, false);
                }
                return;
            }

            boolean alreadyRendered;
            synchronized (LOCK) {
                alreadyRendered = nativeSuggestionsActive && resolved.renderKey.equals(lastNativeRenderKey);
            }
            if (!alreadyRendered) {
                triggerNativeStripUpdate(service, true);
            }
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    private static boolean hasActiveSuggestionsNow(InputMethodService service) {
        if (service == null) {
            return false;
        }
        InputConnection ic = service.getCurrentInputConnection();
        if (ic == null) {
            return false;
        }
        CharSequence before = ic.getTextBeforeCursor(TEXT_LOOKBACK, 0);
        ResolvedCandidates resolved = resolveCandidates(service, before, 1);
        return resolved != null && !resolved.specs.isEmpty();
    }

    private static boolean isStripFeatureActive(Context context) {
        return RamblerAtMentionStore.isEnabled(context)
                || RamblerSwiftKeyShortcutsStore.isActive(context);
    }

    private static boolean isNumericOnlyField(EditorInfo info) {
        if (info == null) {
            return false;
        }
        int cls = info.inputType & android.text.InputType.TYPE_MASK_CLASS;
        return cls == android.text.InputType.TYPE_CLASS_NUMBER
                || cls == android.text.InputType.TYPE_CLASS_PHONE;
    }

    private static ResolvedCandidates resolveCandidates(
            Context context, CharSequence beforeCursor, int limit) {
        if (context == null || beforeCursor == null || beforeCursor.length() == 0 || limit <= 0) {
            return null;
        }
        // 1. SwiftKey Mode custom text-expansion shortcuts take top priority on trigger match.
        RamblerSwiftKeyShortcutsStore.ActiveMatch shortcutMatch =
                RamblerSwiftKeyShortcutsStore.matchBeforeCursor(context, beforeCursor, limit);
        if (shortcutMatch != null && !shortcutMatch.matches.isEmpty()) {
            List<CandidateSpec> specs = new ArrayList<CandidateSpec>(shortcutMatch.matches.size());
            StringBuilder key = new StringBuilder("sk|").append(shortcutMatch.triggerPrefix);
            for (RamblerSwiftKeyShortcutsStore.Shortcut sc : shortcutMatch.matches) {
                boolean noSpace = RamblerAtMentionStore.isValidFullEmail(sc.expansion)
                        || sc.expansion.contains("\n");
                specs.add(new CandidateSpec(
                        sc.expansion,
                        new NativeMentionTag(sc.expansion, false, true, sc.trigger, noSpace),
                        false));
                key.append('|').append(sc.trigger);
            }
            return new ResolvedCandidates(key.toString(), shortcutMatch.deleteCount, specs);
        }

        // 2. Personalized @mention, @domain, full-email, and 1-digit prefix suggestions.
        if (!RamblerAtMentionStore.isEnabled(context)) {
            return null;
        }
        RamblerAtMentionStore.ActivePrefix active =
                RamblerAtMentionStore.extractActivePrefix(beforeCursor);
        if (active == null) {
            return null;
        }
        List<String> suggestions =
                RamblerAtMentionStore.suggestForContext(context, active, limit);
        if (suggestions.isEmpty()) {
            return null;
        }
        List<CandidateSpec> specs = new ArrayList<CandidateSpec>(suggestions.size());
        for (String token : suggestions) {
            boolean noSpace = active.emailDomainContext
                    || RamblerAtMentionStore.isValidFullEmail(token);
            specs.add(new CandidateSpec(
                    token,
                    new NativeMentionTag(token, active.emailDomainContext, false, null, noSpace),
                    true));
        }
        String key = active.kind.name() + "|" + active.prefix + "|" + suggestions;
        return new ResolvedCandidates(key, active.deleteCount, specs);
    }

    private static void triggerNativeStripUpdate(InputMethodService service, boolean hasCandidates) {
        try {
            Object bundle = resolveActiveBundle(service);
            if (bundle == null) {
                return;
            }
            Method updateMethod = bundle.getClass().getMethod(
                    RamblerDynamicConfig.AT_MENTION_TEXT_CANDIDATES_UPDATED_METHOD, boolean.class);
            updateMethod.invoke(bundle, Boolean.valueOf(hasCandidates));
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    private static Object resolveActiveBundle(InputMethodService service) {
        Object cached;
        synchronized (LOCK) {
            cached = activeInputBundle.get();
        }
        if (cached != null) {
            return cached;
        }
        if (service == null) {
            return null;
        }
        try {
            Method getter = service.getClass().getMethod(
                    RamblerDynamicConfig.AT_MENTION_IME_ACTIVE_BUNDLE_METHOD);
            Object resolved = getter.invoke(service);
            if (resolved != null) {
                synchronized (LOCK) {
                    activeInputBundle = new WeakReference<>(resolved);
                }
            }
            return resolved;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object resolveBundleFromDelegate(Object delegate) {
        try {
            Field f = cachedDelegateBundleField;
            if (f == null) {
                for (Class<?> c = delegate.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                    for (Field candidate : c.getDeclaredFields()) {
                        if (candidate.getName().equals("a") && !candidate.getType().isPrimitive()) {
                            candidate.setAccessible(true);
                            f = candidate;
                            cachedDelegateBundleField = candidate;
                            break;
                        }
                    }
                    if (f != null) {
                        break;
                    }
                }
            }
            return f != null ? f.get(delegate) : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object buildNativeCandidate(
            NativeBridgeHandles handles, CandidateSpec spec, int index) {
        try {
            Object builder = handles.builderCtor.newInstance();
            handles.builderTextField.set(builder, spec.text);
            handles.builderDescField.set(builder, spec.text);
            handles.builderDeletableField.setBoolean(builder, spec.deletable);
            handles.builderRankField.setInt(builder, index);
            handles.builderPosField.setInt(builder, index);
            handles.builderDataField.set(builder, spec.tag);
            handles.builderRenderStyleField.setInt(builder, 1); // DEFAULT native suggestion style
            return handles.builderBuildMethod.invoke(builder);
        } catch (Throwable ignored) {
            return null;
        }
    }

    static NativeMentionTag extractMentionTag(Object payload, ClassLoader loader) {
        if (payload == null) {
            return null;
        }
        try {
            NativeBridgeHandles handles = resolveHandles(
                    loader != null ? loader : payload.getClass().getClassLoader());
            if (handles == null) {
                return null;
            }
            Object candidateObj = null;
            if (handles.candidateClass.isInstance(payload)) {
                candidateObj = payload;
            } else {
                Field f = cachedWrapperCandidateField;
                if (f == null || !f.getDeclaringClass().isInstance(payload)) {
                    f = null;
                    for (Class<?> c = payload.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                        for (Field field : c.getDeclaredFields()) {
                            if (handles.candidateClass.isAssignableFrom(field.getType())) {
                                field.setAccessible(true);
                                f = field;
                                cachedWrapperCandidateField = field;
                                break;
                            }
                        }
                        if (f != null) {
                            break;
                        }
                    }
                }
                if (f != null) {
                    candidateObj = f.get(payload);
                }
            }
            if (candidateObj == null) {
                return null;
            }
            Object tag = handles.candidateDataField.get(candidateObj);
            return tag instanceof NativeMentionTag mentionTag ? mentionTag : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object readEventKeyDataArray(Object event) throws Exception {
        Field f = cachedEventKeyDataField;
        if (f == null) {
            f = event.getClass().getField("b");
            cachedEventKeyDataField = f;
        }
        return f.get(event);
    }

    private static int readKeyDataCode(Object keyData) throws Exception {
        Field f = cachedKeyDataCodeField;
        if (f == null) {
            f = keyData.getClass().getField("c");
            cachedKeyDataCodeField = f;
        }
        return f.getInt(keyData);
    }

    private static Object readKeyDataPayload(Object keyData) throws Exception {
        Field f = cachedKeyDataPayloadField;
        if (f == null) {
            f = keyData.getClass().getField("e");
            cachedKeyDataPayloadField = f;
        }
        return f.get(keyData);
    }

    private static void clearPendingLocked() {
        pendingToken = null;
        pendingEmailContext = false;
        pendingBeforeLen = -1;
    }

    private static void flushPendingToken(Context context) {
        String toLearn;
        boolean emailCtx;
        synchronized (LOCK) {
            if (sensitiveSession) {
                clearPendingLocked();
                return;
            }
            toLearn = pendingToken;
            emailCtx = pendingEmailContext;
            clearPendingLocked();
        }
        if (context != null && toLearn != null
                && RamblerAtMentionStore.isEnabled(context)
                && RamblerAtMentionStore.isValidPendingTokenForCommit(toLearn, emailCtx)) {
            RamblerAtMentionStore.recordToken(context, toLearn);
        }
    }

    private static void postToMain(Runnable action) {
        try {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                action.run();
            } else {
                new Handler(Looper.getMainLooper()).post(action);
            }
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    private static NativeBridgeHandles resolveHandles(ClassLoader loader) {
        NativeBridgeHandles existing = cachedHandles;
        if (existing != null) {
            return existing;
        }
        if (loader == null) {
            return null;
        }
        try {
            Class<?> candidateClass = Class.forName(
                    RamblerDynamicConfig.AT_MENTION_CANDIDATE_CLASS, false, loader);
            Class<?> builderClass = Class.forName(
                    RamblerDynamicConfig.AT_MENTION_CANDIDATE_BUILDER_CLASS, false, loader);
            Object bundle = null;
            synchronized (LOCK) {
                bundle = activeInputBundle.get();
            }
            Field bundleWrapperField = null;
            Field wrapperControllerField = null;
            Method wrapperActiveMethod = null;
            Method controllerAppendMethod = null;
            if (bundle != null) {
                bundleWrapperField = bundle.getClass().getField(
                        RamblerDynamicConfig.AT_MENTION_BUNDLE_WRAPPER_FIELD);
                Class<?> wrapperClass = bundleWrapperField.getType();
                wrapperControllerField = wrapperClass.getField(
                        RamblerDynamicConfig.AT_MENTION_WRAPPER_CONTROLLER_FIELD);
                try {
                    wrapperActiveMethod = wrapperClass.getMethod(
                            RamblerDynamicConfig.AT_MENTION_WRAPPER_ACTIVE_METHOD);
                } catch (Throwable ignored) {
                    wrapperActiveMethod = null;
                }
                Class<?> controllerClass = wrapperControllerField.getType();
                controllerAppendMethod = controllerClass.getMethod(
                        RamblerDynamicConfig.AT_MENTION_CONTROLLER_APPEND_METHOD,
                        List.class,
                        candidateClass,
                        boolean.class);
            }
            NativeBridgeHandles built = new NativeBridgeHandles(
                    candidateClass,
                    candidateClass.getField("m"),
                    builderClass.getConstructor(),
                    builderClass.getField("a"),
                    builderClass.getField("c"),
                    builderClass.getField("f"),
                    builderClass.getField("k"),
                    builderClass.getField("l"),
                    builderClass.getField("m"),
                    builderClass.getField("w"),
                    builderClass.getMethod("a"),
                    bundleWrapperField,
                    wrapperControllerField,
                    wrapperActiveMethod,
                    controllerAppendMethod);
            if (bundleWrapperField != null) {
                cachedHandles = built;
            }
            return built;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static final class NativeBridgeHandles {
        final Class<?> candidateClass;
        final Field candidateDataField;
        final Constructor<?> builderCtor;
        final Field builderTextField;
        final Field builderDescField;
        final Field builderDeletableField;
        final Field builderRankField;
        final Field builderPosField;
        final Field builderDataField;
        final Field builderRenderStyleField;
        final Method builderBuildMethod;
        final Field bundleWrapperField;
        final Field wrapperControllerField;
        final Method wrapperActiveMethod;
        final Method controllerAppendMethod;

        NativeBridgeHandles(
                Class<?> candidateClass,
                Field candidateDataField,
                Constructor<?> builderCtor,
                Field builderTextField,
                Field builderDescField,
                Field builderDeletableField,
                Field builderRankField,
                Field builderPosField,
                Field builderDataField,
                Field builderRenderStyleField,
                Method builderBuildMethod,
                Field bundleWrapperField,
                Field wrapperControllerField,
                Method wrapperActiveMethod,
                Method controllerAppendMethod) {
            this.candidateClass = candidateClass;
            this.candidateDataField = candidateDataField;
            this.builderCtor = builderCtor;
            this.builderTextField = builderTextField;
            this.builderDescField = builderDescField;
            this.builderDeletableField = builderDeletableField;
            this.builderRankField = builderRankField;
            this.builderPosField = builderPosField;
            this.builderDataField = builderDataField;
            this.builderRenderStyleField = builderRenderStyleField;
            this.builderBuildMethod = builderBuildMethod;
            this.bundleWrapperField = bundleWrapperField;
            this.wrapperControllerField = wrapperControllerField;
            this.wrapperActiveMethod = wrapperActiveMethod;
            this.controllerAppendMethod = controllerAppendMethod;
        }
    }
}
