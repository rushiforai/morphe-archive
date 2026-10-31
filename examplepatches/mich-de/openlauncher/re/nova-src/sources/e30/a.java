package e30;

import android.content.DialogInterface;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import mx.l1;

/* loaded from: classes4.dex */
public final class a implements DialogInterface.OnCancelListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52097a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f52098b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f52097a = i5;
        this.f52098b = obj;
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        switch (this.f52097a) {
            case 0:
                ((CropImage) this.f52098b).finish();
                break;
            default:
                ((l1) this.f52098b).f77207d.finish();
                break;
        }
    }
}
