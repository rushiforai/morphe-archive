package b;

import ads_mobile_sdk.rf0;
import ads_mobile_sdk.rw0;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class t9 implements DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15992a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ rf0 f15993b;

    public /* synthetic */ t9(rf0 rf0Var, int i5) {
        this.f15992a = i5;
        this.f15993b = rf0Var;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        switch (this.f15992a) {
            case 0:
                rf0 this$0 = this.f15993b;
                Intrinsics.g(this$0, "this$0");
                this$0.f9161k.set(false);
                return;
            case 1:
                rf0.b$1(this.f15993b);
                return;
            case 2:
                rf0 this$02 = this.f15993b;
                Intrinsics.g(this$02, "this$0");
                rw0 rw0Var = this$02.f9157g;
                Intent intent = new Intent("android.intent.action.VIEW", rf0.f9150q);
                Bundle bundle = new Bundle();
                bundle.putBinder("android.support.customtabs.extra.SESSION", null);
                String str = this$02.f9164p;
                if (str == null) {
                    Intrinsics.m("packageName");
                    throw null;
                }
                bundle.putString("com.android.browser.application_id", str);
                intent.putExtras(bundle);
                rw0Var.a(intent);
                return;
            default:
                rf0 this$03 = this.f15993b;
                Intrinsics.g(this$03, "this$0");
                this$03.f9161k.set(false);
                return;
        }
    }
}
