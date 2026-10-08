/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * How many reactions a feed post has, read the way Facebook's own feed reads the count under a
 * post. A story's {@code feedback} is a GraphQLFeedback, whose {@code reactors} model holds the
 * total in its {@code count} field. GraphQLFeedback is a kept class name, the two field names are
 * the GraphQL schema's, and a model's field is read through the kept {@code getCachedInt(int)} by
 * the hash of its name.
 *
 * <p>The story's accessor of its feedback and the feedback's accessor of its reactors are Redex
 * names, so the patch fills in {@link #feedback} and {@link #reactors}. A post whose count can't be
 * read is never hidden, and the report says why it wasn't. What the report counts is a shape, never
 * the post.
 *
 * <p>{@code getCachedInt(int)} and the GraphQLFeedback class are looked up once, not for every
 * post, and a build without one remembers that it's missing.
 */
public final class PostReactions {
    /** The route the report counts each post read for its reactions on, while a ceiling is set. */
    static final String ROUTE = "Reaction ceiling";

    /** What the report counts a hidden post under. */
    static final String ABOVE = "reaction ceiling";

    /** What a read found, for the report, when it didn't hide the post. */
    static final String COUNTED = "under the ceiling";
    static final String NOT_A_STORY = "not a story";
    static final String RELEASED = "tree released";
    static final String NOT_PATCHED = "accessor not patched";
    static final String NO_FEEDBACK = "no feedback";
    static final String NO_REACTORS = "no reactors";
    static final String NO_READER = "no count reader";
    static final String READ_FAILED = "read failed";

    /** The GraphQL class and field the count is read from. */
    static final String FEEDBACK_CLASS = "com.facebook.graphql.model.GraphQLFeedback";
    static final int COUNT_KEY = "count".hashCode();

    private static final String FAMILY = FamilyNames.POST_WORDS;

    /** The count of a post that couldn't be read. */
    static final long UNREAD = -1;

    /** A lookup's answer for the class or loader it was made for. A null answer is a miss, kept too. */
    private static final class Found<K, V> {
        final K key;
        @Nullable final V value;

        Found(K key, @Nullable V value) {
            this.key = key;
            this.value = value;
        }
    }

    /** getCachedInt(int) on the tree model class it was looked up on. */
    @Nullable private static volatile Found<Class<?>, Method> countReader;
    /** GraphQLFeedback through the class loader it was looked up with. */
    @Nullable private static volatile Found<ClassLoader, Class<?>> feedbackType;

    /** How many lookups went to reflection, for tests. */
    static final AtomicInteger LOOKUPS = new AtomicInteger();

    /** What a read found: the count, or {@link #UNREAD} and why. */
    static final class Read {
        final long count;
        final String reason;

        Read(long count, String reason) {
            this.count = count;
            this.reason = reason;
        }
    }

    private PostReactions() {
    }

    /**
     * Injection point, filled in by the patch: the story's {@code feedback}, or null when it has
     * none. Only a GraphQLStory may be passed.
     */
    public static Object feedback(Object story) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * Injection point, filled in by the patch: the feedback's {@code reactors}, or null when it
     * has none. Only a GraphQLFeedback may be passed.
     */
    public static Object reactors(Object feedback) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * The reactions of [feedUnit], through the two accessors. Never throws, and a post it can't
     * read answers {@link #UNREAD} with the reason. No feedback or no reactors is a post nobody
     * reacted to, which can't be over a ceiling.
     */
    static Read read(@Nullable Object feedUnit, StoryFlag.Accessor feedback, StoryFlag.Accessor reactors) {
        PostText.Members found = PostText.members();
        Class<?> story = found.story;
        if (feedUnit == null || story == null || !story.isInstance(feedUnit)) return new Read(UNREAD, NOT_A_STORY);
        Class<?> treeModel = found.treeModel;
        Method cachedInt = cachedInt(treeModel);
        if (cachedInt == null) {
            HookStatus.missingMember(FAMILY, "method", StoryFlag.TREE_MODEL_CLASS, "getCachedInt(int)");
            return new Read(UNREAD, NO_READER);
        }
        if (FeedFilter.released(feedUnit)) return new Read(UNREAD, RELEASED);
        try {
            Object feedbackModel = feedback.model(feedUnit);
            if (feedbackModel == StoryFlag.NOT_PATCHED) {
                HookStatus.missingMember(FAMILY, "method", StoryFlag.STORY_CLASS, "the feedback accessor");
                return new Read(UNREAD, NOT_PATCHED);
            }
            if (feedbackModel == null) return new Read(0, NO_FEEDBACK);
            Class<?> feedbackClass = feedbackClass(feedUnit);
            if (feedbackClass == null) {
                HookStatus.missingMember(FAMILY, "class", "com.facebook.graphql.model", "GraphQLFeedback");
                return new Read(UNREAD, READ_FAILED);
            }
            if (!feedbackClass.isInstance(feedbackModel)) return new Read(UNREAD, READ_FAILED);
            if (FeedFilter.released(feedbackModel)) return new Read(UNREAD, RELEASED);
            Object reactorsModel = reactors.model(feedbackModel);
            if (reactorsModel == StoryFlag.NOT_PATCHED) {
                HookStatus.missingMember(FAMILY, "method", FEEDBACK_CLASS, "the reactors accessor");
                return new Read(UNREAD, NOT_PATCHED);
            }
            if (reactorsModel == null) return new Read(0, NO_REACTORS);
            if (!treeModel.isInstance(reactorsModel)) return new Read(UNREAD, READ_FAILED);
            if (FeedFilter.released(reactorsModel)) return new Read(UNREAD, RELEASED);
            Object count = cachedInt.invoke(reactorsModel, COUNT_KEY);
            if (!(count instanceof Integer)) return new Read(UNREAD, READ_FAILED);
            return new Read(Math.max(0, (Integer) count), COUNTED);
        } catch (InvocationTargetException failure) {
            HookStatus.threw(FAMILY, "reaction count reader", failure.getCause());
            return new Read(UNREAD, READ_FAILED);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reaction count reader", failure);
            return new Read(UNREAD, READ_FAILED);
        }
    }

    /**
     * GraphQLFeedback through the story's own class loader, or null when that loader has none.
     * Looked up once per loader, which is once in Facebook.
     */
    @Nullable
    private static Class<?> feedbackClass(Object feedUnit) {
        ClassLoader loader = feedUnit.getClass().getClassLoader();
        Found<ClassLoader, Class<?>> known = feedbackType;
        if (known == null || known.key != loader) {
            LOOKUPS.incrementAndGet();
            Class<?> type;
            try {
                type = Class.forName(FEEDBACK_CLASS, false, loader);
            } catch (ClassNotFoundException | LinkageError | RuntimeException missing) {
                type = null;
            }
            known = new Found<>(loader, type);
            feedbackType = known;
        }
        return known.value;
    }

    /**
     * The kept public {@code getCachedInt(int)} of Facebook's tree models, or null when this build
     * has none. Looked up once per tree model class, which is once in Facebook.
     */
    @Nullable
    static Method cachedInt(@Nullable Class<?> treeModel) {
        if (treeModel == null) return null;
        Found<Class<?>, Method> known = countReader;
        if (known == null || known.key != treeModel) {
            LOOKUPS.incrementAndGet();
            Method method;
            try {
                method = treeModel.getMethod("getCachedInt", int.class);
                if (method.getReturnType() != int.class) method = null;
            } catch (NoSuchMethodException | RuntimeException missing) {
                method = null;
            }
            known = new Found<>(treeModel, method);
            countReader = known;
        }
        return known.value;
    }

    /** Forgets both lookups, so the next read makes them again. For tests. */
    static void forgetLookupsForTests() {
        countReader = null;
        feedbackType = null;
        LOOKUPS.set(0);
    }
}
