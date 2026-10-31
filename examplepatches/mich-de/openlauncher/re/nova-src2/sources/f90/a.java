package f90;

import h6.c1;
import java.io.File;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f54357a = new a();

    public final void a(File file) throws IOException {
        Intrinsics.g(file, "file");
        if (!file.delete() && file.exists()) {
            throw new IOException(c1.q(file, "failed to delete "));
        }
    }

    public final void b(File directory) throws IOException {
        Intrinsics.g(directory, "directory");
        File[] fileArrListFiles = directory.listFiles();
        if (fileArrListFiles == null) {
            throw new IOException(c1.q(directory, "not a readable directory: "));
        }
        for (File file : fileArrListFiles) {
            if (file.isDirectory()) {
                b(file);
            }
            if (!file.delete()) {
                throw new IOException(c1.q(file, "failed to delete "));
            }
        }
    }

    public final boolean c(File file) {
        Intrinsics.g(file, "file");
        return file.exists();
    }

    public final void d(File from, File to2) throws IOException {
        Intrinsics.g(from, "from");
        Intrinsics.g(to2, "to");
        a(to2);
        if (from.renameTo(to2)) {
            return;
        }
        throw new IOException("failed to rename " + from + " to " + to2);
    }

    public final String toString() {
        return "FileSystem.SYSTEM";
    }
}
