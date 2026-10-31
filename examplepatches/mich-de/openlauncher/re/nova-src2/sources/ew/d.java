package ew;

import a80.m;
import b.c0;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class d {

    @NotNull
    public static final c Companion = new c();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f53039d = {null, null, new ArrayListSerializer(StringSerializer.INSTANCE)};

    /* renamed from: a, reason: collision with root package name */
    public final String f53040a;

    /* renamed from: b, reason: collision with root package name */
    public final String f53041b;

    /* renamed from: c, reason: collision with root package name */
    public final List f53042c;

    public /* synthetic */ d(int i5, List list, String str, String str2) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, b.f53038a.getDescriptor());
        }
        this.f53040a = str;
        this.f53041b = str2;
        this.f53042c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f53040a, dVar.f53040a) && Intrinsics.b(this.f53041b, dVar.f53041b) && Intrinsics.b(this.f53042c, dVar.f53042c);
    }

    public final int hashCode() {
        String str = this.f53040a;
        return this.f53042c.hashCode() + c0.e((str == null ? 0 : str.hashCode()) * 31, 31, this.f53041b);
    }

    public final String toString() {
        return m.j(c0.w("AddressComponent(shortName=", this.f53040a, ", longName=", this.f53041b, ", types="), this.f53042c, ")");
    }

    public d(String str, String str2, List list) {
        this.f53040a = str;
        this.f53041b = str2;
        this.f53042c = list;
    }
}
