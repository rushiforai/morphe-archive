package defpackage;

import com.medium.android.donkey.read.web.ExternalWebViewActivity;
import com.medium.android.donkey.read.web.ExternalWebViewBottomSheetDialogFragment;
import com.medium.android.donkey.read.web.ExternalWebViewFragment;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c84 {
    public final zk2 a;
    public final List b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;

    public c84(Object obj, zk2 zk2Var, hu7 hu7Var, int i) {
        this.c = i;
        this.d = obj;
        zk2Var.getClass();
        hu7Var.getClass();
        this.a = zk2Var;
        this.b = d46.Q(i03.o);
    }

    public final void a() {
        int i = this.c;
        Object obj = this.d;
        switch (i) {
            case 0:
                ((ExternalWebViewActivity) obj).finish();
                break;
            case 1:
                ((ExternalWebViewBottomSheetDialogFragment) obj).Y();
                break;
            default:
                ExternalWebViewFragment externalWebViewFragment = (ExternalWebViewFragment) obj;
                if (externalWebViewFragment.t()) {
                    externalWebViewFragment.Q().getOnBackPressedDispatcher().d();
                }
                break;
        }
    }
}
