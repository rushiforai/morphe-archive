package m70;

import java.io.File;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends b {

    /* renamed from: b, reason: collision with root package name */
    public boolean f76039b;

    /* renamed from: c, reason: collision with root package name */
    public File[] f76040c;

    /* renamed from: d, reason: collision with root package name */
    public int f76041d;

    @Override // m70.g
    public final File a() {
        boolean z11 = this.f76039b;
        File file = this.f76044a;
        if (!z11) {
            this.f76039b = true;
            return file;
        }
        File[] fileArr = this.f76040c;
        if (fileArr != null && this.f76041d >= fileArr.length) {
            return null;
        }
        if (fileArr == null) {
            File[] fileArrListFiles = file.listFiles();
            this.f76040c = fileArrListFiles;
            if (fileArrListFiles == null || fileArrListFiles.length == 0) {
                return null;
            }
        }
        File[] fileArr2 = this.f76040c;
        Intrinsics.d(fileArr2);
        int i5 = this.f76041d;
        this.f76041d = i5 + 1;
        return fileArr2[i5];
    }
}
