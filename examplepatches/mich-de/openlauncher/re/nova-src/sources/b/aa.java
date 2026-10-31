package b;

import ads_mobile_sdk.rf0;
import android.content.DialogInterface;

/* loaded from: classes2.dex */
public final /* synthetic */ class aa implements DialogInterface.OnCancelListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15781a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15782b;

    public /* synthetic */ aa(Object obj, int i5) {
        this.f15781a = i5;
        this.f15782b = obj;
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        switch (this.f15781a) {
            case 0:
                rf0.b((rf0) this.f15782b);
                break;
            default:
                ((zp.d) this.f15782b).dismiss();
                break;
        }
    }
}
