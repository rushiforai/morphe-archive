package com.facebook.messaging.model.attachment;

/**
 * A photo attachment's data. Two maps of the same photo at several sizes, named nothing useful, which is why both are
 * looked at and the biggest address across them wins.
 */
public final class ImageData {
    public int A00;
    public int A01;
    public AttachmentImageMap A02;
    public AttachmentImageMap A03;
    public String A05 = "image/jpeg";
    public String A06;
    public boolean A07;

    public static ImageData of(AttachmentImageMap previews, AttachmentImageMap full) {
        ImageData image = new ImageData();
        image.A02 = previews;
        image.A03 = full;
        return image;
    }
}
