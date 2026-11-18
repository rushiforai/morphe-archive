package com.facebook.messaging.model.attachment;

/**
 * One attachment on a message, shaped like Messenger's: the media it holds sits in a field named nothing useful, and which
 * kind it is shows only in that field's type.
 */
public final class Attachment {
    public int A00;
    public long A01;
    public AudioData A05;
    public ImageData A07;
    public VideoData A08;
    public String A0C;
    public String A0J;
    public String A0L;

    public static Attachment audio(AudioData audio) {
        Attachment attachment = new Attachment();
        attachment.A05 = audio;
        attachment.A0L = "attachment-id";
        return attachment;
    }

    public static Attachment image(ImageData image) {
        Attachment attachment = new Attachment();
        attachment.A07 = image;
        attachment.A0L = "attachment-id";
        return attachment;
    }

    public static Attachment video(VideoData video) {
        Attachment attachment = new Attachment();
        attachment.A08 = video;
        return attachment;
    }
}
