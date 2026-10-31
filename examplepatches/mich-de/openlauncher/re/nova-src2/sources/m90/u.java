package m90;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public class u extends m {
    @Override // m90.m
    public final h0 a(z file) {
        Intrinsics.g(file, "file");
        File file2 = file.toFile();
        Logger logger = w.f76170a;
        return new y(new FileOutputStream(file2, true), new l0());
    }

    @Override // m90.m
    public void b(z source, z target) throws IOException {
        Intrinsics.g(source, "source");
        Intrinsics.g(target, "target");
        if (source.toFile().renameTo(target.toFile())) {
            return;
        }
        throw new IOException("failed to move " + source + " to " + target);
    }

    @Override // m90.m
    public final void d(z zVar) throws IOException {
        if (zVar.toFile().mkdir()) {
            return;
        }
        h4.e eVarJ = j(zVar);
        if (eVarJ == null || !eVarJ.f59100c) {
            throw new IOException("failed to create directory: " + zVar);
        }
    }

    @Override // m90.m
    public final void e(z path) throws IOException {
        Intrinsics.g(path, "path");
        if (Thread.interrupted()) {
            throw new InterruptedIOException("interrupted");
        }
        File file = path.toFile();
        if (file.delete() || !file.exists()) {
            return;
        }
        throw new IOException("failed to delete " + path);
    }

    @Override // m90.m
    public final List h(z zVar) throws IOException {
        File file = zVar.toFile();
        String[] list = file.list();
        if (list == null) {
            if (file.exists()) {
                throw new IOException("failed to list " + zVar);
            }
            throw new FileNotFoundException("no such file: " + zVar);
        }
        ArrayList arrayList = new ArrayList();
        for (String str : list) {
            Intrinsics.d(str);
            arrayList.add(zVar.g(str));
        }
        b70.c.x0(arrayList);
        return arrayList;
    }

    @Override // m90.m
    public h4.e j(z path) {
        Intrinsics.g(path, "path");
        File file = path.toFile();
        boolean zIsFile = file.isFile();
        boolean zIsDirectory = file.isDirectory();
        long jLastModified = file.lastModified();
        long length = file.length();
        if (!zIsFile && !zIsDirectory && jLastModified == 0 && length == 0 && !file.exists()) {
            return null;
        }
        return new h4.e(zIsFile, zIsDirectory, null, Long.valueOf(length), null, Long.valueOf(jLastModified), null);
    }

    @Override // m90.m
    public final t k(z zVar) {
        return new t(false, new RandomAccessFile(zVar.toFile(), "r"));
    }

    @Override // m90.m
    public final t l(z file) {
        Intrinsics.g(file, "file");
        return new t(true, new RandomAccessFile(file.toFile(), "rw"));
    }

    @Override // m90.m
    public final h0 m(z file) {
        Intrinsics.g(file, "file");
        return x7.f.T(file.toFile());
    }

    @Override // m90.m
    public final j0 n(z file) {
        Intrinsics.g(file, "file");
        return x7.f.U(file.toFile());
    }

    public String toString() {
        return "JvmSystemFileSystem";
    }
}
