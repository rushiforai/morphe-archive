package z30;

import android.view.KeyEvent;
import android.widget.TextView;
import com.teslacoilsw.tesladirect.DirectLicensingEnterCode;

/* loaded from: classes4.dex */
public final class b implements TextView.OnEditorActionListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ DirectLicensingEnterCode f98194a;

    public b(DirectLicensingEnterCode directLicensingEnterCode) {
        this.f98194a = directLicensingEnterCode;
    }

    @Override // android.widget.TextView.OnEditorActionListener
    public final boolean onEditorAction(TextView textView, int i5, KeyEvent keyEvent) {
        if (i5 != 2) {
            return false;
        }
        this.f98194a.b();
        return true;
    }
}
