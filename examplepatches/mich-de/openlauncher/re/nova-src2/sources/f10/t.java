package f10;

import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import e10.y2;

/* loaded from: classes.dex */
public abstract class t extends m.m {
    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if ((getResources().getConfiguration().uiMode & 48) == 32) {
            getWindow().setBackgroundDrawable(new ColorDrawable(((Number) y2.f51877a.P0().l()).intValue()));
        }
    }
}
