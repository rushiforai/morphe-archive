package m00;

import b.c9;
import com.teslacoilsw.launcher.search.hero.AppWidgetContent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t extends m {

    /* renamed from: a, reason: collision with root package name */
    public final y20.g f75638a;

    /* renamed from: b, reason: collision with root package name */
    public final y20.d f75639b;

    /* renamed from: c, reason: collision with root package name */
    public final String f75640c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f75641d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f75642e;

    /* renamed from: f, reason: collision with root package name */
    public final com.teslacoilsw.launcher.search.hero.c f75643f;

    public t(y20.g gVar, y20.d dVar, String str, boolean z11, boolean z12, com.teslacoilsw.launcher.search.hero.c cVar) {
        this.f75638a = gVar;
        this.f75639b = dVar;
        this.f75640c = str;
        this.f75641d = z11;
        this.f75642e = z12;
        this.f75643f = cVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v2, types: [com.teslacoilsw.launcher.search.hero.c] */
    public static t a(t tVar, y20.g gVar, boolean z11, boolean z12, AppWidgetContent appWidgetContent, int i5) {
        if ((i5 & 1) != 0) {
            gVar = tVar.f75638a;
        }
        y20.g gVar2 = gVar;
        y20.d dVar = tVar.f75639b;
        String str = tVar.f75640c;
        if ((i5 & 8) != 0) {
            z11 = tVar.f75641d;
        }
        boolean z13 = z11;
        if ((i5 & 16) != 0) {
            z12 = tVar.f75642e;
        }
        boolean z14 = z12;
        AppWidgetContent appWidgetContent2 = appWidgetContent;
        if ((i5 & 32) != 0) {
            appWidgetContent2 = tVar.f75643f;
        }
        tVar.getClass();
        return new t(gVar2, dVar, str, z13, z14, appWidgetContent2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f75638a, tVar.f75638a) && Intrinsics.b(this.f75639b, tVar.f75639b) && Intrinsics.b(this.f75640c, tVar.f75640c) && this.f75641d == tVar.f75641d && this.f75642e == tVar.f75642e && Intrinsics.b(this.f75643f, tVar.f75643f);
    }

    public final int hashCode() {
        int iHashCode = (this.f75639b.hashCode() + (this.f75638a.hashCode() * 31)) * 31;
        String str = this.f75640c;
        return this.f75643f.hashCode() + c9.f(c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f75641d), 31, this.f75642e);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ItemPickerUiData(label=");
        sb2.append(this.f75638a);
        sb2.append(", icon=");
        sb2.append(this.f75639b);
        sb2.append(", summary=");
        a80.m.q(this.f75640c, ", isSelected=", ", isEnabled=", sb2, this.f75641d);
        sb2.append(this.f75642e);
        sb2.append(", cardContent=");
        sb2.append(this.f75643f);
        sb2.append(")");
        return sb2.toString();
    }

    public /* synthetic */ t(y20.e eVar, y20.d dVar, String str, boolean z11, com.teslacoilsw.launcher.search.hero.c cVar, int i5) {
        this((y20.g) eVar, dVar, (i5 & 4) != 0 ? null : str, false, (i5 & 16) != 0 ? true : z11, cVar);
    }
}
