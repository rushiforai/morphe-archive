/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * What a save knows about the post its video comes from, for the file name: the video's id, who
 * posted it and the day it went up. Each is missing when the route to the save doesn't reach it,
 * and {@link FileNameTemplate} then leaves its token out of the name.
 *
 * <p>The poster and the post time are read off Facebook's GraphQL models the way Facebook's own
 * code reads them. Every model is a {@code TreeJNI}, a class whose name Redex keeps, and its kept
 * {@code getTree}, {@code getTreeList}, {@code getString} and {@code getTimeValue} take the Java
 * hash of a field's GraphQL name. A video's {@code owner}, a post's {@code actors} and a reel's
 * {@code short_form_video_context.video_owner} are actor models with a {@code name}; a post's
 * {@code creation_time} is in seconds. Facebook reads each of these the same way: the reel's time
 * label casts the reel's story to {@code TreeJNI} and asks {@code getTimeValue(creation_time)},
 * and its first-actor helper takes the first actor with a {@code name}. Each accessor answers
 * null, an empty list or 0 for a field the tree doesn't hold (with Facebook's set-field list off,
 * its own getters ask the native tree for unset fields the same way), and nothing is asked of a
 * model whose native tree is gone. No getter Redex renames is used, so the reads hold from one
 * Facebook build to the next.
 */
public final class PostDetails {

    /** The class every GraphQL model extends, kept by Redex, and the kept names read on it. */
    static final String TREE = "com.facebook.graphservice.tree.TreeJNI";
    private static final String VALID = "isValidGraphServicesJNIModel";

    /** The fields read, as the hash Facebook's models look a field up by: the Java hash of its GraphQL name. */
    static final int OWNER = "owner".hashCode();
    static final int ACTORS = "actors".hashCode();
    static final int NAME = "name".hashCode();
    static final int CREATION_TIME = "creation_time".hashCode();
    static final int CREATION_STORY = "creation_story".hashCode();
    static final int SHORT_FORM_VIDEO_CONTEXT = "short_form_video_context".hashCode();
    static final int VIDEO_OWNER = "video_owner".hashCode();

    /** A save that knows nothing of its post. */
    public static final PostDetails NONE = new PostDetails(null, null, null);

    /** The video's id on Facebook as the route handed it over, or null. Used only when it's a number. */
    public final String videoId;

    /** The poster's name, cleaned the way a folder name is and bounded, or null when unknown. */
    public final String owner;

    /** When the post went up, or null when unknown. */
    public final Date posted;

    PostDetails(String videoId, String owner, Date posted) {
        this.videoId = videoId;
        String clean = owner == null ? "" : SaveFolder.clean(owner, FileNameTemplate.MAX_OWNER_CODE_POINTS);
        this.owner = clean.isEmpty() ? null : clean;
        this.posted = posted;
    }

    /** A save that knows the video's id and nothing else, as every route did before the poster was read. */
    public static PostDetails of(String videoId) {
        return videoId == null ? NONE : new PostDetails(videoId, null, null);
    }

    public boolean hasVideoId() {
        return FileNameTemplate.isVideoId(videoId);
    }

    public boolean hasOwner() {
        return owner != null;
    }

    public boolean hasPosted() {
        return posted != null;
    }

    /**
     * The details of a save of [videoId], with the poster and the post time read from the first of
     * [models] that knows each. A model that isn't a tree, or whose tree is gone, answers nothing.
     * Never throws.
     */
    public static PostDetails read(String videoId, Object... models) {
        String owner = null;
        Date posted = null;
        for (Object model : models) {
            if (owner == null) owner = ownerOf(model);
            if (posted == null) posted = postedOf(model);
        }
        return new PostDetails(videoId, owner, posted);
    }

    /**
     * The details of a story save. The card's kept {@code getTimestamp} is its own tree's
     * {@code creation_time} in milliseconds, so it's the post time, and the tree in the card with
     * that same creation time is the card's own story, whose actors say who posted it. A card can
     * hold other trees too, and none of those is asked for a poster. A card of one tree and no
     * timestamp is read from that tree.
     */
    public static PostDetails ofCard(String videoId, Object card) {
        List<Object> trees = treesIn(card);
        long millis = timestampOf(card);
        Object story = null;
        if (millis > 0) {
            for (Object tree : trees) {
                if (time(tree, CREATION_TIME) * 1000L == millis) {
                    story = tree;
                    break;
                }
            }
        } else if (trees.size() == 1) {
            story = trees.get(0);
        }
        Date posted = millis > 0 ? new Date(millis) : postedOf(story);
        return new PostDetails(videoId, ownerOf(story), posted);
    }

