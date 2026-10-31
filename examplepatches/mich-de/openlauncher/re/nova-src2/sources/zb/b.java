package zb;

import java.io.File;
import java.io.FileFilter;

/* loaded from: classes2.dex */
public final class b implements FileFilter {
    @Override // java.io.FileFilter
    public final boolean accept(File file) {
        return file.isDirectory();
    }
}
