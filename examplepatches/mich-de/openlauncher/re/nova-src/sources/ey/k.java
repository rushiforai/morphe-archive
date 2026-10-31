package ey;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class k extends n {

    /* renamed from: a, reason: collision with root package name */
    public final u f53161a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f53162b;

    /* renamed from: c, reason: collision with root package name */
    public final String f53163c;

    public k(u uVar, boolean z11, String str) {
        this.f53161a = uVar;
        this.f53162b = z11;
        this.f53163c = str;
    }

    @Override // ey.n
    public final boolean a() {
        Function0 function0A = this.f53161a.a();
        if (function0A == null) {
            return false;
        }
        function0A.invoke();
        return true;
    }

    public /* synthetic */ k(u uVar, int i5) {
        this(uVar, (i5 & 2) == 0, null);
    }
}
