package ads_mobile_sdk;

import b.m3;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h5 implements m3 {

    /* renamed from: a, reason: collision with root package name */
    public final Map f4212a;

    public h5(Map rendererMap) {
        Intrinsics.g(rendererMap, "rendererMap");
        this.f4212a = rendererMap;
    }

    @Override // b.m3
    public final b.b a(String name) {
        Intrinsics.g(name, "name");
        return (b.b) this.f4212a.get(name);
    }
}
