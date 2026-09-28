/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * A Stories tray's bucket list as the filter sees one, with the stubs the patch fills in played by
 * a stand-in bucket class.
 */
public final class SuggestedStoriesForTests {
    private SuggestedStoriesForTests() {
    }

    /** Stands in for Facebook's bucket label enum: only the constant names matter to the filter. */
    public enum Label {
        UNSET_OR_UNRECOGNIZED_ENUM_VALUE, FAMILY, NEW, NEWFRIEND, POPULAR, SUGGESTED, TAGGED, TRENDING
    }

    /**
     * Stands in for a bucket: its is_story_bucket_suggested flag, and its first label, or null for
     * a bucket with none.
     */
    public static final class Bucket {
        public final boolean suggested;
        public final Object label;

        public Bucket(boolean suggested, Object label) {
            this.suggested = suggested;
            this.label = label;
        }

        @Override
        public String toString() {
            return "Bucket(" + suggested + ", " + label + ")";
        }
    }

    /**
     * An ImmutableList as the copy stub hands one back: a new, unmodifiable list, never the one it
     * was given.
     */
    static final class Copy extends ArrayList<Object> {
        Copy(List<Object> kept) {
            super(kept);
        }
    }

    /**
     * The stubs as the patch fills them: an instance-of the bucket interface, a read of its flag, a
     * call of Facebook's label helper and ImmutableList.copyOf.
     */
    static final SuggestedStories.Buckets STAND_IN = new SuggestedStories.Buckets() {
        @Override
        public boolean isBucket(Object item) {
            return item instanceof Bucket;
        }

        @Override
        public Object suggested(Object bucket) {
            return ((Bucket) bucket).suggested;
        }

        @Override
        public Object label(Object bucket) {
            return ((Bucket) bucket).label;
        }

        @Override
        public Object copy(List<Object> kept) {
            return Collections.unmodifiableList(new Copy(kept));
        }
    };

    /** The filter with the stand-in stubs: the very list when nothing goes, otherwise the copy. */
    public static Object keptBuckets(List<?> buckets) {
        return SuggestedStories.keptBuckets(buckets, STAND_IN);
    }

    /**
     * A tray of a friend's story, a suggested one and one labelled SUGGESTED, filtered the way the
     * patched tray data does. True when both suggestions came out, which is the switch changing
     * what Facebook would have drawn.
     */
    public static boolean hidesSuggestions() {
        Bucket friend = new Bucket(false, Label.NEWFRIEND);
        List<Bucket> tray = Arrays.asList(friend, new Bucket(true, null), new Bucket(false, Label.SUGGESTED));
        Object kept = keptBuckets(tray);
        return kept != tray && Collections.singletonList(friend).equals(kept);
    }
}