    /** The card's kept getTimestamp(), in milliseconds, or 0 when it has none. */
    private static long timestampOf(Object card) {
        if (card == null) return 0;
        try {
            Object millis = card.getClass().getMethod("getTimestamp").invoke(card);
            return millis instanceof Long && (Long) millis > 0 ? (Long) millis : 0;
        } catch (Throwable t) {
            // A card of another shape. The time stays unknown.
            return 0;
        }
    }

    /**
     * The poster of [model]: the name of its owner, a video's; then of its first actor with a
     * name, a post's or a reel's; then of its short-form video's owner, a reel's. Null when it
     * has none of them or isn't a tree.
     */
    static String ownerOf(Object model) {
        if (!isLiveTree(model)) return null;
        String name = nameOf(tree(model, OWNER));
        if (name != null) return name;
        List<?> actors = trees(model, ACTORS);
        if (actors != null) {
            for (Object actor : actors) {
                name = nameOf(actor);
                if (name != null) return name;
            }
        }
        return nameOf(tree(tree(model, SHORT_FORM_VIDEO_CONTEXT), VIDEO_OWNER));
    }

    /**
     * When [model] was posted: its creation time, and for a video without one, its creation
     * story's. Null when neither is set or it isn't a tree.
     */
    static Date postedOf(Object model) {
        if (!isLiveTree(model)) return null;
        long seconds = time(model, CREATION_TIME);
        if (seconds <= 0) seconds = time(tree(model, CREATION_STORY), CREATION_TIME);
        return seconds <= 0 ? null : new Date(seconds * 1000L);
    }

    /** The trees [host] holds in its own fields, in declaration order, its parents' included. Never throws. */
    static List<Object> treesIn(Object host) {
        List<Object> trees = new ArrayList<>();
        if (host == null) return trees;
        try {
            for (Class<?> type = host.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    try {
                        field.setAccessible(true);
                        Object value = field.get(host);
                        if (isTree(value)) trees.add(value);
                    } catch (Throwable ignored) {
                        // One unreadable field must not end the walk.
                    }
                }
            }
        } catch (Throwable ignored) {
            // Whatever was found stands.
        }
        return trees;
    }

    /** Whether [value] is a GraphQL model: an instance of the kept tree class. */
    static boolean isTree(Object value) {
        if (value == null) return false;
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().equals(TREE)) return true;
        }
        return false;
    }

    /** A tree whose native side is still there. A read from a released one goes to nothing. */
    private static boolean isLiveTree(Object value) {
        if (!isTree(value)) return false;
        try {
            return Boolean.TRUE.equals(value.getClass().getMethod(VALID).invoke(value));
        } catch (Throwable t) {
            return false;
        }
    }

    private static String nameOf(Object actor) {
        if (!isLiveTree(actor)) return null;
        String name = string(actor, NAME);
        return name == null || name.trim().isEmpty() ? null : name;
    }

    private static Object tree(Object model, int field) {
        if (!isLiveTree(model)) return null;
        Object value = call(model, "getTree", field);
        return isTree(value) ? value : null;
    }

    private static List<?> trees(Object model, int field) {
        if (!isLiveTree(model)) return null;
        Object value = call(model, "getTreeList", field);
        return value instanceof List ? (List<?>) value : null;
    }

    private static String string(Object model, int field) {
        Object value = call(model, "getString", field);
        return value instanceof String ? (String) value : null;
    }

    private static long time(Object model, int field) {
        if (!isLiveTree(model)) return 0;
        Object value = call(model, "getTimeValue", field);
        return value instanceof Long ? (Long) value : 0;
    }

    /** The kept accessor [name] of [model] for [field], or null when the model has none or it fails. */
    private static Object call(Object model, String name, int field) {
        if (model == null) return null;
        try {
            Method method = model.getClass().getMethod(name, int.class);
            return method.invoke(model, field);
        } catch (Throwable t) {
            return null;
        }
    }

    @Override
    public String toString() {
        // Never the poster's name or the id: a details object can end up in a diagnostic line.
        return "PostDetails(id " + (hasVideoId() ? "known" : "unknown") + ", poster " + (hasOwner() ? "known" : "unknown")
            + ", posted " + (hasPosted() ? "known" : "unknown") + ")";
    }
}
