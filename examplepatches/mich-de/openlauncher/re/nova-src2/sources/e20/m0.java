package e20;

import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import p1.m1;
import p1.v0;
import p1.w0;

/* loaded from: classes.dex */
public final class m0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52053a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f52054b;

    public /* synthetic */ m0(Object obj, int i5) {
        this.f52053a = i5;
        this.f52054b = obj;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f52053a) {
            case 0:
                return new f0[((w70.m[]) this.f52054b).length];
            default:
                ArrayList arrayList = ((m1) this.f52054b).f81507a;
                z.o0 o0Var = new z.o0(arrayList.size());
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    w0 w0Var = (w0) arrayList.get(i5);
                    Object obj = w0Var.f81610b;
                    int i11 = w0Var.f81609a;
                    r1.a.a(o0Var, obj != null ? new v0(Integer.valueOf(i11), w0Var.f81610b) : Integer.valueOf(i11), w0Var);
                }
                return new r1.a(o0Var);
        }
    }
}
