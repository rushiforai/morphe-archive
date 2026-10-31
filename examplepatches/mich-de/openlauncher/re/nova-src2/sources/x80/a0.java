package x80;

import java.nio.charset.Charset;
import java.util.regex.Pattern;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: e, reason: collision with root package name */
    public static final Pattern f95396e = Pattern.compile("([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)/([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)");

    /* renamed from: f, reason: collision with root package name */
    public static final Pattern f95397f = Pattern.compile(";\\s*(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)=(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)|\"([^\"]*)\"))?");

    /* renamed from: a, reason: collision with root package name */
    public final String f95398a;

    /* renamed from: b, reason: collision with root package name */
    public final String f95399b;

    /* renamed from: c, reason: collision with root package name */
    public final String f95400c;

    /* renamed from: d, reason: collision with root package name */
    public final String[] f95401d;

    public a0(String str, String str2, String str3, String[] strArr) {
        this.f95398a = str;
        this.f95399b = str2;
        this.f95400c = str3;
        this.f95401d = strArr;
    }

    public final Charset a(Charset charset) {
        String str;
        String[] strArr = this.f95401d;
        int i5 = 0;
        int iA = ProgressionUtilKt.a(0, strArr.length - 1, 2);
        if (iA < 0) {
            str = null;
            break;
        }
        while (!r70.j.B0(strArr[i5], "charset", true)) {
            if (i5 == iA) {
                str = null;
                break;
            }
            i5 += 2;
        }
        str = strArr[i5 + 1];
        if (str == null) {
            return charset;
        }
        try {
            return Charset.forName(str);
        } catch (IllegalArgumentException unused) {
            return charset;
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof a0) && Intrinsics.b(((a0) obj).f95398a, this.f95398a);
    }

    public final int hashCode() {
        return this.f95398a.hashCode();
    }

    public final String toString() {
        return this.f95398a;
    }
}
