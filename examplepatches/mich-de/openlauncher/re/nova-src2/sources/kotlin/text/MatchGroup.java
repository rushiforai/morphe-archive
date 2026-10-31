package kotlin.text;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/text/MatchGroup;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final /* data */ class MatchGroup {

    /* renamed from: a, reason: collision with root package name */
    public final String f72022a;

    /* renamed from: b, reason: collision with root package name */
    public final IntRange f72023b;

    public MatchGroup(String str, IntRange intRange) {
        this.f72022a = str;
        this.f72023b = intRange;
    }

    /* renamed from: a, reason: from getter */
    public final String getF72022a() {
        return this.f72022a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MatchGroup)) {
            return false;
        }
        MatchGroup matchGroup = (MatchGroup) obj;
        return Intrinsics.b(this.f72022a, matchGroup.f72022a) && Intrinsics.b(this.f72023b, matchGroup.f72023b);
    }

    public final int hashCode() {
        return this.f72023b.hashCode() + (this.f72022a.hashCode() * 31);
    }

    public final String toString() {
        return "MatchGroup(value=" + this.f72022a + ", range=" + this.f72023b + ')';
    }
}
