package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eh4 extends dh4 {
    public boolean b;
    public File[] c;
    public int d;
    public boolean e;

    @Override // defpackage.jh4
    public final File a() {
        boolean z = this.e;
        File file = this.a;
        if (!z && this.c == null) {
            File[] fileArrListFiles = file.listFiles();
            this.c = fileArrListFiles;
            if (fileArrListFiles == null) {
                this.e = true;
            }
        }
        File[] fileArr = this.c;
        if (fileArr == null || this.d >= fileArr.length) {
            if (this.b) {
                return null;
            }
            this.b = true;
            return file;
        }
        fileArr.getClass();
        int i = this.d;
        this.d = i + 1;
        return fileArr[i];
    }
}
