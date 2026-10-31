package m70;

import java.io.File;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends b {

    /* renamed from: b, reason: collision with root package name */
    public boolean f76034b;

    /* renamed from: c, reason: collision with root package name */
    public File[] f76035c;

    /* renamed from: d, reason: collision with root package name */
    public int f76036d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f76037e;

    @Override // m70.g
    public final File a() {
        boolean z11 = this.f76037e;
        File file = this.f76044a;
        if (!z11 && this.f76035c == null) {
            File[] fileArrListFiles = file.listFiles();
            this.f76035c = fileArrListFiles;
            if (fileArrListFiles == null) {
                this.f76037e = true;
            }
        }
        File[] fileArr = this.f76035c;
        if (fileArr == null || this.f76036d >= fileArr.length) {
            if (this.f76034b) {
                return null;
            }
            this.f76034b = true;
            return file;
        }
        Intrinsics.d(fileArr);
        int i5 = this.f76036d;
        this.f76036d = i5 + 1;
        return fileArr[i5];
    }
}
