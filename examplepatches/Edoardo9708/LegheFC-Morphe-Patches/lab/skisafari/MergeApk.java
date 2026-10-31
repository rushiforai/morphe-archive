import app.morphe.patcher.apk.ApkMerger;
import java.io.File;

/** Merge a copy of an APK set with Morphe Desktop's bundled merger. */
public final class MergeApk {
    public static void main(String[] args) {
        if (args.length != 2) throw new IllegalArgumentException("input APK set, new output APK required");
        File output = new File(args[1]);
        if (output.exists()) throw new IllegalArgumentException("Output already exists");
        new ApkMerger().merge(new File(args[0]), output, true, null, true, null, false);
    }
}
