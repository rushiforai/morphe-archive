package g;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56409a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o f56410b;

    public /* synthetic */ d(o oVar, int i5) {
        this.f56409a = i5;
        this.f56410b = oVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f56409a) {
            case 0:
                o this$0 = this.f56410b;
                Intrinsics.g(this$0, "this$0");
                this$0.invalidateMenu();
                return;
            default:
                o this$02 = this.f56410b;
                Intrinsics.g(this$02, "this$0");
                try {
                    super/*android.app.Activity*/.onBackPressed();
                    return;
                } catch (IllegalStateException e3) {
                    if (!Intrinsics.b(e3.getMessage(), "Can not perform this action after onSaveInstanceState")) {
                        throw e3;
                    }
                    return;
                } catch (NullPointerException e11) {
                    if (!Intrinsics.b(e11.getMessage(), "Attempt to invoke virtual method 'android.os.Handler android.app.FragmentHostCallback.getHandler()' on a null object reference")) {
                        throw e11;
                    }
                    return;
                }
        }
    }
}
