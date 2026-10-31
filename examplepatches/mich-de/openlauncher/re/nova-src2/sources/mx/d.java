package mx;

import android.content.ComponentName;
import android.view.View;
import com.teslacoilsw.launcher.BulkAddAppActivity;

/* loaded from: classes4.dex */
public final class d implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77047a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BulkAddAppActivity f77048b;

    public /* synthetic */ d(BulkAddAppActivity bulkAddAppActivity, int i5) {
        this.f77047a = i5;
        this.f77048b = bulkAddAppActivity;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i5 = this.f77047a;
        BulkAddAppActivity bulkAddAppActivity = this.f77048b;
        switch (i5) {
            case 0:
                ComponentName componentName = BulkAddAppActivity.f45579v;
                bulkAddAppActivity.Z(false);
                break;
            case 1:
                ComponentName componentName2 = BulkAddAppActivity.f45579v;
                bulkAddAppActivity.Z(false);
                break;
            default:
                ComponentName componentName3 = BulkAddAppActivity.f45579v;
                bulkAddAppActivity.Z(true);
                break;
        }
    }
}
