package ey;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class h extends n {

    /* renamed from: a, reason: collision with root package name */
    public final e f53157a;

    public h(e eVar) {
        this.f53157a = eVar;
    }

    @Override // ey.n
    public final boolean a() {
        Function0 function0 = this.f53157a.f53152d;
        if (function0 == null) {
            return false;
        }
        function0.invoke();
        return true;
    }
}
