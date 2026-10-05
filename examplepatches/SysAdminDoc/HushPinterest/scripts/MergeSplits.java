import app.morphe.patcher.apk.ApkMerger;

import java.io.File;

/**
 * Merges a split bundle (.apkm, .apks or .xapk) into one APK with the desktop CLI's own merger,
 * called the way the CLI's patch command calls it before it patches.
 *
 * <p>morphe-desktop 1.17.0 merges a bundle into {@code <name>-merged.apk} beside its output,
 * patches that and deletes it on the way out, so nothing the scripts could compare a patched APK
 * with was left behind: the resource check fell back to base.apk, which lacks every resource the
 * splits carry, and the receipt read its manifest baseline off base.apk too. The scripts merge
 * first now and hand the CLI the merged APK, which it patches as it is, so the table and manifest
 * the patched APK was rebuilt from are a file they hold.
 *
 * <p>The arguments are the CLI's own (PatchCommand, 1.17.0): {@code merge$default} with every
 * default but the last flag, which it passes as false, the same value the default gives it.
 *
 *   java -cp &lt;cli jar&gt; MergeSplits.java &lt;bundle&gt; &lt;merged.apk&gt;
 */
public final class MergeSplits {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) {
            System.err.println("usage: MergeSplits <bundle> <merged.apk>");
            System.exit(2);
        }
        File bundle = new File(args[0]);
        File merged = new File(args[1]);
        if (!bundle.isFile()) {
            System.err.println("[merge] no bundle at " + bundle.getPath());
            System.exit(2);
        }
        new ApkMerger().merge(bundle, merged, true, null, true, null, false);
        // The merger answers nothing, so the file is the only evidence it worked.
        if (!merged.isFile() || merged.length() == 0) {
            System.err.println("[merge] the merge of " + bundle.getName() + " wrote no APK at " + merged.getPath());
            System.exit(1);
        }
        System.out.println("[merge] " + bundle.getName() + " -> " + merged.getName() + ", " + merged.length() + " bytes");
    }
}
