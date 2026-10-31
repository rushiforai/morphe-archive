package e00;

import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b6 {

    /* renamed from: a, reason: collision with root package name */
    public final String f50237a;

    /* renamed from: b, reason: collision with root package name */
    public final String f50238b;

    /* renamed from: c, reason: collision with root package name */
    public final String f50239c;

    /* renamed from: d, reason: collision with root package name */
    public final String f50240d;

    /* renamed from: e, reason: collision with root package name */
    public final String f50241e;

    /* renamed from: f, reason: collision with root package name */
    public final String f50242f;

    /* renamed from: g, reason: collision with root package name */
    public final String f50243g;

    /* renamed from: h, reason: collision with root package name */
    public final String f50244h;

    public b6(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8) {
        this.f50237a = str;
        this.f50238b = str2;
        this.f50239c = str3;
        this.f50240d = str4;
        this.f50241e = str5;
        this.f50242f = str6;
        this.f50243g = str7;
        this.f50244h = str8;
    }

    public static boolean b(String str, String str2) {
        if (str != null) {
            String lowerCase = str.toLowerCase(Locale.getDefault());
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            if (r70.j.I0(lowerCase, str2, false) || r70.k.K0(lowerCase, " ".concat(str2), false)) {
                return true;
            }
        }
        return false;
    }

    public final boolean a(String str) {
        return b(this.f50239c, str) || b(this.f50240d, str) || b(this.f50241e, str) || b(this.f50242f, str) || b(this.f50243g, str) || b(this.f50244h, str);
    }
}
