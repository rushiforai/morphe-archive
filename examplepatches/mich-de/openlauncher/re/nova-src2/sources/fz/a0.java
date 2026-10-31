package fz;

import android.content.ComponentName;
import android.content.Context;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a0 implements ba.d {
    @Override // ba.d
    public final CharSequence d(Object obj) {
        return ((ga.a) obj).f57300l;
    }

    @Override // ba.d
    public final BitmapInfo e(Context context, Object obj) {
        return ((ga.a) obj).f57304r;
    }

    @Override // ba.d
    public final UserHandle i(Object obj) {
        return ((ga.a) obj).o;
    }

    @Override // ba.d
    public final ComponentName m(Object obj) {
        ComponentName componentNameI = ((ga.a) obj).i();
        Intrinsics.d(componentNameI);
        return componentNameI;
    }
}
