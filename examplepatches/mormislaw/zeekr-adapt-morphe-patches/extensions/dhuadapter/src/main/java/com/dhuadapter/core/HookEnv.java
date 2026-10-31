package com.dhuadapter.core;

import android.content.Context;

import com.dhuadapter.DhuConfig;

/**
 * Shared hook environment (approach A: static holder). The factory populates
 * these once in instantiateApplication, BEFORE any category installer runs, so
 * every category package reads config / appContext / classLoader from here
 * instead of threading a context object through every call.
 */
public final class HookEnv {

    public static final String TAG = "DhuAdapter";

    /** Embedded config, loaded from the APK by the factory. */
    public static DhuConfig config;

    /** The real Application context (available pre-onCreate). */
    public static Context appContext;

    /** App classloader — used to resolve app / androidx classes by name. */
    public static ClassLoader classLoader;

    /** Absolute path to the app's base APK (ApplicationInfo.sourceDir), captured
     *  in the factory. Used to read baked assets from the APK zip directly, the
     *  same way DhuConfig loads its config pre-onCreate. */
    public static String apkSourceDir;

    /**
     * Lazily-created MediaCenter bridge; shared by the media-session hook
     * (which creates it) and the lifecycle hook (which tears it down when the
     * app's last activity is destroyed). Null when config.mediaBridge=false.
     */
    public static com.dhuadapter.mediabridge.MediaBridge mediaBridge;

    private HookEnv() {}
}
