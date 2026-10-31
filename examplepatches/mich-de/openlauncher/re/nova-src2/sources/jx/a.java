package jx;

import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f70394b = new a(EmptySet.f71734a);

    /* renamed from: a, reason: collision with root package name */
    public final Set f70395a;

    public a(Set set) {
        this.f70395a = set;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f70395a, ((a) obj).f70395a);
    }

    public final int hashCode() {
        return this.f70395a.hashCode();
    }

    public final String toString() {
        return "BluetoothData(devices=" + this.f70395a + ")";
    }
}
