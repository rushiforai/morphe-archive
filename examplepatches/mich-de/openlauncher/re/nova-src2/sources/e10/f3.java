package e10;

import b.c9;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f3 {

    @NotNull
    public static final e3 Companion = new e3();

    /* renamed from: h, reason: collision with root package name */
    public static final f3 f51524h = new f3();

    /* renamed from: a, reason: collision with root package name */
    public final String f51525a;

    /* renamed from: b, reason: collision with root package name */
    public final String f51526b;

    /* renamed from: c, reason: collision with root package name */
    public final String f51527c;

    /* renamed from: d, reason: collision with root package name */
    public final String f51528d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f51529e;

    /* renamed from: f, reason: collision with root package name */
    public final String f51530f;

    /* renamed from: g, reason: collision with root package name */
    public final String f51531g;

    public /* synthetic */ f3(int i5, String str, String str2, String str3, String str4, boolean z11, String str5, String str6) {
        this.f51525a = (i5 & 1) == 0 ? "https://discord.gg/novalauncher" : str;
        if ((i5 & 2) == 0) {
            this.f51526b = "https://twitter.com/Nova_Launcher";
        } else {
            this.f51526b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f51527c = "https://novalauncher.com/faq";
        } else {
            this.f51527c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f51528d = "support@novalauncher.com";
        } else {
            this.f51528d = str4;
        }
        if ((i5 & 16) == 0) {
            this.f51529e = true;
        } else {
            this.f51529e = z11;
        }
        if ((i5 & 32) == 0) {
            this.f51530f = null;
        } else {
            this.f51530f = str5;
        }
        if ((i5 & 64) == 0) {
            this.f51531g = null;
        } else {
            this.f51531g = str6;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f3)) {
            return false;
        }
        f3 f3Var = (f3) obj;
        return Intrinsics.b(this.f51525a, f3Var.f51525a) && Intrinsics.b(this.f51526b, f3Var.f51526b) && Intrinsics.b(this.f51527c, f3Var.f51527c) && Intrinsics.b(this.f51528d, f3Var.f51528d) && this.f51529e == f3Var.f51529e && Intrinsics.b(this.f51530f, f3Var.f51530f) && Intrinsics.b(this.f51531g, f3Var.f51531g);
    }

    public final int hashCode() {
        int iF = c9.f(b.c0.e(b.c0.e(b.c0.e(this.f51525a.hashCode() * 31, 31, this.f51526b), 31, this.f51527c), 31, this.f51528d), 31, this.f51529e);
        String str = this.f51530f;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f51531g;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("RemoteConfigData(discordUrl=", this.f51525a, ", twitterUrl=", this.f51526b, ", faqUrl=");
        b.c0.D(sbW, this.f51527c, ", supportEmail=", this.f51528d, ", promptForUpdates=");
        c9.s(", titleMessage=", this.f51530f, ", versionMessage=", sbW, this.f51529e);
        return b.c0.q(sbW, this.f51531g, ")");
    }

    public f3() {
        this.f51525a = "https://discord.gg/novalauncher";
        this.f51526b = "https://twitter.com/Nova_Launcher";
        this.f51527c = "https://novalauncher.com/faq";
        this.f51528d = "support@novalauncher.com";
        this.f51529e = true;
        this.f51530f = null;
        this.f51531g = null;
    }
}
