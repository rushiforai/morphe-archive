package com.facebook.react.bridge;

public interface WritableArray extends ReadableArray {
    void pushString(String value);

    void pushMap(ReadableMap map);
}
