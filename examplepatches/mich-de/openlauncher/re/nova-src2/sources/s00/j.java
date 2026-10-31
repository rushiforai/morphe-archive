package s00;

import e10.a3;
import e10.s2;
import kotlin.Unit;
import kotlin.jvm.functions.Function6;
import p1.o;

/* loaded from: classes4.dex */
public final class j implements Function6 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86557a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s2 f86558b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f86559c;

    public j(int i5, s2 s2Var, boolean z11) {
        this.f86557a = i5;
        this.f86558b = s2Var;
        this.f86559c = z11;
    }

    @Override // kotlin.jvm.functions.Function6
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        String str = (String) obj;
        ((Number) obj4).intValue();
        o oVar = (o) obj5;
        int iIntValue = ((Number) obj6).intValue();
        boolean z11 = false;
        if (!this.f86559c && !a3.f51435a.f51552h) {
            z11 = true;
        }
        boolean z12 = z11;
        k.b(str, this.f86557a, this.f86558b, z12, null, oVar, iIntValue & 14);
        return Unit.f71706a;
    }
}
