package ux;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f91600a;

    /* renamed from: b, reason: collision with root package name */
    public final String f91601b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f91602c;

    public a(String str, String str2, boolean z11) {
        this.f91600a = str;
        this.f91601b = str2;
        this.f91602c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f91600a, aVar.f91600a) && Intrinsics.b(this.f91601b, aVar.f91601b) && this.f91602c == aVar.f91602c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f91602c) + c0.e(this.f91600a.hashCode() * 31, 31, this.f91601b);
    }

    public final String toString() {
        return a80.m.k(c0.w("CalendarEvent(title=", this.f91600a, ", startTimeFormatted=", this.f91601b, ", isAllDay="), this.f91602c, ")");
    }
}
