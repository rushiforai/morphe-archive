/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the View stories anonymously patch asks before Facebook reports the stories you've viewed.
 *
 * <p>The story viewer queues each story card you view and sends the queue as one GraphQL mutation,
 * DirectSeenMutation, which is what puts you on a story's viewer list. The patch asks
 * {@link #toSend} first thing in the method that builds and sends it, handing over everything that
 * method was handed, and sends the set of card ids it answers. Nothing is built or sent on null.
 * Facebook has already counted those cards as reported in a set it keeps in memory, so a card held
 * back isn't queued again until it restarts. The switch is read at each send, so turning it off lets
 * the next batch through.
 *
 * <p>With the second switch on, the cards you tapped Mark as seen on ({@link StorySeenButton})
 * still go out: the answer is then a new set holding those cards and nothing else, and the rest
 * stay held ({@link StoryMarks}). A card a batch already held back is sent at the next send, or
 * right away through the send that held it when that is still around.
 *
 * <p>It fails open, like the other hooks: the switch off, a pause, settings that aren't ready yet,
 * or a failure reading the switch send the views as Facebook would. A failure picking out the
 * marked cards holds the whole batch back, as the switch does without marks.
 */
public final class StorySeen {
    /** The diagnostic counter route: each batch of views Facebook went to send, and the ones held back. */
    static final String ROUTE = "Story views";

    /** What a batch held back is counted under. */
    static final String HELD_BACK = "viewed stories";

    static final String SEND_HOOK = "story seen send";
    static final String MARKED_HOOK = "marked story send";

    /** The cards marked as seen, shared with the button. */
    static final StoryMarks MARKS = new StoryMarks(SystemClock::elapsedRealtime);

    /**
     * One call of Facebook's sender, kept with the cards it held back, so a card marked later can
     * go out through the same sender, callback and account. The sender and the session are held
     * weakly. The callback is held as it is: Facebook makes a new one for each batch and nothing
     * else keeps it, so a weak hold lost it at the next garbage collection and a mark waited for
     * a later batch. {@link StoryMarks} keeps at most {@link StoryMarks#MAX_HELD} held cards for 24
     * hours, so these stay few.
     */
    static final class Call {
        final WeakReference<Object> sender;
        @Nullable final Object listener;
        final WeakReference<Object> session;
        @Nullable final String first;
        @Nullable final String second;
        @Nullable final String third;
        final boolean peek;

        Call(@Nullable Object sender, @Nullable Object listener, @Nullable Object session, @Nullable String first,
             @Nullable String second, @Nullable String third, boolean peek) {
            this.sender = new WeakReference<>(sender);
            this.listener = listener;
            this.session = new WeakReference<>(session);
            this.first = first;
            this.second = second;
            this.third = third;
            this.peek = peek;
        }
    }

    private StorySeen() {
    }

    /**
     * Injection point, first thing in the seen sender, handed what the sender was: the sender, its
     * callback, the account's session, its three strings, the card filters, the set of card ids and
     * whether the cards were only peeked at. Answers the set to send: [ids] itself while the switch
     * is off, paused or before the settings are ready; a new set holding only the cards marked with
     * Mark as seen, which the patch sends without the card filters; or null, and the sender returns
     * before building anything. Never throws.
     */
    @Nullable
    public static Set<?> toSend(@Nullable Object sender, @Nullable Object listener, @Nullable Object session,
                                @Nullable String first, @Nullable String second, @Nullable String third,
                                @Nullable Map<?, ?> filters, @Nullable Set<?> ids, boolean peek) {
        try {
            HookStatus.invoked(FamilyNames.STORY_SEEN);
            FeedFilterCounters.sawList(ROUTE, 1);
        } catch (Throwable ignored) {
            // Counters are optional.
        }
        try {
            if (!Utils.settingsReady() || !Settings.VIEW_STORIES_ANONYMOUSLY.get()) return ids;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, SEND_HOOK, failure);
            return ids;
        }
        Set<String> marked = null;
        try {
            if (StorySeenButton.switchedOn()) {
                marked = MARKS.choose(account(session), ids, new Call(sender, listener, session, first, second, third, peek));
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, MARKED_HOOK, failure);
            marked = null;
        }
        try {
            if (marked == null) {
                FeedFilterCounters.removed(ROUTE, 1, HELD_BACK);
                Logger.printDebug(() -> "Story views: held back a batch of viewed stories");
            } else {
                Logger.printDebug(() -> "Story views: sent only the stories marked as seen");
            }
        } catch (Throwable ignored) {
            // Counters are optional.
        }
        return marked;
    }

    /**
     * Sends [card], which a batch of [account]'s held back and which has been marked since, through
     * the sender that held it, right away. The sender's hook fills the empty set it's handed with
     * the marked cards that sender held. False when that sender, its callback or the session is
     * gone, and the next send carries the card instead. Never throws.
     */
    static boolean sendHeld(@Nullable String account, @Nullable String card) {
        try {
            Call call = MARKS.heldBy(account, card);
            if (call == null) return false;
            Object sender = call.sender.get();
            Object listener = call.listener;
            Object session = call.session.get();
            if (sender == null || listener == null || session == null) return false;
            send(sender, listener, session, call.first, call.second, call.third, null, new LinkedHashSet<String>(),
                    call.peek);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, MARKED_HOOK, failure);
            return false;
        }
    }

    /**
     * The user ID of the account [session] is for, Facebook's FbUserSession: the first thing it
     * writes to a Parcel. Null for anything else.
     */
    @Nullable
    static String account(@Nullable Object session) {
        if (!(session instanceof Parcelable)) return null;
        Parcel parcel = Parcel.obtain();
        try {
            ((Parcelable) session).writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            String id = parcel.readString();
            return id == null || id.isEmpty() ? null : id;
        } catch (Throwable failure) {
            return null;
        } finally {
            parcel.recycle();
        }
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: hands [ids] to Facebook's sender [sender] with the rest of its arguments. */
    public static void send(Object sender, Object listener, Object session, @Nullable String first,
                            @Nullable String second, @Nullable String third, @Nullable Map<?, ?> filters,
                            Set<?> ids, boolean peek) {
    }
}
