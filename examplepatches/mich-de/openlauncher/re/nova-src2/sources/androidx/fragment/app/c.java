package androidx.fragment.app;

import android.graphics.Rect;
import android.view.View;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14499a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14500b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f14501c;

    public /* synthetic */ c(q qVar, d2 d2Var) {
        this.f14501c = qVar;
        this.f14500b = d2Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f14499a) {
            case 0:
                q this$0 = (q) this.f14501c;
                d2 operation = (d2) this.f14500b;
                Intrinsics.g(this$0, "this$0");
                Intrinsics.g(operation, "$operation");
                this$0.a(operation);
                break;
            case 1:
                d2 operation2 = (d2) this.f14500b;
                n this$02 = (n) this.f14501c;
                Intrinsics.g(operation2, "$operation");
                Intrinsics.g(this$02, "this$0");
                if (h1.K(2)) {
                    operation2.toString();
                }
                operation2.c(this$02);
                break;
            default:
                w1.b((View) this.f14501c, (Rect) this.f14500b);
                break;
        }
    }

    public /* synthetic */ c(w1 w1Var, View view, Rect rect) {
        this.f14501c = view;
        this.f14500b = rect;
    }

    public /* synthetic */ c(d2 d2Var, n nVar) {
        this.f14500b = d2Var;
        this.f14501c = nVar;
    }
}
