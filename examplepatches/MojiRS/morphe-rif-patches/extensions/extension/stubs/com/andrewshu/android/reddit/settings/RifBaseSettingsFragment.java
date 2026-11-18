package com.andrewshu.android.reddit.settings;

/**
 * COMPILE-ONLY stub of rif's base settings fragment, packaged as ../libs/rif-stubs.jar
 * and wired in with compileOnly(), so it is never part of the extension .rve; rif
 * provides the real class at runtime. It deliberately extends Object so nothing here
 * references rif's R8-renamed androidx classes.
 *
 * The abstract "return the preference-XML resource id" method is obfuscated differently
 * per build of rif 5.6.22, so the stub declares both and RevancedSettingsFragment
 * implements both:
 *   - E4()  free         (com.andrewshu.android.reddit)
 *   - t4()  Golden Platinum (com.andrewshu.android.redditdonation)
 *
 * The jar also holds the androidx SeekBarPreference stub (stubs/androidx/preference/) and the
 * androidx Pair stub (stubs/androidx/core/util/c.java, used by ImageHosting).
 * Rebuild it after editing either (from extensions/extension/, JDK 17):
 *   javac --release 17 -cp "$ANDROID_HOME/platforms/android-34/android.jar" -d stubs-out \
 *       stubs/com/andrewshu/android/reddit/settings/RifBaseSettingsFragment.java \
 *       stubs/androidx/preference/SeekBarPreference.java stubs/androidx/core/util/c.java
 *   jar cf libs/rif-stubs.jar -C stubs-out .
 */
public abstract class RifBaseSettingsFragment {
    protected abstract int E4();

    protected abstract int t4();
}
