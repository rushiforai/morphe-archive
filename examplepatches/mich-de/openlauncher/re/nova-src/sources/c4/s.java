package c4;

import android.window.OnBackInvokedCallback;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class s implements OnBackInvokedCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19628a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f19629b;

    public /* synthetic */ s(Function0 function0, int i5) {
        this.f19628a = i5;
        this.f19629b = function0;
    }

    public final void onBackInvoked() {
        switch (this.f19628a) {
            case 0:
                Function0 function0 = this.f19629b;
                if (function0 != null) {
                    function0.invoke();
                    break;
                }
                break;
            case 1:
                Function0 onBackInvoked = this.f19629b;
                Intrinsics.g(onBackInvoked, "$onBackInvoked");
                onBackInvoked.invoke();
                break;
            default:
                this.f19629b.invoke();
                break;
        }
    }
}
