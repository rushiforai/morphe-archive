package ni;

import io.branch.search.internal.J6;
import io.branch.search.internal.K6;
import java.lang.reflect.Type;

/* loaded from: classes3.dex */
public final /* synthetic */ class t implements com.google.gson.u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78325a;

    public /* synthetic */ t(int i5) {
        this.f78325a = i5;
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type type, com.google.gson.t tVar) {
        switch (this.f78325a) {
            case 0:
                u uVar = (u) obj;
                return new com.google.gson.s(uVar.name() + " (" + uVar.f78337a + ")");
            case 1:
                return K6.a((J6.e) obj, type, tVar);
            case 2:
                return K6.a((J6.b) obj, type, tVar);
            case 3:
                return K6.a((J6.d) obj, type, tVar);
            case 4:
                return K6.a((J6.a) obj, type, tVar);
            default:
                return K6.a((J6.c) obj, type, tVar);
        }
    }
}
