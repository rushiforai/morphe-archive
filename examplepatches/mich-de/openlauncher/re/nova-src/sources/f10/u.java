package f10;

import android.content.DialogInterface;
import android.widget.PopupWindow;

/* loaded from: classes4.dex */
public final class u extends PopupWindow implements DialogInterface {
    @Override // android.content.DialogInterface
    public final void cancel() {
        dismiss();
    }
}
