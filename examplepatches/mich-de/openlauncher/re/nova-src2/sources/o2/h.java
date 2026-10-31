package o2;

import java.util.ArrayList;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f79265a;

    public h(int i5) {
        switch (i5) {
            case 1:
                this.f79265a = new ArrayList(20);
                break;
            default:
                this.f79265a = new ArrayList(32);
                break;
        }
    }

    public void a(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        v4.a.c(name);
        v4.a.d(value, name);
        c(name, value);
    }

    public void b(String str) {
        int iR0 = r70.k.R0(AbstractJsonLexerKt.COLON, 1, 4, str);
        if (iR0 != -1) {
            String strSubstring = str.substring(0, iR0);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
            String strSubstring2 = str.substring(iR0 + 1);
            Intrinsics.f(strSubstring2, "this as java.lang.String).substring(startIndex)");
            c(strSubstring, strSubstring2);
            return;
        }
        if (str.charAt(0) != ':') {
            c(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, str);
            return;
        }
        String strSubstring3 = str.substring(1);
        Intrinsics.f(strSubstring3, "this as java.lang.String).substring(startIndex)");
        c(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, strSubstring3);
    }

    public void c(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        ArrayList arrayList = this.f79265a;
        arrayList.add(name);
        arrayList.add(r70.k.u1(value).toString());
    }

    public void d(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        if (name.length() <= 0) {
            throw new IllegalArgumentException("name is empty");
        }
        int length = name.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = name.charAt(i5);
            if ('!' > cCharAt || cCharAt >= 127) {
                throw new IllegalArgumentException(y80.c.g("Unexpected char %#04x at %d in header name: %s", Integer.valueOf(cCharAt), Integer.valueOf(i5), name).toString());
            }
        }
        c(name, value);
    }

    public void e(float f11, float f12, boolean z11, boolean z12, float f13, float f14) {
        this.f79265a.add(new t(f11, f12, 0.0f, z11, z12, f13, f14));
    }

    public x80.u f() {
        return new x80.u((String[]) this.f79265a.toArray(new String[0]));
    }

    public void g() {
        this.f79265a.add(l.f79317c);
    }

    public void h(float f11, float f12, float f13, float f14, float f15, float f16) {
        this.f79265a.add(new m(f11, f12, f13, f14, f15, f16));
    }

    public void i(float f11, float f12, float f13, float f14, float f15, float f16) {
        this.f79265a.add(new u(f11, f12, f13, f14, f15, f16));
    }

    public String j(String name) {
        Intrinsics.g(name, "name");
        ArrayList arrayList = this.f79265a;
        int size = arrayList.size() - 2;
        int iA = ProgressionUtilKt.a(size, 0, -2);
        if (iA > size) {
            return null;
        }
        while (!name.equalsIgnoreCase((String) arrayList.get(size))) {
            if (size == iA) {
                return null;
            }
            size -= 2;
        }
        return (String) arrayList.get(size + 1);
    }

    public void k(float f11) {
        this.f79265a.add(new n(f11));
    }

    public void l(float f11) {
        this.f79265a.add(new v(f11));
    }

    public void m(float f11, float f12) {
        this.f79265a.add(new o(f11, f12));
    }

    public void n(float f11, float f12) {
        this.f79265a.add(new w(f11, f12));
    }

    public void o(float f11, float f12) {
        this.f79265a.add(new p(f11, f12));
    }

    public void p(float f11, float f12) {
        this.f79265a.add(new x(f11, f12));
    }

    public void q(float f11, float f12, float f13, float f14) {
        this.f79265a.add(new r(f11, f12, f13, f14));
    }

    public void r(float f11, float f12, float f13, float f14) {
        this.f79265a.add(new z(f11, f12, f13, f14));
    }

    public void s(String name) {
        Intrinsics.g(name, "name");
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f79265a;
            if (i5 >= arrayList.size()) {
                return;
            }
            if (name.equalsIgnoreCase((String) arrayList.get(i5))) {
                arrayList.remove(i5);
                arrayList.remove(i5);
                i5 -= 2;
            }
            i5 += 2;
        }
    }

    public void t(float f11) {
        this.f79265a.add(new c0(f11));
    }

    public void u(float f11) {
        this.f79265a.add(new b0(f11));
    }
}
