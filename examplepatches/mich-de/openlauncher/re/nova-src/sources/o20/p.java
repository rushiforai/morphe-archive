package o20;

import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f79453a;

    /* renamed from: b, reason: collision with root package name */
    public final List f79454b;

    /* renamed from: c, reason: collision with root package name */
    public final List f79455c;

    /* renamed from: d, reason: collision with root package name */
    public final List f79456d;

    public p(String str, List list, List list2, List list3) {
        this.f79453a = str;
        this.f79454b = list;
        this.f79455c = list2;
        this.f79456d = list3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f79453a, pVar.f79453a) && Intrinsics.b(this.f79454b, pVar.f79454b) && Intrinsics.b(this.f79455c, pVar.f79455c) && Intrinsics.b(this.f79456d, pVar.f79456d);
    }

    public final int hashCode() {
        return this.f79456d.hashCode() + u4.c(u4.c(this.f79453a.hashCode() * 31, 31, this.f79454b), 31, this.f79455c);
    }

    public final String toString() {
        return "SlackWorkspaceData(workspace=" + this.f79453a + ", channels=" + this.f79454b + ", colleagues=" + this.f79455c + ", groups=" + this.f79456d + ")";
    }
}
