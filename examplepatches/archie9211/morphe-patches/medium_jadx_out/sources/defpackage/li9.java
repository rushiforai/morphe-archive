package defpackage;

import com.medium.android.data.post.TargetPost;
import com.medium.android.donkey.post.PostPageFragment2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class li9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PostPageFragment2 b;

    public /* synthetic */ li9(PostPageFragment2 postPageFragment2, int i) {
        this.a = i;
        this.b = postPageFragment2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PostPageFragment2 postPageFragment2 = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-786692248, new li9(postPageFragment2, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = postPageFragment2.w0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jj9.d(((PostPageFragment2.BundleInfo) vq6Var.getValue()).getPost(), ((PostPageFragment2.BundleInfo) vq6Var.getValue()).getReadingContext(), ((PostPageFragment2.BundleInfo) vq6Var.getValue()).getReferrerSource(), postPageFragment2.x0, null, null, p65Var2, TargetPost.$stable);
                }
                break;
        }
        return c1eVar;
    }
}
