/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Hide posts by words' switches for whole kinds of post: photo posts, video posts, link posts and
 * posts written on a colored background, read the way Facebook's own code reads them.
 *
 * <p>A post's attachments each carry a {@code style_list}, the GraphQL attachment styles Facebook
 * may draw it in, best first. The first is the one it draws, so that's the one judged: PHOTO and
 * ALBUM are photos, VIDEO, VIDEO_INLINE and VIDEO_AUTOPLAY videos, SHARE, SHARE_LARGE_IMAGE and
 * IMAGE_SHARE a shared link. The styles are an enum Redex renames, but a constant's
 * {@link Enum#name()} is the literal it was built with. A colored background is the story's
 * {@code text_format_metadata}, a TextFormatMetadata model, holding a colour, a background colour,
 * a font style, a font weight or a text alignment: the five fields Facebook's own check of a
 * formatted text post reads.
 *
 * <p>The story's accessor of its text format and the attachment's accessor of its styles are Redex
 * names, so the patch fills in {@link #textFormat} and {@link #styleList}; the attachments come
 * through the people, Pages and sites list's stub. A share is judged by the post it wraps as well.
 * What the report counts is a kind below or a style's constant name, never the post.
 */
public final class PostTypes {
    /** The route the report counts each read post on, while a switch here is on. */
    static final String ROUTE = "Post types";

    /** The kinds a post can be hidden as. Each is also what the report counts it under. */
    static final String PHOTO = "photo post";
    static final String VIDEO = "video post";
    static final String LINK = "link post";
    static final String BACKGROUND = "colored background post";

    /** What a read found when the post isn't one to hide. */
    static final String NOT_A_STORY = "not a story";
    static final String RELEASED = "tree released";
    static final String NOT_PATCHED = "accessor not patched";
    static final String READ_FAILED = "read failed";
    static final String NO_ATTACHMENTS = "no attachments";
    static final String PLAIN = "no kind to hide";
    /** Prefixes the first style of a post this didn't hide, so the report shows what the feed holds. */
    static final String STYLE = "style ";

    static final Set<String> PHOTO_STYLES = new HashSet<>(Arrays.asList("PHOTO", "ALBUM"));
    static final Set<String> VIDEO_STYLES = new HashSet<>(Arrays.asList("VIDEO", "VIDEO_INLINE", "VIDEO_AUTOPLAY"));
    static final Set<String> LINK_STYLES = new HashSet<>(Arrays.asList("SHARE", "SHARE_LARGE_IMAGE", "IMAGE_SHARE"));

    /** The GraphQL type of a story's text format, and the fields Facebook's check of one reads. */
    static final String TEXT_FORMAT_TYPE = "TextFormatMetadata";
    static final int TEXT_FORMAT_TYPE_TAG = StoryFlag.typeTag(TEXT_FORMAT_TYPE);
    static final String[] TEXT_FORMAT_FIELDS = {"color", "background_color", "font_style", "font_weight", "text_align"};

    private static final String FAMILY = FamilyNames.POST_WORDS;

    /**
     * The three reads a post's kind takes, and the two its reaction count takes, the patch's stubs
     * or stand-ins in a test. A reader that isn't given reads as not patched.
     */
    static final class Readers {
        final StoryFlag.Accessor attachments;
        final StoryFlag.Accessor styles;
        final StoryFlag.Accessor format;
        final StoryFlag.Accessor feedback;
        final StoryFlag.Accessor reactors;

        Readers(StoryFlag.Accessor attachments, StoryFlag.Accessor styles, StoryFlag.Accessor format) {
            this(attachments, styles, format, unit -> StoryFlag.NOT_PATCHED, unit -> StoryFlag.NOT_PATCHED);
        }

        Readers(StoryFlag.Accessor attachments, StoryFlag.Accessor styles, StoryFlag.Accessor format,
                StoryFlag.Accessor feedback, StoryFlag.Accessor reactors) {
            this.attachments = attachments;
            this.styles = styles;
            this.format = format;
            this.feedback = feedback;
            this.reactors = reactors;
        }
    }

    static final Readers READERS = new Readers(PostSources.ATTACHMENTS, PostTypes::styleList, PostTypes::textFormat,
            PostReactions::feedback, PostReactions::reactors);

    /** Which kinds the switches ask to hide. */
    static final class Wanted {
        final boolean photos;
        final boolean videos;
        final boolean links;
        final boolean backgrounds;

        Wanted(boolean photos, boolean videos, boolean links, boolean backgrounds) {
            this.photos = photos;
            this.videos = videos;
            this.links = links;
            this.backgrounds = backgrounds;
        }

        boolean any() {
            return photos || videos || links || backgrounds;
        }

        boolean attachments() {
            return photos || videos || links;
        }

        boolean hides(String kind) {
            return (photos && PHOTO.equals(kind)) || (videos && VIDEO.equals(kind)) || (links && LINK.equals(kind))
                    || (backgrounds && BACKGROUND.equals(kind));
        }
    }

    private PostTypes() {
    }

    /**
     * Injection point, filled in by the patch: the attachment's {@code style_list}, an
     * ImmutableList of Facebook's attachment style enum, or null. Only a GraphQLStoryAttachment may
     * be passed.
     */
    public static Object styleList(Object attachment) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * Injection point, filled in by the patch: the story's {@code text_format_metadata}, or null
     * when its text has no format. Only a GraphQLStory may be passed.
     */
    public static Object textFormat(Object story) {
        return StoryFlag.NOT_PATCHED;
    }

    /**
     * What [feedUnit] is among the kinds [wanted] asks about: one of {@link #PHOTO}, {@link #VIDEO},
     * {@link #LINK} or {@link #BACKGROUND} when it's one to hide, otherwise what the read found for
     * the report. A share is judged by the post it wraps too. Never throws, and a post it can't
     * read stays.
     */
    static String read(@Nullable Object feedUnit, Readers readers, StoryFlag.Accessor attached, Wanted wanted) {
        Class<?> story = StoryFlag.members().story;
        if (feedUnit == null || story == null || !story.isInstance(feedUnit)) return NOT_A_STORY;
        if (FeedFilter.released(feedUnit)) return RELEASED;
        String own = kindOf(feedUnit, readers, wanted);
        if (wanted.hides(own)) return own;

        Object wrapped;
        try {
            wrapped = attached.model(feedUnit);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "attached story accessor", failure);
            return own;
        }
        if (wrapped == null || wrapped == StoryFlag.NOT_PATCHED || !story.isInstance(wrapped)
                || FeedFilter.released(wrapped)) {
            return own;
        }
        String shared = kindOf(wrapped, readers, wanted);
        return wanted.hides(shared) ? shared : own;
    }

    /** One story's kind, without the post it wraps. */
    private static String kindOf(Object story, Readers readers, Wanted wanted) {
        String found = PLAIN;
        if (wanted.backgrounds) {
            try {
                Object format = readers.format.model(story);
                if (format == StoryFlag.NOT_PATCHED) {
                    HookStatus.missingMember(FAMILY, "method", StoryFlag.STORY_CLASS,
                            "the text_format_metadata accessor");
                    found = NOT_PATCHED;
                } else if (format != null && formatted(format)) {
                    return BACKGROUND;
                }
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "text format accessor", failure);
                found = READ_FAILED;
            }
        }
        // A missing text format accessor leaves the attachment kinds working, and the other way round.
        return wanted.attachments() ? attachmentKind(story, readers, wanted) : found;
    }

    /**
     * The kind of the first attachment whose drawn style is one [wanted] asks about, or the first
     * attachment's style for the report when none is.
     */
    private static String attachmentKind(Object story, Readers readers, Wanted wanted) {
        Object list;
        try {
            list = readers.attachments.model(story);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "attachments accessor", failure);
            return READ_FAILED;
        }
        if (list == StoryFlag.NOT_PATCHED) {
            HookStatus.missingMember(FAMILY, "method", StoryFlag.STORY_CLASS, "the attachments accessor");
            return NOT_PATCHED;
        }
        if (list == null) return NO_ATTACHMENTS;
        if (!(list instanceof Iterable)) return READ_FAILED;
        String first = null;
        try {
            for (Object attachment : (Iterable<?>) list) {
                if (attachment == null) continue;
                Object styles = readers.styles.model(attachment);
                if (styles == StoryFlag.NOT_PATCHED) {
                    HookStatus.missingMember(FAMILY, "method", AiCharacterPosts.ATTACHMENT_CLASS,
                            "the style_list accessor");
                    return NOT_PATCHED;
                }
                String style = firstStyle(styles);
                if (style == null) continue;
                String kind = kind(style);
                if (wanted.hides(kind)) return kind;
                if (first == null) first = style;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "attachment style list", failure);
            return READ_FAILED;
        }
        return first == null ? NO_ATTACHMENTS : STYLE + first;
    }

    /** The name of the style an attachment is drawn in, the first of its list, or null. */
    @Nullable
    static String firstStyle(@Nullable Object styles) {
        if (!(styles instanceof Iterable)) return null;
        for (Object style : (Iterable<?>) styles) {
            return style instanceof Enum ? ((Enum<?>) style).name() : null;
        }
        return null;
    }

    /** The kind a drawn style makes a post, or the style itself when it's none of them. */
    static String kind(String style) {
        if (PHOTO_STYLES.contains(style)) return PHOTO;
        if (VIDEO_STYLES.contains(style)) return VIDEO;
        if (LINK_STYLES.contains(style)) return LINK;
        return style;
    }

    /**
     * Whether a story's text format model sets any of {@link #TEXT_FORMAT_FIELDS}, read through the
     * kept {@code getCachedString(int)} as Facebook's own check reads them.
     */
    static boolean formatted(Object format) {
        PostText.Members found = PostText.members();
        if (!found.complete() || !found.treeModel.isInstance(format)) return false;
        try {
            if (found.typeTag.getInt(format) != TEXT_FORMAT_TYPE_TAG) return false;
            for (String field : TEXT_FORMAT_FIELDS) {
                if (found.cachedString.invoke(format, field.hashCode()) != null) return true;
            }
            return false;
        } catch (InvocationTargetException failure) {
            HookStatus.threw(FAMILY, "text format reader", failure.getCause());
            return false;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            HookStatus.threw(FAMILY, "text format reader", failure);
            return false;
        }
    }
}
