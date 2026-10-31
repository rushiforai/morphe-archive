package c20;

import android.content.Intent;
import b.c0;
import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f19185a;

    /* renamed from: b, reason: collision with root package name */
    public final String f19186b;

    /* renamed from: c, reason: collision with root package name */
    public final String f19187c;

    /* renamed from: d, reason: collision with root package name */
    public final List f19188d;

    /* renamed from: e, reason: collision with root package name */
    public final int f19189e;

    /* renamed from: f, reason: collision with root package name */
    public final String f19190f;

    /* renamed from: g, reason: collision with root package name */
    public final Intent f19191g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f19192h;

    public b(String str, String str2, String str3, List list, int i5, String str4, Intent intent, boolean z11) {
        this.f19185a = str;
        this.f19186b = str2;
        this.f19187c = str3;
        this.f19188d = list;
        this.f19189e = i5;
        this.f19190f = str4;
        this.f19191g = intent;
        this.f19192h = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f19185a, bVar.f19185a) && Intrinsics.b(this.f19186b, bVar.f19186b) && Intrinsics.b(this.f19187c, bVar.f19187c) && Intrinsics.b(this.f19188d, bVar.f19188d) && this.f19189e == bVar.f19189e && Intrinsics.b(this.f19190f, bVar.f19190f) && Intrinsics.b(this.f19191g, bVar.f19191g) && this.f19192h == bVar.f19192h;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f19192h) + ((this.f19191g.hashCode() + c0.e(u4.a(this.f19189e, u4.c(c0.e(c0.e(this.f19185a.hashCode() * 31, 31, this.f19186b), 31, this.f19187c), 31, this.f19188d), 31), 31, this.f19190f)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("WeatherCardUIState(tempText=", this.f19185a, ", conditionText=", this.f19186b, ", locationText=");
        sbW.append(this.f19187c);
        sbW.append(", weatherBg=");
        sbW.append(this.f19188d);
        sbW.append(", weatherIcon=");
        sbW.append(this.f19189e);
        sbW.append(", formattedTime=");
        sbW.append(this.f19190f);
        sbW.append(", intent=");
        sbW.append(this.f19191g);
        sbW.append(", hasPendingCondition=");
        sbW.append(this.f19192h);
        sbW.append(")");
        return sbW.toString();
    }
}
