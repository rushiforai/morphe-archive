package c30;

import android.graphics.Color;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f19536a;

    /* renamed from: b, reason: collision with root package name */
    public final int f19537b;

    /* renamed from: c, reason: collision with root package name */
    public final int f19538c;

    /* renamed from: d, reason: collision with root package name */
    public final int f19539d;

    /* renamed from: e, reason: collision with root package name */
    public final int f19540e;

    /* renamed from: f, reason: collision with root package name */
    public float[] f19541f;

    public e(int i5, int i11) {
        this.f19536a = Color.red(i5);
        this.f19537b = Color.green(i5);
        this.f19538c = Color.blue(i5);
        this.f19539d = i5;
        this.f19540e = i11;
    }

    public final float[] a() {
        if (this.f19541f == null) {
            float[] fArr = new float[3];
            this.f19541f = fArr;
            r4.a.c(this.f19536a, this.f19537b, this.f19538c, fArr);
        }
        return this.f19541f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && e.class == obj.getClass()) {
            e eVar = (e) obj;
            if (this.f19540e == eVar.f19540e && this.f19539d == eVar.f19539d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (this.f19539d * 31) + this.f19540e;
    }

    public final String toString() {
        return e.class.getSimpleName() + " [RGB: #" + Integer.toHexString(this.f19539d) + "] [HSL: " + Arrays.toString(a()) + "] [Population: " + this.f19540e + "] [Title Text: #" + Integer.toHexString(0) + "] [Body Text: #" + Integer.toHexString(0) + AbstractJsonLexerKt.END_LIST;
    }

    public e(int i5, int i11, int i12, int i13) {
        this.f19536a = i5;
        this.f19537b = i11;
        this.f19538c = i12;
        this.f19539d = Color.rgb(i5, i11, i12);
        this.f19540e = i13;
    }
}
