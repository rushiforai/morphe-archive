package com.tapblaze.pizzabusiness;

/** Compile-only declarations; use the game's original JNI methods at runtime. */
public final class IronSourceWrapper {
    public static native void onInitialized();
    public static native void onVideoReady();
}
