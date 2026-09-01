package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bh9 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PostFragment b;

    public /* synthetic */ bh9(PostFragment postFragment, int i) {
        this.a = i;
        this.b = postFragment;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PostFragment postFragment = this.b;
        switch (i) {
            case 0:
                ((Boolean) obj).getClass();
                postFragment.p1();
                break;
            case 1:
                postFragment.p1();
                break;
            default:
                postFragment.p1();
                break;
        }
        return c1eVar;
    }
}
