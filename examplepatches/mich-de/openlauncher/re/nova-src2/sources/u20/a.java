package u20;

import android.view.View;
import com.teslacoilsw.launcher.theme.AbstractThumbnailPicker;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes4.dex */
public final class a implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90457a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AbstractThumbnailPicker f90458b;

    public /* synthetic */ a(AbstractThumbnailPicker abstractThumbnailPicker, int i5) {
        this.f90457a = i5;
        this.f90458b = abstractThumbnailPicker;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f90457a) {
            case 0:
                this.f90458b.getActivity().onBackPressed();
                break;
            default:
                AbstractThumbnailPicker abstractThumbnailPicker = this.f90458b;
                try {
                    abstractThumbnailPicker.startActivityForResult(abstractThumbnailPicker.f46291f, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
                    break;
                } catch (Exception unused) {
                    return;
                }
        }
    }
}
