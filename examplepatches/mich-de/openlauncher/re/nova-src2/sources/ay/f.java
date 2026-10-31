package ay;

import com.stripe.android.core.model.Country;
import java.io.File;
import java.text.Collator;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15747a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Collator f15748b;

    public /* synthetic */ f(Collator collator, int i5) {
        this.f15747a = i5;
        this.f15748b = collator;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5;
        int iCompare;
        switch (this.f15747a) {
            case 0:
                File file = (File) obj;
                File file2 = (File) obj2;
                if (file2.lastModified() == file.lastModified()) {
                    i5 = this.f15748b.compare(file.getName(), file2.getName());
                } else {
                    i5 = Intrinsics.i(file2.lastModified(), file.lastModified());
                }
                return Integer.valueOf(i5);
            case 1:
                iCompare = this.f15748b.compare(((Country) obj).f42573b, ((Country) obj2).f42573b);
                break;
            default:
                iCompare = this.f15748b.compare(((nx.i) obj).f78640a, ((nx.i) obj2).f78640a);
                break;
        }
        return Integer.valueOf(iCompare);
    }
}
