package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jib extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ nib e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jib(nib nibVar, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.b = 0;
        this.e = nibVar;
        this.d = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nib nibVar = this.e;
        boolean z = this.d;
        switch (i) {
            case 0:
                return new jib(nibVar, z, n92Var);
            case 1:
                return new jib(z, nibVar, n92Var, 1);
            default:
                return new jib(z, nibVar, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((jib) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        nib nibVar = this.e;
        boolean z = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                b0f b0fVar = nibVar.I;
                j13 j13Var = new j13(nibVar, z, (n92) null);
                this.c = 1;
                return b0fVar.h(j13Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1 || i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (z) {
                    ResponsesReference responsesReference = nibVar.c;
                    boolean z2 = (responsesReference instanceof ResponsesReference.Post) || (responsesReference instanceof ResponsesReference.HighlightResponses);
                    xpc xpcVar = nibVar.P;
                    ygb ygbVar = new ygb(z2);
                    this.c = 1;
                    xpcVar.a(ygbVar, this);
                    if (c1eVar != tb2Var2) {
                        return c1eVar;
                    }
                } else {
                    this.c = 2;
                    if (nibVar.g(false, this) != tb2Var2) {
                        return c1eVar;
                    }
                }
                return tb2Var2;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1 || i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (z) {
                    xpc xpcVar2 = nibVar.P;
                    zgb zgbVar = new zgb(nibVar.E);
                    this.c = 1;
                    xpcVar2.a(zgbVar, this);
                    if (c1eVar != tb2Var3) {
                        return c1eVar;
                    }
                } else {
                    this.c = 2;
                    if (nibVar.h(false, this) != tb2Var3) {
                        return c1eVar;
                    }
                }
                return tb2Var3;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jib(boolean z, nib nibVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = z;
        this.e = nibVar;
    }
}
