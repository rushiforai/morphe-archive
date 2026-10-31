package aq;

import com.instabridge.ai.proactive.AiInsightScoreAdapter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Set;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public final Type f15432a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f15433b;

    /* renamed from: c, reason: collision with root package name */
    public final AiInsightScoreAdapter f15434c;

    /* renamed from: d, reason: collision with root package name */
    public final Method f15435d;

    /* renamed from: e, reason: collision with root package name */
    public final int f15436e;

    /* renamed from: f, reason: collision with root package name */
    public final r[] f15437f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f15438g;

    public d(Type type, Set set, AiInsightScoreAdapter aiInsightScoreAdapter, Method method, int i5, int i11, boolean z11) {
        this.f15432a = bq.e.a(type);
        this.f15433b = set;
        this.f15434c = aiInsightScoreAdapter;
        this.f15435d = method;
        this.f15436e = i11;
        this.f15437f = new r[i5 - i11];
        this.f15438g = z11;
    }

    public void a(h0 h0Var, e eVar) {
        r[] rVarArr = this.f15437f;
        if (rVarArr.length > 0) {
            Method method = this.f15435d;
            Type[] genericParameterTypes = method.getGenericParameterTypes();
            Annotation[][] parameterAnnotations = method.getParameterAnnotations();
            int length = genericParameterTypes.length;
            int i5 = this.f15436e;
            for (int i11 = i5; i11 < length; i11++) {
                Type type = ((ParameterizedType) genericParameterTypes[i11]).getActualTypeArguments()[0];
                Set setF = bq.e.f(parameterAnnotations[i11]);
                rVarArr[i11 - i5] = (m0.b(this.f15432a, type) && this.f15433b.equals(setF)) ? h0Var.c(eVar, type, setF) : h0Var.b(type, setF, null);
            }
        }
    }

    public Object b(u uVar) {
        throw new AssertionError();
    }

    public final Object c(Object obj) {
        r[] rVarArr = this.f15437f;
        Object[] objArr = new Object[rVarArr.length + 1];
        objArr[0] = obj;
        System.arraycopy(rVarArr, 0, objArr, 1, rVarArr.length);
        try {
            return this.f15435d.invoke(this.f15434c, objArr);
        } catch (IllegalAccessException unused) {
            throw new AssertionError();
        }
    }

    public void d(x xVar, Object obj) {
        throw new AssertionError();
    }
}
