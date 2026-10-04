/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide suggested stories patch does to the buckets of a Stories tray before Facebook
 * keeps them.
 *
 * <p>A tray holds one bucket per person or Page with a story. Every answer of the tray's fetch,
 * from the network or the cache, becomes one tray data object, and both of Facebook's trays, the
 * classic one and the unified one, draw from it. The hook goes first in that object's one
 * constructor and hands its bucket list to {@link #keptBuckets}.
 *
 * <p>A bucket is a suggestion when Facebook marks it as one: its is_story_bucket_suggested flag is
 * true, or its first label is SUGGESTED. Those are the two things the tray's own card reads before
 * it writes "Suggested" under the name.
 *
 * <p>Some buckets aren't stories at all but cards: the tray's tile dispatcher picks a bucket's card
 * by its story_bucket_type, and draws a PYMK_STORY or PYMK_PROFILE_FORWARD_STORY bucket as a
 * "People you may know" card with an Add button, and a CONTACT_IMPORTER_STORY bucket as the "Find
 * friends from contacts" card. The type decides the card, so it's read first. The People you may
 * know cards go under that switch, which belongs to Hide suggested and promoted posts, so they
 * only go when that patch is in too. The contacts card has a switch of its own.
 *
 * <p>Nothing else counts, so a friend's story, a Page you follow, your own story, a friend
 * request and anything that isn't a bucket or whose type isn't one of those stay.
 *
 * <p>The cards beside Create story that suggest a story to make aren't buckets. The server sends
 * them in a list of their own, which the tray's fetch can ask it to leave out, and
 * {@link #skipPromptCards} answers that question first.
 *
 * <p>The bucket interface, its accessors and Facebook's label helper are Redex names that change
 * every build, so the patch fills in the five stubs below. It fails open: switch off, a pause,
 * settings that aren't ready, a bucket it can't read, a list it can't copy, or any failure in
 * here, and the tray keeps every bucket Facebook sent.
 */
public final class SuggestedStories {
    /** The diagnostic counter route: each tray list, each bucket's kind, and the buckets left out. */
    static final String ROUTE = "Stories tray buckets";

    /** The GraphQL flag and the label constant the tray's card reads, as the report names them. */
    static final String SUGGESTED_FLAG = "is_story_bucket_suggested";
    static final String SUGGESTED_LABEL = "SUGGESTED";

    /** The GraphQL field the tray's card dispatcher reads, and the types of it that are cards. */
    static final String BUCKET_TYPE_FIELD = "story_bucket_type";
    static final String PYMK_TYPE = "PYMK_STORY";
    static final String PYMK_PROFILE_FORWARD_TYPE = "PYMK_PROFILE_FORWARD_STORY";
    static final String CONTACT_IMPORTER_TYPE = "CONTACT_IMPORTER_STORY";

    /** What a bucket counts as. Only the first four can leave the tray, each behind its switch. */
    static final String SUGGESTED = "suggested";
    static final String LABELLED_SUGGESTED = "labelled suggested";
    static final String PEOPLE_YOU_MAY_KNOW = "people you may know";
    static final String CONTACT_IMPORT = "contact import card";
    static final String NOT_SUGGESTED = "not suggested";
    static final String NOT_A_BUCKET = "not a bucket";
    static final String NOT_PATCHED = "reader not patched";
    static final String READ_FAILED = "read failed";

    /** What {@link #suggested}, {@link #label} and {@link #bucketType} answer until the patch fills them in. */
    static final Object UNPATCHED = new Object();

    /**
     * Whether Hide suggested and promoted posts, which owns the People you may know switch, is in
     * this build, when a test says so instead of {@link SettingsStatus}.
     */
    @Nullable
    static volatile Boolean peopleYouMayKnowInBuildForTests;

    /** A tray's buckets, read through the stubs the patch filled in or through a test's stand-in. */
    interface Buckets {
        boolean isBucket(Object item);

        /** The bucket's story_bucket_type, an enum constant or null, or {@link #UNPATCHED}. */
        @Nullable
        Object type(Object bucket);

        /** The bucket's flag as a Boolean, or {@link #UNPATCHED}. */
        @Nullable
        Object suggested(Object bucket);

        /** The bucket's first label, an enum constant or null, or {@link #UNPATCHED}. */
        @Nullable
        Object label(Object bucket);

        /** An ImmutableList of [kept], or null when there's nothing to make one with. */
        @Nullable
        Object copy(List<Object> kept);
    }

    static final Buckets PATCHED = new Buckets() {
        @Override
        public boolean isBucket(Object item) {
            return SuggestedStories.isBucket(item);
        }

        @Nullable
        @Override
        public Object type(Object bucket) {
            return SuggestedStories.bucketType(bucket);
        }

        @Nullable
        @Override
        public Object suggested(Object bucket) {
            return SuggestedStories.suggested(bucket);
        }

        @Nullable
        @Override
        public Object label(Object bucket) {
            return SuggestedStories.label(bucket);
        }

        @Nullable
        @Override
        public Object copy(List<Object> kept) {
            return immutableCopy(kept);
        }
    };

    /** Which kinds leave the tray, read once for each tray. */
    static final class Switches {
        /** Before the settings are ready, or when they can't be read: every bucket stays. */
        static final Switches NONE = new Switches(false, false, false, false);

        final boolean suggested;
        /** Whether the People you may know switch is in this build at all. */
        final boolean peopleYouMayKnowInBuild;
        final boolean peopleYouMayKnow;
        final boolean contactImport;

        Switches(boolean suggested, boolean peopleYouMayKnowInBuild, boolean peopleYouMayKnow, boolean contactImport) {
            this.suggested = suggested;
            this.peopleYouMayKnowInBuild = peopleYouMayKnowInBuild;
            this.peopleYouMayKnow = peopleYouMayKnowInBuild && peopleYouMayKnow;
            this.contactImport = contactImport;
        }

        /** Whether a bucket of this kind leaves the tray. */
        boolean leaves(String kind) {
            if (SUGGESTED.equals(kind) || LABELLED_SUGGESTED.equals(kind)) return suggested;
            if (PEOPLE_YOU_MAY_KNOW.equals(kind)) return peopleYouMayKnow;
            if (CONTACT_IMPORT.equals(kind)) return contactImport;
            return false;
        }

        /**
         * " (off: suggested, contact import card)", naming the switches this build has that are off, or "";
         * " (switches not read)" when they weren't, so the line doesn't call them off.
         */
        String offNote() {
            if (this == NONE) return " (switches not read)";
            List<String> off = new ArrayList<>();
            if (!suggested) off.add(SUGGESTED);
            if (peopleYouMayKnowInBuild && !peopleYouMayKnow) off.add(PEOPLE_YOU_MAY_KNOW);
            if (!contactImport) off.add(CONTACT_IMPORT);
            return off.isEmpty() ? "" : " (off: " + String.join(", ", off) + ")";
        }
    }

    private SuggestedStories() {
    }

    /**
     * Injection point, first in the constructor of the tray data. Answers the list it was handed,
     * or an ImmutableList of the same buckets in the same order without the ones whose switch is
     * on, which takes the list's place. Never throws.
     *
     * @param buckets the tray's bucket list, an ImmutableList.
     */
    @Nullable
    public static Object keptBuckets(@Nullable List<?> buckets) {
        return keptBuckets(buckets, PATCHED);
    }

    /** {@link #keptBuckets(List)} with the bucket reads passed in, so a test can stand in for the stubs. */
    @Nullable
    static Object keptBuckets(@Nullable List<?> buckets, Buckets access) {
        try {
            HookStatus.invoked(FamilyNames.SUGGESTED_STORIES);
            if (buckets == null) return null;
            FeedFilterCounters.sawList(ROUTE, buckets.size());
            if (buckets.isEmpty()) return buckets;

            Switches switches = switches();
            List<String> kinds = new ArrayList<>(buckets.size());
            List<String> left = new ArrayList<>();
            ArrayList<Object> kept = null;
            for (int index = 0; index < buckets.size(); index++) {
                Object bucket = buckets.get(index);
                String kind = kindOf(bucket, access);
                kinds.add(kind);
                FeedFilterCounters.sawKind(ROUTE, kind);
                if (switches.leaves(kind)) {
                    if (kept == null) {
                        kept = new ArrayList<>(buckets.size());
                        kept.addAll(buckets.subList(0, index));
                    }
                    left.add(kind);
                } else if (kept != null) {
                    kept.add(bucket);
                }
            }

            Object answer = buckets;
            if (kept != null) {
                Object copy = access.copy(kept);
                if (copy == null) {
                    HookStatus.missingMember(FamilyNames.SUGGESTED_STORIES, "method", "ImmutableList", "copyOf(Collection)");
                    left.clear();
                } else {
                    answer = copy;
                    for (String kind : left) FeedFilterCounters.removed(ROUTE, 1, kind);
                }
            }

            // What a tray held, as kinds and how many of each, never whose stories they are.
            final int shown = buckets.size() - left.size();
            final String off = switches.offNote();
            Logger.printDebug(() -> "Stories tray: " + buckets.size() + " buckets, " + shown + " kept. Kinds: "
                    + summary(kinds) + off);
            return answer;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "tray bucket filter", failure);
            Logger.printException(() -> "Hide suggested stories: could not read the tray's buckets", failure);
            return buckets;
        }
    }

    /** What one item of the list counts as. Never throws. */
    static String kindOf(@Nullable Object item, Buckets access) {
        try {
            if (item == null || !access.isBucket(item)) return NOT_A_BUCKET;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "bucket check", failure);
            return READ_FAILED;
        }
        // The type picks the card the tray draws, so a card is a card whatever its flags say.
        String card = cardKind(item, access);
        if (card != null) return card;

        Object flag;
        try {
            flag = access.suggested(item);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "bucket flag", failure);
            return READ_FAILED;
        }
        if (flag == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SUGGESTED_STORIES, "method", "tray bucket", SUGGESTED_FLAG);
            return NOT_PATCHED;
        }
        if (!(flag instanceof Boolean)) return READ_FAILED;
        HookStatus.bound(FamilyNames.SUGGESTED_STORIES, "tray bucket#" + SUGGESTED_FLAG);
        if ((Boolean) flag) return SUGGESTED;

        Object label;
        try {
            label = access.label(item);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "bucket label", failure);
            return READ_FAILED;
        }
        if (label == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SUGGESTED_STORIES, "method", "tray bucket", "first label");
            return NOT_PATCHED;
        }
        if (label == null) return NOT_SUGGESTED;
        if (!(label instanceof Enum)) return READ_FAILED;
        HookStatus.bound(FamilyNames.SUGGESTED_STORIES, "tray bucket#first label");
        return SUGGESTED_LABEL.equals(((Enum<?>) label).name()) ? LABELLED_SUGGESTED : NOT_SUGGESTED;
    }

    /**
     * The card a bucket's type makes it, {@link #PEOPLE_YOU_MAY_KNOW} or {@link #CONTACT_IMPORT},
     * or null for a story and for a type it can't read, which then goes by its flags. Never throws.
     */
    @Nullable
    static String cardKind(Object bucket, Buckets access) {
        Object type;
        try {
            type = access.type(bucket);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "bucket type", failure);
            return null;
        }
        if (type == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SUGGESTED_STORIES, "method", "tray bucket", BUCKET_TYPE_FIELD);
            return null;
        }
        if (!(type instanceof Enum)) return null;
        HookStatus.bound(FamilyNames.SUGGESTED_STORIES, "tray bucket#" + BUCKET_TYPE_FIELD);
        String name = ((Enum<?>) type).name();
        if (PYMK_TYPE.equals(name) || PYMK_PROFILE_FORWARD_TYPE.equals(name)) return PEOPLE_YOU_MAY_KNOW;
        if (CONTACT_IMPORTER_TYPE.equals(name)) return CONTACT_IMPORT;
        return null;
    }

    /**
     * Injection point, filled in by the patch: whether an item is a tray bucket. The patch replaces
     * this body with an instance-of the bucket interface, whose name changes every build.
     */
    public static boolean isBucket(Object item) {
        return false;
    }

    /**
     * Injection point, filled in by the patch: the bucket's story_bucket_type, a constant of
     * Facebook's bucket type enum or null. The patch replaces this body with a call of the
     * interface's accessor, the one the tray's card dispatcher calls. Only an item {@link #isBucket}
     * took may be passed.
     */
    public static Object bucketType(Object bucket) {
        return UNPATCHED;
    }

    /**
     * Injection point, filled in by the patch: the bucket's is_story_bucket_suggested flag, as a
     * Boolean. The patch replaces this body with a call of the interface's accessor. Only an item
     * {@link #isBucket} took may be passed.
     */
    public static Object suggested(Object bucket) {
        return UNPATCHED;
    }

    /**
     * Injection point, filled in by the patch: the bucket's first label, a constant of Facebook's
     * label enum or null. The patch replaces this body with a call of Facebook's own label helper.
     * Only an item {@link #isBucket} took may be passed.
     */
    public static Object label(Object bucket) {
        return UNPATCHED;
    }

    /**
     * Injection point, filled in by the patch: an ImmutableList of [kept], through
     * ImmutableList.copyOf, so the tray data keeps the type it stores. Null until then.
     */
    public static Object immutableCopy(List<?> kept) {
        return null;
    }

    /** "not suggested 9, suggested 3", in the order each kind first came. */
    static String summary(List<String> kinds) {
        Map<String, Integer> counts = new LinkedHashMap<>();
        for (String kind : kinds) {
            Integer seen = counts.get(kind);
            counts.put(kind, seen == null ? 1 : seen + 1);
        }
        StringBuilder line = new StringBuilder();
        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            if (line.length() > 0) line.append(", ");
            line.append(entry.getKey()).append(' ').append(entry.getValue());
        }
        return line.toString();
    }

    /**
     * Injection point, right before each tray fetch sets skip_srtt_item_list, the query variable
     * asking the server to leave out the cards beside Create story: "Share music you love", a text
     * story, ready-made stories and the camera (issue #21). Facebook asks that for the Video tab's
     * tray. With Hide story prompts on, every tray asks it.
     *
     * @param facebook what Facebook was about to send
     * @return true when the switch is on, otherwise {@code facebook}. Never throws: switched off, a
     * pause, settings that aren't ready or any failure in here, and Facebook's own value goes.
     */
    public static boolean skipPromptCards(boolean facebook) {
        try {
            HookStatus.invoked(FamilyNames.SUGGESTED_STORIES);
            if (facebook || !Utils.settingsReady() || !Settings.HIDE_STORY_PROMPTS.get()) return facebook;
            Logger.printDebug(() -> "Stories tray: the fetch asks the server to leave out the story prompt cards");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "story prompt switch", failure);
            return facebook;
        }
    }

    /** Whether the People you may know switch is in this build: its patch is. */
    static boolean peopleYouMayKnowInBuild() {
        Boolean forced = peopleYouMayKnowInBuildForTests;
        return forced != null ? forced : SettingsStatus.suggestedPosts();
    }

    /** The switches. Off, unreadable, or asked before the settings are ready, the tray stays whole. */
    private static Switches switches() {
        try {
            if (!Utils.settingsReady()) return Switches.NONE;
            return new Switches(Settings.HIDE_SUGGESTED_STORIES.get(), peopleYouMayKnowInBuild(),
                    Settings.HIDE_PEOPLE_YOU_MAY_KNOW.get(), Settings.HIDE_CONTACT_IMPORT_CARD.get());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_STORIES, "switch read", failure);
            return Switches.NONE;
        }
    }
}
