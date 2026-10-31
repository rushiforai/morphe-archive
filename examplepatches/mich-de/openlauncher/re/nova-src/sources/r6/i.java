package r6;

import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import androidx.preference.SeekBarPreference;

/* loaded from: classes2.dex */
public final class i implements View.OnKeyListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ SeekBarPreference f85552a;

    public i(SeekBarPreference seekBarPreference) {
        this.f85552a = seekBarPreference;
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i5, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0) {
            return false;
        }
        if ((this.f85552a.f14814r || (i5 != 21 && i5 != 22)) && i5 != 23 && i5 != 66) {
            Log.e("SeekBarPreference", "SeekBar view is null and hence cannot be adjusted.");
        }
        return false;
    }
}
