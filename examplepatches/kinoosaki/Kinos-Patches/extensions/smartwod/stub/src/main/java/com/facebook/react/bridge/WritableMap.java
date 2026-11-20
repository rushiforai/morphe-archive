package com.facebook.react.bridge;

public interface WritableMap extends ReadableMap {
    void putArray(String key, ReadableArray value);

    void putBoolean(String key, boolean value);

    void putDouble(String key, double value);

    void putInt(String key, int value);

    void putNull(String key);

    void putString(String key, String value);
}
