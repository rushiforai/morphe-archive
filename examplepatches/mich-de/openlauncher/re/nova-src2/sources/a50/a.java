package a50;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {
    public static b a(String str) {
        for (b bVar : b.values()) {
            if (Intrinsics.b(bVar.name(), str)) {
                return bVar;
            }
        }
        return null;
    }
}
