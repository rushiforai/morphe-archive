package com.facebook.imagepipeline.cache;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public class LruCountingMemoryCache implements CountingMemoryCache {

    /** Read under the cache's own lock. */
    public MemoryCacheParams mMemoryCacheParams;

    /** When the params were last asked for, in uptime milliseconds. */
    public long mLastCacheParamsCheck;

    /** Drops the entries no one holds until the cache is within its params. */
    public void maybeEvictEntries() {
        throw new UnsupportedOperationException("stub");
    }
}
