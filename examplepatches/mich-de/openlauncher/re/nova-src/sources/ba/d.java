package ba;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;

/* loaded from: classes.dex */
public interface d {
    CharSequence d(Object obj);

    BitmapInfo e(Context context, Object obj);

    default CharSequence f(Object obj, CharSequence charSequence) {
        return charSequence;
    }

    UserHandle i(Object obj);

    default long k(Object obj, PackageInfo packageInfo) {
        return packageInfo.lastUpdateTime;
    }

    default boolean l() {
        return true;
    }

    ComponentName m(Object obj);
}
