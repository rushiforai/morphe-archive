package defpackage;

import com.medium.stats.ui.subscriberslist.SubscribersListFragment;
import gen.model.SourceParameter;
import java.io.ByteArrayInputStream;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ba3 implements m45 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;
    public final Object d;

    public /* synthetic */ ba3(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                return ((vf6) obj3).b((ByteArrayInputStream) obj2, ((i93) ((da3) obj).b.a).p);
            case 1:
                ah6 ah6Var = (ah6) obj2;
                dh6 dh6Var = (dh6) obj;
                co1 co1VarA = ((mn6) obj3).j0().a();
                if (!(co1VarA instanceof y28)) {
                    rd6.r("Supertype not a class: ", co1VarA);
                    return null;
                }
                Class clsJ = bpe.j((y28) co1VarA);
                if (clsJ == null) {
                    throw new zb2("Unsupported superclass of " + ah6Var + ": " + co1VarA);
                }
                Class cls = dh6Var.b;
                if (g76.L(cls.getSuperclass(), clsJ)) {
                    Type genericSuperclass = cls.getGenericSuperclass();
                    genericSuperclass.getClass();
                    return genericSuperclass;
                }
                Class<?>[] interfaces = cls.getInterfaces();
                interfaces.getClass();
                int iA0 = k80.A0(clsJ, interfaces);
                if (iA0 >= 0) {
                    Type type = cls.getGenericInterfaces()[iA0];
                    type.getClass();
                    return type;
                }
                throw new zb2("No superclass of " + ah6Var + " in Java reflection for " + co1VarA);
            case 2:
                ts6 ts6Var = (ts6) obj3;
                return new t67(((k96) ts6Var.b.b).a, new a3(ts6Var, (w0b) obj2, (rya) obj));
            default:
                String str = ((ixc) obj2).a;
                SourceParameter sourceParameter = ((jxc) obj).g;
                str.getClass();
                sourceParameter.getClass();
                SubscribersListFragment subscribersListFragment = (SubscribersListFragment) ((gxc) obj3).a.a;
                ((p13) subscribersListFragment.Z()).Q(subscribersListFragment.S(), str, gp7.u(sourceParameter));
                return c1e.a;
        }
    }
}
