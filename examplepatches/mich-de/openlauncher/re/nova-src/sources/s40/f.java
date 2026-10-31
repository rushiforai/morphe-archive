package s40;

import java.util.LinkedHashMap;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f86660a = new LinkedHashMap((int) ((11 / 0.75f) + 1.0f));

    public final void a(Class cls, h hVar) {
        if (hVar == null) {
            throw new NullPointerException("provider");
        }
        this.f86660a.put(cls, hVar);
    }
}
