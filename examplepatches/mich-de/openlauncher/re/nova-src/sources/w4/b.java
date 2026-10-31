package w4;

import android.os.Bundle;
import java.io.Serializable;

/* loaded from: classes.dex */
public abstract class b {
    public static Object a(Bundle bundle, String str, Class cls) {
        return bundle.getParcelable(str, cls);
    }

    public static Serializable b(Bundle bundle) {
        return bundle.getSerializable("LinkFailure", Exception.class);
    }
}
