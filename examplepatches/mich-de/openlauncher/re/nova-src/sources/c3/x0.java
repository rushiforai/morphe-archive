package c3;

import android.content.ComponentCallbacks2;
import android.content.Context;

/* loaded from: classes.dex */
public final class x0 implements p1.k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19464a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f19465b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ComponentCallbacks2 f19466c;

    public /* synthetic */ x0(Context context, ComponentCallbacks2 componentCallbacks2, int i5) {
        this.f19464a = i5;
        this.f19465b = context;
        this.f19466c = componentCallbacks2;
    }

    @Override // p1.k0
    public final void dispose() {
        switch (this.f19464a) {
            case 0:
                this.f19465b.getApplicationContext().unregisterComponentCallbacks((y0) this.f19466c);
                break;
            default:
                this.f19465b.getApplicationContext().unregisterComponentCallbacks((z0) this.f19466c);
                break;
        }
    }
}
