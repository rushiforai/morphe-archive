package gx;

import android.app.Activity;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58065a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b0 f58066b;

    public /* synthetic */ f(b0 b0Var, int i5) {
        this.f58065a = i5;
        this.f58066b = b0Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f58065a) {
            case 0:
                return Integer.valueOf(((dx.h) this.f58066b.f58030e.getValue()).f49706b.f49725i);
            case 1:
                return (Activity) this.f58066b.f58040q.invoke();
            case 2:
                return ((dx.h) this.f58066b.f58030e.getValue()).f49706b;
            case 3:
                ((dx.h) this.f58066b.f58030e.getValue()).f49707c.getClass();
                return Boolean.FALSE;
            case 4:
                return Long.valueOf(((dx.h) this.f58066b.f58030e.getValue()).f49706b.f49720d);
            case 5:
                return Boolean.valueOf(this.f58066b.f58041r);
            case 6:
                return Integer.valueOf(((dx.h) this.f58066b.f58030e.getValue()).f49706b.f49726j);
            default:
                return ((dx.h) this.f58066b.f58030e.getValue()).f49706b;
        }
    }
}
