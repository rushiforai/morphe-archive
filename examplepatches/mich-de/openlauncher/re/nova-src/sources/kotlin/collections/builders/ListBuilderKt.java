package kotlin.collections.builders;

import kotlin.Metadata;
import kotlin.collections.AbstractMutableList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ListBuilderKt {
    public static final String a(Object[] objArr, int i5, int i11, AbstractMutableList abstractMutableList) {
        StringBuilder sb2 = new StringBuilder((i11 * 3) + 2);
        sb2.append("[");
        for (int i12 = 0; i12 < i11; i12++) {
            if (i12 > 0) {
                sb2.append(", ");
            }
            Object obj = objArr[i5 + i12];
            if (obj == abstractMutableList) {
                sb2.append("(this Collection)");
            } else {
                sb2.append(obj);
            }
        }
        sb2.append("]");
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public static final void b(Object[] objArr, int i5, int i11) {
        Intrinsics.g(objArr, "<this>");
        while (i5 < i11) {
            objArr[i5] = null;
            i5++;
        }
    }
}
