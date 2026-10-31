package mi;

import android.os.Bundle;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import ni.i0;
import ni.k;

/* loaded from: classes.dex */
public final class g extends k implements h {

    /* renamed from: j, reason: collision with root package name */
    public final a f76419j;

    /* renamed from: k, reason: collision with root package name */
    public final List f76420k;

    /* renamed from: l, reason: collision with root package name */
    public final i0 f76421l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f76422m;

    public g(String str, Set set, String str2, Map map, Bundle bundle, Set set2, Set set3, LinkedHashMap linkedHashMap, String str3, a aVar, List list, i0 i0Var, boolean z11) {
        super(str, set, str2, map, bundle, set2, set3, linkedHashMap, str3);
        this.f76419j = aVar;
        this.f76420k = list;
        this.f76421l = i0Var;
        this.f76422m = z11;
    }

    @Override // mi.h
    public final i0 c() {
        return this.f76421l;
    }

    @Override // mi.h
    public final boolean g() {
        return this.f76422m;
    }

    @Override // mi.h
    public final List h() {
        return this.f76420k;
    }

    @Override // mi.h
    public final a k() {
        return this.f76419j;
    }
}
