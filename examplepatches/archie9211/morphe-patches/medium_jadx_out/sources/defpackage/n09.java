package defpackage;

import android.view.View;
import android.widget.FrameLayout;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.image.ParagraphEditImageLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n09 implements View.OnFocusChangeListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ FrameLayout b;

    public /* synthetic */ n09(FrameLayout frameLayout, int i) {
        this.a = i;
        this.b = frameLayout;
    }

    @Override // android.view.View.OnFocusChangeListener
    public final void onFocusChange(View view, boolean z) {
        int i = this.a;
        FrameLayout frameLayout = this.b;
        switch (i) {
            case 0:
                ParagraphEditIframeLayout.c((ParagraphEditIframeLayout) frameLayout, z);
                break;
            default:
                ParagraphEditImageLayout.h((ParagraphEditImageLayout) frameLayout, z);
                break;
        }
    }
}
