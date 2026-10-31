package xa0;

import b.c0;
import com.amplitude.core.events.Identify;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Locale;
import java.util.regex.Pattern;
import wa0.c;

/* loaded from: classes.dex */
public abstract class a implements c, wa0.a {

    /* renamed from: m, reason: collision with root package name */
    public static final Pattern f95735m = Pattern.compile("\\s{2,}");

    /* renamed from: a, reason: collision with root package name */
    public Locale f95736a;

    /* renamed from: b, reason: collision with root package name */
    public String f95737b = b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public String f95738c = b.f42142b;

    /* renamed from: d, reason: collision with root package name */
    public String f95739d = b.f42142b;

    /* renamed from: e, reason: collision with root package name */
    public String f95740e = b.f42142b;

    /* renamed from: f, reason: collision with root package name */
    public String f95741f = b.f42142b;

    /* renamed from: g, reason: collision with root package name */
    public String f95742g = b.f42142b;

    /* renamed from: h, reason: collision with root package name */
    public String f95743h = b.f42142b;

    /* renamed from: i, reason: collision with root package name */
    public String f95744i = b.f42142b;

    /* renamed from: j, reason: collision with root package name */
    public String f95745j = b.f42142b;

    /* renamed from: k, reason: collision with root package name */
    public String f95746k = b.f42142b;

    /* renamed from: l, reason: collision with root package name */
    public String f95747l = b.f42142b;

    @Override // wa0.c
    public String b(ya0.a aVar, String str) {
        StringBuilder sb2 = new StringBuilder();
        if (aVar.e()) {
            c0.D(sb2, this.f95746k, " ", str, " ");
            sb2.append(this.f95747l);
        } else {
            c0.D(sb2, this.f95744i, " ", str, " ");
            sb2.append(this.f95745j);
        }
        return f95735m.matcher(sb2).replaceAll(" ").trim();
    }

    @Override // wa0.c
    public String c(ya0.a aVar) {
        String str = aVar.a() < 0 ? Identify.UNSET_VALUE : b.f42142b;
        String strD = d(aVar);
        long jAbs = Math.abs(aVar.b());
        String strReplace = e(jAbs).replace("%s", str);
        Locale locale = this.f95736a;
        return strReplace.replace("%n", locale != null ? String.format(locale, "%d", Long.valueOf(jAbs)) : String.format("%d", Long.valueOf(jAbs))).replace("%u", strD);
    }

    public String d(ya0.a aVar) {
        String str;
        String str2;
        String str3 = (!aVar.d() || (str2 = this.f95739d) == null || str2.length() <= 0) ? (!aVar.e() || (str = this.f95741f) == null || str.length() <= 0) ? this.f95737b : this.f95741f : this.f95739d;
        long jAbs = Math.abs(Math.abs(aVar.b()));
        return (jAbs == 0 || jAbs > 1) ? (!aVar.d() || this.f95740e == null || this.f95739d.length() <= 0) ? (!aVar.e() || this.f95742g == null || this.f95741f.length() <= 0) ? this.f95738c : this.f95742g : this.f95740e : str3;
    }

    public String e(long j11) {
        return this.f95743h;
    }

    @Override // wa0.a
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public a a(Locale locale) {
        this.f95736a = locale;
        return this;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SimpleTimeFormat [pattern=");
        sb2.append(this.f95743h);
        sb2.append(", futurePrefix=");
        sb2.append(this.f95744i);
        sb2.append(", futureSuffix=");
        sb2.append(this.f95745j);
        sb2.append(", pastPrefix=");
        sb2.append(this.f95746k);
        sb2.append(", pastSuffix=");
        return c0.q(sb2, this.f95747l, ", roundingTolerance=50]");
    }
}
