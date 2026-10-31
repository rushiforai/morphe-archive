package z6;

import b.c0;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import ps.f0;
import r70.k;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f98249a;

    /* renamed from: b, reason: collision with root package name */
    public final String f98250b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f98251c;

    /* renamed from: d, reason: collision with root package name */
    public final int f98252d;

    /* renamed from: e, reason: collision with root package name */
    public final String f98253e;

    /* renamed from: f, reason: collision with root package name */
    public final int f98254f;

    /* renamed from: g, reason: collision with root package name */
    public final int f98255g;

    public a(int i5, int i11, String str, String str2, String str3, boolean z11) {
        this.f98249a = str;
        this.f98250b = str2;
        this.f98251c = z11;
        this.f98252d = i5;
        this.f98253e = str3;
        this.f98254f = i11;
        Locale US = Locale.US;
        Intrinsics.f(US, "US");
        String upperCase = str2.toUpperCase(US);
        Intrinsics.f(upperCase, "this as java.lang.String).toUpperCase(locale)");
        this.f98255g = k.K0(upperCase, "INT", false) ? 3 : (k.K0(upperCase, "CHAR", false) || k.K0(upperCase, "CLOB", false) || k.K0(upperCase, "TEXT", false)) ? 2 : k.K0(upperCase, "BLOB", false) ? 5 : (k.K0(upperCase, "REAL", false) || k.K0(upperCase, "FLOA", false) || k.K0(upperCase, "DOUB", false)) ? 4 : 1;
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            if (this.f98252d != aVar.f98252d) {
                return false;
            }
            int i5 = aVar.f98254f;
            String str = aVar.f98253e;
            if (!this.f98249a.equals(aVar.f98249a) || this.f98251c != aVar.f98251c) {
                return false;
            }
            String str2 = this.f98253e;
            int i11 = this.f98254f;
            if (i11 == 1 && i5 == 2 && str2 != null && !f0.k(str2, str)) {
                return false;
            }
            if (i11 == 2 && i5 == 1 && str != null && !f0.k(str, str2)) {
                return false;
            }
            if (i11 != 0 && i11 == i5) {
                if (str2 != null) {
                    if (!f0.k(str2, str)) {
                        return false;
                    }
                } else if (str != null) {
                    return false;
                }
            }
            if (this.f98255g != aVar.f98255g) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        return (((((this.f98249a.hashCode() * 31) + this.f98255g) * 31) + (this.f98251c ? 1231 : 1237)) * 31) + this.f98252d;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Column{name='");
        sb2.append(this.f98249a);
        sb2.append("', type='");
        sb2.append(this.f98250b);
        sb2.append("', affinity='");
        sb2.append(this.f98255g);
        sb2.append("', notNull=");
        sb2.append(this.f98251c);
        sb2.append(", primaryKeyPosition=");
        sb2.append(this.f98252d);
        sb2.append(", defaultValue='");
        String str = this.f98253e;
        if (str == null) {
            str = "undefined";
        }
        return c0.q(sb2, str, "'}");
    }
}
