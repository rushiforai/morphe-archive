package r90;

import b.c0;
import com.google.protobuf.l;
import h60.h;
import java.io.Serializable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final Serializable f85751a;

    public g(boolean z11) {
        this.f85751a = Boolean.valueOf(z11);
    }

    public static g a(b bVar, String str, int[] iArr, boolean z11) {
        String str2;
        loop0: for (a aVar : bVar.e()) {
            if (z11 || aVar.e()) {
                if (!aVar.m() || aVar.getAppId().equals(str)) {
                    if (aVar.n()) {
                        int[] iArrC = h.c(aVar.j());
                        int i5 = 0;
                        while (i5 < Math.max(iArr.length, iArrC.length)) {
                            int i11 = i5 < iArr.length ? iArr[i5] : 0;
                            int i12 = i5 < iArrC.length ? iArrC[i5] : 0;
                            if (i11 > i12) {
                                break loop0;
                            }
                            if (i11 < i12) {
                                break;
                            }
                            i5++;
                        }
                    }
                    int iL = aVar.l();
                    int iF = c0.F(iL);
                    if (iF == 0) {
                        return new g(aVar.f());
                    }
                    if (iF == 1) {
                        return new g(aVar.i());
                    }
                    if (iF == 2) {
                        return new g(aVar.h());
                    }
                    if (iF == 3) {
                        return new g(aVar.k());
                    }
                    if (iF == 4) {
                        return new g(aVar.g());
                    }
                    if (iF == 5) {
                        return null;
                    }
                    switch (iL) {
                        case 1:
                            str2 = "BOOL_VALUE";
                            break;
                        case 2:
                            str2 = "INT_VALUE";
                            break;
                        case 3:
                            str2 = "FLOAT_VALUE";
                            break;
                        case 4:
                            str2 = "STRING_VALUE";
                            break;
                        case 5:
                            str2 = "BYTES_VALUE";
                            break;
                        case 6:
                            str2 = "VALUE_NOT_SET";
                            break;
                        default:
                            str2 = AbstractJsonLexerKt.NULL;
                            break;
                    }
                    throw new IllegalArgumentException("Flag value uses unknown value type ".concat(str2));
                }
            }
        }
        return null;
    }

    public final void b(int i5) {
        int i11;
        Serializable serializable = this.f85751a;
        if (serializable instanceof Boolean) {
            i11 = 1;
        } else if (serializable instanceof Long) {
            i11 = 2;
        } else if (serializable instanceof Float) {
            i11 = 3;
        } else if (serializable instanceof String) {
            i11 = 4;
        } else {
            if (!(serializable instanceof l)) {
                throw new IllegalStateException("Unexpected flag value type: ".concat(serializable.getClass().getName()));
            }
            i11 = 5;
        }
        if (i5 != i11) {
            throw new IllegalStateException(c0.m("Attempted to access flag value as ", qm.e.s(i5), ", but actual type is ", qm.e.s(i11)));
        }
    }

    public final String toString() {
        return this.f85751a.toString();
    }

    public g(long j11) {
        this.f85751a = Long.valueOf(j11);
    }

    public g(float f11) {
        this.f85751a = Float.valueOf(f11);
    }

    public g(String str) {
        this.f85751a = str;
    }

    public g(l lVar) {
        this.f85751a = lVar;
    }
}
