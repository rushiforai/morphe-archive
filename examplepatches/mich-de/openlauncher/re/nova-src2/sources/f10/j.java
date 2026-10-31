package f10;

import android.widget.EditText;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSeekBarView;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54192a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ EditText f54193b;

    public /* synthetic */ j(EditText editText, int i5) {
        this.f54192a = i5;
        this.f54193b = editText;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f54192a;
        EditText editText = this.f54193b;
        switch (i5) {
            case 0:
                int i11 = FancyPrefSeekBarView.T;
                editText.requestFocus();
                editText.selectAll();
                lx.d.g(editText);
                break;
            default:
                editText.requestFocus();
                editText.selectAll();
                lx.d.g(editText);
                break;
        }
    }
}
