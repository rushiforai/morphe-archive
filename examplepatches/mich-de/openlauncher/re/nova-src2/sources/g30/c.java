package g30;

import java.util.Objects;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final int f57027a;

    /* renamed from: b, reason: collision with root package name */
    public final int f57028b;

    /* renamed from: c, reason: collision with root package name */
    public final int f57029c;

    /* renamed from: d, reason: collision with root package name */
    public final int f57030d;

    public c(int i5, int i11, int i12, int i13) {
        this.f57027a = i5;
        this.f57028b = i11;
        this.f57029c = i12;
        this.f57030d = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && c.class == obj.getClass()) {
            c cVar = (c) obj;
            if (this.f57027a == cVar.f57027a && this.f57028b == cVar.f57028b && this.f57029c == cVar.f57029c && this.f57030d == cVar.f57030d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(Integer.valueOf(this.f57027a), Integer.valueOf(this.f57028b), Integer.valueOf(this.f57029c), Integer.valueOf(this.f57030d));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WallpaperColorsCompat{ #");
        sb2.append(Integer.toHexString(this.f57027a));
        sb2.append(", #");
        sb2.append(Integer.toHexString(this.f57028b));
        sb2.append(", #");
        sb2.append(Integer.toHexString(this.f57029c));
        sb2.append(", hints=");
        return a2.c.m(sb2, this.f57030d, AbstractJsonLexerKt.END_OBJ);
    }
}
