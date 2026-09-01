package defpackage;

import java.io.File;
import java.io.FileFilter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tp0 implements FileFilter {
    @Override // java.io.FileFilter
    public final boolean accept(File file) {
        if (file == null) {
            return false;
        }
        String name = file.getName();
        name.getClass();
        return tuc.P(name) != null;
    }
}
