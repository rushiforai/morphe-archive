package y30;

import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.RandomAccessFile;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public interface c extends Closeable {
    static c g(File path) {
        Intrinsics.g(path, "path");
        path.getParentFile().mkdirs();
        try {
            return new d(new RandomAccessFile(path, "r"));
        } catch (FileNotFoundException unused) {
            return new e();
        }
    }

    b G(String str, String str2);
}
