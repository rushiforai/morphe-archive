package q20;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink$$serializer;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f83465d = {null, new ArrayListSerializer(ExternalLink$$serializer.INSTANCE), null};

    /* renamed from: a, reason: collision with root package name */
    public final boolean f83466a;

    /* renamed from: b, reason: collision with root package name */
    public final List f83467b;

    /* renamed from: c, reason: collision with root package name */
    public final long f83468c;

    public /* synthetic */ f(List list, boolean z11, long j11, int i5) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, d.f83464a.getDescriptor());
        }
        this.f83466a = z11;
        this.f83467b = list;
        this.f83468c = j11;
    }

    public final List a() {
        return this.f83467b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f83466a == fVar.f83466a && Intrinsics.b(this.f83467b, fVar.f83467b) && this.f83468c == fVar.f83468c;
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f83466a) * 31;
        List list = this.f83467b;
        return Long.hashCode(this.f83468c) + ((iHashCode + (list == null ? 0 : list.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ApiResult(hasError=");
        sb2.append(this.f83466a);
        sb2.append(", links=");
        sb2.append(this.f83467b);
        sb2.append(", bytesReceived=");
        return a2.c.i(this.f83468c, ")", sb2);
    }

    public f(List list, boolean z11, long j11) {
        this.f83466a = z11;
        this.f83467b = list;
        this.f83468c = j11;
    }
}
