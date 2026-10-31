package kotlin.text;

import kotlin.Metadata;
import kotlin.collections.AbstractList;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"kotlin/text/MatcherMatchResult$groupValues$1", "Lkotlin/collections/AbstractList;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MatcherMatchResult$groupValues$1 extends AbstractList<String> {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b f72024b;

    public MatcherMatchResult$groupValues$1(b bVar) {
        this.f72024b = bVar;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f72024b.f72033a.groupCount() + 1;
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj instanceof String) {
            return super.contains((String) obj);
        }
        return false;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        String strGroup = this.f72024b.f72033a.group(i5);
        return strGroup == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strGroup;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (obj instanceof String) {
            return super.indexOf((String) obj);
        }
        return -1;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (obj instanceof String) {
            return super.lastIndexOf((String) obj);
        }
        return -1;
    }
}
