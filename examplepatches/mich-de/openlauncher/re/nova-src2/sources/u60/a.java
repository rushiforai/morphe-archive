package u60;

import java.util.List;
import t5.d0;

/* loaded from: classes4.dex */
public final class a implements e {

    /* renamed from: a, reason: collision with root package name */
    public final String f90644a;

    /* renamed from: b, reason: collision with root package name */
    public final List f90645b;

    public a(String str, List list) {
        this.f90644a = str;
        this.f90645b = list;
    }

    @Override // u60.e
    public final String name() {
        return this.f90644a;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        p6.j.B(sb2, new d0(9), this);
        return sb2.toString();
    }

    @Override // u60.e
    public final List tokens() {
        return this.f90645b;
    }
}
