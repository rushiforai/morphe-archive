package a5;

import android.graphics.Insets;
import android.view.DisplayCutout;
import android.view.View;

/* loaded from: classes.dex */
public abstract class m {
    public static Insets a(DisplayCutout displayCutout) {
        return displayCutout.getWaterfallInsets();
    }

    public static void b(View view) {
        view.setImportantForContentCapture(1);
    }
}
