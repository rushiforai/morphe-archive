package q60;

import android.text.Spanned;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import ba0.r;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class e extends a {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f83759a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final int f83760b = 2131623999;

    /* renamed from: c, reason: collision with root package name */
    public final int f83761c = 2131428999;

    @Override // q60.a
    public final void a(h60.b bVar, b bVar2, r rVar) {
        d dVar = (d) bVar2;
        HashMap map = this.f83759a;
        Spanned spannedB = (Spanned) map.get(rVar);
        if (spannedB == null) {
            spannedB = bVar.b(rVar);
            map.put(rVar, spannedB);
        }
        bVar.c(dVar.f83758b, spannedB);
    }

    @Override // q60.a
    public final void b() {
        this.f83759a.clear();
    }

    @Override // q60.a
    public final b c(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        return new d(this.f83761c, layoutInflater.inflate(this.f83760b, viewGroup, false));
    }
}
