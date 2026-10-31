package l30;

import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import com.teslacoilsw.launcher.widget.NumberPicker;

/* loaded from: classes4.dex */
public final class l implements View.OnFocusChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ NumberPicker f74665a;

    public l(NumberPicker numberPicker) {
        this.f74665a = numberPicker;
    }

    @Override // android.view.View.OnFocusChangeListener
    public final void onFocusChange(View view, boolean z11) throws NumberFormatException {
        int i5;
        NumberPicker numberPicker = this.f74665a;
        EditText editText = numberPicker.f46426a;
        if (z11) {
            editText.selectAll();
            return;
        }
        editText.setSelection(0, 0);
        String strValueOf = String.valueOf(((TextView) view).getText());
        if (TextUtils.isEmpty(strValueOf)) {
            numberPicker.s();
            return;
        }
        try {
            i5 = Integer.parseInt(strValueOf.toString());
        } catch (NumberFormatException unused) {
            i5 = numberPicker.f46440j;
        }
        numberPicker.p(i5, true);
    }
}
