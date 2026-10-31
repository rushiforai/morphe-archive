package aq;

import com.instabridge.ai.proactive.AiInsightScoreAdapter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Set;

/* loaded from: classes4.dex */
public final class b extends d {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f15411h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(Type type, Set set, AiInsightScoreAdapter aiInsightScoreAdapter, Method method, int i5, int i11, boolean z11, int i12) {
        super(type, set, aiInsightScoreAdapter, method, i5, i11, z11);
        this.f15411h = i12;
    }

    @Override // aq.d
    public Object b(u uVar) {
        switch (this.f15411h) {
            case 1:
                return c(uVar);
            default:
                return super.b(uVar);
        }
    }

    @Override // aq.d
    public void d(x xVar, Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        switch (this.f15411h) {
            case 0:
                r[] rVarArr = this.f15437f;
                Object[] objArr = new Object[rVarArr.length + 2];
                objArr[0] = xVar;
                objArr[1] = obj;
                System.arraycopy(rVarArr, 0, objArr, 2, rVarArr.length);
                try {
                    this.f15435d.invoke(this.f15434c, objArr);
                    return;
                } catch (IllegalAccessException unused) {
                    throw new AssertionError();
                }
            default:
                super.d(xVar, obj);
                return;
        }
    }
}
