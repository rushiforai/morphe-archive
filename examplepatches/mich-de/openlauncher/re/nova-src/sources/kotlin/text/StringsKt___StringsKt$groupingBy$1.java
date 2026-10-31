package kotlin.text;

import java.util.Iterator;
import kotlin.Metadata;
import kotlin.collections.Grouping;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\f\n\u0000\b\n\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0003"}, d2 = {"kotlin/text/StringsKt___StringsKt$groupingBy$1", "Lkotlin/collections/Grouping;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 176)
/* loaded from: classes5.dex */
public final class StringsKt___StringsKt$groupingBy$1 implements Grouping<Character, Object> {
    @Override // kotlin.collections.Grouping
    public final Object keyOf(Object obj) {
        ((Character) obj).charValue();
        throw null;
    }

    @Override // kotlin.collections.Grouping
    public final Iterator sourceIterator() {
        Intrinsics.g(null, "<this>");
        new StringsKt__StringsKt$iterator$1();
        throw null;
    }
}
