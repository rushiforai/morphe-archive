package bp;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final Map f18398a;

    static {
        HashMap map = new HashMap();
        map.put(i.f18395b, new HashSet(Arrays.asList(e.SIGN, e.VERIFY)));
        map.put(i.f18396c, new HashSet(Arrays.asList(e.ENCRYPT, e.DECRYPT, e.WRAP_KEY, e.UNWRAP_KEY)));
        f18398a = Collections.unmodifiableMap(map);
    }
}
