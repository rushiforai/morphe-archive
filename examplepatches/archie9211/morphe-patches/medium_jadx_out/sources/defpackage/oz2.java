package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.medium.android.donkey.susi.SusiActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oz2 extends p4d implements b55 {
    public final /* synthetic */ m45 b;
    public final /* synthetic */ pz2 c;
    public final /* synthetic */ String d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oz2(m45 m45Var, pz2 pz2Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.b = m45Var;
        this.c = pz2Var;
        this.d = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new oz2(this.b, this.c, this.d, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        oz2 oz2Var = (oz2) create((sb2) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        oz2Var.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        m45 m45Var = this.b;
        if (m45Var != null) {
            m45Var.invoke();
        } else {
            Context context = this.c.a;
            int i = SusiActivity.v;
            String str = this.d;
            if (str == null) {
                str = "";
            }
            Intent intent = new Intent(context, (Class<?>) SusiActivity.class);
            Bundle bundle = new Bundle();
            bundle.putString("referrer_source", str);
            bundle.putParcelable("susi_destination", null);
            bundle.putSerializable("susi_operation", null);
            bundle.putParcelable("route_to", null);
            intent.putExtras(bundle);
            context.startActivity(intent.addFlags(268468224));
        }
        return c1e.a;
    }
}
