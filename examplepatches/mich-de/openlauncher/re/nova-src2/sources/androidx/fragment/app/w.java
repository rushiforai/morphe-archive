package androidx.fragment.app;

import e10.k4;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final /* synthetic */ class w implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14703a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14704b;

    public /* synthetic */ w(Object obj, int i5) {
        this.f14703a = i5;
        this.f14704b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f14703a) {
            case 0:
                h0 h0Var = (h0) this.f14704b;
                y1 y1Var = h0Var.mViewLifecycleOwner;
                y1Var.f14723f.a(h0Var.mSavedViewRegistryState);
                h0Var.mSavedViewRegistryState = null;
                break;
            case 1:
                r1.a((ArrayList) this.f14704b, 4);
                break;
            default:
                Iterator it = ((h1) this.f14704b).n.iterator();
                while (it.hasNext()) {
                    ((k4) it.next()).getClass();
                }
                break;
        }
    }
}
