package defpackage;

import android.content.Context;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.proto.obv.post.BlockLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gp3 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ gp3(Context context, BlockLayout blockLayout, y09 y09Var, boolean z) {
        this.a = 0;
        this.c = context;
        this.d = blockLayout;
        this.e = y09Var;
        this.b = z;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        Object obj = this.e;
        Object obj2 = this.d;
        Object obj3 = this.c;
        switch (i) {
            case 0:
                BlockLayout blockLayout = (BlockLayout) obj2;
                y09 y09Var = (y09) obj;
                break;
            case 1:
                x45 x45Var = (x45) obj3;
                String str = (String) obj2;
                m45 m45Var = (m45) obj;
                if (z) {
                    x45Var.invoke(str);
                } else if (m45Var != null) {
                    m45Var.invoke();
                }
                break;
            case 2:
                eb8 eb8Var = (eb8) obj3;
                TopicData topicData = (TopicData) obj2;
                jea jeaVar = (jea) obj;
                if (!z) {
                    jeaVar.invoke(topicData);
                } else {
                    eb8Var.invoke(topicData);
                }
                break;
            case 3:
                ((l8b) obj3).e((String) obj2, (String) obj, z);
                break;
            default:
                sfb sfbVar = (sfb) obj2;
                ((veb) obj3).B(sfbVar.e.a, sfbVar.m, !z);
                ((l78) obj).setValue(Boolean.FALSE);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ gp3(int i, Object obj, Object obj2, Object obj3, boolean z) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.b = z;
        this.e = obj3;
    }

    public /* synthetic */ gp3(boolean z, x45 x45Var, Object obj, j55 j55Var, int i) {
        this.a = i;
        this.b = z;
        this.c = x45Var;
        this.d = obj;
        this.e = j55Var;
    }
}
