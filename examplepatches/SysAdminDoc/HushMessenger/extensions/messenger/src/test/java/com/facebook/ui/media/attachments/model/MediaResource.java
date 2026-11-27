package com.facebook.ui.media.attachments.model;

/**
 * A photo or video the way Messenger's editor hands it back in its result's message: its kind among other enums, under
 * names that say nothing, as 588's Redex leaves them.
 */
public final class MediaResource {
    /** Messenger's kinds of media, under the names its enum gives them (588's LX/8Ie;). */
    public enum Type { PHOTO, VIDEO, AUDIO, FILE, OTHER, ENCRYPTED_PHOTO, ENT_PHOTO, ENT_VIDEO, ANIMATED_PHOTO, SELFIE_STICKER, MUSIC_MEDIA }

    /** Another enum beside it, which a walk that takes the first enum field would read instead. */
    public enum Orientation { NORMAL, ROTATE_90 }

    public final Orientation A0I = Orientation.NORMAL;
    public final String A0j = "content://media/1";
    public final Type A0R;

    public MediaResource(Type kind) {
        A0R = kind;
    }
}
