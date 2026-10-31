package z20;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class a implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public int[] f98184a;

    /* renamed from: b, reason: collision with root package name */
    public float[] f98185b;

    /* renamed from: c, reason: collision with root package name */
    public int f98186c;

    public final Object clone() {
        try {
            a aVar = (a) super.clone();
            try {
                aVar.f98184a = (int[]) this.f98184a.clone();
                aVar.f98185b = (float[]) this.f98185b.clone();
                return aVar;
            } catch (CloneNotSupportedException unused) {
                return aVar;
            }
        } catch (CloneNotSupportedException unused2) {
            return null;
        }
    }

    public final String toString() {
        int i5 = this.f98186c;
        if (i5 <= 0) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder(i5 * 28);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        for (int i11 = 0; i11 < this.f98186c; i11++) {
            if (i11 > 0) {
                sb2.append(", ");
            }
            sb2.append(this.f98184a[i11]);
            sb2.append('=');
            sb2.append(this.f98185b[i11]);
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }
}
