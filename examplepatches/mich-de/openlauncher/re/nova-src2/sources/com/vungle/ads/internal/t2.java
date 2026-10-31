package com.vungle.ads.internal;

import com.vungle.ads.InitializationListener;
import com.vungle.ads.VungleError;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class t2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v2 f47527a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ VungleError f47528b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t2(v2 v2Var, VungleError vungleError) {
        super(0);
        this.f47527a = v2Var;
        this.f47528b = vungleError;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.b("VungleInitializer", "onError");
        CopyOnWriteArrayList copyOnWriteArrayList = this.f47527a.f47726c;
        VungleError vungleError = this.f47528b;
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            ((InitializationListener) it.next()).onError(vungleError);
        }
        this.f47527a.f47726c.clear();
        return Unit.f71706a;
    }
}
