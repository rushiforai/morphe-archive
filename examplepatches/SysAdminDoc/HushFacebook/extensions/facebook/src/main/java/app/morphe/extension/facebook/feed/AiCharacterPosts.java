/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Hide AI character posts' rule for posts that carry an AI character: Meta's Creator AI and AI
 * Studio characters, which a post offers to chat with or call. Facebook marks such a post's
 * attachment with a style of the GraphQL type {@link #STYLE_TYPE}, and its feed code asks for that
 * style through a finder of its own, which walks the attachment's {@code style_infos} and compares
 * each one's {@code getTypeName()} with the name it's handed.
 *
 * <p>The patch fills in two stubs: GraphQLStory's accessor of its {@code attachments}, which Redex
 * renames every build, and a call of Facebook's finder. So a post is judged by the same lookup
 * Facebook draws the character's attachment with. The guard asks only while Hide AI character
 * posts is on, and what the report counts is one of the kinds below, never the post.
 */
public final class AiCharacterPosts {
    /** The attachment style Facebook gives a post that carries an AI character. */
    static final String STYLE_TYPE = "AiInteractiveEmbodimentAttachmentStyleInfo";

    /** The route the report counts each read post on, while the switch is on. */
    static final String ROUTE = "AI character posts";

    /** What reading one feed unit found, as the report counts it. Only {@link #FOUND} hides anything. */
    static final String FOUND = "AI character";
    static final String NONE = "no AI character";
    static final String NO_ATTACHMENTS = "no attachments";
    static final String NOT_A_STORY = "not a story";
    static final String RELEASED = "tree released";
    static final String NOT_PATCHED = "accessor not patched";
    static final String READ_FAILED = "read failed";

    static final String ATTACHMENT_CLASS = "com.facebook.graphql.model.GraphQLStoryAttachment";
    private static final String FAMILY = FamilyNames.AI_DETECTED_POSTS;

    /** Facebook's finder of an attachment's style by type name, or a stand-in in a test. */
    interface Finder {
        @Nullable
        Object style(Object attachment, String type);
    }

    static final StoryFlag.Accessor ATTACHMENTS = AiCharacterPosts::attachments;
    static final Finder STYLES = AiCharacterPosts::styleInfo;

    private AiCharacterPosts() {
    }

    /**
     * Injection point, filled in by the patch: the story's attachments, an ImmutableList, or null.
     * Only a GraphQLStory may be passed.
     */
    public static Object attachments(Object story) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * Injection point, filled in by the patch with a call of Facebook's own finder: the
     * attachment's style of GraphQL type {@code type}, or null when it has none. Only a
     * GraphQLStoryAttachment may be passed.
     */
    public static Object styleInfo(Object attachment, String type) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * What the feed unit carries, as one of the kinds above. Never throws. A unit this can't read
     * is kept: the kind says why.
     */
    static String read(@Nullable Object feedUnit, StoryFlag.Accessor attachments, Finder styles) {
        Class<?> story = StoryFlag.members().story;
        if (feedUnit == null || story == null || !story.isInstance(feedUnit)) return NOT_A_STORY;
        // Facebook's finder asks each style's native tree for its type, which nothing catches on a
        // released model, so a story that says its tree is gone isn't read at all.
        if (FeedFilter.released(feedUnit)) return RELEASED;

        Object list;
        try {
            list = attachments.model(feedUnit);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "attachments accessor", failure);
            return READ_FAILED;
        }
        if (list == StoryFlag.NOT_PATCHED) {
            HookStatus.missingMember(FAMILY, "method", StoryFlag.STORY_CLASS, "the attachments accessor");
            return NOT_PATCHED;
        }
        HookStatus.bound(FAMILY, "story attachments");
        if (list == null) return NO_ATTACHMENTS;
        if (!(list instanceof Iterable)) return READ_FAILED;

        boolean any = false;
        try {
            for (Object attachment : (Iterable<?>) list) {
                if (attachment == null) continue;
                any = true;
                Object style = styles.style(attachment, STYLE_TYPE);
                if (style == StoryFlag.NOT_PATCHED) {
                    HookStatus.missingMember(FAMILY, "method", ATTACHMENT_CLASS, "Facebook's style finder");
                    return NOT_PATCHED;
                }
                HookStatus.bound(FAMILY, "attachment style finder");
                if (style != null) return FOUND;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "AI character style finder", failure);
            return READ_FAILED;
        }
        return any ? NONE : NO_ATTACHMENTS;
    }
}
