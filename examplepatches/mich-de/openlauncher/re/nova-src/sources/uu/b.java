package uu;

import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f91547a;

    /* renamed from: b, reason: collision with root package name */
    public final wu.c f91548b;

    public b(LinkedHashMap linkedHashMap, wu.c userRequestedReuse) {
        Intrinsics.g(userRequestedReuse, "userRequestedReuse");
        this.f91547a = linkedHashMap;
        this.f91548b = userRequestedReuse;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f91547a.equals(bVar.f91547a) && this.f91548b == bVar.f91548b;
    }

    public final int hashCode() {
        return this.f91548b.hashCode() + (this.f91547a.hashCode() * 31);
    }

    public final String toString() {
        return "FormFieldValues(fieldValuePairs=" + this.f91547a + ", userRequestedReuse=" + this.f91548b + ")";
    }
}
