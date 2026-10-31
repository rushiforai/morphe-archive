package a40;

import b.u4;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class w {

    @NotNull
    public static final v Companion = new v();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f240d = {null, new ArrayListSerializer(x.f245a), null};

    /* renamed from: e, reason: collision with root package name */
    public static final w f241e = new w(new c0(), EmptyList.f71733a);

    /* renamed from: a, reason: collision with root package name */
    public final c0 f242a;

    /* renamed from: b, reason: collision with root package name */
    public final List f243b;

    /* renamed from: c, reason: collision with root package name */
    public final String f244c;

    public /* synthetic */ w(int i5, c0 c0Var, List list, String str) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, u.f239a.getDescriptor());
        }
        this.f242a = c0Var;
        this.f243b = list;
        this.f244c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return Intrinsics.b(this.f242a, wVar.f242a) && Intrinsics.b(this.f243b, wVar.f243b) && Intrinsics.b(this.f244c, wVar.f244c);
    }

    public final int hashCode() {
        return this.f244c.hashCode() + u4.c(this.f242a.hashCode() * 31, 31, this.f243b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AccuWeatherMinutecast(Summary=");
        sb2.append(this.f242a);
        sb2.append(", Summaries=");
        sb2.append(this.f243b);
        sb2.append(", MobileLink=");
        return b.c0.q(sb2, this.f244c, ")");
    }

    public w(c0 c0Var, List list) {
        this.f242a = c0Var;
        this.f243b = list;
        this.f244c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
