package uy;

import android.content.ComponentName;
import android.os.Process;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements ya.v {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f91715b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f91716c;

    public /* synthetic */ i(Object obj, int i5) {
        this.f91715b = i5;
        this.f91716c = obj;
    }

    @Override // ya.v
    public final boolean b(ga.e eVar, ComponentName componentName) {
        switch (this.f91715b) {
            case 0:
                return ((s) this.f91716c).f91757i.b(eVar.i(), eVar.o);
            default:
                return eVar.o.equals(Process.myUserHandle()) || ((ja.h) this.f91716c).h(eVar.o);
        }
    }
}
