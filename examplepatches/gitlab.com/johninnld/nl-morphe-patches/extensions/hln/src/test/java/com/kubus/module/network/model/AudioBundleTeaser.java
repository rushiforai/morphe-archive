package com.kubus.module.network.model;

import java.util.List;

/**
 * JVM test stub of the kept Moshi block. The real class extends TeaserBlock
 * with minified public field names, so this stub deliberately uses odd names:
 * the runtime must find the item list by shape, not by field name.
 */
public final class AudioBundleTeaser {
    public final String q;
    public final List<?> z9;
    public final List<?> items;

    public AudioBundleTeaser(String q, List<?> z9, List<?> items) {
        this.q = q;
        this.z9 = z9;
        this.items = items;
    }
}
