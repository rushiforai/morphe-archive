package com.badlogic.gdx;

/** Compile-only signatures from the APK's libGDX 1.1.0. */
public interface Preferences {
    void putInteger(String key, int value);
    void flush();
}
