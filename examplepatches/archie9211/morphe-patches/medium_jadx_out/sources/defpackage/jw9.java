package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jw9 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ sw9 c;
    public final /* synthetic */ tf9 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ PostMetaData.Collection f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jw9(sw9 sw9Var, tf9 tf9Var, String str, PostMetaData.Collection collection, n92 n92Var) {
        super(2, n92Var);
        this.c = sw9Var;
        this.d = tf9Var;
        this.e = str;
        this.f = collection;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new jw9(this.c, this.d, this.e, this.f, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((jw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            sw9 sw9Var = this.c;
            r6c r6cVar = sw9Var.x0;
            tf9 tf9Var = this.d;
            String str = tf9Var.a;
            String str2 = tf9Var.b;
            String str3 = this.e;
            if (str3 == null) {
                ay0.e("Don't show the PostFeaturedInPublicationChip if publication has no name");
                return null;
            }
            PostMetaData.Avatar avatar = this.f.getAvatar();
            pt9 pt9Var = new pt9(sw9Var.E0, str, str2, str3, avatar != null ? avatar.getId() : null);
            this.b = 1;
            if (r6cVar.a(pt9Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
