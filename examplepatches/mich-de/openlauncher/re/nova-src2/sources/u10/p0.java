package u10;

import android.net.Uri;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class p0 extends e0 {

    @NotNull
    public static final o0 Companion = new o0();

    /* renamed from: c, reason: collision with root package name */
    public final String f90406c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90407d;

    /* renamed from: e, reason: collision with root package name */
    public final String f90408e;

    /* renamed from: f, reason: collision with root package name */
    public final String f90409f;

    /* renamed from: g, reason: collision with root package name */
    public final Uri f90410g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p0(int i5, String str, String str2, String str3, String str4, String str5, Uri uri) {
        super(str, 0);
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, n0.f90404a.getDescriptor());
        }
        this.f90406c = str2;
        if ((i5 & 4) == 0) {
            this.f90407d = null;
        } else {
            this.f90407d = str3;
        }
        if ((i5 & 8) == 0) {
            this.f90408e = str2;
        } else {
            this.f90408e = str4;
        }
        if ((i5 & 16) == 0) {
            this.f90409f = null;
        } else {
            this.f90409f = str5;
        }
        if ((i5 & 32) == 0) {
            this.f90410g = null;
        } else {
            this.f90410g = uri;
        }
    }

    @Override // u10.e0
    public final String a() {
        return this.f90408e;
    }

    @Override // u10.e0
    public final Uri b() {
        return r10.a.g("com.google.android.apps.maps");
    }

    @Override // u10.e0
    public final Function0 c() {
        return new sx.d(19);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p0)) {
            return false;
        }
        p0 p0Var = (p0) obj;
        return Intrinsics.b(this.f90406c, p0Var.f90406c) && Intrinsics.b(this.f90407d, p0Var.f90407d) && Intrinsics.b(this.f90408e, p0Var.f90408e) && Intrinsics.b(this.f90409f, p0Var.f90409f) && Intrinsics.b(this.f90410g, p0Var.f90410g);
    }

    public final int hashCode() {
        int iHashCode = this.f90406c.hashCode() * 31;
        String str = this.f90407d;
        int iE = b.c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f90408e);
        String str2 = this.f90409f;
        int iHashCode2 = (iE + (str2 == null ? 0 : str2.hashCode())) * 31;
        Uri uri = this.f90410g;
        return iHashCode2 + (uri != null ? uri.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("MapLocationHeroCard(location=", this.f90406c, ", locationPlaceId=", this.f90407d, ", displayName=");
        b.c0.D(sbW, this.f90408e, ", note=", this.f90409f, ", image=");
        sbW.append(this.f90410g);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ p0(String str, String str2, Uri uri, int i5) {
        this(str, null, str2, null, uri);
    }

    public p0(String str, String str2, String str3, String str4, Uri uri) {
        super(b.c0.k("MapLocationCard:", str3));
        this.f90406c = str;
        this.f90407d = str2;
        this.f90408e = str3;
        this.f90409f = str4;
        this.f90410g = uri;
    }
}
