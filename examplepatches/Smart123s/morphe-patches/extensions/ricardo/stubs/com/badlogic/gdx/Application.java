package com.badlogic.gdx;

/** Compile-only signatures from Ricardo 2.077. */
public interface Application {
    void postRunnable(Runnable runnable);
    Preferences getPreferences(String name);
}
