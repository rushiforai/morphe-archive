package b;

import ads_mobile_sdk.rf0;
import android.content.DialogInterface;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class v9 implements DialogInterface.OnDismissListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16013a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ rf0 f16014b;

    public /* synthetic */ v9(rf0 rf0Var, int i5) {
        this.f16013a = i5;
        this.f16014b = rf0Var;
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        switch (this.f16013a) {
            case 0:
                rf0 this$0 = this.f16014b;
                Intrinsics.g(this$0, "this$0");
                this$0.f9161k.set(false);
                break;
            case 1:
                rf0 this$02 = this.f16014b;
                Intrinsics.g(this$02, "this$0");
                this$02.f9161k.set(false);
                break;
            default:
                rf0 this$03 = this.f16014b;
                Intrinsics.g(this$03, "this$0");
                this$03.f9161k.set(false);
                break;
        }
    }
}
