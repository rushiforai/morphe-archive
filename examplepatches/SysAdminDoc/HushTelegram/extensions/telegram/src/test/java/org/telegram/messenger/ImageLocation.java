package org.telegram.messenger;

import org.telegram.tgnet.TLRPC;

/** Telegram's ImageLocation, as far as a test needs it: one photo size or document preview to download. */
public class ImageLocation {
    private final String owner;
    private final TLRPC.PhotoSize size;

    private ImageLocation(String owner, TLRPC.PhotoSize size) {
        this.owner = owner;
        this.size = size;
    }

    public static ImageLocation getForPhoto(TLRPC.PhotoSize size, TLRPC.Photo photo) {
        return size == null || photo == null ? null : new ImageLocation("photo", size);
    }

    public static ImageLocation getForDocument(TLRPC.PhotoSize size, TLRPC.Document document) {
        return size == null || document == null ? null : new ImageLocation("preview", size);
    }

    @Override public String toString() {
        return owner + " " + size.type;
    }
}
