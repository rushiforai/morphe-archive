/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/tumblr/stub/src/main/java/com/tumblr/rumblr/model/TimelineObject.java
 */

package com.tumblr.rumblr.model;

public class TimelineObject<T extends Timelineable> {
    public final T getData() {
        throw new UnsupportedOperationException("Stub");
    }

}

