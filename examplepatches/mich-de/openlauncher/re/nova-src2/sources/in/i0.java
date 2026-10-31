package in;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class i0 extends g0 {

    /* renamed from: a, reason: collision with root package name */
    public final com.google.gson.u f61704a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.gson.o f61705b;

    /* renamed from: c, reason: collision with root package name */
    public final Gson f61706c;

    /* renamed from: d, reason: collision with root package name */
    public final mn.a f61707d;

    /* renamed from: e, reason: collision with root package name */
    public final com.google.gson.i0 f61708e;

    /* renamed from: f, reason: collision with root package name */
    public final gu.j f61709f = new gu.j(this, 18);

    /* renamed from: g, reason: collision with root package name */
    public final boolean f61710g;

    /* renamed from: h, reason: collision with root package name */
    public volatile com.google.gson.h0 f61711h;

    public i0(com.google.gson.u uVar, com.google.gson.o oVar, Gson gson, mn.a aVar, com.google.gson.i0 i0Var, boolean z11) {
        this.f61704a = uVar;
        this.f61705b = oVar;
        this.f61706c = gson;
        this.f61707d = aVar;
        this.f61708e = i0Var;
        this.f61710g = z11;
    }

    public static h0 e(mn.a aVar, Object obj) {
        return new h0(obj, aVar, aVar.f76505b == aVar.f76504a, null);
    }

    public static h0 f(Class cls, Object obj) {
        return new h0(obj, null, false, cls);
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) {
        com.google.gson.o oVar = this.f61705b;
        if (oVar == null) {
            com.google.gson.h0 delegateAdapter = this.f61711h;
            if (delegateAdapter == null) {
                delegateAdapter = this.f61706c.getDelegateAdapter(this.f61708e, this.f61707d);
                this.f61711h = delegateAdapter;
            }
            return delegateAdapter.b(jsonReader);
        }
        com.google.gson.p pVarI = hn.h.i(jsonReader);
        if (this.f61710g) {
            pVarI.getClass();
            if (pVarI instanceof com.google.gson.q) {
                return null;
            }
        }
        return oVar.deserialize(pVarI, this.f61707d.f76505b, this.f61709f);
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        com.google.gson.u uVar = this.f61704a;
        if (uVar == null) {
            com.google.gson.h0 delegateAdapter = this.f61711h;
            if (delegateAdapter == null) {
                delegateAdapter = this.f61706c.getDelegateAdapter(this.f61708e, this.f61707d);
                this.f61711h = delegateAdapter;
            }
            delegateAdapter.c(jsonWriter, obj);
            return;
        }
        if (this.f61710g && obj == null) {
            jsonWriter.nullValue();
            return;
        }
        com.google.gson.p pVarSerialize = uVar.serialize(obj, this.f61707d.f76505b, this.f61709f);
        n nVar = p1.B;
        nVar.getClass();
        nVar.c(pVarSerialize, jsonWriter);
    }

    @Override // in.g0
    public final com.google.gson.h0 d() {
        if (this.f61704a != null) {
            return this;
        }
        com.google.gson.h0 h0Var = this.f61711h;
        if (h0Var != null) {
            return h0Var;
        }
        com.google.gson.h0 delegateAdapter = this.f61706c.getDelegateAdapter(this.f61708e, this.f61707d);
        this.f61711h = delegateAdapter;
        return delegateAdapter;
    }
}
