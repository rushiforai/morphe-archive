/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.comment;

/** Filled by the patch after every native boundary has been validated. */
public final class CommentPhotoNative {
    private CommentPhotoNative() {}

    /**
     * The Media of this selected comment's own photo; null for anything else, including a GIF, a
     * video, a comment without media and an unsupported object.
     */
    public static Object photoMedia(Object comment) { return null; }

    /** A native display row using Instagram's Save label, icon and normal style. */
    public static Object newRow(Object callback) { return null; }

    /** The callback of an owned Save row, or null for stock, Copy and unsupported rows. */
    public static Object callback(Object row) { return null; }
}
