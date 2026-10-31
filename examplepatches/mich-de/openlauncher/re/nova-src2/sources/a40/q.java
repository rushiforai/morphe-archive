package a40;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class q {

    @NotNull
    public static final p Companion = new p();

    /* renamed from: a, reason: collision with root package name */
    public final String f226a;

    /* renamed from: b, reason: collision with root package name */
    public final String f227b;

    /* renamed from: c, reason: collision with root package name */
    public final String f228c;

    /* renamed from: d, reason: collision with root package name */
    public final h f229d;

    /* renamed from: e, reason: collision with root package name */
    public final h f230e;

    public /* synthetic */ q(int i5, String str, String str2, String str3, h hVar, h hVar2) {
        if (27 != (i5 & 27)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 27, o.f225a.getDescriptor());
        }
        this.f226a = str;
        this.f227b = str2;
        if ((i5 & 4) == 0) {
            this.f228c = null;
        } else {
            this.f228c = str3;
        }
        this.f229d = hVar;
        this.f230e = hVar2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return Intrinsics.b(this.f226a, qVar.f226a) && Intrinsics.b(this.f227b, qVar.f227b) && Intrinsics.b(this.f228c, qVar.f228c) && Intrinsics.b(this.f229d, qVar.f229d) && Intrinsics.b(this.f230e, qVar.f230e);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f226a.hashCode() * 31, 31, this.f227b);
        String str = this.f228c;
        return this.f230e.hashCode() + ((this.f229d.hashCode() + ((iE + (str == null ? 0 : str.hashCode())) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("AccuWeatherLocationAutoComplete(Key=", this.f226a, ", LocalizedName=", this.f227b, ", EnglishName=");
        sbW.append(this.f228c);
        sbW.append(", Country=");
        sbW.append(this.f229d);
        sbW.append(", AdministrativeArea=");
        sbW.append(this.f230e);
        sbW.append(")");
        return sbW.toString();
    }
}
