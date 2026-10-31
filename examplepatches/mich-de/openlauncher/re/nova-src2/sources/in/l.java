package in;

import com.google.gson.Gson;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class l implements com.google.gson.i0 {

    /* renamed from: c, reason: collision with root package name */
    public static final k f61719c = new k(0);

    /* renamed from: d, reason: collision with root package name */
    public static final k f61720d = new k(0);

    /* renamed from: a, reason: collision with root package name */
    public final hn.c f61721a;

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f61722b = new ConcurrentHashMap();

    public l(hn.c cVar) {
        this.f61721a = cVar;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        gn.b bVar = (gn.b) aVar.f76504a.getAnnotation(gn.b.class);
        if (bVar == null) {
            return null;
        }
        return b(this.f61721a, gson, aVar, bVar, true);
    }

    public final com.google.gson.h0 b(hn.c cVar, Gson gson, mn.a aVar, gn.b bVar, boolean z11) {
        com.google.gson.h0 h0VarA;
        Object objA = cVar.b(new mn.a(bVar.value()), true).a();
        boolean zNullSafe = bVar.nullSafe();
        if (objA instanceof com.google.gson.h0) {
            h0VarA = (com.google.gson.h0) objA;
        } else if (objA instanceof com.google.gson.i0) {
            com.google.gson.i0 i0Var = (com.google.gson.i0) objA;
            if (z11) {
                com.google.gson.i0 i0Var2 = (com.google.gson.i0) this.f61722b.putIfAbsent(aVar.f76504a, i0Var);
                if (i0Var2 != null) {
                    i0Var = i0Var2;
                }
            }
            h0VarA = i0Var.a(gson, aVar);
        } else {
            boolean z12 = objA instanceof com.google.gson.u;
            if (!z12 && !(objA instanceof com.google.gson.o)) {
                throw new IllegalArgumentException("Invalid attempt to bind an instance of " + objA.getClass().getName() + " as a @JsonAdapter for " + hn.h.l(aVar.f76505b) + ". @JsonAdapter value must be a TypeAdapter, TypeAdapterFactory, JsonSerializer or JsonDeserializer.");
            }
            i0 i0Var3 = new i0(z12 ? (com.google.gson.u) objA : null, objA instanceof com.google.gson.o ? (com.google.gson.o) objA : null, gson, aVar, z11 ? f61719c : f61720d, zNullSafe);
            zNullSafe = false;
            h0VarA = i0Var3;
        }
        return (h0VarA == null || !zNullSafe) ? h0VarA : h0VarA.a();
    }
}
