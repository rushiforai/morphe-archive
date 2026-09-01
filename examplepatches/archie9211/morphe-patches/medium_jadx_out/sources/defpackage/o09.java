package defpackage;

import android.text.InputFilter;
import android.text.Spanned;
import android.widget.FrameLayout;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.text.ParagraphEditTextLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o09 implements InputFilter {
    public final /* synthetic */ int a;
    public final /* synthetic */ FrameLayout b;

    public /* synthetic */ o09(FrameLayout frameLayout, int i) {
        this.a = i;
        this.b = frameLayout;
    }

    @Override // android.text.InputFilter
    public final CharSequence filter(CharSequence charSequence, int i, int i2, Spanned spanned, int i3, int i4) {
        int i5 = this.a;
        FrameLayout frameLayout = this.b;
        charSequence.getClass();
        spanned.getClass();
        switch (i5) {
            case 0:
                ((ParagraphEditIframeLayout) frameLayout).i.c();
                break;
            case 1:
                ((ParagraphEditImageLayout) frameLayout).k.c();
                break;
            default:
                ParagraphEditTextLayout paragraphEditTextLayout = (ParagraphEditTextLayout) frameLayout;
                paragraphEditTextLayout.h.c();
                if (i3 == 0) {
                    paragraphEditTextLayout.c.postDelayed(new jn(11, paragraphEditTextLayout), 15L);
                }
                break;
        }
        return null;
    }
}
