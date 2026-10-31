package o9;

import android.view.View;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final View f80092a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80093b;

    /* renamed from: c, reason: collision with root package name */
    public final int f80094c;

    /* renamed from: d, reason: collision with root package name */
    public final n30.a f80095d;

    /* renamed from: e, reason: collision with root package name */
    public final n30.a f80096e;

    /* renamed from: f, reason: collision with root package name */
    public final n30.b f80097f;

    /* renamed from: g, reason: collision with root package name */
    public final n30.b f80098g;

    public s(View view, ga.e eVar) {
        this.f80095d = eVar.f57293e;
        this.f80096e = eVar.f57294f;
        this.f80097f = eVar.f57295g;
        this.f80098g = eVar.f57296h;
        this.f80092a = view;
        this.f80093b = eVar.f57292d;
        this.f80094c = eVar.f57291c;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Cell[view=");
        View view = this.f80092a;
        sb2.append(view == null ? AbstractJsonLexerKt.NULL : view.getClass());
        sb2.append(", x=");
        sb2.append(this.f80095d);
        sb2.append(", y=");
        sb2.append(this.f80096e);
        sb2.append("]");
        return sb2.toString();
    }
}
