package com.facebook.messaging.model.share;

import java.util.ArrayList;
import java.util.List;

/**
 * The older share the way a message carries it: a row of String fields holding its address among its title, caption,
 * ids and a deep link into the app, under names that say nothing, and a list of its pictures beside them.
 */
public final class Share {
    private final String A06;
    private final String A07;
    private final String A09;
    private final String A0A;
    private final String A0B;
    private final String A0C;
    private final String A0D;
    /** Its pictures, which the extension has no reason to read. */
    public final List<Object> A04 = new ArrayList<>();

    public Share(String attribution, String caption, String deepLink, String description, String id, String href, String name) {
        A06 = attribution;
        A07 = caption;
        A09 = deepLink;
        A0A = description;
        A0B = id;
        A0C = href;
        A0D = name;
    }

    /** A share whose only address is [href], beside the kind of values a real one carries. */
    public static Share linking(String href) {
        return new Share("Instagram", "Reel by ana", "fb://reel/1234567890", "Watch this", "1234567890", href, "ana");
    }
}
