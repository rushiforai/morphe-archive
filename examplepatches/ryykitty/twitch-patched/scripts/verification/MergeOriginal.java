import app.morphe.patcher.apk.ApkMerger;
import java.io.File;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.zip.ZipFile;


public final class MergeOriginal {
    public static void main(String[] args) throws Exception {
        if (args.length != 3) throw new IllegalArgumentException("Expected bundle, original base APK, output APK.");
        new ApkMerger().merge(new File(args[0]), new File(args[2]), true, null, true, null, false);
        int count = 0;
        try (ZipFile base = new ZipFile(args[1]); ZipFile output = new ZipFile(args[2])) {
            var entries = base.entries();
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes(?:\\d+)?\\.dex")) continue;
                var merged = output.getEntry(entry.getName());
                if (merged == null) throw new IllegalStateException("Merged original is missing a DEX file.");
                try (var left = base.getInputStream(entry); var right = output.getInputStream(merged)) {
                    if (!Arrays.equals(MessageDigest.getInstance("SHA-256").digest(left.readAllBytes()),
                            MessageDigest.getInstance("SHA-256").digest(right.readAllBytes()))) {
                        throw new IllegalStateException("Merge changed original DEX bytes.");
                    }
                }
                count++;
            }
            if (count == 0 || output.stream().filter(e -> e.getName().matches("classes(?:\\d+)?\\.dex")).count() != count) {
                throw new IllegalStateException("Merged original DEX count differs from the inspected base.");
            }
        }
        System.out.println("Prepared original: " + count + " DEX files are byte-identical to the base APK.");
    }
}
