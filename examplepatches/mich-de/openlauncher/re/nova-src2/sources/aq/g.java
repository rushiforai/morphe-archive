package aq;

import com.squareup.moshi.JsonDataException;
import java.lang.reflect.Array;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class g extends r {

    /* renamed from: d, reason: collision with root package name */
    public static final f f15457d = new f(0);

    /* renamed from: e, reason: collision with root package name */
    public static final f f15458e = new f(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15459a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final r f15460b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f15461c;

    public g(h0 h0Var, Type type, Type type2) {
        Set set = bq.e.f18422a;
        this.f15460b = h0Var.b(type, set, null);
        this.f15461c = h0Var.b(type2, set, null);
    }

    @Override // aq.r
    public final Object a(u uVar) throws ArrayIndexOutOfBoundsException, IllegalArgumentException, NegativeArraySizeException {
        switch (this.f15459a) {
            case 0:
                ArrayList arrayList = new ArrayList();
                uVar.a();
                while (uVar.f()) {
                    arrayList.add(this.f15460b.a(uVar));
                }
                uVar.c();
                Object objNewInstance = Array.newInstance((Class<?>) this.f15461c, arrayList.size());
                for (int i5 = 0; i5 < arrayList.size(); i5++) {
                    Array.set(objNewInstance, i5, arrayList.get(i5));
                }
                return objNewInstance;
            default:
                d0 d0Var = new d0();
                uVar.b();
                while (uVar.f()) {
                    v vVar = (v) uVar;
                    if (vVar.f()) {
                        vVar.f15524j = vVar.f0();
                        vVar.f15521g = 11;
                    }
                    Object objA = this.f15460b.a(uVar);
                    Object objA2 = ((r) this.f15461c).a(uVar);
                    Object objPut = d0Var.put(objA, objA2);
                    if (objPut != null) {
                        throw new JsonDataException("Map key '" + objA + "' has multiple values at path " + uVar.e() + ": " + objPut + " and " + objA2);
                    }
                }
                uVar.d();
                return d0Var;
        }
    }

    @Override // aq.r
    public final void e(x xVar, Object obj) {
        switch (this.f15459a) {
            case 0:
                xVar.a();
                int length = Array.getLength(obj);
                for (int i5 = 0; i5 < length; i5++) {
                    this.f15460b.e(xVar, Array.get(obj, i5));
                }
                ((w) xVar).s(1, 2, AbstractJsonLexerKt.END_LIST);
                return;
            default:
                xVar.b();
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    if (entry.getKey() == null) {
                        throw new JsonDataException("Map key is null at " + xVar.c());
                    }
                    int iF = xVar.f();
                    if (iF != 5 && iF != 3) {
                        throw new IllegalStateException("Nesting problem.");
                    }
                    xVar.f15534f = true;
                    this.f15460b.e(xVar, entry.getKey());
                    ((r) this.f15461c).e(xVar, entry.getValue());
                }
                w wVar = (w) xVar;
                wVar.f15534f = false;
                wVar.s(3, 5, AbstractJsonLexerKt.END_OBJ);
                return;
        }
    }

    public final String toString() {
        switch (this.f15459a) {
            case 0:
                return this.f15460b + ".array()";
            default:
                return "JsonAdapter(" + this.f15460b + "=" + ((r) this.f15461c) + ")";
        }
    }

    public g(Class cls, r rVar) {
        this.f15461c = cls;
        this.f15460b = rVar;
    }
}
