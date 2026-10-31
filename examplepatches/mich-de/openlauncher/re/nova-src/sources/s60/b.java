package s60;

import java.util.HashMap;

/* loaded from: classes4.dex */
public final class b extends HashMap {
    public void a(int i5, String str) {
        put(str, new a(i5));
    }

    public void c(int i5, String str, String str2, String str3) {
        a aVar = new a(i5);
        put(str, aVar);
        put(str2, aVar);
        put(str3, aVar);
    }
}
