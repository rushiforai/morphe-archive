package defpackage;

import android.view.View;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.showlesslikethis.ui.ShowLessLikeThisDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class na3 implements View.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ View.OnCreateContextMenuListener b;

    public /* synthetic */ na3(View.OnCreateContextMenuListener onCreateContextMenuListener, int i) {
        this.a = i;
        this.b = onCreateContextMenuListener;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i = this.a;
        View.OnCreateContextMenuListener onCreateContextMenuListener = this.b;
        switch (i) {
            case 0:
                ((ta3) onCreateContextMenuListener).f0();
                break;
            case 1:
                int i2 = ImageCarouselActivity.x;
                ((ImageCarouselActivity) onCreateContextMenuListener).getOnBackPressedDispatcher().d();
                break;
            case 2:
                MainActivity mainActivity = (MainActivity) onCreateContextMenuListener;
                int i3 = MainActivity.H;
                ((p13) mainActivity.t()).c0(mainActivity);
                break;
            case 3:
                l9c l9cVarG0 = ((ShowLessLikeThisDialogFragment) onCreateContextMenuListener).g0();
                vx0.c0(f76.F(l9cVarG0), null, null, new eub(l9cVarG0, (n92) null, 12), 3);
                break;
            default:
                ((n1f) onCreateContextMenuListener).cancel();
                break;
        }
    }
}
