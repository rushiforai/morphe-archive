package x1;

import java.util.Set;
import p1.a2;
import p1.z1;

/* loaded from: classes2.dex */
public final class h implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final Set f94957a;

    /* renamed from: b, reason: collision with root package name */
    public final r1.e f94958b = new r1.e(new a2[16]);

    public h(Set set) {
        this.f94957a = set;
    }

    @Override // p1.z1
    public final void a() {
        r1.e eVar = this.f94958b;
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            z1 z1Var = ((a2) objArr[i11]).f81381a;
            this.f94957a.remove(z1Var);
            z1Var.a();
        }
    }

    public final r1.e b() {
        return this.f94958b;
    }

    @Override // p1.z1
    public final void g() {
    }

    @Override // p1.z1
    public final void i() {
    }
}
