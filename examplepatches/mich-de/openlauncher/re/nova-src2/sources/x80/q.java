package x80;

import b.c9;
import java.text.DateFormat;
import java.util.Date;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class q {

    /* renamed from: j, reason: collision with root package name */
    public static final Pattern f95581j = Pattern.compile("(\\d{2,4})[^\\d]*");

    /* renamed from: k, reason: collision with root package name */
    public static final Pattern f95582k = Pattern.compile("(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*");

    /* renamed from: l, reason: collision with root package name */
    public static final Pattern f95583l = Pattern.compile("(\\d{1,2})[^\\d]*");

    /* renamed from: m, reason: collision with root package name */
    public static final Pattern f95584m = Pattern.compile("(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*");

    /* renamed from: a, reason: collision with root package name */
    public final String f95585a;

    /* renamed from: b, reason: collision with root package name */
    public final String f95586b;

    /* renamed from: c, reason: collision with root package name */
    public final long f95587c;

    /* renamed from: d, reason: collision with root package name */
    public final String f95588d;

    /* renamed from: e, reason: collision with root package name */
    public final String f95589e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f95590f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f95591g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f95592h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f95593i;

    public q(String str, String str2, long j11, String str3, String str4, boolean z11, boolean z12, boolean z13, boolean z14) {
        this.f95585a = str;
        this.f95586b = str2;
        this.f95587c = j11;
        this.f95588d = str3;
        this.f95589e = str4;
        this.f95590f = z11;
        this.f95591g = z12;
        this.f95592h = z13;
        this.f95593i = z14;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return Intrinsics.b(qVar.f95585a, this.f95585a) && Intrinsics.b(qVar.f95586b, this.f95586b) && qVar.f95587c == this.f95587c && Intrinsics.b(qVar.f95588d, this.f95588d) && Intrinsics.b(qVar.f95589e, this.f95589e) && qVar.f95590f == this.f95590f && qVar.f95591g == this.f95591g && qVar.f95592h == this.f95592h && qVar.f95593i == this.f95593i;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f95593i) + c9.f(c9.f(c9.f(b.c0.e(b.c0.e(b.c0.d(b.c0.e(b.c0.e(527, 31, this.f95585a), 31, this.f95586b), 31, this.f95587c), 31, this.f95588d), 31, this.f95589e), 31, this.f95590f), 31, this.f95591g), 31, this.f95592h);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f95585a);
        sb2.append('=');
        sb2.append(this.f95586b);
        if (this.f95592h) {
            long j11 = this.f95587c;
            if (j11 == Long.MIN_VALUE) {
                sb2.append("; max-age=0");
            } else {
                sb2.append("; expires=");
                String str = ((DateFormat) c90.c.f19885a.get()).format(new Date(j11));
                Intrinsics.f(str, "STANDARD_DATE_FORMAT.get().format(this)");
                sb2.append(str);
            }
        }
        if (!this.f95593i) {
            sb2.append("; domain=");
            sb2.append(this.f95588d);
        }
        sb2.append("; path=");
        sb2.append(this.f95589e);
        if (this.f95590f) {
            sb2.append("; secure");
        }
        if (this.f95591g) {
            sb2.append("; httponly");
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString()");
        return string;
    }
}
