package op;

import b.c9;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f80563a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f80564b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f80565c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f80566d;

    /* renamed from: e, reason: collision with root package name */
    public final String f80567e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f80568f;

    public m(boolean z11, boolean z12, boolean z13, boolean z14, String str, ArrayList arrayList) {
        this.f80563a = z11;
        this.f80564b = z12;
        this.f80565c = z13;
        this.f80566d = z14;
        this.f80567e = str;
        this.f80568f = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return this.f80563a == mVar.f80563a && this.f80564b == mVar.f80564b && this.f80565c == mVar.f80565c && this.f80566d == mVar.f80566d && Intrinsics.b(this.f80567e, mVar.f80567e) && this.f80568f.equals(mVar.f80568f);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f(c9.f(Boolean.hashCode(this.f80563a) * 31, 31, this.f80564b), 31, this.f80565c), 31, this.f80566d);
        String str = this.f80567e;
        return this.f80568f.hashCode() + ((iF + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NovaSettingsAnalytics(microResultsEnabled=");
        sb2.append(this.f80563a);
        sb2.append(", shortcutSearchEnabled=");
        sb2.append(this.f80564b);
        sb2.append(", cardViewEnabled=");
        a80.m.s(sb2, this.f80565c, ", contactsEnabled=", this.f80566d, ", webSuggestions=");
        sb2.append(this.f80567e);
        sb2.append(", searchMoreProviders=");
        sb2.append(this.f80568f);
        sb2.append(")");
        return sb2.toString();
    }
}
