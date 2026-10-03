/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.util.Map;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "View stories anonymously" patch.
 *
 * <p>Instagram gathers the stories you've seen into a batch and posts it to {@code media/seen/},
 * which is what puts you on each story's viewer list. The patch asks {@link #toSend} first thing in
 * the method that sends a batch, and sends what it answers in the batch's place, or nothing at all
 * on null. Each caller has already cleared its own copy, so a batch held back is gone, and turning
 * the switch off lets the next batch through. A batch the store retries from what an earlier
 * session saved goes through {@link #toRetry} right before its request is built, and a batch held
 * back there goes out as an empty one.
 *
 * <p>With the second switch on, the stories you tapped Mark as seen on ({@link StorySeenButton})
 * still go out: the answer is then a batch of the extension's own, started empty by Instagram's own
 * constructor, holding those stories and nothing else. Marks belong to the account they were made
 * on, read from the store that sends. See {@link StoryMarks}.
 *
 * <p>It fails open, like the other hooks: the switch off, a pause, settings that aren't ready yet,
 * or a failure reading them send the views as Instagram would. A failure picking out the marked
 * stories holds the whole batch back, as the switch on does without marks. The diagnostics it
 * keeps are only counted: a failure there never changes what goes out.
 */
public final class StorySeen {
    /** The diagnostic counter route: each batch of views Instagram went to send, and the ones held back. */
    static final String ROUTE = "Story views";

    /** What a batch held back is counted under. */
    static final String HELD_BACK = "viewed stories";

    static final String SEND_HOOK = "story seen send";
    static final String MARKED_HOOK = "marked story send";
    static final String RETRY_HOOK = "story seen retry";

    /** The stories marked as seen, shared with the button. */
    static final StoryMarks MARKS = new StoryMarks(SystemClock::elapsedRealtime);

    /** Where {@link #toSend} reads and starts batches, and reads the account a store sends for. Tests hand in their own. */
    interface Batches {
        /** A new batch of Instagram's, holding nothing, or null. */
        @Nullable
        Object empty();

        /** The map of stories [batch] holds, Instagram's own, which changes the batch when changed. */
        @Nullable
        Map<Object, Object> stories(Object batch);

        /** Instagram's user ID for the account [store] sends for, or null. */
        @Nullable
        String account(@Nullable Object store);
    }

    /** What {@link #toSend} counts and reports. None of it may change what goes out. */
    interface Diagnostics {
        /** A batch reached the send. */
        void saw();

        /** A batch was held back whole. */
        void heldBack();

        /** Only the marked stories went out. */
        void sentMarked();

        void threw(String hook, Throwable failure);
    }

    static final Batches PATCHED = new Batches() {
        @Override
        public Object empty() {
            return emptyBatch();
        }

        @Override
        @SuppressWarnings("unchecked")
        public Map<Object, Object> stories(Object batch) {
            return (Map<Object, Object>) seenStories(batch);
        }

        @Override
        public String account(Object store) {
            return store == null ? null : storeAccount(store);
        }
    };

    static final Diagnostics COUNTED = new Diagnostics() {
        @Override
        public void saw() {
            HookStatus.invoked(FamilyNames.STORY_SEEN);
            FeedFilterCounters.sawList(ROUTE, 1);
        }

        @Override
        public void heldBack() {
            FeedFilterCounters.removed(ROUTE, 1, HELD_BACK);
            Logger.printDebug(() -> "Story views: held back a batch of viewed stories");
        }

        @Override
        public void sentMarked() {
            Logger.printDebug(() -> "Story views: sent only the stories marked as seen");
        }

        @Override
        public void threw(String hook, Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, hook, failure);
        }
    };

    private StorySeen() {
    }

    /**
     * Asked first thing in the send, with the store sending and the batch it was handed. Answers the
     * batch to send: the same one while the switch is off, HushGram is paused or the settings aren't
     * ready; one holding only the stories you marked on the store's account; or null, and the send
     * returns before the request is built. Never throws.
     */
    @Nullable
    public static Object toSend(Object store, Object batch) {
        return toSend(store, batch, PATCHED, StorySeen::anonymous, StorySeenButton::switchedOn, MARKS, COUNTED);
    }

    @Nullable
    static Object toSend(@Nullable Object store, @Nullable Object batch, Batches batches, BooleanSupplier anonymous,
                         BooleanSupplier marking, StoryMarks marks, Diagnostics diagnostics) {
        quietly(diagnostics::saw);
        boolean holdBack;
        try {
            holdBack = anonymous.getAsBoolean();
        } catch (Throwable failure) {
            quietly(() -> diagnostics.threw(SEND_HOOK, failure));
            return batch;
        }
        if (!holdBack) return batch;
        Object marked = null;
        try {
            if (marking.getAsBoolean()) marked = marks.choose(batches.account(store), batch, batches);
        } catch (Throwable failure) {
            quietly(() -> diagnostics.threw(MARKED_HOOK, failure));
            marked = null;
        }
        quietly(marked == null ? diagnostics::heldBack : diagnostics::sentMarked);
        return marked;
    }

    /**
     * Asked right before the store builds the request for a batch it retries, one an earlier session
     * saved to disk. Answers what {@link #toSend} does, but never null, since the retry can't stop
     * there: a batch held back is answered by a new empty batch of Instagram's, which names no story.
     * Only when no empty batch can be made does Instagram's own go, as every hook fails open. Never
     * throws.
     */
    public static Object toRetry(Object store, Object batch) {
        return toRetry(store, batch, PATCHED, StorySeen::anonymous, StorySeenButton::switchedOn, MARKS, COUNTED);
    }

    static Object toRetry(@Nullable Object store, Object batch, Batches batches, BooleanSupplier anonymous,
                          BooleanSupplier marking, StoryMarks marks, Diagnostics diagnostics) {
        Object answer = toSend(store, batch, batches, anonymous, marking, marks, diagnostics);
        if (answer != null) return answer;
        try {
            Object empty = batches.empty();
            Map<Object, Object> stories = empty == null ? null : batches.stories(empty);
            if (stories != null && stories.isEmpty()) return empty;
        } catch (Throwable failure) {
            quietly(() -> diagnostics.threw(RETRY_HOOK, failure));
        }
        return batch;
    }

    /** Whether views are held back: the switch on, HushGram not paused and the settings read. */
    static boolean anonymous() {
        return Utils.settingsReady() && Settings.VIEW_STORIES_ANONYMOUSLY.get();
    }

    /**
     * Sends the stories marked as seen that an earlier batch held back, through Instagram's own send
     * for [session]'s account, handing it an empty batch for {@link #toSend} to fill. Never throws.
     */
    static void sendMarked(Object session) {
        try {
            Object batch = emptyBatch();
            if (batch != null) send(session, batch);
        } catch (Throwable failure) {
            quietly(() -> COUNTED.threw(MARKED_HOOK, failure));
        }
    }

    /** Runs a diagnostic, which must never decide anything: a failure in it is dropped. */
    private static void quietly(Runnable diagnostic) {
        try {
            diagnostic.run();
        } catch (Throwable ignored) {
            // The counters and the log are only what's reported; there's nowhere left to report this.
        }
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: a new batch of Instagram's, from its constructor taking nothing. */
    @Nullable
    public static Object emptyBatch() {
        return null;
    }

    /** Filled in by the patch: the map of stories [batch] holds, the one sent under "reels". */
    @Nullable
    public static Map<?, ?> seenStories(Object batch) {
        return null;
    }

    /** Filled in by the patch: hands [batch] to Instagram's send for [session]'s account. */
    public static void send(Object session, Object batch) {
    }

    /** Filled in by the patch: Instagram's user ID for the account [store], the store that sends, is for. */
    @Nullable
    public static String storeAccount(Object store) {
        return null;
    }

    /** Filled in by the patch: Instagram's user ID for [session], the account signed in. */
    @Nullable
    public static String sessionAccount(Object session) {
        return null;
    }
}
