package com.facebook.common.memory;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public interface PooledByteBuffer {
    byte read(int offset);

    int read(int offset, byte[] buffer, int bufferOffset, int length);

    int size();
}
