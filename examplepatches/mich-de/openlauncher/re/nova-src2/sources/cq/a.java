package cq;

import aq.r;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KParameter;
import kotlin.reflect.KProperty1;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f47789a;

    /* renamed from: b, reason: collision with root package name */
    public final r f47790b;

    /* renamed from: c, reason: collision with root package name */
    public final KProperty1 f47791c;

    /* renamed from: d, reason: collision with root package name */
    public final KParameter f47792d;

    /* renamed from: e, reason: collision with root package name */
    public final int f47793e;

    public a(String jsonName, r rVar, KProperty1 kProperty1, KParameter kParameter, int i5) {
        Intrinsics.g(jsonName, "jsonName");
        this.f47789a = jsonName;
        this.f47790b = rVar;
        this.f47791c = kProperty1;
        this.f47792d = kParameter;
        this.f47793e = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f47789a, aVar.f47789a) && Intrinsics.b(this.f47790b, aVar.f47790b) && Intrinsics.b(this.f47791c, aVar.f47791c) && Intrinsics.b(this.f47792d, aVar.f47792d) && this.f47793e == aVar.f47793e;
    }

    public final int hashCode() {
        int iHashCode = (this.f47791c.hashCode() + ((this.f47790b.hashCode() + (this.f47789a.hashCode() * 31)) * 31)) * 31;
        KParameter kParameter = this.f47792d;
        return Integer.hashCode(this.f47793e) + ((iHashCode + (kParameter == null ? 0 : kParameter.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Binding(jsonName=");
        sb2.append(this.f47789a);
        sb2.append(", adapter=");
        sb2.append(this.f47790b);
        sb2.append(", property=");
        sb2.append(this.f47791c);
        sb2.append(", parameter=");
        sb2.append(this.f47792d);
        sb2.append(", propertyIndex=");
        return a2.c.m(sb2, this.f47793e, ')');
    }
}
