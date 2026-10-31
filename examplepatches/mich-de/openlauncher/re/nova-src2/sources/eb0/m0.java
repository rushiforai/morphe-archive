package eb0;

import java.util.ArrayList;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class m0 {

    /* renamed from: l, reason: collision with root package name */
    public static final char[] f52577l = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /* renamed from: m, reason: collision with root package name */
    public static final Pattern f52578m = Pattern.compile("(.*/)?(\\.|%2e|%2E){1,2}(/.*)?");

    /* renamed from: a, reason: collision with root package name */
    public final String f52579a;

    /* renamed from: b, reason: collision with root package name */
    public final x80.w f52580b;

    /* renamed from: c, reason: collision with root package name */
    public String f52581c;

    /* renamed from: d, reason: collision with root package name */
    public x80.v f52582d;

    /* renamed from: e, reason: collision with root package name */
    public final x80.g0 f52583e = new x80.g0();

    /* renamed from: f, reason: collision with root package name */
    public final o2.h f52584f;

    /* renamed from: g, reason: collision with root package name */
    public x80.a0 f52585g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f52586h;

    /* renamed from: i, reason: collision with root package name */
    public final vk.j f52587i;

    /* renamed from: j, reason: collision with root package name */
    public final of.f f52588j;

    /* renamed from: k, reason: collision with root package name */
    public x80.k0 f52589k;

    public m0(String str, x80.w wVar, String str2, x80.u uVar, x80.a0 a0Var, boolean z11, boolean z12, boolean z13) {
        this.f52579a = str;
        this.f52580b = wVar;
        this.f52581c = str2;
        this.f52585g = a0Var;
        this.f52586h = z11;
        if (uVar != null) {
            this.f52584f = uVar.d();
        } else {
            this.f52584f = new o2.h(1);
        }
        if (z12) {
            this.f52588j = new of.f();
            return;
        }
        if (z13) {
            vk.j jVar = new vk.j();
            this.f52587i = jVar;
            x80.a0 type = x80.c0.f95412h;
            Intrinsics.g(type, "type");
            if (type.f95399b.equals("multipart")) {
                jVar.f92818c = type;
            } else {
                throw new IllegalArgumentException(("multipart != " + type).toString());
            }
        }
    }

    public final void a(String name, String str, boolean z11) {
        of.f fVar = this.f52588j;
        if (!z11) {
            fVar.b(name, str);
            return;
        }
        fVar.getClass();
        Intrinsics.g(name, "name");
        fVar.f80376a.add(x80.b.b(name, 0, 0, 83, " \"':;<=>@[]^`{}|/\\?#&!$(),~"));
        fVar.f80377b.add(x80.b.b(str, 0, 0, 83, " \"':;<=>@[]^`{}|/\\?#&!$(),~"));
    }

    public final void b(String str, String str2, boolean z11) {
        if ("Content-Type".equalsIgnoreCase(str)) {
            try {
                Pattern pattern = x80.a0.f95396e;
                this.f52585g = x80.z.a(str2);
                return;
            } catch (IllegalArgumentException e3) {
                throw new IllegalArgumentException(b.c0.k("Malformed content type: ", str2), e3);
            }
        }
        o2.h hVar = this.f52584f;
        if (z11) {
            hVar.d(str, str2);
        } else {
            hVar.a(str, str2);
        }
    }

    public final void c(x80.u uVar, x80.k0 body) {
        vk.j jVar = this.f52587i;
        jVar.getClass();
        Intrinsics.g(body, "body");
        if (uVar.b("Content-Type") != null) {
            throw new IllegalArgumentException("Unexpected header: Content-Type");
        }
        if (uVar.b("Content-Length") != null) {
            throw new IllegalArgumentException("Unexpected header: Content-Length");
        }
        ((ArrayList) jVar.f92819d).add(new x80.b0(uVar, body));
    }

    public final void d(String encodedName, String str, boolean z11) {
        String str2 = this.f52581c;
        if (str2 != null) {
            x80.w wVar = this.f52580b;
            x80.v vVarH = wVar.h(str2);
            this.f52582d = vVarH;
            if (vVarH == null) {
                throw new IllegalArgumentException("Malformed URL. Base: " + wVar + ", Relative: " + this.f52581c);
            }
            this.f52581c = null;
        }
        if (!z11) {
            this.f52582d.a(encodedName, str);
            return;
        }
        x80.v vVar = this.f52582d;
        vVar.getClass();
        Intrinsics.g(encodedName, "encodedName");
        if (vVar.f95622g == null) {
            vVar.f95622g = new ArrayList();
        }
        ArrayList arrayList = vVar.f95622g;
        Intrinsics.d(arrayList);
        arrayList.add(x80.b.b(encodedName, 0, 0, 211, " \"'<>#&="));
        ArrayList arrayList2 = vVar.f95622g;
        Intrinsics.d(arrayList2);
        arrayList2.add(str != null ? x80.b.b(str, 0, 0, 211, " \"'<>#&=") : null);
    }
}
