package com.facebook.react.bridge;

/**
 * Compile-time stub of React Native's ReadableArray. The real class is in the patched app.
 */
public interface ReadableArray {
    int size();

    boolean isNull(int index);

    String getString(int index);

    ReadableArray getArray(int index);
}
