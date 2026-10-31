package e00;

import android.content.Context;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import kotlin.collections.EmptyList;

/* loaded from: classes4.dex */
public final class w3 {

    /* renamed from: a, reason: collision with root package name */
    public final File f51114a;

    /* renamed from: b, reason: collision with root package name */
    public final k30.h0 f51115b;

    /* renamed from: c, reason: collision with root package name */
    public final String f51116c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f51117d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f51118e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f51119f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f51120g;

    /* renamed from: h, reason: collision with root package name */
    public final p1.e1 f51121h;

    public w3(Context context) {
        this.f51114a = new File(context.getFilesDir(), "weather_autocomplete_history");
        k30.h0 h0Var = k30.h0.f70974r;
        this.f51115b = lm.e.p(context);
        a40.a aVar = a40.b.f189a;
        Locale locale = Locale.getDefault();
        aVar.getClass();
        this.f51116c = a40.a.a(locale);
        EmptyList emptyList = EmptyList.f71733a;
        this.f51118e = androidx.compose.runtime.d.k(emptyList);
        this.f51119f = androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f51120g = androidx.compose.runtime.d.k(emptyList);
        e10.y2.f51877a.getClass();
        this.f51121h = androidx.compose.runtime.d.k(e10.y2.C1().l());
    }

    public final void a(k30.c cVar) {
        k30.c.Companion.getClass();
        k30.c cVar2 = k30.c.f70909h;
        if (cVar.equals(cVar2)) {
            e10.y2.f51877a.getClass();
            e10.y2.C1().a();
        } else {
            e10.y2.f51877a.getClass();
            e10.y2.C1().i(cVar);
        }
        ((p1.s2) this.f51121h).setValue(cVar);
        if (!this.f51117d || cVar.equals(cVar2)) {
            return;
        }
        p1.e1 e1Var = this.f51118e;
        ArrayList arrayListK1 = b70.g.K1((List) ((p1.s2) e1Var).getValue());
        arrayListK1.removeIf(new u3(new t3(cVar, 0), 0));
        arrayListK1.add(0, cVar);
        while (arrayListK1.size() > 5) {
            dy.k kVar = lx.d.f75158a;
            arrayListK1.remove(ul.b.K(arrayListK1));
        }
        ((p1.s2) e1Var).setValue(arrayListK1);
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(t70.l1.f88818a, a80.d.f488c, null, new ar.d(this, arrayListK1, null, 20), 2);
    }
}
