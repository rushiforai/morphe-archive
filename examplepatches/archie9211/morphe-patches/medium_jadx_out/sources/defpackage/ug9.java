package defpackage;

import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.donkey.post.PostFragment;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ug9 {
    public final /* synthetic */ PostFragment a;

    public /* synthetic */ ug9(PostFragment postFragment) {
        this.a = postFragment;
    }

    public final void a() {
        View view;
        gy6 gy6Var;
        int i;
        PostFragment postFragment = this.a;
        if (!postFragment.t() || postFragment.u() || (view = postFragment.G) == null || view.getWindowToken() == null || postFragment.G.getVisibility() != 0) {
            return;
        }
        String paragraphName = postFragment.j1().getPost().getParagraphName();
        if (paragraphName == null) {
            postFragment.y0 = true;
            return;
        }
        jz1 jz1Var = postFragment.E0;
        if (jz1Var == null || (gy6Var = postFragment.F0) == null) {
            return;
        }
        ArrayList arrayList = gy6Var.c;
        if (postFragment.y0) {
            return;
        }
        int size = arrayList.size();
        int i2 = 0;
        while (true) {
            i = -1;
            if (i2 >= size) {
                break;
            }
            nr0 nr0VarX = op8.X(i2, arrayList);
            if ((nr0VarX instanceof r19) && g76.L(((r19) nr0VarX).c.b.getName(), paragraphName)) {
                Iterator it2 = arrayList.iterator();
                int i3 = 0;
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    nr0 nr0Var = (nr0) it2.next();
                    nr0Var.getClass();
                    int i4 = nr0Var == nr0VarX ? 0 : -1;
                    if (i4 >= 0) {
                        i = i4 + i3;
                        break;
                    }
                    i3++;
                }
            } else {
                i2++;
            }
        }
        if (i >= 0) {
            k71 k71Var = new k71(postFragment.S());
            k71Var.a = i;
            sxa layoutManager = ((RecyclerView) jz1Var.f).getLayoutManager();
            layoutManager.getClass();
            ((LinearLayoutManager) layoutManager).C0(k71Var);
        }
        postFragment.y0 = true;
    }
}
