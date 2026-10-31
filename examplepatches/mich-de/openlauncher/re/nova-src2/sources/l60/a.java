package l60;

import android.text.Spanned;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f74747a;

    /* renamed from: b, reason: collision with root package name */
    public final Spanned f74748b;

    public a(int i5, Spanned spanned) {
        this.f74747a = i5;
        this.f74748b = spanned;
    }

    public final String toString() {
        return "Column{alignment=" + fq.c.z(this.f74747a) + ", content=" + ((Object) this.f74748b) + AbstractJsonLexerKt.END_OBJ;
    }
}
