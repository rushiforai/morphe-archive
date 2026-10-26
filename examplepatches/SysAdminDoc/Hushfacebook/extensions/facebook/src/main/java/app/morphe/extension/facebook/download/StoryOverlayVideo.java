/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import java.util.List;

/**
 * The reel a story reshares, read from the story's overlays (#207).
 *
 * <p>A story made by sharing a reel is a still card: its own attachment is a photo, the reel's
 * first frame with a play button drawn on, and {@code getMedia} answers that photo. The reel sits
 * in the card's story tree as a sticker, {@code story_overlays[].fb_shorts_story}, with the video's
 * DASH manifest under {@code short_form_video_context.video.playlist} and again on the reel's own
 * attachment, and the overlay carries one single-file address as {@code playable_url}. Facebook's
 * Save takes the still. A person tapping Save on a playing reel wants the reel, so the story save
 * reads it from here when the card holds no video of its own.
 */
final class StoryOverlayVideo {
    static final int STORY_OVERLAYS = "story_overlays".hashCode();
    static final int FB_SHORTS_STORY = "fb_shorts_story".hashCode();
    static final int VIDEO = "video".hashCode();
    static final int ATTACHMENTS = "attachments".hashCode();
    static final int MEDIA = "media".hashCode();
    static final int PLAYLIST = "playlist".hashCode();

    /** The reel's DASH manifest, or null when the overlay holds none. */
    final String manifest;
    /** The reel's one single-file address, or null. */
    final String url;
    /** The reel's video id, for the file name, or null. */
    final String videoId;

    private StoryOverlayVideo(String manifest, String url, String videoId) {
        this.manifest = manifest;
        this.url = url;
        this.videoId = videoId;
    }

    /**
     * The first reshared reel among the overlays of [card]'s trees, or null when no overlay holds
     * a video. Never throws: a released tree reads as nothing.
     */
    static StoryOverlayVideo in(Object card) {
        try {
            for (Object tree : PostDetails.treesIn(card)) {
                List<?> overlays = PostDetails.trees(tree, STORY_OVERLAYS);
                if (overlays == null) continue;
                for (Object overlay : overlays) {
                    StoryOverlayVideo found = of(overlay);
                    if (found != null) return found;
                }
            }
        } catch (Throwable unreadable) {
            // A card this can't read saves as it did before.
        }
        return null;
    }

    /** The reel [overlay] reshares, or null when it's another kind of sticker. */
    static StoryOverlayVideo of(Object overlay) {
        if (!PostDetails.isLiveTree(overlay)) return null;
        String url = address(PostDetails.string(overlay, VideoMenuItem.PLAYABLE_URL));
        Object reel = PostDetails.tree(overlay, FB_SHORTS_STORY);
        Object video = PostDetails.tree(PostDetails.tree(reel, PostDetails.SHORT_FORM_VIDEO_CONTEXT), VIDEO);
        String manifest = manifestOf(video);
        String videoId = PostDetails.isLiveTree(video) ? PostDetails.string(video, PostDetails.ID) : null;
        List<?> attachments = PostDetails.trees(reel, ATTACHMENTS);
        if (attachments != null) {
            for (Object attachment : attachments) {
                Object media = PostDetails.tree(attachment, MEDIA);
                if (!PostDetails.isLiveTree(media)) continue;
                if (manifest == null) manifest = manifestOf(media);
                if (url == null) url = address(PostDetails.string(media, VideoMenuItem.PLAYABLE_URL));
                if (videoId == null) videoId = PostDetails.string(media, PostDetails.ID);
            }
        }
        if (manifest == null && url == null) return null;
        return new StoryOverlayVideo(manifest, url, videoId);
    }

    private static String manifestOf(Object video) {
        if (!PostDetails.isLiveTree(video)) return null;
        String playlist = PostDetails.string(video, PLAYLIST);
        return playlist != null && playlist.contains("<MPD") ? playlist : null;
    }

    private static String address(String text) {
        return text != null && RenditionPicker.isHttpUrl(text) ? text : null;
    }
}
