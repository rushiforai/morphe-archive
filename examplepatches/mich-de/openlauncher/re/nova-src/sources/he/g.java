package he;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: e, reason: collision with root package name */
    public static final g f59715e = new g(-1, -1, -1);

    /* renamed from: a, reason: collision with root package name */
    public final int f59716a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59717b;

    /* renamed from: c, reason: collision with root package name */
    public final int f59718c;

    /* renamed from: d, reason: collision with root package name */
    public final int f59719d;

    public g(int i5, int i11, int i12) {
        this.f59716a = i5;
        this.f59717b = i11;
        this.f59718c = i12;
        this.f59719d = wf.v.w(i12) ? wf.v.p(i12, i11) : -1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f59716a == gVar.f59716a && this.f59717b == gVar.f59717b && this.f59718c == gVar.f59718c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f59716a), Integer.valueOf(this.f59717b), Integer.valueOf(this.f59718c)});
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AudioFormat[sampleRate=");
        sb2.append(this.f59716a);
        sb2.append(", channelCount=");
        sb2.append(this.f59717b);
        sb2.append(", encoding=");
        return a2.c.m(sb2, this.f59718c, AbstractJsonLexerKt.END_LIST);
    }
}
