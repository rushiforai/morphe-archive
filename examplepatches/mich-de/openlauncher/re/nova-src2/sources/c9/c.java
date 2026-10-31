package c9;

import android.content.Context;
import androidx.lifecycle.DefaultLifecycleObserver;
import h6.a0;
import kotlin.Result;
import kotlin.Unit;

/* loaded from: classes2.dex */
public final class c implements DefaultLifecycleObserver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19858a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19859b;

    public /* synthetic */ c(Object obj, int i5) {
        this.f19858a = i5;
        this.f19859b = obj;
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStart(a0 a0Var) {
        int i5 = this.f19858a;
        Object obj = this.f19859b;
        switch (i5) {
            case 0:
                int i11 = Result.f71687b;
                ((t70.m) obj).resumeWith(Unit.f71706a);
                break;
            default:
                j10.m.r((Context) obj);
                break;
        }
    }
}
