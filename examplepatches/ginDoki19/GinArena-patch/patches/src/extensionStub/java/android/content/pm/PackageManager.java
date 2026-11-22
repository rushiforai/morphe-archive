package android.content.pm;

/**
 * Lab stub: only the feature check the extension makes.
 *
 * FEATURE_LEANBACK is a real constant with a real value, because the extension compares against
 * it at runtime on the device. hasSystemFeature throws, exactly like every other stub here, so a
 * mistake that reaches it on a device would be a build-time impossibility rather than a silent
 * wrong answer: the extension calls it inside try/catch and treats a throw as "not a TV".
 */
public class PackageManager {
    public static final String FEATURE_LEANBACK = "android.software.leanback";
    public boolean hasSystemFeature(String name) { throw new RuntimeException(); }
}
