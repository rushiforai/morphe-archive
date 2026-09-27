package com.facebook.imagepipeline.core;

import com.facebook.imagepipeline.cache.CountingMemoryCache;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public class ImagePipelineFactory {

    public static ImagePipelineFactory getInstance() {
        throw new UnsupportedOperationException("stub");
    }

    /** The cache of downloaded, still encoded images, created on first use. */
    public CountingMemoryCache getEncodedCountingMemoryCache() {
        throw new UnsupportedOperationException("stub");
    }
}
