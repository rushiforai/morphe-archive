package com.facebook.messaging.model.attachment;

import android.net.Uri;

/**
 * A video attachment's data, shaped like Messenger's: four address fields of the same type, of which an incoming video
 * fills the playable one and its thumbnail's, with nothing on the class saying which is which.
 */
public final class VideoData {
    public Uri A09;
    public Uri A0A;
    public Uri A0B;
    public Uri A0C;

    public VideoData(Uri playable) {
        this.A0B = playable;
    }

    public VideoData(Uri playable, Uri thumbnail) {
        this.A0B = playable;
        this.A0C = thumbnail;
    }
}
