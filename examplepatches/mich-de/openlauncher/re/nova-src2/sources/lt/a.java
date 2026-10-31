package lt;

import b70.g;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final LinkedHashMap f75094a = new LinkedHashMap();

    public static void a(String key) {
        Intrinsics.g(key, "key");
        LinkedHashMap linkedHashMap = f75094a;
        if (linkedHashMap.get(key) != null) {
            throw new ClassCastException();
        }
        if (g.X0(linkedHashMap.values()) != null) {
            throw new ClassCastException();
        }
    }
}
