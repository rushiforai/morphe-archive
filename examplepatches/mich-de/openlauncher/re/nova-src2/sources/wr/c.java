package wr;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    public final String f94635a;

    /* renamed from: b, reason: collision with root package name */
    public final String f94636b;

    /* renamed from: c, reason: collision with root package name */
    public final String f94637c;

    public /* synthetic */ c(int i5, String str, String str2, String str3) {
        if ((i5 & 1) == 0) {
            this.f94635a = null;
        } else {
            this.f94635a = str;
        }
        if ((i5 & 2) == 0) {
            this.f94636b = null;
        } else {
            this.f94636b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f94637c = null;
        } else {
            this.f94637c = str3;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f94635a, cVar.f94635a) && Intrinsics.b(this.f94636b, cVar.f94636b) && Intrinsics.b(this.f94637c, cVar.f94637c);
    }

    public final int hashCode() {
        String str = this.f94635a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f94636b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f94637c;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        return c0.q(c0.w("FinancialConnectionsSessionManifest(cancelUrl=", this.f94635a, ", hostedAuthUrl=", this.f94636b, ", successUrl="), this.f94637c, ")");
    }
}
