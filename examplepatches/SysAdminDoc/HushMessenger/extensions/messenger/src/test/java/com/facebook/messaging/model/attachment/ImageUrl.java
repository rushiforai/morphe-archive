package com.facebook.messaging.model.attachment;

/** One address for a photo at one size, with its two numbers beside it, the way Messenger keeps them. */
public final class ImageUrl {
    public int A00;
    public int A01;
    public String A02;

    public ImageUrl(int width, int height, String url) {
        this.A00 = width;
        this.A01 = height;
        this.A02 = url;
    }
}
