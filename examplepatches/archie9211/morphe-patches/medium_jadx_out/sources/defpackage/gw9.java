package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gw9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ PostMetaData e;
    public final /* synthetic */ yd4 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gw9(sw9 sw9Var, PostMetaData postMetaData, yd4 yd4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = postMetaData;
        this.f = yd4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new gw9(this.d, this.e, this.f, n92Var, 0);
            default:
                return new gw9(this.d, this.e, this.f, n92Var, 1);
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
        return ((gw9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        yd4 yd4Var = this.f;
        PostMetaData postMetaData = this.e;
        sw9 sw9Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    Serializable serializableL = sw9Var.l(postMetaData, yd4Var, this);
                    return serializableL == tb2Var ? tb2Var : serializableL;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return obj;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                String id = postMetaData.getId();
                this.c = 1;
                Serializable serializableO = sw9Var.o(id, yd4Var, this);
                return serializableO == tb2Var2 ? tb2Var2 : serializableO;
        }
    }
}
