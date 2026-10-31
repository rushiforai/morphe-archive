package a40;

import b.u4;
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
public final class t {

    @NotNull
    public static final s Companion = new s();

    /* renamed from: g, reason: collision with root package name */
    public static final KSerializer[] f232g = {null, null, null, null, new ArrayListSerializer(StringSerializer.INSTANCE), null};

    /* renamed from: a, reason: collision with root package name */
    public final String f233a;

    /* renamed from: b, reason: collision with root package name */
    public final String f234b;

    /* renamed from: c, reason: collision with root package name */
    public final String f235c;

    /* renamed from: d, reason: collision with root package name */
    public final f0 f236d;

    /* renamed from: e, reason: collision with root package name */
    public final List f237e;

    /* renamed from: f, reason: collision with root package name */
    public final n f238f;

    public /* synthetic */ t(int i5, String str, String str2, String str3, f0 f0Var, List list, n nVar) {
        if (51 != (i5 & 51)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 51, r.f231a.getDescriptor());
        }
        this.f233a = str;
        this.f234b = str2;
        if ((i5 & 4) == 0) {
            this.f235c = null;
        } else {
            this.f235c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f236d = null;
        } else {
            this.f236d = f0Var;
        }
        this.f237e = list;
        this.f238f = nVar;
    }

    public final List a() {
        return this.f237e;
    }

    public final String b() {
        return this.f233a;
    }

    public final f0 c() {
        return this.f236d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f233a, tVar.f233a) && Intrinsics.b(this.f234b, tVar.f234b) && Intrinsics.b(this.f235c, tVar.f235c) && Intrinsics.b(this.f236d, tVar.f236d) && Intrinsics.b(this.f237e, tVar.f237e) && Intrinsics.b(this.f238f, tVar.f238f);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f233a.hashCode() * 31, 31, this.f234b);
        String str = this.f235c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        f0 f0Var = this.f236d;
        return this.f238f.hashCode() + u4.c((iHashCode + (f0Var != null ? f0Var.hashCode() : 0)) * 31, 31, this.f237e);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("AccuWeatherLocationData(Key=", this.f233a, ", LocalizedName=", this.f234b, ", EnglishName=");
        sbW.append(this.f235c);
        sbW.append(", ParentCity=");
        sbW.append(this.f236d);
        sbW.append(", DataSets=");
        sbW.append(this.f237e);
        sbW.append(", GeoPosition=");
        sbW.append(this.f238f);
        sbW.append(")");
        return sbW.toString();
    }
}
