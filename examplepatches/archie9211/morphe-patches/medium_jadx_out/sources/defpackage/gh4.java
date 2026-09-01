package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gh4 extends dh4 {
    public boolean b;
    public File[] c;
    public int d;

    @Override // defpackage.jh4
    public final File a() {
        boolean z = this.b;
        File file = this.a;
        if (!z) {
            this.b = true;
            return file;
        }
        File[] fileArrListFiles = this.c;
        if (fileArrListFiles != null && this.d >= fileArrListFiles.length) {
            return null;
        }
        if (fileArrListFiles == null) {
            fileArrListFiles = file.listFiles();
            this.c = fileArrListFiles;
            if (fileArrListFiles == null || fileArrListFiles.length == 0) {
                return null;
            }
        }
        fileArrListFiles.getClass();
        int i = this.d;
        this.d = i + 1;
        return fileArrListFiles[i];
    }
}
