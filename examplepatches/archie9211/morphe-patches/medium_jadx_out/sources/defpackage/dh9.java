package defpackage;

import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dh9 extends rwe {
    public final /* synthetic */ PostFragment d;

    public dh9(PostFragment postFragment) {
        this.d = postFragment;
    }

    @Override // defpackage.rwe
    public final void b(RecyclerView recyclerView, int i) {
        PostFragment postFragment = this.d;
        Integer num = postFragment.M0;
        if (num == null || i < num.intValue()) {
            return;
        }
        postFragment.k1().A();
    }
}
