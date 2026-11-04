package app.wordfeudwordfinder.extension.core;

/**
 * Stand-in for the generated BuildInfo (task generateBuildInfo in extensions/extension/build.gradle.kts), used only
 * by the JVM test build and android-compile-check.sh.
 */
public final class BuildInfo {
    public static final String PATCH_VERSION = "dev";

    private BuildInfo() {}
}
