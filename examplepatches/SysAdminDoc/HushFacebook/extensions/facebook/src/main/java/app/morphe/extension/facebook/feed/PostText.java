/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * A feed post's own words: {@code message.text} on a GraphQLStory, and the same on the post a share
 * wraps ({@code attached_story}), read the way Facebook's own code reads them.
 *
 * <p>The message is the text the author typed, as the server sends it. Facebook's translation of a
 * post is another field, and the header lines Facebook writes in the reader's language ("shared a
 * memory") aren't in it, so a word matches the same post whatever language the phone is in.
 *
 * <p>The story's two accessors are Redex names that change every build, so the patch fills in a
 * stub for each. Everything after that goes through members Facebook keeps: the model's
 * {@code TreeJNI.mTypeTag}, to be sure it's a TextWithEntities, and
 * {@code BaseModelWithTree.getCachedString}, the reader GraphQLStory's own toString reads
 * "message.text" with. That reader checks the native tree is still there before it reads, so a
 * released model reads as no text rather than crashing.
 *
 * <p>What a post shares counts too (#255): each attachment's {@code title}, a link card's headline,
 * read with the same {@code getCachedString}, and its {@code description}, the line under it, a
 * TextWithEntities read through the kept {@code getCachedModel(int, Class, int)} the way
 * GraphQLStoryAttachment's own accessor reads it (584 {@code A02}, key {@code 0x993583fc}). The
 * attachments come from PostSources' accessor, which the same patch fills in. A build where it
 * isn't filled in reads the messages alone, as before.
 *
 * <p>Nothing here keeps, logs or reports the text. What a read found is one of the shapes in
 * {@link Outcome}, and only the rule that asked sees the words.
 *
 * <p>Hide reposts asks the same accessor only whether a story wraps another ({@link #shareKind}),
 * and reads no text at all.
 */
public final class PostText {
    /** The GraphQL names. See the patch's PostTextAnchors.kt for how the keys were read. */
    static final String MESSAGE_FIELD = "message";
    static final String TEXT_TYPE = "TextWithEntities";
    static final String TEXT_FIELD = "text";
    static final String ATTACHED_STORY_FIELD = "attached_story";
    static final String TEXT_CLASS = "com.facebook.graphql.model.GraphQLTextWithEntities";

    /** An attachment's headline, a plain string, and the line under it, a TextWithEntities. */
    static final int LINK_TITLE_KEY = "title".hashCode();
    static final int LINK_DESCRIPTION_KEY = "description".hashCode();

    /** A tree model is tagged with the first four bytes of its GraphQL type name's MD5. */
    static final int TEXT_TYPE_TAG = StoryFlag.typeTag(TEXT_TYPE);

    /** A tree model keys a field by its name's hash code. */
    static final int TEXT_KEY = TEXT_FIELD.hashCode();

    static final StoryFlag.Accessor MESSAGE = PostText::message;
    static final StoryFlag.Accessor ATTACHED = PostText::attachedStory;

    /** The route the report counts each post on while Hide reposts is on. */
    static final String REPOST_ROUTE = "Reposts";
    /** A story that wraps another story: the kind the report counts it under, and why it was hidden. */
    static final String REPOST = "repost";
    /** What {@link #shareKind} found when the post stays. */
    static final String ORIGINAL = "original post";
    static final String RELEASED = "tree released";
    static final String SHARED_NOT_A_STORY = "ambiguous: shared post not a story";
    static final String SHARED_RELEASED = "shared post's tree released";

    /** What reading one feed unit found. Only {@link #TEXT} carries words. */
    enum Outcome {
        TEXT("text read"),
        NO_TEXT("no text"),
        NO_UNIT("no feed unit"),
        NOT_A_STORY("not a story"),
        NO_READER("reader missing"),
        NO_ACCESSOR("accessor not patched"),
        OTHER_TYPE("ambiguous: text of another type"),
        NOT_A_TREE("ambiguous: text not a tree model"),
        READ_FAILED("read failed");

        /** What the report counts this under: a shape, never content. */
        final String reason;

        Outcome(String reason) {
            this.reason = reason;
        }
    }

    /** What a read found, and the words when it found some: the post's own, then a shared post's. */
    static final class Read {
        final Outcome outcome;
        final List<String> texts;

        Read(Outcome outcome, List<String> texts) {
            this.outcome = outcome;
            this.texts = texts;
        }

        static Read of(Outcome outcome) {
            return new Read(outcome, Collections.emptyList());
        }
    }

    private PostText() {
    }

    /**
     * Injection point, filled in by the patch: the story's {@code message} model, or null when it
     * has none. The patch replaces this body with a call to GraphQLStory's accessor, whose name
     * changes every build. Only a GraphQLStory may be passed.
     */
    public static Object message(Object story) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * Injection point, filled in by the patch: the post a share wraps ({@code attached_story}), or
     * null when the story wraps none. Only a GraphQLStory may be passed.
     */
    public static Object attachedStory(Object story) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * The words of a feed unit: its message's text and its attachments' headlines and descriptions,
     * then the same of the post it shares when it shares one. Never throws. A unit that isn't a
     * story, has no text, or has a part this can't read answers why, with no words, and the rule
     * keeps it: a word from the keep list could be in the part that wasn't read. An attachments
     * accessor that was never filled in reads no attachments, and the messages still count.
     */
    static Read read(@Nullable Object feedUnit, StoryFlag.Accessor message, StoryFlag.Accessor attached,
            StoryFlag.Accessor links) {
        if (feedUnit == null) return Read.of(Outcome.NO_UNIT);
        Members found = members();
        report();
        if (!found.complete()) return Read.of(Outcome.NO_READER);
        if (!found.story.isInstance(feedUnit)) return Read.of(Outcome.NOT_A_STORY);

        List<String> texts = new ArrayList<>(4);
        Outcome own = messageText(feedUnit, message, found, texts);
        if (!readable(own)) return Read.of(own);
        Outcome ownLinks = linkText(feedUnit, links, found, texts);
        if (!readable(ownLinks)) return Read.of(ownLinks);

        Object wrapped;
        try {
            wrapped = attached.model(feedUnit);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "attached story accessor", failure);
            return Read.of(Outcome.READ_FAILED);
        }
        if (wrapped == StoryFlag.NOT_PATCHED) {
            HookStatus.missingMember(FamilyNames.POST_WORDS, "method", StoryFlag.STORY_CLASS,
                    "the " + ATTACHED_STORY_FIELD + " accessor");
            return Read.of(Outcome.NO_ACCESSOR);
        }
        if (wrapped != null && found.story.isInstance(wrapped)) {
            Outcome shared = messageText(wrapped, message, found, texts);
            if (!readable(shared)) return Read.of(shared);
            Outcome sharedLinks = linkText(wrapped, links, found, texts);
            if (!readable(sharedLinks)) return Read.of(sharedLinks);
        }

        if (texts.isEmpty()) return Read.of(Outcome.NO_TEXT);
        return new Read(Outcome.TEXT, Collections.unmodifiableList(texts));
    }

    /**
     * Whether a feed unit is a share: {@link #REPOST} for a GraphQLStory whose {@code attached_story}
     * accessor answers another GraphQLStory, with both trees still there. The accessor is typed, so
     * it answers only a model Facebook built as a Story. Anything else is what the read found, for
     * the report, and stays: a post that wraps none is {@link #ORIGINAL}. Neither post's message is
     * read, so a share with a caption and one without read the same. Never throws.
     */
    static String shareKind(@Nullable Object feedUnit, StoryFlag.Accessor attached) {
        if (feedUnit == null) return Outcome.NO_UNIT.reason;
        Class<?> story = members().story;
        report();
        if (story == null) return Outcome.NO_READER.reason;
        if (!story.isInstance(feedUnit)) return Outcome.NOT_A_STORY.reason;
        if (FeedFilter.released(feedUnit)) return RELEASED;

        Object wrapped;
        try {
            wrapped = attached.model(feedUnit);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "attached story accessor", failure);
            return Outcome.READ_FAILED.reason;
        }
        if (wrapped == StoryFlag.NOT_PATCHED) {
            HookStatus.missingMember(FamilyNames.POST_WORDS, "method", StoryFlag.STORY_CLASS,
                    "the " + ATTACHED_STORY_FIELD + " accessor");
            return Outcome.NO_ACCESSOR.reason;
        }
        if (wrapped == null) return ORIGINAL;
        if (!story.isInstance(wrapped)) return SHARED_NOT_A_STORY;
        if (FeedFilter.released(wrapped)) return SHARED_RELEASED;
        return REPOST;
    }

    /** Whether a part read cleanly, with words or with none. */
    private static boolean readable(Outcome outcome) {
        return outcome == Outcome.TEXT || outcome == Outcome.NO_TEXT;
    }

    /**
     * Adds the text of [story]'s message to [texts] and answers {@link Outcome#TEXT}, or answers
     * why there's none to add.
     */
    private static Outcome messageText(Object story, StoryFlag.Accessor accessor, Members found, List<String> texts) {
        Object model;
        try {
            model = accessor.model(story);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "message accessor", failure);
            return Outcome.READ_FAILED;
        }
        if (model == StoryFlag.NOT_PATCHED) {
            HookStatus.missingMember(FamilyNames.POST_WORDS, "method", StoryFlag.STORY_CLASS,
                    "the " + MESSAGE_FIELD + " accessor");
            return Outcome.NO_ACCESSOR;
        }
        if (model == null) return Outcome.NO_TEXT;
        if (!found.treeModel.isInstance(model)) return Outcome.NOT_A_TREE;
        try {
            if (found.typeTag.getInt(model) != TEXT_TYPE_TAG) return Outcome.OTHER_TYPE;
            Object value = found.cachedString.invoke(model, TEXT_KEY);
            if (value != null && !(value instanceof String)) return Outcome.READ_FAILED;
            String text = (String) value;
            if (text == null || text.trim().isEmpty()) return Outcome.NO_TEXT;
            texts.add(text);
            return Outcome.TEXT;
        } catch (InvocationTargetException failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "text reader", failure.getCause());
            return Outcome.READ_FAILED;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "text reader", failure);
            return Outcome.READ_FAILED;
        }
    }

    /**
     * Adds the headline and description of each of [story]'s attachments to [texts], skipping one
     * already there (a share often carries the card of the post it wraps). Answers
     * {@link Outcome#TEXT} or {@link Outcome#NO_TEXT}, or {@link Outcome#READ_FAILED} when a read
     * threw. An accessor the patch never filled in, or a build without the description's members,
     * reads less and still answers cleanly, so the words read before #255 judge the post as they did.
     */
    private static Outcome linkText(Object story, StoryFlag.Accessor accessor, Members found, List<String> texts) {
        Object list;
        try {
            list = accessor.model(story);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "link accessor", failure);
            return Outcome.READ_FAILED;
        }
        if (list == StoryFlag.NOT_PATCHED || !(list instanceof Iterable)) return Outcome.NO_TEXT;
        boolean any = false;
        try {
            for (Object attachment : (Iterable<?>) list) {
                if (!found.treeModel.isInstance(attachment)) continue;
                any |= add(texts, found.cachedString.invoke(attachment, LINK_TITLE_KEY));
                if (found.cachedModel == null || found.text == null) continue;
                Object description = found.cachedModel.invoke(attachment, LINK_DESCRIPTION_KEY, found.text, TEXT_TYPE_TAG);
                if (found.text.isInstance(description)) {
                    any |= add(texts, found.cachedString.invoke(description, TEXT_KEY));
                }
            }
        } catch (InvocationTargetException failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "link text reader", failure.getCause());
            return Outcome.READ_FAILED;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            HookStatus.threw(FamilyNames.POST_WORDS, "link text reader", failure);
            return Outcome.READ_FAILED;
        }
        return any ? Outcome.TEXT : Outcome.NO_TEXT;
    }

    /** Adds [value] to [texts] when it's a string with words that isn't there yet. */
    private static boolean add(List<String> texts, @Nullable Object value) {
        if (!(value instanceof String)) return false;
        String text = (String) value;
        if (text.trim().isEmpty() || texts.contains(text)) return false;
        texts.add(text);
        return true;
    }

    /** Which Hook status row the members were last reported into. */
    private static volatile long reportedGeneration = -1;

    /**
     * The members, reported into the patch's Hook status row once per row: again after a
     * diagnostic clear, which empties the row it was written into.
     */
    static void report() {
        long generation = HookStatus.generation();
        if (reportedGeneration == generation) return;
        reportedGeneration = generation;
        members().reportInto(FamilyNames.POST_WORDS);
    }

    /**
     * The kept members the text is read through, looked up once. A member this build doesn't have
     * is null, and the rule then keeps every post while the report names what's missing.
     */
    static final class Members {
        @Nullable final Class<?> story;
        @Nullable final Class<?> treeModel;
        @Nullable final Method cachedString;
        @Nullable final Field typeTag;
        /** Only an attachment's description needs these two, so neither is part of {@link #complete}. */
        @Nullable final Class<?> text;
        @Nullable final Method cachedModel;

        Members(@Nullable Class<?> story, @Nullable Class<?> treeModel, @Nullable Method cachedString,
                @Nullable Field typeTag, @Nullable Class<?> text, @Nullable Method cachedModel) {
            this.story = story;
            this.treeModel = treeModel;
            this.cachedString = cachedString;
            this.typeTag = typeTag;
            this.text = text;
            this.cachedModel = cachedModel;
        }

        boolean complete() {
            return story != null && treeModel != null && cachedString != null && typeTag != null;
        }

        static Members lookUp(ClassLoader loader) {
            Class<?> story = classOrNull(StoryFlag.STORY_CLASS, loader);
            Class<?> treeModel = classOrNull(StoryFlag.TREE_MODEL_CLASS, loader);
            Class<?> tree = classOrNull(StoryFlag.TREE_CLASS, loader);
            Method cachedString = null;
            Method cachedModel = null;
            Field typeTag = null;
            try {
                if (treeModel != null) {
                    Method method = treeModel.getMethod("getCachedString", int.class);
                    if (method.getReturnType() == String.class) cachedString = method;
                }
            } catch (NoSuchMethodException | RuntimeException missing) {
                // Named in the report.
            }
            try {
                if (treeModel != null) {
                    Method method = treeModel.getMethod("getCachedModel", int.class, Class.class, int.class);
                    if (treeModel.isAssignableFrom(method.getReturnType())) cachedModel = method;
                }
            } catch (NoSuchMethodException | RuntimeException missing) {
                // Named in the report.
            }
            try {
                if (tree != null) {
                    Field field = tree.getField("mTypeTag");
                    if (field.getType() == int.class) typeTag = field;
                }
            } catch (NoSuchFieldException | RuntimeException missing) {
                // Named in the report.
            }
            return new Members(story, treeModel, cachedString, typeTag, classOrNull(TEXT_CLASS, loader), cachedModel);
        }

        /**
         * What was found and what wasn't, into one family's Hook status row. The description's two
         * members show only when one is missing: the words still work without them.
         */
        void reportInto(String family) {
            if (story != null) HookStatus.bound(family, "GraphQLStory");
            else HookStatus.missingMember(family, "class", "com.facebook.graphql.model", "GraphQLStory");
            if (cachedString != null) HookStatus.bound(family, "BaseModelWithTree#getCachedString");
            else HookStatus.missingMember(family, "method", StoryFlag.TREE_MODEL_CLASS, "getCachedString(int)");
            if (typeTag != null) HookStatus.bound(family, "TreeJNI#mTypeTag");
            else HookStatus.missingMember(family, "field", StoryFlag.TREE_CLASS, "mTypeTag");
            if (text == null) HookStatus.missingMember(family, "class", "com.facebook.graphql.model", "GraphQLTextWithEntities");
            if (cachedModel == null) {
                HookStatus.missingMember(family, "method", StoryFlag.TREE_MODEL_CLASS, "getCachedModel(int, Class, int)");
            }
        }

        @Nullable
        private static Class<?> classOrNull(String name, ClassLoader loader) {
            try {
                return Class.forName(name, false, loader);
            } catch (Throwable missing) {
                return null;
            }
        }
    }

    /** Looked up on first use. A test sets it to stand in for a build missing a member. */
    static volatile Members cachedMembers;

    static Members members() {
        Members found = cachedMembers;
        if (found == null) {
            found = Members.lookUp(PostText.class.getClassLoader());
            cachedMembers = found;
        }
        return found;
    }
}
