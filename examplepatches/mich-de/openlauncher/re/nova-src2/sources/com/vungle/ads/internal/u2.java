package com.vungle.ads.internal;

import com.vungle.ads.InitializationListener;
import java.util.Iterator;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class u2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v2 f47558a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u2(v2 v2Var) {
        super(0);
        this.f47558a = v2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Iterator it = this.f47558a.f47726c.iterator();
        while (it.hasNext()) {
            ((InitializationListener) it.next()).onSuccess();
        }
        this.f47558a.f47726c.clear();
        return Unit.f71706a;
    }
}
