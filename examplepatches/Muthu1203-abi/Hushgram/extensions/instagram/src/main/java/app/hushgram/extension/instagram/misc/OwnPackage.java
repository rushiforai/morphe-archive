/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

/**
 * The package this build installs under. It's Instagram's, unless Install next to Instagram
 * moved the build to a package of its own, in which case the patch writes that one here. A check
 * that the running app is this build asks this, so it accepts the second copy's own package and
 * nothing else.
 */
public final class OwnPackage {

    private OwnPackage() {}

    /** This build's package. The patch rewrites the one string here, so keep it the method's only one. */
    public static String name() {
        return "com.instagram.android";
    }
}
