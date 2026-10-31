package m00;

import b.c9;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends m {

    /* renamed from: a, reason: collision with root package name */
    public final y20.g f75535a;

    /* renamed from: b, reason: collision with root package name */
    public final y20.d f75536b;

    /* renamed from: c, reason: collision with root package name */
    public final List f75537c;

    public e(y20.g gVar, y20.d dVar, List list) {
        this.f75535a = gVar;
        this.f75536b = dVar;
        this.f75537c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f75535a, eVar.f75535a) && Intrinsics.b(this.f75536b, eVar.f75536b) && Intrinsics.b(this.f75537c, eVar.f75537c);
    }

    public final int hashCode() {
        return this.f75537c.hashCode() + c9.f((this.f75536b.hashCode() + (this.f75535a.hashCode() * 31)) * 31, 31, false);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GroupItemPickerUiData(label=");
        sb2.append(this.f75535a);
        sb2.append(", icon=");
        sb2.append(this.f75536b);
        sb2.append(", isExpanded=false, items=");
        return a80.m.j(sb2, this.f75537c, ")");
    }
}
