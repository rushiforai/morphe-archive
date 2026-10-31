package ey;

import java.util.List;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class j extends n {

    /* renamed from: a, reason: collision with root package name */
    public final List f53160a;

    public j(List list) {
        this.f53160a = list;
    }

    @Override // ey.n
    public final boolean a() {
        Function0 function0A;
        u uVar = (u) b70.g.Y0(this.f53160a);
        if (uVar == null || (function0A = uVar.a()) == null) {
            return false;
        }
        function0A.invoke();
        return true;
    }
}
