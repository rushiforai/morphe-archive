package ay;

import java.io.File;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.jvm.internal.ArrayIteratorKt;

/* loaded from: classes4.dex */
public final class h extends a {

    /* renamed from: d, reason: collision with root package name */
    public final File f15751d;

    public h(int i5, String str, String str2, File file) {
        super(i5, str, str2);
        this.f15751d = file;
    }

    @Override // ay.a
    public final boolean b(ArrayList arrayList) {
        File[] fileArrListFiles = this.f15751d.listFiles();
        if (fileArrListFiles == null) {
            return false;
        }
        int i5 = 0;
        Arrays.sort(fileArrListFiles, new g(new f(Collator.getInstance(), i5), i5));
        b70.a aVarA = ArrayIteratorKt.a(fileArrListFiles);
        boolean z11 = false;
        while (aVarA.hasNext()) {
            File file = (File) aVarA.next();
            if (file.isFile() && r70.j.A0(file.getAbsolutePath(), ".novabackup", false)) {
                arrayList.add(new q(file));
                z11 = true;
            }
        }
        return z11;
    }
}
