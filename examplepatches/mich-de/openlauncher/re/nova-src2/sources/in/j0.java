package in;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

/* loaded from: classes.dex */
public final class j0 extends com.google.gson.h0 {

    /* renamed from: a, reason: collision with root package name */
    public final Gson f61716a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.gson.h0 f61717b;

    /* renamed from: c, reason: collision with root package name */
    public final Type f61718c;

    public j0(Gson gson, com.google.gson.h0 h0Var, Type type) {
        this.f61716a = gson;
        this.f61717b = h0Var;
        this.f61718c = type;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) {
        return this.f61717b.b(jsonReader);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:25:0x003c  */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.reflect.Type] */
    @Override // com.google.gson.h0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(JsonWriter jsonWriter, Object obj) {
        com.google.gson.h0 h0VarD;
        ?? r02 = this.f61718c;
        Class<?> cls = (obj == null || !((r02 instanceof Class) || (r02 instanceof TypeVariable))) ? r02 : obj.getClass();
        com.google.gson.h0 h0Var = this.f61717b;
        if (cls != r02) {
            com.google.gson.h0 adapter = this.f61716a.getAdapter(new mn.a(cls));
            if (adapter instanceof b0) {
                com.google.gson.h0 h0Var2 = h0Var;
                while ((h0Var2 instanceof g0) && (h0VarD = ((g0) h0Var2).d()) != h0Var2) {
                    h0Var2 = h0VarD;
                }
                if (h0Var2 instanceof b0) {
                }
            } else {
                h0Var = adapter;
            }
        }
        h0Var.c(jsonWriter, obj);
    }
}
