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
 * <p>Nothing here keeps, logs or reports the text. What a read found is one of the shapes in
 * {@link Outcome}, and only the rule that asked sees the words.
 */
public final class PostText {
    /** The GraphQL names. See the patch's PostTextAnchors.kt for how the keys were read. */
    static final String MESSAGE_FIELD = "message";
    static final String TEXT_TYPE = "TextWithEntities";
    static final String TEXT_FIELD = "text";
    static final String ATTACHED_STORY_FIELD = "attached_story";

    /** A tree model is tagged with the first four bytes of its GraphQL type name's MD5. */
    static final int TEXT_TYPE_TAG = StoryFlag.typeTag(TEXT_TYPE);

    /** A tree model keys a field by its name's hash code. */
    static final int TEXT_KEY = TEXT_FIELD.hashCode();

    static final StoryFlag.Accessor MESSAGE = PostText::message;
    static final StoryFlag.Accessor ATTACHED = PostText::attachedStory;

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
     * The words of a feed unit: its message's text, then the text of the post it shares when it
     * shares one. Never throws. A unit that isn't a story, has no text, or has a part this can't
     * read answers why, with no words, and the rule keeps it: a word from the keep list could be in
     * the part that wasn't read.
     */
    static Read read(@Nullable Object feedUnit, StoryFlag.Accessor message, StoryFlag.Accessor attached) {
        if (feedUnit == null) return Read.of(Outcome.NO_UNIT);
        Members found = members();
        report();
        if (!found.complete()) return Read.of(Outcome.NO_READER);
        if (!found.story.isInstance(feedUnit)) return Read.of(Outcome.NOT_A_STORY);

        List<String> texts = new ArrayList<>(2);
        Outcome own = messageText(feedUnit, message, found, texts);
        if (!readable(own)) return Read.of(own);

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
        }

        if (texts.isEmpty()) return Read.of(Outcome.NO_TEXT);
        return new Read(Outcome.TEXT, Collections.unmodifiableList(texts));
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

        Members(@Nullable Class<?> story, @Nullable Class<?> treeModel, @Nullable Method cachedString,
                @Nullable Field typeTag) {
            this.story = story;
            this.treeModel = treeModel;
            this.cachedString = cachedString;
            this.typeTag = typeTag;
        }

        boolean complete() {
            return story != null && treeModel != null && cachedString != null && typeTag != null;
        }

        static Members lookUp(ClassLoader loader) {
            Class<?> story = classOrNull(StoryFlag.STORY_CLASS, loader);
            Class<?> treeModel = classOrNull(StoryFlag.TREE_MODEL_CLASS, loader);
            Class<?> tree = classOrNull(StoryFlag.TREE_CLASS, loader);
            Method cachedString = null;
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
                if (tree != null) {
                    Field field = tree.getField("mTypeTag");
                    if (field.getType() == int.class) typeTag = field;
                }
            } catch (NoSuchFieldException | RuntimeException missing) {
                // Named in the report.
            }
            return new Members(story, treeModel, cachedString, typeTag);
        }

        /** What was found and what wasn't, into one family's Hook status row. */
        void reportInto(String family) {
            if (story != null) HookStatus.bound(family, "GraphQLStory");
            else HookStatus.missingMember(family, "class", "com.facebook.graphql.model", "GraphQLStory");
            if (cachedString != null) HookStatus.bound(family, "BaseModelWithTree#getCachedString");
            else HookStatus.missingMember(family, "method", StoryFlag.TREE_MODEL_CLASS, "getCachedString(int)");
            if (typeTag != null) HookStatus.bound(family, "TreeJNI#mTypeTag");
            else HookStatus.missingMember(family, "field", StoryFlag.TREE_CLASS, "mTypeTag");
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
