package aa;

import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.UserHandle;

/* loaded from: classes.dex */
public interface j {
    CharSequence a(PackageManager packageManager);

    Drawable b(fz.d0 d0Var);

    ComponentName d();

    UserHandle getUser();
}
