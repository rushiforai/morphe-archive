/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.morphe.extension.hushthreads.download;

import java.util.Date;

/**
 * What a save knows about the post its media comes from, for the file name: the media's id, who
 * posted it and the day it went up. Each is missing when the route to the save doesn't reach it,
 * and {@link FileNameTemplate} then leaves its token out of the name.
 *
 * <p>Only the value is here. Hushfacebook read these off Facebook's GraphQL trees; the Threads
 * hook that saves a post reads them off Threads' own media model and hands them in through
 * {@link #of(String, String, Date)}.
 */
public final class PostDetails {

    /** A save that knows nothing of its post. */
    public static final PostDetails NONE = new PostDetails(null, null, null);

    /** The media's id as the route handed it over, or null. Used only when it's a number. */
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

    /** A save that knows the media's id and nothing else. */
    public static PostDetails of(String videoId) {
        return videoId == null ? NONE : new PostDetails(videoId, null, null);
    }

    /**
     * A save that knows the media's id [mediaId], its poster's name [owner] and when it was posted
     * [posted], each null when unknown. Threads writes a media id as {@code <pk>_<owner's id>};
     * the pk before the underscore is the media's own number, so that's the one kept.
     */
    public static PostDetails of(String mediaId, String owner, Date posted) {
        String id = mediaId;
        if (id != null) {
            int underscore = id.indexOf('_');
            if (underscore > 0 && FileNameTemplate.isVideoId(id.substring(0, underscore))
                    && FileNameTemplate.isVideoId(id.substring(underscore + 1))) {
                id = id.substring(0, underscore);
            }
        }
        if (id == null && owner == null && posted == null) return NONE;
        return new PostDetails(id, owner, posted);
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

    @Override
    public String toString() {
        // Never the poster's name or the id: a details object can end up in a diagnostic line.
        return "PostDetails(id " + (hasVideoId() ? "known" : "unknown") + ", poster " + (hasOwner() ? "known" : "unknown")
            + ", posted " + (hasPosted() ? "known" : "unknown") + ")";
    }
}
