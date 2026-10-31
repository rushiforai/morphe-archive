package aq;

import com.instabridge.ai.proactive.AiInsightScoreAdapter;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Set;

/* loaded from: classes4.dex */
public final class c extends d {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f15417h;

    /* renamed from: i, reason: collision with root package name */
    public r f15418i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Type[] f15419j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Type f15420k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Set f15421l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Set f15422m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(Type type, Set set, AiInsightScoreAdapter aiInsightScoreAdapter, Method method, int i5, boolean z11, Type[] typeArr, Type type2, Set set2, Set set3, int i11) {
        super(type, set, aiInsightScoreAdapter, method, i5, 1, z11);
        this.f15417h = i11;
        this.f15419j = typeArr;
        this.f15420k = type2;
        this.f15421l = set2;
        this.f15422m = set3;
    }

    @Override // aq.d
    public final void a(h0 h0Var, e eVar) {
        switch (this.f15417h) {
            case 0:
                super.a(h0Var, eVar);
                Type type = this.f15419j[0];
                Type type2 = this.f15420k;
                boolean zB = m0.b(type, type2);
                Set set = this.f15422m;
                this.f15418i = (zB && this.f15421l.equals(set)) ? h0Var.c(eVar, type2, set) : h0Var.b(type2, set, null);
                break;
            default:
                super.a(h0Var, eVar);
                Type[] typeArr = this.f15419j;
                boolean zB2 = m0.b(typeArr[0], this.f15420k);
                Set set2 = this.f15421l;
                this.f15418i = (zB2 && set2.equals(this.f15422m)) ? h0Var.c(eVar, typeArr[0], set2) : h0Var.b(typeArr[0], set2, null);
                break;
        }
    }

    @Override // aq.d
    public Object b(u uVar) {
        switch (this.f15417h) {
            case 1:
                return c(this.f15418i.a(uVar));
            default:
                return super.b(uVar);
        }
    }

    @Override // aq.d
    public void d(x xVar, Object obj) {
        switch (this.f15417h) {
            case 0:
                this.f15418i.e(xVar, c(obj));
                break;
            default:
                super.d(xVar, obj);
                break;
        }
    }
}
