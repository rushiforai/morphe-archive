package eb0;

import java.lang.reflect.Method;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class f0 extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final Method f52557d;

    /* renamed from: e, reason: collision with root package name */
    public final int f52558e;

    /* renamed from: f, reason: collision with root package name */
    public final String f52559f;

    /* renamed from: g, reason: collision with root package name */
    public final a f52560g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f52561h;

    public f0(Method method, int i5, String str, boolean z11) {
        a aVar = a.f52530b;
        this.f52557d = method;
        this.f52558e = i5;
        Objects.requireNonNull(str, "name == null");
        this.f52559f = str;
        this.f52560g = aVar;
        this.f52561h = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e9  */
    @Override // eb0.w0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(m0 m0Var, Object obj) {
        String strP;
        String strReplace;
        String str = this.f52559f;
        if (obj == null) {
            throw w0.o(this.f52557d, this.f52558e, b.c0.l("Path parameter \"", str, "\" value must not be null."), new Object[0]);
        }
        this.f52560g.getClass();
        String string = obj.toString();
        if (m0Var.f52581c == null) {
            throw new AssertionError();
        }
        int length = string.length();
        int iCharCount = 0;
        while (iCharCount < length) {
            int iCodePointAt = string.codePointAt(iCharCount);
            boolean z11 = this.f52561h;
            int i5 = 47;
            int i11 = -1;
            if (iCodePointAt < 32 || iCodePointAt >= 127 || " \"<>^`{}|\\?#".indexOf(iCodePointAt) != -1 || (!z11 && (iCodePointAt == 47 || iCodePointAt == 37))) {
                m90.g gVar = new m90.g();
                gVar.l0(0, iCharCount, string);
                m90.g gVar2 = null;
                while (iCharCount < length) {
                    int iCodePointAt2 = string.codePointAt(iCharCount);
                    if (!z11 || (iCodePointAt2 != 9 && iCodePointAt2 != 10 && iCodePointAt2 != 12 && iCodePointAt2 != 13)) {
                        if (iCodePointAt2 < 32 || iCodePointAt2 >= 127 || " \"<>^`{}|\\?#".indexOf(iCodePointAt2) != i11 || (!z11 && (iCodePointAt2 == i5 || iCodePointAt2 == 37))) {
                            if (gVar2 == null) {
                                gVar2 = new m90.g();
                            }
                            gVar2.n0(iCodePointAt2);
                            while (!gVar2.N()) {
                                byte b11 = gVar2.readByte();
                                gVar.g0(37);
                                char[] cArr = m0.f52577l;
                                gVar.g0(cArr[((b11 & 255) >> 4) & 15]);
                                gVar.g0(cArr[b11 & 15]);
                            }
                        } else {
                            gVar.n0(iCodePointAt2);
                        }
                    }
                    iCharCount += Character.charCount(iCodePointAt2);
                    i5 = 47;
                    i11 = -1;
                }
                strP = gVar.P();
                strReplace = m0Var.f52581c.replace("{" + str + "}", strP);
                if (!m0.f52578m.matcher(strReplace).matches()) {
                    throw new IllegalArgumentException("@Path parameters shouldn't perform path traversal ('.' or '..'): ".concat(string));
                }
                m0Var.f52581c = strReplace;
                return;
            }
            iCharCount += Character.charCount(iCodePointAt);
        }
        strP = string;
        strReplace = m0Var.f52581c.replace("{" + str + "}", strP);
        if (!m0.f52578m.matcher(strReplace).matches()) {
        }
    }
}
